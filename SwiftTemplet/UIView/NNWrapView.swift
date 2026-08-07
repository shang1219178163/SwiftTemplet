//
//  NNWrapView.swift
//  SwiftTemplet
//
//  Flutter Wrap 的 UIKit 对齐实现（参数 / 布局语义与 Flutter Wrap 一致）。
//  参考：https://api.flutter.dev/flutter/widgets/Wrap-class.html
//

import UIKit

// MARK: - Flutter-aligned enums

/// 对应 Flutter `Axis`
enum WrapAxis: Int {
    case horizontal
    case vertical
}

/// 对应 Flutter `WrapAlignment`
enum WrapAlignment: Int {
    case start
    case end
    case center
    case spaceBetween
    case spaceAround
    case spaceEvenly

    /// Flutter `WrapAlignment._distributeSpace`
    fileprivate func distributeSpace(
        freeSpace: CGFloat,
        itemSpacing: CGFloat,
        itemCount: Int,
        flipped: Bool
    ) -> (leadingSpace: CGFloat, betweenSpace: CGFloat) {
        assert(itemCount > 0)
        switch self {
        case .start:
            return (flipped ? freeSpace : 0, itemSpacing)
        case .end:
            return WrapAlignment.start.distributeSpace(
                freeSpace: freeSpace,
                itemSpacing: itemSpacing,
                itemCount: itemCount,
                flipped: !flipped
            )
        case .spaceBetween where itemCount < 2:
            return WrapAlignment.start.distributeSpace(
                freeSpace: freeSpace,
                itemSpacing: itemSpacing,
                itemCount: itemCount,
                flipped: flipped
            )
        case .center:
            return (freeSpace / 2, itemSpacing)
        case .spaceBetween:
            return (0, freeSpace / CGFloat(itemCount - 1) + itemSpacing)
        case .spaceAround:
            return (freeSpace / CGFloat(itemCount) / 2, freeSpace / CGFloat(itemCount) + itemSpacing)
        case .spaceEvenly:
            let slot = freeSpace / CGFloat(itemCount + 1)
            return (slot, slot + itemSpacing)
        }
    }
}

/// 对应 Flutter `WrapCrossAlignment`
enum WrapCrossAlignment: Int {
    case start
    case end
    case center

    fileprivate var flipped: WrapCrossAlignment {
        switch self {
        case .start: return .end
        case .end: return .start
        case .center: return .center
        }
    }

    /// Flutter `WrapCrossAlignment._alignment`（0 / 0.5 / 1）
    fileprivate var alignmentFactor: CGFloat {
        switch self {
        case .start: return 0
        case .end: return 1
        case .center: return 0.5
        }
    }
}

/// 对应 Flutter `TextDirection`
enum WrapTextDirection: Int {
    case ltr
    case rtl
}

/// 对应 Flutter `VerticalDirection`
enum WrapVerticalDirection: Int {
    case up
    case down
}

/// 对应 Flutter `Clip`
enum WrapClipBehavior: Int {
    case none
    case hardEdge
    case antiAlias
    case antiAliasWithSaveLayer
}

// MARK: - NNWrapView

/// Flutter `Wrap` 的 UIKit 实现。
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
/// ```
class NNWrapView: UIView {

    // MARK: Flutter Wrap parameters

    /// 对应 `Wrap.direction`，默认 `.horizontal`
    var direction: WrapAxis = .horizontal {
        didSet { guard oldValue != direction else { return }; setNeedsWrapLayout() }
    }

    /// 对应 `Wrap.alignment`，默认 `.start`
    var alignment: WrapAlignment = .start {
        didSet { guard oldValue != alignment else { return }; setNeedsWrapLayout() }
    }

    /// 对应 `Wrap.spacing`，主轴子视图间距，默认 `0`
    var spacing: CGFloat = 0 {
        didSet { guard oldValue != spacing else { return }; setNeedsWrapLayout() }
    }

    /// 对应 `Wrap.runAlignment`，默认 `.start`
    var runAlignment: WrapAlignment = .start {
        didSet { guard oldValue != runAlignment else { return }; setNeedsWrapLayout() }
    }

