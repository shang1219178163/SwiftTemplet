//
//  NNAnimatedCrossFadeView.swift
//  SwiftTemplet
//
//  Flutter AnimatedCrossFade 的 UIKit 对齐实现。
//  参考：https://api.flutter.dev/flutter/widgets/AnimatedCrossFade-class.html
//

import UIKit

// MARK: - CrossFade-local types

/// 对应 Flutter `CrossFadeState`
enum CrossFadeState: Int {
    /// 显示 `firstChild`
    case showFirst
    /// 显示 `secondChild`
    case showSecond
}

/// 对应 Flutter `AnimatedCrossFadeBuilder`
/// - topChild / bottomChild：已挂在 `contentView` 上，应改它们的 frame（勿改 container）
/// - contentView：子视图容器
/// - container：外层 `NNAnimatedCrossFadeView`
typealias AnimatedCrossFadeLayoutBuilder = (
    _ topChild: UIView,
    _ bottomChild: UIView,
    _ contentView: UIView,
    _ container: NNAnimatedCrossFadeView
) -> Void

/// `onEnd` 回调：`completed == true` 表示播完；`false` 表示被中断
typealias AnimatedCrossFadeEndHandler = (_ completed: Bool) -> Void

// MARK: - DisplayLink weak proxy

private final class CrossFadeDisplayLinkProxy: NSObject {
    weak var target: NNAnimatedCrossFadeView?

    /// CADisplayLink 回调入口，弱引用转发至 `handleDisplayLink`
    @objc func handle(_ link: CADisplayLink) {
        target?.handleDisplayLink(link)
    }
}

// MARK: - NNAnimatedCrossFadeView

/// Flutter `AnimatedCrossFade` 的 UIKit 实现。
///
/// - 尺寸动画同时支持 frame 布局与 Auto Layout（后者通过内部宽高约束 + intrinsic）。
/// - **子视图理想尺寸会缓存**；文案 / 约束 / intrinsic 变化后必须调用 `invalidateChildSizes()`，
///   否则尺寸动画与布局会使用过期测量。
/// - `layoutBuilder` 应改 `contentView` 上 top/bottom 的 **frame**（`contentView` 本身为 frame 布局）。
///
/// ```swift
/// let fade = NNAnimatedCrossFadeView(firstChild: a, secondChild: b)
/// fade.duration = 0.35
/// fade.crossFadeState = .showSecond
/// // label.text 变更后：
/// fade.invalidateChildSizes()
/// ```
class NNAnimatedCrossFadeView: UIView {

    // MARK: Flutter parameters

    /// 对应 `AnimatedCrossFade.firstChild`
    var firstChild: UIView? {
        didSet {
            if isAnimating { interruptAnimation(completed: false) }
            syncChild(oldValue, with: firstChild)
            setNeedsCrossFadeLayout()
        }
    }

    /// 对应 `AnimatedCrossFade.secondChild`
    var secondChild: UIView? {
        didSet {
            if isAnimating { interruptAnimation(completed: false) }
            syncChild(oldValue, with: secondChild)
            setNeedsCrossFadeLayout()
        }
    }

    /// 对应 `AnimatedCrossFade.crossFadeState`；变更时自动播放动画
    var crossFadeState: CrossFadeState = .showFirst {
        didSet {
            guard oldValue != crossFadeState else { return }
            animateToCurrentState()
        }
    }

    /// 对应 `AnimatedCrossFade.duration`
    var duration: TimeInterval = 0.3

    /// 对应 `AnimatedCrossFade.reverseDuration`；`nil` 时使用 `duration`
    var reverseDuration: TimeInterval?

    /// 对应 `AnimatedCrossFade.firstCurve`（会反向作用于第一子视图透明度）
    var firstCurve: NNCurves = .linear

    /// 对应 `AnimatedCrossFade.secondCurve`
    var secondCurve: NNCurves = .linear

    /// 对应 `AnimatedCrossFade.sizeCurve`
    var sizeCurve: NNCurves = .linear

    /// 对应 `AnimatedCrossFade.alignment`，默认 `.topCenter`
    var alignment: NNAlignment = .topCenter {
        didSet { guard oldValue != alignment else { return }; setNeedsCrossFadeLayout() }
    }

