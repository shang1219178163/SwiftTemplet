//
//  NNWrapView.swift
//  SwiftTemplet
//
//  Flutter Wrap 的 UIKit 对齐实现（参数 / 布局语义与 Flutter Wrap 一致）。
//  参考：https://api.flutter.dev/flutter/widgets/Wrap-class.html
//

import UIKit

// MARK: - Wrap-local enums

/// 对应 Flutter `VerticalDirection`
enum WrapVerticalDirection: Int {
    case up
    case down
}

// MARK: - NNWrapView

/// Flutter `Wrap` 的 UIKit 实现。
/// 一句话：测尺寸 → 按 Flutter 规则分包成 run → 按对齐写 frame；UIKit 只负责宿主约束和刷新入口。
///
/// - 使用 **frame 布局**子视图：会将 child 的 `translatesAutoresizingMaskIntoConstraints` 设为 `true`。
///   子视图**内部**约束（如 label 贴边）可保留；不要用父级约束把 child 钉在 Wrap 上。
/// - `isHidden == true` 的子视图不参与测量与占位（对齐 Flutter `Visibility(visible: false)`）。
/// - Auto Layout 下请设置 `preferredMaxLayoutWidth`（水平）或 `preferredMaxLayoutHeight`（垂直），
///   并与父约束宽度/高度保持一致，否则固有尺寸与真实换行可能不一致。
/// - **子视图文案 / 显隐 / intrinsic 变化后必须调用 `reload()`**（组件不会自动观察子内容）。
///
/// ```swift
/// let wrap = NNWrapView()
/// wrap.preferredMaxLayoutWidth = 320
/// wrap.children = [label1, label2, button]
/// label1.text = "updated"
/// wrap.reload() // 子视图内容变化后刷新
/// ```
class NNWrapView: UIView {

    /// 对齐 Flutter `precisionErrorTolerance`
    private static let precisionErrorTolerance: CGFloat = 1e-10

    // MARK: Flutter Wrap parameters

    /// 对应 `Wrap.direction`，默认 `.horizontal`
    var direction: NNAxis = .horizontal {
        didSet { guard oldValue != direction else { return }; setNeedsWrapLayout() }
    }

    /// 对应 `Wrap.alignment`，默认 `.start`
    var alignment: NNMainAxisAlignment = .start {
        didSet { guard oldValue != alignment else { return }; setNeedsWrapLayout() }
    }

    /// 对应 `Wrap.spacing`，主轴子视图间距，默认 `0`
    var spacing: CGFloat = 0 {
        didSet { guard oldValue != spacing else { return }; setNeedsWrapLayout() }
    }

    /// 对应 `Wrap.runAlignment`，默认 `.start`
    var runAlignment: NNMainAxisAlignment = .start {
        didSet { guard oldValue != runAlignment else { return }; setNeedsWrapLayout() }
    }

    /// 对应 `Wrap.runSpacing`，run 之间间距，默认 `0`
    var runSpacing: CGFloat = 0 {
        didSet { guard oldValue != runSpacing else { return }; setNeedsWrapLayout() }
    }

    /// 对应 `Wrap.crossAxisAlignment`，默认 `.start`
    var crossAxisAlignment: NNCrossAxisAlignment = .start {
        didSet { guard oldValue != crossAxisAlignment else { return }; setNeedsWrapLayout() }
    }

    /// 对应 `Wrap.textDirection`；`nil` 时跟随 `effectiveUserInterfaceLayoutDirection`
    var textDirection: NNTextDirection? = nil {
        didSet { guard oldValue != textDirection else { return }; setNeedsWrapLayout() }
    }

    /// 对应 `Wrap.verticalDirection`，默认 `.down`
    var verticalDirection: WrapVerticalDirection = .down {
        didSet { guard oldValue != verticalDirection else { return }; setNeedsWrapLayout() }
    }

