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

    @objc func handle(_ link: CADisplayLink) {
        target?.handleDisplayLink(link)
    }
}

// MARK: - NNAnimatedCrossFadeView

/// Flutter `AnimatedCrossFade` 的 UIKit 实现。
///
/// - 尺寸动画同时支持 frame 布局与 Auto Layout（后者通过内部宽高约束 + intrinsic）。
/// - 子视图理想尺寸会缓存；内容变化后请调用 `invalidateChildSizes()`。
/// - `layoutBuilder` 应布局 `contentView` 上的 top/bottom child。
///
/// ```swift
/// let fade = NNAnimatedCrossFadeView(firstChild: a, secondChild: b)
/// fade.duration = 0.35
/// fade.crossFadeState = .showSecond
/// ```
class NNAnimatedCrossFadeView: UIView {

    // MARK: Flutter parameters

    /// 对应 `AnimatedCrossFade.firstChild`
    var firstChild: UIView? {
        didSet { syncChild(oldValue, with: firstChild); setNeedsCrossFadeLayout() }
    }

    /// 对应 `AnimatedCrossFade.secondChild`
    var secondChild: UIView? {
        didSet { syncChild(oldValue, with: secondChild); setNeedsCrossFadeLayout() }
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

    private var animatedWidthConstraint: NSLayoutConstraint?
    private var animatedHeightConstraint: NSLayoutConstraint?

    // MARK: Lifecycle

    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }

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

    deinit {
        displayLink?.invalidate()
    }

    private func commonInit() {
        displayLinkProxy.target = self
        clipsToBounds = true
        contentView.clipsToBounds = false
        addSubview(contentView)
        applyClipBehavior()
    }

    override var intrinsicContentSize: CGSize {
        animatedSize(at: progress)
    }

    override func sizeThatFits(_ size: CGSize) -> CGSize {
        _ = size
        return animatedSize(at: progress)
    }

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

    /// 重新测量并缓存子视图理想尺寸（子视图文案/约束/frame 变化后必须调用）
    func invalidateChildSizes() {
        if let firstChild {
            preferredSizeCache[ObjectIdentifier(firstChild)] = capturePreferredSize(firstChild)
        }
        if let secondChild {
            preferredSizeCache[ObjectIdentifier(secondChild)] = capturePreferredSize(secondChild)
        }
        setNeedsCrossFadeLayout()
        syncAnimatedSizeToProgress()
    }

    // MARK: Animation (Flutter AnimationController)

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
        guard size.width > 0, size.height > 0 else { return }

        if translatesAutoresizingMaskIntoConstraints {
            var f = frame
            guard abs(f.width - size.width) > 0.5 || abs(f.height - size.height) > 0.5 else { return }
            let (ax, ay) = alignment.xy
            let anchorX = (ax + 1) / 2
            let anchorY = (ay + 1) / 2
            let anchor = CGPoint(
                x: f.origin.x + f.width * anchorX,
                y: f.origin.y + f.height * anchorY
            )
            f.size = size
            f.origin.x = anchor.x - size.width * anchorX
            f.origin.y = anchor.y - size.height * anchorY
            frame = f
        } else {
            ensureAnimatedSizeConstraints()
            animatedWidthConstraint?.constant = size.width
            animatedHeightConstraint?.constant = size.height
        }
    }

    private func ensureAnimatedSizeConstraints() {
        if animatedWidthConstraint == nil {
            let width = widthAnchor.constraint(equalToConstant: bounds.width)
            width.priority = UILayoutPriority(999)
            width.isActive = true
            animatedWidthConstraint = width
        }
        if animatedHeightConstraint == nil {
            let height = heightAnchor.constraint(equalToConstant: bounds.height)
            height.priority = UILayoutPriority(999)
            height.isActive = true
            animatedHeightConstraint = height
        }
    }

    private func requestHostLayout() {
        superview?.setNeedsLayout()
    }

    // MARK: Layout / Visual

    private func setNeedsCrossFadeLayout() {
        invalidateIntrinsicContentSize()
        setNeedsLayout()
    }

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

    private func syncChild(_ old: UIView?, with new: UIView?) {
        if let old, old !== new {
            preferredSizeCache.removeValue(forKey: ObjectIdentifier(old))
            if old.superview === contentView || old.superview === self {
                old.removeFromSuperview()
            }
        }
        if let new {
            preferredSizeCache[ObjectIdentifier(new)] = capturePreferredSize(new)
            if new.superview !== contentView {
                contentView.addSubview(new)
            }
        }
    }

    /// Flutter: `AnimationController.isForwardOrCompleted` → second 在上层
    private var isForwardOrCompleted: Bool {
        if isAnimating {
            return animationTo > animationFrom
        }
        return crossFadeState == .showSecond
    }

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

        contentView.insertSubview(bottomChild, at: 0)
        contentView.bringSubviewToFront(topChild)
        applyFocusPolicy()
    }

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
            guard constraint.firstItem === child, constraint.secondItem == nil else { continue }
            if constraint.firstAttribute == .width, constraint.constant > 0 {
                size.width = constraint.constant
            }
            if constraint.firstAttribute == .height, constraint.constant > 0 {
                size.height = constraint.constant
            }
        }

        let intrinsic = child.intrinsicContentSize
        if size.width <= 0, intrinsic.width > 0, intrinsic.width < UIView.noIntrinsicMetric / 2 {
            size.width = intrinsic.width
        }
        if size.height <= 0, intrinsic.height > 0, intrinsic.height < UIView.noIntrinsicMetric / 2 {
            size.height = intrinsic.height
        }

        let fitted = child.sizeThatFits(CGSize(
            width: CGFloat.greatestFiniteMagnitude,
            height: CGFloat.greatestFiniteMagnitude
        ))
        if size.width <= 0, fitted.width > 0 { size.width = fitted.width }
        if size.height <= 0, fitted.height > 0 { size.height = fitted.height }

        if size.width <= 0, child.frame.width > 0 { size.width = child.frame.width }
        if size.height <= 0, child.frame.height > 0 { size.height = child.frame.height }
        if size.width <= 0, child.bounds.width > 0 { size.width = child.bounds.width }
        if size.height <= 0, child.bounds.height > 0 { size.height = child.bounds.height }

        return CGSize(width: max(0, size.width), height: max(0, size.height))
    }
}