    /// 对应 `Wrap.runSpacing`，run 之间间距，默认 `0`
    var runSpacing: CGFloat = 0 {
        didSet { guard oldValue != runSpacing else { return }; setNeedsWrapLayout() }
    }

    /// 对应 `Wrap.crossAxisAlignment`，默认 `.start`
    var crossAxisAlignment: WrapCrossAlignment = .start {
        didSet { guard oldValue != crossAxisAlignment else { return }; setNeedsWrapLayout() }
    }

    /// 对应 `Wrap.textDirection`；`nil` 时按 `.ltr` 解析（与常见 Directionality 默认一致）
    var textDirection: WrapTextDirection? = nil {
        didSet { guard oldValue != textDirection else { return }; setNeedsWrapLayout() }
    }

    /// 对应 `Wrap.verticalDirection`，默认 `.down`
    var verticalDirection: WrapVerticalDirection = .down {
        didSet { guard oldValue != verticalDirection else { return }; setNeedsWrapLayout() }
    }

    /// 对应 `Wrap.clipBehavior`，默认 `.none`
    var clipBehavior: WrapClipBehavior = .none {
        didSet { guard oldValue != clipBehavior else { return }; applyClipBehavior() }
    }

    /// 对应 `Wrap.children`
    var children: [UIView] = [] {
        didSet { syncChildren(oldValue) }
    }

    /// Auto Layout 下计算固有高度时的最大主轴长度（水平 Wrap 时为最大宽度）
    /// 类似 `UILabel.preferredMaxLayoutWidth`
    var preferredMaxLayoutWidth: CGFloat = 0 {
        didSet { guard oldValue != preferredMaxLayoutWidth else { return }; setNeedsWrapLayout() }
    }

    /// 垂直 Wrap 时用于固有宽度计算的最大高度
    var preferredMaxLayoutHeight: CGFloat = 0 {
        didSet { guard oldValue != preferredMaxLayoutHeight else { return }; setNeedsWrapLayout() }
    }

    // MARK: - Private types (Flutter `_AxisSize` / `_RunMetrics`)

    private struct AxisSize {
        var main: CGFloat
        var cross: CGFloat

        static let empty = AxisSize(main: 0, cross: 0)

        init(main: CGFloat, cross: CGFloat) {
            self.main = main
            self.cross = cross
        }

        init(size: CGSize, direction: WrapAxis) {
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

        func toSize(direction: WrapAxis) -> CGSize {
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
                axisSize.main + childSize.main + spacing - maxMainExtent > CGFloat.ulpOfOne
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
        direction: WrapAxis = .horizontal,
        alignment: WrapAlignment = .start,
        spacing: CGFloat = 0,
        runAlignment: WrapAlignment = .start,
        runSpacing: CGFloat = 0,
        crossAxisAlignment: WrapCrossAlignment = .start,
        textDirection: WrapTextDirection? = nil,
        verticalDirection: WrapVerticalDirection = .down,
        clipBehavior: WrapClipBehavior = .none,
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
        return contentSize(mainAxisLimit: limit)
    }

    override func sizeThatFits(_ size: CGSize) -> CGSize {
        let limit: CGFloat
        switch direction {
        case .horizontal:
            limit = size.width > 0 ? size.width : mainAxisLimitForIntrinsicSize()
        case .vertical:
            limit = size.height > 0 ? size.height : mainAxisLimitForIntrinsicSize()
        }
        guard limit.isFinite, limit > 0 else { return .zero }
        return contentSize(mainAxisLimit: limit)
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
        layoutChildren(in: bounds.size)
    }

    // MARK: - Public helpers

    /// 按给定主轴可用长度计算内容尺寸（不修改子视图 frame）
    func contentSize(mainAxisLimit: CGFloat) -> CGSize {
        guard !children.isEmpty else { return .zero }
        let measured = measureChildren(mainAxisLimit: mainAxisLimit)
        let (_, childrenAxisSize) = computeRuns(
            measured: measured,
            mainAxisLimit: mainAxisLimit
        )
        return childrenAxisSize.toSize(direction: direction)
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
        case .hardEdge:
            clipsToBounds = true
            layer.allowsEdgeAntialiasing = false
        case .antiAlias, .antiAliasWithSaveLayer:
            clipsToBounds = true
            layer.allowsEdgeAntialiasing = true
        }
    }