    /// 对应 `AnimatedCrossFade.layoutBuilder`；`nil` 使用默认 Stack 布局
    var layoutBuilder: AnimatedCrossFadeLayoutBuilder?

    /// 对应 `AnimatedCrossFade.excludeBottomFocus`，默认 `true`
    var excludeBottomFocus: Bool = true {
        didSet { applyFocusPolicy() }
    }

    /// 是否由本视图自身驱动尺寸动画（改 `frame` / 宽高约束）。
    ///
    /// 嵌入外层容器并用 Auto Layout 钉边时请设为 `false`，仅通过
    /// `intrinsicContentSize` 驱动宿主尺寸，避免「edges + 宽高常量」冲突。
    var animatesOwnSize: Bool = true

    /// 对应 `AnimatedCrossFade.clipBehavior`，默认 `.hardEdge`
    /// - Note: `antiAliasWithSaveLayer` 使用 `shouldRasterize` 近似，非完全等价 Flutter save-layer。
    var clipBehavior: NNClipBehavior = .hardEdge {
        didSet { applyClipBehavior() }
    }

    /// 对应 `AnimatedCrossFade.onEnd`；参数表示是否完整播完
    var onEnd: AnimatedCrossFadeEndHandler?

    /// 子视图容器（自定义 `layoutBuilder` 时布局目标）
    var crossFadeContentView: UIView { contentView }

    // MARK: Private

    /// 动画进度：0 = showFirst，1 = showSecond（对齐 Flutter AnimationController）
    private var progress: CGFloat = 0
    private var displayLink: CADisplayLink?
    private let displayLinkProxy = CrossFadeDisplayLinkProxy()
    private var animationStartTime: CFTimeInterval = 0
    private var animationFrom: CGFloat = 0
    private var animationTo: CGFloat = 0
    private var animationDuration: TimeInterval = 0
    private var isAnimating = false
    private var suppressAnimation = false

    private let contentView = UIView()

    /// 子视图“理想尺寸”缓存（避免 layout 改写 frame 后污染 measure）
    private var preferredSizeCache: [ObjectIdentifier: CGSize] = [:]

    /// `sizeThatFits` / `invalidateChildSizes(proposedWidth:)` 传入的测量宽度提示
    private var measureWidthHint: CGFloat?

    private var animatedWidthConstraint: NSLayoutConstraint?
    private var animatedHeightConstraint: NSLayoutConstraint?

    /// 上次应用的上下层方向，避免动画中每帧改 z-order
    private var lastTopIsSecond: Bool?

    // MARK: Lifecycle

