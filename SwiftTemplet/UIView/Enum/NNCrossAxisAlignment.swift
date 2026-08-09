//
//  NNCrossAxisAlignment.swift
//  SwiftTemplet
//
//  对应 Flutter `WrapCrossAlignment` / `CrossAxisAlignment`。
//

import UIKit

/// 对应 Flutter `WrapCrossAlignment`（交叉轴对齐）
enum NNCrossAxisAlignment: Int, NNEnumName {
    case start
    case end
    case center

    var flipped: NNCrossAxisAlignment {
        switch self {
        case .start: return .end
        case .end: return .start
        case .center: return .center
        }
    }

    /// Flutter `WrapCrossAlignment._alignment`（0 / 0.5 / 1）
    var alignmentFactor: CGFloat {
        switch self {
        case .start: return 0
        case .end: return 1
        case .center: return 0.5
        }
    }
}