    private func syncChildren(_ oldChildren: [UIView]) {
        let oldSet = Set(oldChildren.map { ObjectIdentifier($0) })
        let newSet = Set(children.map { ObjectIdentifier($0) })

        for view in oldChildren where !newSet.contains(ObjectIdentifier(view)) {
            if view.superview === self {
                view.removeFromSuperview()
            }
        }
        for view in children where !oldSet.contains(ObjectIdentifier(view)) || view.superview !== self {
            if view.superview !== self {
                addSubview(view)
            }
        }
        // 保持 children 声明顺序
        for (index, view) in children.enumerated() {
            insertSubview(view, at: index)
        }
        setNeedsWrapLayout()
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

    private func layoutChildren(in containerSize: CGSize) {
        guard !children.isEmpty else { return }

        let mainAxisLimit: CGFloat
        switch direction {
        case .horizontal: mainAxisLimit = containerSize.width
        case .vertical: mainAxisLimit = containerSize.height
        }
        guard mainAxisLimit > 0 else { return }

        let measured = measureChildren(mainAxisLimit: mainAxisLimit)
        let (runMetrics, childrenAxisSize) = computeRuns(
            measured: measured,
            mainAxisLimit: mainAxisLimit
        )

        let containerAxisSize = AxisSize(size: containerSize, direction: direction)
        let freeAxisSize = containerAxisSize - childrenAxisSize
        positionChildren(
            runMetrics: runMetrics,
            measured: measured,
            freeAxisSize: freeAxisSize,
            containerAxisSize: containerAxisSize
        )
    }

    private func measureChildren(mainAxisLimit: CGFloat) -> [MeasuredChild] {
        children.map { view in
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

        // 3) 显式宽高约束覆盖（主动固定尺寸时）
        let constrained = explicitSizeConstraints(of: child)
        if let w = constrained.width { size.width = w }
        if let h = constrained.height { size.height = h }

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
        for constraint in view.constraints {
            guard constraint.isActive else { continue }
            if constraint.firstItem === view, constraint.secondItem == nil {
                switch constraint.firstAttribute {
                case .width: width = constraint.constant
                case .height: height = constraint.constant
                default: break
                }
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

        // children 顺序索引，用于在 run 内按正/反方向遍历
        let indexByView = Dictionary(uniqueKeysWithValues: children.enumerated().map {
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
            let runChildren = childrenInRun(run, indexByView: indexByView, flipMainAxis: flipMainAxis)

            for child in runChildren {
                let childSize = sizeByView[ObjectIdentifier(child)] ?? .zero
                let childAxis = AxisSize(size: childSize, direction: direction)
                let childCrossAxisOffset =
                    effectiveCrossAlignment.alignmentFactor * (runCrossAxisExtent - childAxis.cross)
                let origin = offset(
                    main: childMainAxisOffset,
                    cross: runCrossAxisOffset + childCrossAxisOffset
                )
                // Wrap 使用 frame 布局；避免 Auto Layout 覆盖 frame
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
        indexByView: [ObjectIdentifier: Int],
        flipMainAxis: Bool
    ) -> [UIView] {
        guard let startIndex = indexByView[ObjectIdentifier(run.leadingChild)] else { return [] }

        if flipMainAxis {
            // leadingChild 是该 run 最后一个（原序），向前取 childCount 个再正序布局
            let end = startIndex
            let begin = max(0, end - run.childCount + 1)
            // 布局时仍按 nextChild = childBefore，即从 leading 往前
            return (begin...end).reversed().compactMap { idx in
                children.indices.contains(idx) ? children[idx] : nil
            }
        } else {
            let end = min(children.count - 1, startIndex + run.childCount - 1)
            return (startIndex...end).compactMap { idx in
                children.indices.contains(idx) ? children[idx] : nil
            }
        }
    }

    private func areAxesFlipped() -> (flipMainAxis: Bool, flipCrossAxis: Bool) {
        let flipHorizontal = (textDirection ?? .ltr) == .rtl
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