    /// 以 frame 初始化，并配置 contentView 与裁剪行为
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }

    /// Interface Builder / Storyboard 解码初始化
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }

    /// 对齐 Flutter `AnimatedCrossFade(...)` 构造参数
    convenience init(
        firstChild: UIView,
        secondChild: UIView,
        firstCurve: NNCurves = .linear,
        secondCurve: NNCurves = .linear,
        sizeCurve: NNCurves = .linear,
        alignment: NNAlignment = .topCenter,
        crossFadeState: CrossFadeState = .showFirst,
        duration: TimeInterval = 0.3,
        reverseDuration: TimeInterval? = nil,
        excludeBottomFocus: Bool = true,
        clipBehavior: NNClipBehavior = .hardEdge,
        layoutBuilder: AnimatedCrossFadeLayoutBuilder? = nil,
        onEnd: AnimatedCrossFadeEndHandler? = nil
    ) {
        self.init(frame: .zero)
        self.firstCurve = firstCurve
        self.secondCurve = secondCurve
        self.sizeCurve = sizeCurve
        self.alignment = alignment
        self.duration = duration
        self.reverseDuration = reverseDuration
        self.excludeBottomFocus = excludeBottomFocus
        self.clipBehavior = clipBehavior
        self.layoutBuilder = layoutBuilder
        self.onEnd = onEnd
        // init 内不触发 didSet，手动同步
        self.firstChild = firstChild
        self.secondChild = secondChild
        syncChild(nil, with: firstChild)
        syncChild(nil, with: secondChild)
        suppressAnimation = true
        self.crossFadeState = crossFadeState
        progress = crossFadeState == .showSecond ? 1 : 0
        suppressAnimation = false
        applyClipBehavior()
        applyFocusPolicy()
        setNeedsCrossFadeLayout()
    }

    /// 销毁时停止 CADisplayLink，避免循环引用与泄漏
    deinit {
        displayLink?.invalidate()
    }

    /// 共享初始化：绑定 DisplayLink 代理、挂载 contentView、应用 clipBehavior
    private func commonInit() {
        displayLinkProxy.target = self
        clipsToBounds = true
        contentView.clipsToBounds = false
        addSubview(contentView)
        applyClipBehavior()
    }

    /// 当前动画进度下的内在尺寸（对齐 Flutter AnimatedSize）
    override var intrinsicContentSize: CGSize {
        animatedSize(at: progress)
    }

    /// 按提议尺寸重测子视图后，返回当前进度对应的交叉淡入淡出尺寸
    override func sizeThatFits(_ size: CGSize) -> CGSize {
        if let width = Self.sanitizedMeasureWidth(size.width) {
            remeasureChildren(proposedWidth: width)
        }
        return animatedSize(at: progress)
    }

    /// 布局子视图：按 progress 更新透明度、尺寸与 Stack 位置
    override func layoutSubviews() {
        super.layoutSubviews()
        applyVisualState(progress: progress, layoutBounds: bounds.size)
    }

    // MARK: Public

    /// 无动画切换到指定状态（对应 controller.value = 0/1）
    func setCrossFadeState(_ state: CrossFadeState, animated: Bool) {
        if animated {
            crossFadeState = state
        } else {
            interruptAnimation(completed: false)
            if crossFadeState != state {
                applyStateWithoutAnimation(state)
            } else {
                progress = state == .showSecond ? 1 : 0
                setNeedsCrossFadeLayout()
            }
        }
    }

    /// 重新测量并缓存子视图理想尺寸。
    ///
    /// - Important: 子视图文案、约束、`intrinsicContentSize` / frame 变化后**必须**调用，
    ///   否则 `preferredSizeCache` 会继续使用旧尺寸。
    /// - Parameter proposedWidth: 宽度敏感 child（多行 Label）的测量宽；`nil` 时用 bounds / 回退值。
    func invalidateChildSizes(proposedWidth: CGFloat? = nil) {
        remeasureChildren(proposedWidth: proposedWidth)
        setNeedsCrossFadeLayout()
        syncAnimatedSizeToProgress()
    }

    /// 用可选宽度提示重新测量并写入缓存
    private func remeasureChildren(proposedWidth: CGFloat?) {
        if let width = Self.sanitizedMeasureWidth(proposedWidth) {
            measureWidthHint = width
        }
        defer { measureWidthHint = nil }

        preferredSizeCache.removeAll(keepingCapacity: true)
        if let firstChild {
            preferredSizeCache[ObjectIdentifier(firstChild)] = capturePreferredSize(firstChild)
        }
        if let secondChild {
            preferredSizeCache[ObjectIdentifier(secondChild)] = capturePreferredSize(secondChild)
        }
    }

    /// 过滤无效测量宽度（非有限、过小或过大）
    private static func sanitizedMeasureWidth(_ width: CGFloat?) -> CGFloat? {
        guard let width, width.isFinite, width > 1, width < 10_000 else { return nil }
        return width
    }

    // MARK: Animation (Flutter AnimationController)

    /// 无动画跳转到目标状态，同步 progress 与尺寸
    private func applyStateWithoutAnimation(_ state: CrossFadeState) {
        let previous = crossFadeState
        progress = state == .showSecond ? 1 : 0
        if previous != state {
            suppressAnimation = true
            crossFadeState = state
            suppressAnimation = false
        }
        syncAnimatedSizeToProgress()
        invalidateIntrinsicContentSize()
        setNeedsLayout()
        layoutIfNeeded()
    }

    /// 根据 `crossFadeState` 启动或更新 CADisplayLink 尺寸/透明度动画
    private func animateToCurrentState() {
        if suppressAnimation {
            progress = crossFadeState == .showSecond ? 1 : 0
            invalidateIntrinsicContentSize()
            setNeedsLayout()
            return
        }

        let target: CGFloat = crossFadeState == .showSecond ? 1 : 0
        guard abs(progress - target) > 0.0001 else {
            progress = target
            setNeedsCrossFadeLayout()
            return
        }

        // 中断进行中的动画
        if isAnimating {
            interruptAnimation(completed: false)
        }

        animationFrom = progress
        animationTo = target
        let fullDuration: TimeInterval
        if target < progress {
            fullDuration = reverseDuration ?? duration
        } else {
            fullDuration = duration
        }
        // 按剩余进度缩放时长（对齐 AnimationController 中途转向）
        let distance = abs(animationTo - animationFrom)
        animationDuration = fullDuration * TimeInterval(distance)

        if animationDuration <= 0 {
            progress = target
            isAnimating = false
            applyFocusPolicy()
            setNeedsCrossFadeLayout()
            onEnd?(true)
            return
        }

        isAnimating = true
        animationStartTime = CACurrentMediaTime()
        applyFocusPolicy()

        displayLink?.invalidate()
        let link = CADisplayLink(target: displayLinkProxy, selector: #selector(CrossFadeDisplayLinkProxy.handle(_:)))
        link.add(to: .main, forMode: .common)
        displayLink = link
    }

    /// 停止进行中的动画并触发 `onEnd`（`completed` 表示是否完整播完）
    private func interruptAnimation(completed: Bool) {
        guard isAnimating || displayLink != nil else { return }
        displayLink?.invalidate()
        displayLink = nil
        let wasAnimating = isAnimating
        isAnimating = false
        if wasAnimating {
            onEnd?(completed)
        }
    }

    /// DisplayLink 每帧驱动：插值 progress、同步尺寸，结束时清理并回调
    fileprivate func handleDisplayLink(_ link: CADisplayLink) {
        let elapsed = CACurrentMediaTime() - animationStartTime
        let t = min(max(elapsed / max(animationDuration, .ulpOfOne), 0), 1)
        progress = animationFrom + (animationTo - animationFrom) * CGFloat(t)

        syncAnimatedSizeToProgress()
        invalidateIntrinsicContentSize()
        setNeedsLayout()
        requestHostLayout()

        if t >= 1 {
            progress = animationTo
            link.invalidate()
            displayLink = nil
            isAnimating = false
            applyFocusPolicy()
            syncAnimatedSizeToProgress()
            setNeedsLayout()
            requestHostLayout()
            onEnd?(true)
        }
    }

    /// 自身尺寸跟随动画（对齐 Flutter AnimatedSize），锚点由 `alignment` 决定
    private func syncAnimatedSizeToProgress() {
        let size = animatedSize(at: progress)
        // 允许单轴为 0；仅当双轴都无效时跳过
        guard size.width > 0 || size.height > 0 else { return }
        let width = max(0, size.width)
        let height = max(0, size.height)

        // 嵌入宿主（如 NNCrossFadeView）时只刷新 intrinsic，避免与钉边约束冲突
        guard animatesOwnSize else {
            invalidateIntrinsicContentSize()
            superview?.invalidateIntrinsicContentSize()
            return
        }

        if translatesAutoresizingMaskIntoConstraints {
            var f = frame
            guard abs(f.width - width) > 0.5 || abs(f.height - height) > 0.5 else { return }
            let (ax, ay) = alignment.xy
            let anchorX = (ax + 1) / 2
            let anchorY = (ay + 1) / 2
            let anchor = CGPoint(
                x: f.origin.x + f.width * anchorX,
                y: f.origin.y + f.height * anchorY
            )
            f.size = CGSize(width: width, height: height)
            f.origin.x = anchor.x - width * anchorX
            f.origin.y = anchor.y - height * anchorY
            frame = f
        } else {
            ensureAnimatedSizeConstraints(seed: CGSize(width: width, height: height))
            if width > 0 { animatedWidthConstraint?.constant = width }
            if height > 0 { animatedHeightConstraint?.constant = height }
        }
    }

    /// 懒创建宽高约束（priority 999），用于 Auto Layout 模式下的尺寸动画
    private func ensureAnimatedSizeConstraints(seed: CGSize) {
        if animatedWidthConstraint == nil {
            let initial = seed.width > 0 ? seed.width : max(bounds.width, 1)
            let width = widthAnchor.constraint(equalToConstant: initial)
            width.priority = UILayoutPriority(999)
            width.isActive = true
            animatedWidthConstraint = width
        }
        if animatedHeightConstraint == nil {
            let initial = seed.height > 0 ? seed.height : max(bounds.height, 1)
            let height = heightAnchor.constraint(equalToConstant: initial)
            height.priority = UILayoutPriority(999)
            height.isActive = true
            animatedHeightConstraint = height
        }
    }

    /// 通知父视图失效 intrinsic 并重新布局（嵌入 NNCrossFadeView 等宿主时必需）
    private func requestHostLayout() {
        // 宿主若用 intrinsic 决定高度（NNCrossFadeView），必须同步失效
        superview?.invalidateIntrinsicContentSize()
        superview?.setNeedsLayout()
    }

    // MARK: Layout / Visual

    /// 标记需要重新测量与布局（失效 intrinsic + setNeedsLayout）
    private func setNeedsCrossFadeLayout() {
        invalidateIntrinsicContentSize()
        setNeedsLayout()
    }

    /// 按 `clipBehavior` 配置 clipsToBounds、抗锯齿与栅格化
    private func applyClipBehavior() {
        switch clipBehavior {
        case .none:
            clipsToBounds = false
            layer.allowsEdgeAntialiasing = false
            layer.shouldRasterize = false
        case .hardEdge:
            clipsToBounds = true
            layer.allowsEdgeAntialiasing = false
            layer.shouldRasterize = false
        case .antiAlias:
            clipsToBounds = true
            layer.allowsEdgeAntialiasing = true
            layer.shouldRasterize = false
        case .antiAliasWithSaveLayer:
            clipsToBounds = true
            layer.allowsEdgeAntialiasing = true
            layer.shouldRasterize = true
            layer.rasterizationScale = UIScreen.main.scale
        }
    }

    /// 子视图增删时更新 contentView 层级、缓存与 z-order 标记
    private func syncChild(_ old: UIView?, with new: UIView?) {
        if let old, old !== new {
            preferredSizeCache.removeValue(forKey: ObjectIdentifier(old))
            if old.superview === contentView || old.superview === self {
                old.removeFromSuperview()
            }
            lastTopIsSecond = nil
        }
        if let new {
            preferredSizeCache[ObjectIdentifier(new)] = capturePreferredSize(new)
            if new.superview !== contentView {
                contentView.addSubview(new)
            }
            lastTopIsSecond = nil
        }
    }

    /// Flutter: `AnimationController.isForwardOrCompleted` → second 在上层
    private var isForwardOrCompleted: Bool {
        if isAnimating {
            return animationTo > animationFrom
        }
        return crossFadeState == .showSecond
    }

    /// 按上下层关系禁用下层交互与无障碍焦点（对齐 Flutter excludeBottomFocus）
    private func applyFocusPolicy() {
        guard let firstChild, let secondChild else {
            firstChild?.isUserInteractionEnabled = true
            secondChild?.isUserInteractionEnabled = true
            return
        }
        let topIsSecond = isForwardOrCompleted
        let top = topIsSecond ? secondChild : firstChild
        let bottom = topIsSecond ? firstChild : secondChild

        bottom.isUserInteractionEnabled = false
        top.isUserInteractionEnabled = true
        if excludeBottomFocus {
            bottom.accessibilityElementsHidden = true
            top.accessibilityElementsHidden = false
        } else {
            bottom.accessibilityElementsHidden = false
            top.accessibilityElementsHidden = false
        }
    }

    /// 只把命中交给当前上层（可见）child，避免「上层 alpha≈0 仍占交互 / 下层已禁用」导致点击失灵。
    override func hitTest(_ point: CGPoint, with event: UIEvent?) -> UIView? {
        guard isUserInteractionEnabled, !isHidden, alpha > 0.01, self.point(inside: point, with: event) else {
            return nil
        }
        guard let firstChild, let secondChild else {
            return super.hitTest(point, with: event)
        }
        let top = isForwardOrCompleted ? secondChild : firstChild
        let p = convert(point, to: top)
        if let hit = top.hitTest(p, with: event) {
            return hit
        }
        // 点在容器内但不在 top 理想 frame 内时，仍把交互交给 top（对齐 Flutter 上层接收手势）
        if contentView.point(inside: convert(point, to: contentView), with: event) {
            return top
        }
        return nil
    }

    /// 按 progress 应用透明度、contentView 尺寸、layoutBuilder 与 z-order
    private func applyVisualState(progress t: CGFloat, layoutBounds: CGSize) {
        // 仅一侧存在时降级为单 child 展示
        if firstChild == nil || secondChild == nil {
            layoutSingleChildIfNeeded(layoutBounds: layoutBounds)
            return
        }
        guard let firstChild, let secondChild else { return }

        let firstSize = measure(firstChild)
        let secondSize = measure(secondChild)

        firstChild.alpha = 1 - firstCurve.transform(t)
        secondChild.alpha = secondCurve.transform(t)

        let animated = animatedSize(at: t)
        let contentSize: CGSize
        if layoutBounds.width > 0.5, layoutBounds.height > 0.5 {
            contentSize = layoutBounds
        } else {
            contentSize = animated
        }
        contentView.frame = CGRect(origin: .zero, size: contentSize)

        let topIsSecond = isForwardOrCompleted
        let topChild = topIsSecond ? secondChild : firstChild
        let bottomChild = topIsSecond ? firstChild : secondChild
        let topSize = topIsSecond ? secondSize : firstSize
        let bottomSize = topIsSecond ? firstSize : secondSize

        if let layoutBuilder {
            layoutBuilder(topChild, bottomChild, contentView, self)
        } else {
            defaultLayoutBuilder(
                topChild: topChild,
                topSize: topSize,
                bottomChild: bottomChild,
                bottomSize: bottomSize,
                contentSize: contentSize
            )
        }

        if lastTopIsSecond != topIsSecond {
            contentView.insertSubview(bottomChild, at: 0)
            contentView.bringSubviewToFront(topChild)
            lastTopIsSecond = topIsSecond
        }
        applyFocusPolicy()
    }

    /// 仅有一个 child 时的降级布局：按 alignment 放置并恢复交互
    private func layoutSingleChildIfNeeded(layoutBounds: CGSize) {
        contentView.subviews.forEach { $0.alpha = 1 }
        guard let only = firstChild ?? secondChild else {
            contentView.frame = .zero
            return
        }
        let size = measure(only)
        let contentSize: CGSize
        if layoutBounds.width > 0.5, layoutBounds.height > 0.5 {
            contentSize = layoutBounds
        } else {
            contentSize = size
        }
        contentView.frame = CGRect(origin: .zero, size: contentSize)
        only.translatesAutoresizingMaskIntoConstraints = true
        only.alpha = 1
        only.isUserInteractionEnabled = true
        only.accessibilityElementsHidden = false
        let origin = alignment.origin(childSize: size, in: contentSize)
        only.frame = CGRect(origin: origin, size: size)
        contentView.bringSubviewToFront(only)
    }

    /// Flutter `AnimatedCrossFade.defaultLayoutBuilder`
    /// bottom: left/top/right 贴齐（宽度随容器）；top: 理想尺寸按 alignment 放置
    private func defaultLayoutBuilder(
        topChild: UIView,
        topSize: CGSize,
        bottomChild: UIView,
        bottomSize: CGSize,
        contentSize: CGSize
    ) {
        bottomChild.translatesAutoresizingMaskIntoConstraints = true
        topChild.translatesAutoresizingMaskIntoConstraints = true

        bottomChild.frame = CGRect(
            x: 0,
            y: 0,
            width: contentSize.width,
            height: bottomSize.height
        )

        let topOrigin = alignment.origin(childSize: topSize, in: contentSize)
        topChild.frame = CGRect(origin: topOrigin, size: topSize)
    }

    /// 在 progress `t` 处按 `sizeCurve` 插值两子视图的宽高
    private func animatedSize(at t: CGFloat) -> CGSize {
        let firstSize = measure(firstChild)
        let secondSize = measure(secondChild)
        if firstChild == nil { return secondSize }
        if secondChild == nil { return firstSize }
        let sizeT = sizeCurve.transform(t)
        return CGSize(
            width: firstSize.width + (secondSize.width - firstSize.width) * sizeT,
            height: firstSize.height + (secondSize.height - firstSize.height) * sizeT
        )
    }

    /// 读取子视图理想尺寸，优先使用 `preferredSizeCache`
    private func measure(_ child: UIView?) -> CGSize {
        guard let child else { return .zero }
        if let cached = preferredSizeCache[ObjectIdentifier(child)],
           cached.width > 0 || cached.height > 0 {
            return cached
        }
        let size = capturePreferredSize(child)
        preferredSizeCache[ObjectIdentifier(child)] = size
        return size
    }

    /// 在 layout 改写 frame 之前捕获子视图理想尺寸
    private func capturePreferredSize(_ child: UIView) -> CGSize {
        var size: CGSize = .zero

        let candidates = child.constraints + (child.superview?.constraints ?? [])
        for constraint in candidates where constraint.isActive {
            guard constraint.multiplier == 1 else { continue }
            let constant = abs(constraint.constant)
            guard constant > 0 else { continue }
            if constraint.firstItem === child, constraint.secondItem == nil {
                if constraint.firstAttribute == .width { size.width = constant }
                if constraint.firstAttribute == .height { size.height = constant }
            } else if constraint.secondItem === child, constraint.firstItem == nil {
                if constraint.secondAttribute == .width { size.width = constant }
                if constraint.secondAttribute == .height { size.height = constant }
            }
        }

        let intrinsic = child.intrinsicContentSize
        if size.width <= 0, intrinsic.width > 0, intrinsic.width < UIView.noIntrinsicMetric / 2 {
            size.width = intrinsic.width
        }
        if size.height <= 0, intrinsic.height > 0, intrinsic.height < UIView.noIntrinsicMetric / 2 {
            size.height = intrinsic.height
        }

        // 多行文本等宽度敏感视图：禁止用 infinite 宽测算（否则会压成单行，展开/收起无差别）
        let proposedWidth = proposedMeasureWidth(for: child, knownWidth: size.width)
        let fitted = child.sizeThatFits(CGSize(
            width: proposedWidth,
            height: CGFloat.greatestFiniteMagnitude
        ))
        if size.width <= 0, fitted.width > 0, fitted.width.isFinite { size.width = fitted.width }
        if size.height <= 0, fitted.height > 0, fitted.height.isFinite { size.height = fitted.height }
        // 已有固定宽时，高度仍以该宽下的 sizeThatFits 为准（覆盖错误的单行 intrinsic）
        if proposedWidth > 0, fitted.height > 0, fitted.height.isFinite {
            size.height = fitted.height
            if size.width <= 0 { size.width = proposedWidth }
        }

        // Auto Layout 压缩测算（纯约束子视图）
        if size.width <= 0 || size.height <= 0 || !size.width.isFinite || !size.height.isFinite {
            let target = CGSize(
                width: proposedWidth > 0 ? proposedWidth : UIView.layoutFittingCompressedSize.width,
                height: UIView.layoutFittingCompressedSize.height
            )
            let fitting = child.systemLayoutSizeFitting(
                target,
                withHorizontalFittingPriority: proposedWidth > 0 ? .required : .fittingSizeLevel,
                verticalFittingPriority: .fittingSizeLevel
            )
            if size.width <= 0 || !size.width.isFinite { size.width = fitting.width }
            if size.height <= 0 || !size.height.isFinite { size.height = fitting.height }
        }

        if size.width <= 0, child.frame.width > 0 { size.width = child.frame.width }
        if size.height <= 0, child.frame.height > 0 { size.height = child.frame.height }
        if size.width <= 0, child.bounds.width > 0 { size.width = child.bounds.width }
        if size.height <= 0, child.bounds.height > 0 { size.height = child.bounds.height }

        return CGSize(width: max(0, size.width), height: max(0, size.height))
    }

    /// 宽度敏感 child 的测量宽：优先 hint / 容器 / child 已布局宽度，避免 infinite
    private func proposedMeasureWidth(for child: UIView, knownWidth: CGFloat) -> CGFloat {
        if let measureWidthHint { return measureWidthHint }
        if bounds.width > 1 { return bounds.width }
        if contentView.bounds.width > 1 { return contentView.bounds.width }
        if child.bounds.width > 1 { return child.bounds.width }
        if let known = Self.sanitizedMeasureWidth(knownWidth) { return known }
        let screen = UIScreen.main.bounds.width
        return screen > 1 ? screen : 320
    }
}
