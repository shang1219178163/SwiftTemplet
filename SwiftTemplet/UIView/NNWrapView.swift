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
///
/// - 使用 **frame 布局**子视图：会将 child 的 `translatesAutoresizingMaskIntoConstraints` 设为 `true`。
/// - `isHidden == true` 的子视图不参与测量与占位（对齐 Flutter `Visibility(visible: false)`）。
/// - Auto Layout 下请设置 `preferredMaxLayoutWidth`（水平）或 `preferredMaxLayoutHeight`（垂直），
///   并与父约束宽度/高度保持一致，否则固有尺寸与真实换行可能不一致。
///
/// ```swift
/// let wrap = NNWrapView()
/// wrap.direction = .horizontal
/// wrap.alignment = .start
/// wrap.spacing = 8
/// wrap.runAlignment = .start
/// wrap.runSpacing = 8
/// wrap.crossAxisAlignment = .start
/// wrap.children = [label1, label2, button]
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
    /// - Note: `antiAliasWithSaveLayer` 目前与 `antiAlias` 行为相同（未做离屏 save-layer 合成）。
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

    private struct AxisSize {
        var main: CGFloat
        var cross: CGFloat

        static let empty = AxisSize(main: 0, cross: 0)

        init(main: CGFloat, cross: CGFloat) {
            self.main = main
            self.cross = cross
        }

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

        var flipped: AxisSize { AxisSize(main: cross, cross: main) }

        func toSize(direction: NNAxis) -> CGSize {
            switch direction {
            case .horizontal: return CGSize(width: main, height: cross)
            case .vertical: return CGSize(width: cross, height: main)
            }
        }

        static func + (lhs: AxisSize, rhs: AxisSize) -> AxisSize {
            AxisSize(main: lhs.main + rhs.main, cross: max(lhs.cross, rhs.cross))
        }

        static func - (lhs: AxisSize, rhs: AxisSize) -> AxisSize {
            AxisSize(main: lhs.main - rhs.main, cross: lhs.cross - rhs.cross)
        }

        mutating func formAddition(_ other: AxisSize) {
            self = self + other
        }
    }

    private final class RunMetrics {
        var axisSize: AxisSize
        var childCount: Int
        var leadingChild: UIView

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

    private struct MeasuredChild {
        let view: UIView
        let size: CGSize
    }

    // MARK: - Lifecycle

    override init(frame: CGRect) {
        super.init(frame: frame)
        applyClipBehavior()
    }

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

    override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        super.traitCollectionDidChange(previousTraitCollection)
        guard textDirection == nil else { return }
        if previousTraitCollection?.layoutDirection != traitCollection.layoutDirection {
            setNeedsWrapLayout()
        }
    }

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

    private func setNeedsWrapLayout() {
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
            // 近似 Flutter save-layer：离屏栅格化后再合成（非完全等价）
            clipsToBounds = true
            layer.allowsEdgeAntialiasing = true
            layer.shouldRasterize = true
            layer.rasterizationScale = UIScreen.main.scale
        }
    }

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

    private var usesBoundsForIntrinsicMainAxisLimit: Bool {
        switch direction {
        case .horizontal: return preferredMaxLayoutWidth <= 0
        case .vertical: return preferredMaxLayoutHeight <= 0
        }
    }

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

    private func visibleChildren() -> [UIView] {
        children.filter { !$0.isHidden }
    }

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

        // 3) 显式宽高约束覆盖（忽略 0 占位约束；含 superview 上安装的约束）
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

        switch direction {
        case .horizontal:
            if mainAxisLimit > 0, size.width > mainAxisLimit { size.width = mainAxisLimit }
        case .vertical:
            if mainAxisLimit > 0, size.height > mainAxisLimit { size.height = mainAxisLimit }
        }
        return size
    }

    private func explicitSizeConstraints(of view: UIView) -> (width: CGFloat?, height: CGFloat?) {
        var width: CGFloat?
        var height: CGFloat?
        let candidates = view.constraints + (view.superview?.constraints ?? [])
        for constraint in candidates where constraint.isActive {
            guard constraint.firstItem === view, constraint.secondItem == nil else { continue }
            switch constraint.firstAttribute {
            case .width where constraint.constant > 0:
                width = constraint.constant
            case .height where constraint.constant > 0:
                height = constraint.constant
            default:
                break
            }
        }
        return (width, height)
    }

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
                // Wrap 使用 frame 布局；会覆盖 child 上已有的 Auto Layout 约束效果
                #if DEBUG
                if !child.translatesAutoresizingMaskIntoConstraints,
                   child.constraints.contains(where: { $0.isActive }) {
                    assertionFailure("NNWrapView 对 \(type(of: child)) 使用 frame 布局，将忽略其 Auto Layout 约束")
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

    private func resolvedTextDirection() -> NNTextDirection {
        if let textDirection { return textDirection }
        return effectiveUserInterfaceLayoutDirection == .rightToLeft ? .rtl : .ltr
    }

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

    private func offset(main: CGFloat, cross: CGFloat) -> CGPoint {
        switch direction {
        case .horizontal: return CGPoint(x: main, y: cross)
        case .vertical: return CGPoint(x: cross, y: main)
        }
    }
}