    /// 对应 `Wrap.clipBehavior`，默认 `.none`
    /// - Note: `antiAliasWithSaveLayer` 使用 `shouldRasterize` 近似，非完全等价 Flutter save-layer。
    var clipBehavior: NNClipBehavior = .none {
        didSet { guard oldValue != clipBehavior else { return }; applyClipBehavior() }
    }

    /// 对应 `Wrap.children`。赋值时会将仍挂在其他父视图上的 child re-parent 到本视图。
    var children: [UIView] = [] {
        didSet { syncChildren(oldValue) }
    }

    /// Auto Layout 下计算固有高度时的最大主轴长度（水平 Wrap 时为最大宽度）
    /// 类似 `UILabel.preferredMaxLayoutWidth`，应与真实布局宽度一致。
    var preferredMaxLayoutWidth: CGFloat = 0 {
        didSet { guard oldValue != preferredMaxLayoutWidth else { return }; setNeedsWrapLayout() }
    }

    /// 垂直 Wrap 时用于固有宽度计算的最大高度
    var preferredMaxLayoutHeight: CGFloat = 0 {
        didSet { guard oldValue != preferredMaxLayoutHeight else { return }; setNeedsWrapLayout() }
    }

    /// 上次参与布局的主轴长度（用于 bounds 变化时刷新固有尺寸）
    private var lastLaidOutMainAxisLimit: CGFloat = -1

    // MARK: - Private types (Flutter `_AxisSize` / `_RunMetrics`)

    /// 对应 Flutter `_AxisSize`：主轴 / 交叉轴尺寸对
    private struct AxisSize {
        var main: CGFloat
        var cross: CGFloat

        /// 零尺寸占位
        static let empty = AxisSize(main: 0, cross: 0)

        /// 直接指定主轴与交叉轴长度
        init(main: CGFloat, cross: CGFloat) {
            self.main = main
            self.cross = cross
        }

        /// 从 `CGSize` 按 `direction` 拆为主轴 / 交叉轴
        init(size: CGSize, direction: NNAxis) {
            switch direction {
            case .horizontal:
                main = size.width
                cross = size.height
            case .vertical:
                main = size.height
                cross = size.width
            }
        }

        /// 交换主轴与交叉轴（run 累加时用）
        var flipped: AxisSize { AxisSize(main: cross, cross: main) }

        /// 还原为 `CGSize`（按当前 `direction` 映射宽高）
        func toSize(direction: NNAxis) -> CGSize {
            switch direction {
            case .horizontal: return CGSize(width: main, height: cross)
            case .vertical: return CGSize(width: cross, height: main)
            }
        }

        /// 主轴相加、交叉轴取 max（对齐 Flutter `_AxisSize` 加法）
        static func + (lhs: AxisSize, rhs: AxisSize) -> AxisSize {
            AxisSize(main: lhs.main + rhs.main, cross: max(lhs.cross, rhs.cross))
        }

        /// 逐分量相减（计算容器剩余空间）
        static func - (lhs: AxisSize, rhs: AxisSize) -> AxisSize {
            AxisSize(main: lhs.main - rhs.main, cross: lhs.cross - rhs.cross)
        }

        /// 原地累加另一个 `AxisSize`
        mutating func formAddition(_ other: AxisSize) {
            self = self + other
        }
    }

    /// 对应 Flutter `_RunMetrics`：单行 / 单列 run 的度量
    private final class RunMetrics {
        var axisSize: AxisSize
        var childCount: Int
        var leadingChild: UIView

        /// 以首个子视图及其尺寸初始化新 run
        init(leadingChild: UIView, axisSize: AxisSize) {
            self.leadingChild = leadingChild
            self.axisSize = axisSize
            self.childCount = 1
        }

