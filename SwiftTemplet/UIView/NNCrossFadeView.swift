//
//  NNCrossFadeView.swift
//  SwiftTemplet
//
//  Flutter `NCrossFade` 的 UIKit 对齐封装（基于 NNAnimatedCrossFadeView）。
//  参考：flutter_templet_project/lib/basicWidget/n_cross_fade.dart
//

import UIKit
import SnapKit

/// 对应 Flutter `NCrossFade`：`AnimatedCrossFade` 的展开/收起封装。
///
/// ## 子视图构建
/// `firstChild` / `secondChild` 为构建闭包，参数 `onToggle` 在子视图内触发切换
///（对齐 `Widget Function(VoidCallback onToggle)`）。
/// Flutter 每次 `build` 都会重建 child；本组件仅在 **赋值 builder** 或调用
/// `reloadChildren()` 时重建。builder 闭包内依赖的外部状态变化后请调用 `reloadChildren()`。
///
/// ## 子视图布局约束
/// 底层 `NNAnimatedCrossFadeView` 会对 child 设置 `translatesAutoresizingMaskIntoConstraints = true`
/// 并写入 **frame**。子视图内部请用 frame 布局（或自行兼容 TAMIC）；不要在 child 上挂
/// 依赖 Auto Layout 的竖向/宽高链，否则会与交叉淡入淡出布局冲突。
///
/// ## 尺寸
/// 宽度敏感的子视图（多行 Label 等）在 bounds 宽度变化时会自动重新测量（下一 runloop，
/// 避免在 `layoutSubviews` 内 `setNeedsLayout`）。
/// 仅文案/intrinsic 变化、宽度不变时，仍需手动调用 `invalidateChildSizes()`。
/// `sizeThatFits(_:)` 会把传入宽度传给测量（适合布局前测算）。
///
/// ## 状态回调
/// - `toggle()` / 子视图 `onToggle`：切换并触发 `onChanged`
/// - 直接写 `isFirst` 或 `setIsFirst`：**不**触发 `onChanged`（对齐 Flutter `didUpdateWidget`）
/// - 无动画更新请用 `setIsFirst(_:animated: false)`；直接赋 `isFirst` 会带动画
///
/// ```swift
/// let fade = NNCrossFadeView(
///     firstChild: { onToggle in
///         let button = UIButton(type: .system)
///         button.setTitle("收起态", for: .normal)
///         // 在 touchUpInside 中调用 onToggle()
///         return button
///     },
///     secondChild: { onToggle in
///         let button = UIButton(type: .system)
///         button.setTitle("展开态", for: .normal)
///         return button
///     },
///     isFirst: true
/// )
/// fade.onChanged = { isFirst in print(isFirst) }
/// ```
class NNCrossFadeView: UIView {

    /// 对应 Flutter `Widget Function(VoidCallback onToggle)`
    typealias ChildBuilder = (_ onToggle: @escaping () -> Void) -> UIView

    // MARK: - Flutter NCrossFade parameters

    /// 对应 `NCrossFade.firstChild`。赋值会重建子视图。
    var firstChild: ChildBuilder? {
        didSet {
            guard !suppressBuilderRebuild else { return }
            rebuildChildren()
        }
    }

    /// 对应 `NCrossFade.secondChild`。赋值会重建子视图。
    var secondChild: ChildBuilder? {
        didSet {
            guard !suppressBuilderRebuild else { return }
            rebuildChildren()
        }
    }

    /// 对应 `NCrossFade.alignment`，默认 `.topCenter`
    var alignment: NNAlignment = .topCenter {
        didSet {
            guard oldValue != alignment else { return }
            crossFade.alignment = alignment
        }
    }

    /// 对应 `NCrossFade.duration`，默认 `0.35`
    var duration: TimeInterval = 0.35 {
        didSet {
            guard oldValue != duration else { return }
            crossFade.duration = duration
        }
    }

    /// 对应 `NCrossFade.isFirst`：是否显示 firstChild。
    ///
    /// 直接赋值会**带动画**切换；无动画请用 `setIsFirst(_:animated:)`。
    /// 不会触发 `onChanged`（仅 `toggle()` / 子视图 `onToggle` 会触发）。
    var isFirst: Bool = true {
        didSet {
            guard oldValue != isFirst else { return }
            applyCrossFadeState(animated: !suppressIsFirstAnimation)
        }
    }

    /// 对应 `NCrossFade.onChanged`：仅在 `toggle()` / 子视图 `onToggle` 后回调。
    var onChanged: ((Bool) -> Void)?

    /// 透传底层交叉淡入淡出结束回调（`completed` 区分播完/中断）
    var onEnd: AnimatedCrossFadeEndHandler? {
        get { crossFade.onEnd }
        set { crossFade.onEnd = newValue }
    }

    // MARK: - Private

    /// 底层 `NNAnimatedCrossFadeView`，承载交叉淡入淡出与 child 布局
    private let crossFade = NNAnimatedCrossFadeView()
    /// 为 `true` 时 `isFirst` 赋值不触发动画（`setIsFirst(_:animated: false)` 使用）
    private var suppressIsFirstAnimation = false
    /// 为 `true` 时 builder 赋值不触发 `rebuildChildren`（convenience init 批量赋值时使用）
    private var suppressBuilderRebuild = false
    /// 上次 `layoutSubviews` 时的 bounds 宽度，用于检测宽度变化并重测 child
    private var lastLaidOutWidth: CGFloat = -1
    /// 避免 `layoutSubviews` 内同步 invalidate 触发额外 layout pass
    private var widthInvalidateScheduled = false

