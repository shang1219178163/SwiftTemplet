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
/// ## 尺寸
/// 宽度敏感的子视图（多行 Label 等）在 bounds 宽度变化时会自动 `invalidateChildSizes()`。
/// 仅文案/intrinsic 变化、宽度不变时，仍需手动调用 `invalidateChildSizes()`。
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

    private let crossFade = NNAnimatedCrossFadeView()
    private var suppressIsFirstAnimation = false
    private var suppressBuilderRebuild = false
    private var lastLaidOutWidth: CGFloat = -1

    // MARK: - Lifecycle

    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }

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

    override var intrinsicContentSize: CGSize {
        crossFade.intrinsicContentSize
    }

    override func sizeThatFits(_ size: CGSize) -> CGSize {
        crossFade.sizeThatFits(size)
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        let width = bounds.width
        guard width > 1 else { return }
        // 宽度敏感 child（多行 Label）在宽度变化后需重新测量
        if lastLaidOutWidth < 0 || abs(width - lastLaidOutWidth) > 0.5 {
            lastLaidOutWidth = width
            invalidateChildSizes()
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
    /// 宽度变化时组件会在 `layoutSubviews` 中自动调用。
    func invalidateChildSizes() {
        crossFade.invalidateChildSizes()
        invalidateIntrinsicContentSize()
        setNeedsLayout()
    }

    // MARK: - Private

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
        crossFade.invalidateChildSizes()
        invalidateIntrinsicContentSize()
    }

    private func applyCrossFadeState(animated: Bool) {
        let state: CrossFadeState = isFirst ? .showFirst : .showSecond
        crossFade.setCrossFadeState(state, animated: animated)
        invalidateIntrinsicContentSize()
    }
}