        /// Flutter `_RunMetrics.tryAddingNewChild`：放得下则并入当前 run，否则返回新 run
        func tryAdding(
            child: UIView,
            childSize: AxisSize,
            flipMainAxis: Bool,
            spacing: CGFloat,
            maxMainExtent: CGFloat
        ) -> RunMetrics? {
            let needsNewRun =
                axisSize.main + childSize.main + spacing - maxMainExtent
                > NNWrapView.precisionErrorTolerance
            if needsNewRun {
                return RunMetrics(leadingChild: child, axisSize: childSize)
            }
            axisSize.formAddition(childSize + AxisSize(main: spacing, cross: 0))
            childCount += 1
            if flipMainAxis {
                leadingChild = child
            }
            return nil
        }
    }

    /// 子视图及其测算尺寸
    private struct MeasuredChild {
        /// 参与布局的子视图
        let view: UIView
        /// `preferredSize` 测算结果
        let size: CGSize
    }

    // MARK: - Lifecycle

    /// 标准 frame 初始化，并应用 `clipBehavior`
    override init(frame: CGRect) {
        super.init(frame: frame)
        applyClipBehavior()
    }

    /// Interface Builder / Storyboard 解码初始化
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        applyClipBehavior()
    }

    /// 对齐 Flutter `Wrap(...)` 构造参数顺序
    convenience init(
        direction: NNAxis = .horizontal,
        alignment: NNMainAxisAlignment = .start,
        spacing: CGFloat = 0,
        runAlignment: NNMainAxisAlignment = .start,
        runSpacing: CGFloat = 0,
        crossAxisAlignment: NNCrossAxisAlignment = .start,
        textDirection: NNTextDirection? = nil,
        verticalDirection: WrapVerticalDirection = .down,
        clipBehavior: NNClipBehavior = .none,
        children: [UIView] = []
    ) {
        self.init(frame: .zero)
        self.direction = direction
        self.alignment = alignment
        self.spacing = spacing
        self.runAlignment = runAlignment
        self.runSpacing = runSpacing
        self.crossAxisAlignment = crossAxisAlignment
        self.textDirection = textDirection
        self.verticalDirection = verticalDirection
        self.clipBehavior = clipBehavior
        // 初始化上下文中不会触发 didSet，需手动同步子视图
        self.children = children
        syncChildren([])
        applyClipBehavior()
    }

    /// 固有尺寸：交叉轴返回内容高度/宽度，主轴为 `noIntrinsicMetric`（需父级约束宽度/高度）
    override var intrinsicContentSize: CGSize {
        let limit = mainAxisLimitForIntrinsicSize()
        guard limit.isFinite, limit > 0 else {
            return CGSize(width: UIView.noIntrinsicMetric, height: UIView.noIntrinsicMetric)
        }
        let size = contentSize(mainAxisLimit: limit)
        switch direction {
        case .horizontal:
            return CGSize(width: UIView.noIntrinsicMetric, height: size.height)
        case .vertical:
            return CGSize(width: size.width, height: UIView.noIntrinsicMetric)
        }
    }

    /// 在给定容器尺寸下测算 Wrap 内容尺寸（主轴取 `size` 对应边或固有上限）
    override func sizeThatFits(_ size: CGSize) -> CGSize {
        let limit: CGFloat
        switch direction {
        case .horizontal:
            limit = size.width > 0 ? size.width : mainAxisLimitForIntrinsicSize()
        case .vertical:
            limit = size.height > 0 ? size.height : mainAxisLimitForIntrinsicSize()
        }
        guard limit.isFinite, limit > 0 else {
            return CGSize(width: UIView.noIntrinsicMetric, height: UIView.noIntrinsicMetric)
        }
        return contentSize(mainAxisLimit: limit)
    }

    /// `textDirection == nil` 时，布局方向变化则重新布局（对齐 Flutter 跟随 locale）
    override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        super.traitCollectionDidChange(previousTraitCollection)
        guard textDirection == nil else { return }
        if previousTraitCollection?.layoutDirection != traitCollection.layoutDirection {
            setNeedsWrapLayout()
        }
    }

    /// Auto Layout  fitting：按 `targetSize` 主轴上限计算换行后的内容尺寸
    override func systemLayoutSizeFitting(
        _ targetSize: CGSize,
        withHorizontalFittingPriority horizontalFittingPriority: UILayoutPriority,
        verticalFittingPriority: UILayoutPriority
    ) -> CGSize {
        let limit: CGFloat
        switch direction {
        case .horizontal:
            if targetSize.width > 0, targetSize.width < CGFloat.greatestFiniteMagnitude / 2 {
                limit = targetSize.width
            } else {
                limit = mainAxisLimitForIntrinsicSize()
            }
        case .vertical:
            if targetSize.height > 0, targetSize.height < CGFloat.greatestFiniteMagnitude / 2 {
                limit = targetSize.height
            } else {
                limit = mainAxisLimitForIntrinsicSize()
            }
        }
        guard limit.isFinite, limit > 0 else {
            return super.systemLayoutSizeFitting(
                targetSize,
                withHorizontalFittingPriority: horizontalFittingPriority,
                verticalFittingPriority: verticalFittingPriority
            )
        }
        return contentSize(mainAxisLimit: limit)
    }

    /// 布局子视图 frame；bounds 主轴变化时刷新固有尺寸缓存
    override func layoutSubviews() {
        super.layoutSubviews()
        let mainLimit: CGFloat = direction == .horizontal ? bounds.width : bounds.height
        // 未设置 preferredMax* 时固有尺寸依赖 bounds；宽度变化需刷新缓存的 intrinsic
        if usesBoundsForIntrinsicMainAxisLimit,
           lastLaidOutMainAxisLimit >= 0,
           abs(mainLimit - lastLaidOutMainAxisLimit) > 0.5 {
            invalidateIntrinsicContentSize()
        }
        lastLaidOutMainAxisLimit = mainLimit
        layoutChildren(in: bounds.size)
    }

    // MARK: - Public helpers

    /// 按给定主轴可用长度计算内容尺寸（不修改子视图 frame）
    func contentSize(mainAxisLimit: CGFloat) -> CGSize {
        let visible = visibleChildren()
        guard !visible.isEmpty else { return .zero }
        let measured = measureChildren(visible, mainAxisLimit: mainAxisLimit)
        let (_, childrenAxisSize) = computeRuns(
            measured: measured,
            mainAxisLimit: mainAxisLimit
        )
        return childrenAxisSize.toSize(direction: direction)
    }

    /// 重新测量并布局（不改动子视图层级）。
    ///
    /// 适用于未改 `children`，但子视图文案、显隐或尺寸已变化的场景。
    /// 若还需同步层级顺序，使用 `reload(synchronizingHierarchy: true)`。
    /// 若需立刻生效，可再调用 `layoutIfNeeded()`。
    func reload(synchronizingHierarchy: Bool = false) {
        if synchronizingHierarchy {
            syncChildren(children)
        } else {
            setNeedsWrapLayout()
        }
    }

    // MARK: - Layout (Flutter RenderWrap)

    /// 标记需要重新测算与布局（失效 intrinsic 并 `setNeedsLayout`）
    private func setNeedsWrapLayout() {
        invalidateIntrinsicContentSize()
        setNeedsLayout()
    }

    /// 按 `clipBehavior` 配置 `clipsToBounds` 与抗锯齿 / 栅格化（对齐 Flutter `Clip`）
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
            // 近似 Flutter save-layer：离屏栅格化后再合成（非完全等价）
            clipsToBounds = true
            layer.allowsEdgeAntialiasing = true
            layer.shouldRasterize = true
            layer.rasterizationScale = UIScreen.main.scale
        }
    }

    /// 同步 `children` 与 subview 层级：增删、re-parent、保持声明顺序
    private func syncChildren(_ oldChildren: [UIView]) {
        #if DEBUG
        let ids = children.map(ObjectIdentifier.init)
        assert(Set(ids).count == ids.count, "NNWrapView.children 不应包含重复引用")
        #endif

        let oldSet = Set(oldChildren.map { ObjectIdentifier($0) })
        let newSet = Set(children.map { ObjectIdentifier($0) })

        for view in oldChildren where !newSet.contains(ObjectIdentifier(view)) {
            if view.superview === self {
                view.removeFromSuperview()
            }
        }
        for view in children where !oldSet.contains(ObjectIdentifier(view)) || view.superview !== self {
            if let superview = view.superview, superview !== self {
                #if DEBUG
                assertionFailure("NNWrapView 将 re-parent \(type(of: view))（原父视图 \(type(of: superview))）")
                #endif
                addSubview(view)
            } else if view.superview !== self {
                addSubview(view)
            }
        }
        // 保持 children 声明顺序
        for (index, view) in children.enumerated() {
            insertSubview(view, at: index)
        }
        setNeedsWrapLayout()
    }

    /// 未设置 `preferredMaxLayout*` 时，固有尺寸主轴上限取自 `bounds`
    private var usesBoundsForIntrinsicMainAxisLimit: Bool {
        switch direction {
        case .horizontal: return preferredMaxLayoutWidth <= 0
        case .vertical: return preferredMaxLayoutHeight <= 0
        }
    }

    /// 固有尺寸测算用的主轴上限（优先 `preferredMaxLayout*`，否则 `bounds`）
    private func mainAxisLimitForIntrinsicSize() -> CGFloat {
        switch direction {
        case .horizontal:
            if preferredMaxLayoutWidth > 0 { return preferredMaxLayoutWidth }
            if bounds.width > 0 { return bounds.width }
            return 0
        case .vertical:
            if preferredMaxLayoutHeight > 0 { return preferredMaxLayoutHeight }
            if bounds.height > 0 { return bounds.height }
            return 0
        }
    }

    /// 可见子视图（`isHidden == false`，对齐 Flutter 不参与布局的隐藏 child）
    private func visibleChildren() -> [UIView] {
        children.filter { !$0.isHidden }
    }

    /// 测算 run 并按 `alignment` / `runAlignment` / `crossAxisAlignment` 放置子视图 frame
    private func layoutChildren(in containerSize: CGSize) {
        let visible = visibleChildren()
        guard !visible.isEmpty else { return }

        let mainAxisLimit: CGFloat
        switch direction {
        case .horizontal: mainAxisLimit = containerSize.width
        case .vertical: mainAxisLimit = containerSize.height
        }
        guard mainAxisLimit > 0 else { return }

        let measured = measureChildren(visible, mainAxisLimit: mainAxisLimit)
        let (runMetrics, childrenAxisSize) = computeRuns(
            measured: measured,
            mainAxisLimit: mainAxisLimit
        )

        let containerAxisSize = AxisSize(size: containerSize, direction: direction)
        let freeAxisSize = containerAxisSize - childrenAxisSize
        positionChildren(
            runMetrics: runMetrics,
            measured: measured,
            orderedChildren: visible,
            freeAxisSize: freeAxisSize,
            containerAxisSize: containerAxisSize
        )
    }

    /// 批量测算可见子视图的 `preferredSize`
    private func measureChildren(_ views: [UIView], mainAxisLimit: CGFloat) -> [MeasuredChild] {
        views.map { view in
            MeasuredChild(view: view, size: preferredSize(of: view, mainAxisLimit: mainAxisLimit))
        }
    }

    /// 对齐 Flutter：按子视图内容自适应测算尺寸（主轴不超过 `mainAxisLimit`）
    private func preferredSize(of child: UIView, mainAxisLimit: CGFloat) -> CGSize {
        let target: CGSize
        switch direction {
        case .horizontal:
            target = CGSize(width: mainAxisLimit, height: CGFloat.greatestFiniteMagnitude)
        case .vertical:
            target = CGSize(width: CGFloat.greatestFiniteMagnitude, height: mainAxisLimit)
        }

        // 1) 内容尺寸优先：sizeThatFits / intrinsicContentSize
        var size = child.sizeThatFits(target)
        let intrinsic = child.intrinsicContentSize
        if (size.width <= 0 || !size.width.isFinite),
           intrinsic.width > 0, intrinsic.width < UIView.noIntrinsicMetric / 2 {
            size.width = intrinsic.width
        }
        if (size.height <= 0 || !size.height.isFinite),
           intrinsic.height > 0, intrinsic.height < UIView.noIntrinsicMetric / 2 {
            size.height = intrinsic.height
        }

        // 2) Auto Layout 压缩测算
        if size.width <= 0 || size.height <= 0 || !size.width.isFinite || !size.height.isFinite {
            let fitting = child.systemLayoutSizeFitting(
                CGSize(
                    width: direction == .horizontal ? mainAxisLimit : UIView.layoutFittingCompressedSize.width,
                    height: direction == .vertical ? mainAxisLimit : UIView.layoutFittingCompressedSize.height
                ),
                withHorizontalFittingPriority: .fittingSizeLevel,
                verticalFittingPriority: .fittingSizeLevel
            )
            if size.width <= 0 || !size.width.isFinite { size.width = fitting.width }
            if size.height <= 0 || !size.height.isFinite { size.height = fitting.height }
        }

        // 3) 显式宽高约束覆盖（忽略 0 占位；含 superview / 反向 first-second）
        let constrained = explicitSizeConstraints(of: child)
        if let w = constrained.width, w > 0 { size.width = w }
        if let h = constrained.height, h > 0 { size.height = h }

        // 4) 兜底：已有 bounds / frame
        if size.width <= 0, child.bounds.width > 0 { size.width = child.bounds.width }
        if size.height <= 0, child.bounds.height > 0 { size.height = child.bounds.height }
        if size.width <= 0, child.frame.width > 0 { size.width = child.frame.width }
        if size.height <= 0, child.frame.height > 0 { size.height = child.frame.height }

        if !size.width.isFinite { size.width = 0 }
        if !size.height.isFinite { size.height = 0 }

        // 5) 主轴钳制后按固定主轴再测交叉轴（多行文本行高）
        switch direction {
        case .horizontal:
            if mainAxisLimit > 0, size.width > mainAxisLimit {
                size.width = mainAxisLimit
                let refit = child.sizeThatFits(CGSize(
                    width: mainAxisLimit,
                    height: CGFloat.greatestFiniteMagnitude
                ))
                if refit.height > 0, refit.height.isFinite {
                    size.height = refit.height
                }
            }
        case .vertical:
            if mainAxisLimit > 0, size.height > mainAxisLimit {
                size.height = mainAxisLimit
                let refit = child.sizeThatFits(CGSize(
                    width: CGFloat.greatestFiniteMagnitude,
                    height: mainAxisLimit
                ))
                if refit.width > 0, refit.width.isFinite {
                    size.width = refit.width
                }
            }
        }
        return size
    }

    /// 读取子视图自身显式宽高约束（用于测量覆盖 intrinsic）
    private func explicitSizeConstraints(of view: UIView) -> (width: CGFloat?, height: CGFloat?) {
        var width: CGFloat?
        var height: CGFloat?
        let candidates = view.constraints + (view.superview?.constraints ?? [])
        for constraint in candidates where constraint.isActive {
            guard constraint.multiplier == 1 else { continue }
            let constant = abs(constraint.constant)
            guard constant > 0 else { continue }

            // view.width/height == constant，或 constant == view.width/height
            if constraint.firstItem === view, constraint.secondItem == nil {
                if constraint.firstAttribute == .width { width = constant }
                if constraint.firstAttribute == .height { height = constant }
            } else if constraint.secondItem === view, constraint.firstItem == nil {
                if constraint.secondAttribute == .width { width = constant }
                if constraint.secondAttribute == .height { height = constant }
            }
        }
        return (width, height)
    }

    /// 按主轴上限换行分组 run，并累加总内容 `AxisSize`（对齐 Flutter `RenderWrap._computeRuns`）
    private func computeRuns(
        measured: [MeasuredChild],
        mainAxisLimit: CGFloat
    ) -> (runs: [RunMetrics], childrenAxisSize: AxisSize) {
        let (flipMainAxis, _) = areAxesFlipped()
        var runMetrics: [RunMetrics] = []
        var currentRun: RunMetrics?
        var childrenAxisSize = AxisSize.empty

        for item in measured {
            let childSize = AxisSize(size: item.size, direction: direction)
            let newRun: RunMetrics?
            if let run = currentRun {
                newRun = run.tryAdding(
                    child: item.view,
                    childSize: childSize,
                    flipMainAxis: flipMainAxis,
                    spacing: spacing,
                    maxMainExtent: mainAxisLimit
                )
            } else {
                newRun = RunMetrics(leadingChild: item.view, axisSize: childSize)
            }

            if let newRun {
                runMetrics.append(newRun)
                if let currentRun {
                    childrenAxisSize.formAddition(currentRun.axisSize.flipped)
                }
                currentRun = newRun
            }
        }

        guard let lastRun = currentRun else {
            return ([], .empty)
        }

        let totalRunSpacing = runSpacing * CGFloat(max(runMetrics.count - 1, 0))
        childrenAxisSize.formAddition(AxisSize(main: totalRunSpacing, cross: 0) + lastRun.axisSize.flipped)
        return (runMetrics, childrenAxisSize.flipped)
    }

    /// 按 `alignment`、`runAlignment`、`crossAxisAlignment` 与 text/vertical 方向分配空间并设置 frame
    private func positionChildren(
        runMetrics: [RunMetrics],
        measured: [MeasuredChild],
        orderedChildren: [UIView],
        freeAxisSize: AxisSize,
        containerAxisSize: AxisSize
    ) {
        guard !runMetrics.isEmpty else { return }

        let sizeByView = Dictionary(uniqueKeysWithValues: measured.map {
            (ObjectIdentifier($0.view), $0.size)
        })

        let crossAxisFreeSpace = max(0, freeAxisSize.cross)
        let (flipMainAxis, flipCrossAxis) = areAxesFlipped()
        let effectiveCrossAlignment = flipCrossAxis ? crossAxisAlignment.flipped : crossAxisAlignment
        let (runLeadingSpace, runBetweenSpace) = runAlignment.distributeSpace(
            freeSpace: crossAxisFreeSpace,
            itemSpacing: runSpacing,
            itemCount: runMetrics.count,
            flipped: flipCrossAxis
        )

        let runs: [RunMetrics] = flipCrossAxis ? runMetrics.reversed() : runMetrics
        var runCrossAxisOffset = runLeadingSpace

        // 可见 children 顺序索引，用于在 run 内按正/反方向遍历
        let indexByView = Dictionary(uniqueKeysWithValues: orderedChildren.enumerated().map {
            (ObjectIdentifier($0.element), $0.offset)
        })

        for run in runs {
            let runCrossAxisExtent = run.axisSize.cross
            let childCount = run.childCount
            let mainAxisFreeSpace = max(0, containerAxisSize.main - run.axisSize.main)
            let (childLeadingSpace, childBetweenSpace) = alignment.distributeSpace(
                freeSpace: mainAxisFreeSpace,
                itemSpacing: spacing,
                itemCount: childCount,
                flipped: flipMainAxis
            )

            var childMainAxisOffset = childLeadingSpace
            let runChildren = childrenInRun(
                run,
                orderedChildren: orderedChildren,
                indexByView: indexByView,
                flipMainAxis: flipMainAxis
            )

            for child in runChildren {
                let childSize = sizeByView[ObjectIdentifier(child)] ?? .zero
                let childAxis = AxisSize(size: childSize, direction: direction)
                let childCrossAxisOffset =
                    effectiveCrossAlignment.alignmentFactor * (runCrossAxisExtent - childAxis.cross)
                let origin = offset(
                    main: childMainAxisOffset,
                    cross: runCrossAxisOffset + childCrossAxisOffset
                )
                // Wrap 使用 frame 布局 child 自身；允许 child 内部约束
                #if DEBUG
                if hasExtrinsicSizeConstraintsPinning(child) {
                    assertionFailure(
                        "NNWrapView 对 \(type(of: child)) 使用 frame 布局；请勿用父视图约束将其钉在 Wrap 上"
                    )
                }
                #endif
                if !child.translatesAutoresizingMaskIntoConstraints {
                    child.translatesAutoresizingMaskIntoConstraints = true
                }
                child.frame = CGRect(origin: origin, size: childSize)
                childMainAxisOffset += childAxis.main + childBetweenSpace
            }
            runCrossAxisOffset += runCrossAxisExtent + runBetweenSpace
        }
    }

    /// 取出某个 run 内的子视图（按绘制/布局顺序）
    private func childrenInRun(
        _ run: RunMetrics,
        orderedChildren: [UIView],
        indexByView: [ObjectIdentifier: Int],
        flipMainAxis: Bool
    ) -> [UIView] {
        guard let startIndex = indexByView[ObjectIdentifier(run.leadingChild)] else { return [] }

        if flipMainAxis {
            // leadingChild 是该 run 最后一个（原序），向前取 childCount 个再正序布局
            let end = startIndex
            let begin = max(0, end - run.childCount + 1)
            return (begin...end).reversed().compactMap { idx in
                orderedChildren.indices.contains(idx) ? orderedChildren[idx] : nil
            }
        } else {
            let end = min(orderedChildren.count - 1, startIndex + run.childCount - 1)
            return (startIndex...end).compactMap { idx in
                orderedChildren.indices.contains(idx) ? orderedChildren[idx] : nil
            }
        }
    }

    /// 解析有效 `textDirection`（显式值或跟随 `effectiveUserInterfaceLayoutDirection`）
    private func resolvedTextDirection() -> NNTextDirection {
        if let textDirection { return textDirection }
        return effectiveUserInterfaceLayoutDirection == .rightToLeft ? .rtl : .ltr
    }

    /// 根据 `textDirection` 与 `verticalDirection` 判断主轴 / 交叉轴是否反向布局
    private func areAxesFlipped() -> (flipMainAxis: Bool, flipCrossAxis: Bool) {
        let flipHorizontal = resolvedTextDirection() == .rtl
        let flipVertical = verticalDirection == .up
        switch direction {
        case .horizontal:
            return (flipHorizontal, flipVertical)
        case .vertical:
            return (flipVertical, flipHorizontal)
        }
    }

    /// 主轴 / 交叉轴偏移量转换为 `CGPoint`（随 `direction` 映射 x/y）
    private func offset(main: CGFloat, cross: CGFloat) -> CGPoint {
        switch direction {
        case .horizontal: return CGPoint(x: main, y: cross)
        case .vertical: return CGPoint(x: cross, y: main)
        }
    }

    /// 检测是否被父视图（非 self 内部）用位置约束钉住——此类约束会与 frame 布局冲突
    private func hasExtrinsicSizeConstraintsPinning(_ child: UIView) -> Bool {
        guard let superview = child.superview, superview === self else { return false }
        return superview.constraints.contains { constraint in
            guard constraint.isActive else { return false }
            let involvesChild =
                constraint.firstItem === child || constraint.secondItem === child
            guard involvesChild else { return false }
            switch constraint.firstAttribute {
            case .leading, .trailing, .left, .right, .top, .bottom,
                 .centerX, .centerY, .firstBaseline, .lastBaseline:
                return true
            default:
                return false
            }
        }
    }
}