    // MARK: - Lifecycle

    /// 指定 frame 初始化
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }

    /// Storyboard / XIB 解码初始化
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }

    /// 对齐 Flutter `NCrossFade(...)`
    convenience init(
        firstChild: @escaping ChildBuilder,
        secondChild: @escaping ChildBuilder,
        alignment: NNAlignment = .topCenter,
        isFirst: Bool = true,
        duration: TimeInterval = 0.35,
        onChanged: ((Bool) -> Void)? = nil
    ) {
        self.init(frame: .zero)
        self.alignment = alignment
        self.duration = duration
        self.onChanged = onChanged

        suppressBuilderRebuild = true
        self.firstChild = firstChild
        self.secondChild = secondChild
        suppressBuilderRebuild = false
        rebuildChildren()

        setIsFirst(isFirst, animated: false)
    }

    /// 公共初始化：挂载 crossFade、配置约束与初始 crossFade 状态
    private func commonInit() {
        addSubview(crossFade)
        // 钉边填满宿主；尺寸动画只走 intrinsic，避免与内部宽高常量约束冲突
        crossFade.animatesOwnSize = false
        crossFade.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        crossFade.alignment = alignment
        crossFade.duration = duration
        applyCrossFadeState(animated: false)
    }

    /// 透传底层 crossFade 的固有尺寸（对齐 Flutter 当前可见 child 的测量结果）
    override var intrinsicContentSize: CGSize {
        crossFade.intrinsicContentSize
    }

    /// 在给定约束尺寸下测量；会将 `size.width` 传给 child 测量（布局前测算用）
    override func sizeThatFits(_ size: CGSize) -> CGSize {
        crossFade.sizeThatFits(size)
    }

    /// 布局时检测 bounds 宽度变化，调度子视图尺寸重测（对齐宽度敏感 child）
    override func layoutSubviews() {
        super.layoutSubviews()
        let width = bounds.width
        guard width > 1 else { return }
        // 宽度敏感 child：宽度变化后延期重测，避免 layout 过程中 invalidate + setNeedsLayout
        if lastLaidOutWidth < 0 || abs(width - lastLaidOutWidth) > 0.5 {
            lastLaidOutWidth = width
            scheduleChildSizeInvalidation(proposedWidth: width)
        }
    }

    // MARK: - Public (Flutter onToggle)

    /// 对应 Flutter `onToggle`：切换 first/second，并触发 `onChanged`
    func toggle() {
        isFirst.toggle()
        onChanged?(isFirst)
    }

    /// 设置 `isFirst`（可控制是否动画）。**不**触发 `onChanged`。
    func setIsFirst(_ value: Bool, animated: Bool) {
        if isFirst == value {
            if !animated {
                applyCrossFadeState(animated: false)
            }
            return
        }
        suppressIsFirstAnimation = !animated
        isFirst = value
        suppressIsFirstAnimation = false
    }

    /// 重新用当前 builder 构建子视图（builder 输出应变化时调用）。
    func reloadChildren() {
        rebuildChildren()
    }

    /// 子视图尺寸变化后刷新测量缓存（不重建 child）。
    /// 宽度变化时组件会在 `layoutSubviews` 之后自动调度调用。
    /// - Parameter proposedWidth: 测量宽；默认用当前 `bounds.width`（若有效）。
    func invalidateChildSizes(proposedWidth: CGFloat? = nil) {
        let width = proposedWidth ?? (bounds.width > 1 ? bounds.width : nil)
        let before = crossFade.intrinsicContentSize
        crossFade.invalidateChildSizes(proposedWidth: width)
        let after = crossFade.intrinsicContentSize
        if abs(before.width - after.width) > 0.5 || abs(before.height - after.height) > 0.5 {
            invalidateIntrinsicContentSize()
        }
        setNeedsLayout()
    }

    // MARK: - Private

    /// 下一 runloop 调度 `invalidateChildSizes`，避免在 `layoutSubviews` 内同步 invalidate
    private func scheduleChildSizeInvalidation(proposedWidth: CGFloat) {
        guard !widthInvalidateScheduled else { return }
        widthInvalidateScheduled = true
        DispatchQueue.main.async { [weak self] in
            guard let self else { return }
            self.widthInvalidateScheduled = false
            let width = self.bounds.width > 1 ? self.bounds.width : proposedWidth
            guard width > 1 else { return }
            self.lastLaidOutWidth = width
            self.invalidateChildSizes(proposedWidth: width)
        }
    }

    /// 用当前 `firstChild` / `secondChild` builder 重建子视图并刷新测量缓存
    private func rebuildChildren() {
        if let firstChild {
            crossFade.firstChild = firstChild { [weak self] in
                self?.toggle()
            }
        } else {
            crossFade.firstChild = nil
        }
        if let secondChild {
            crossFade.secondChild = secondChild { [weak self] in
                self?.toggle()
            }
        } else {
            crossFade.secondChild = nil
        }
        applyCrossFadeState(animated: false)
        let width = bounds.width > 1 ? bounds.width : nil
        crossFade.invalidateChildSizes(proposedWidth: width)
        invalidateIntrinsicContentSize()
    }

    /// 将 `isFirst` 同步为底层 crossFade 的 showFirst / showSecond 状态
    private func applyCrossFadeState(animated: Bool) {
        let state: CrossFadeState = isFirst ? .showFirst : .showSecond
        crossFade.setCrossFadeState(state, animated: animated)
        invalidateIntrinsicContentSize()
    }
}
