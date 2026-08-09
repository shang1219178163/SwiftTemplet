//
//  NNMainAxisAlignment.swift
//  SwiftTemplet
//
//  对应 Flutter `WrapAlignment` / `MainAxisAlignment`。
//

import UIKit

/// 对应 Flutter `WrapAlignment`（主轴对齐）
enum NNMainAxisAlignment: Int, NNEnumName {
    case start
    case end
    case center
    case spaceBetween
    case spaceAround
    case spaceEvenly

    /// Flutter `WrapAlignment._distributeSpace`
    func distributeSpace(
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
            return NNMainAxisAlignment.start.distributeSpace(
                freeSpace: freeSpace,
                itemSpacing: itemSpacing,
                itemCount: itemCount,
                flipped: !flipped
            )
        case .spaceBetween where itemCount < 2:
            return NNMainAxisAlignment.start.distributeSpace(
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
