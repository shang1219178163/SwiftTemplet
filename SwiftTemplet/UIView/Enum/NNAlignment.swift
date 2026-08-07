//
//  NNAlignment.swift
//  SwiftTemplet
//
//  对应 Flutter `Alignment` / `AlignmentGeometry`。
//

import UIKit

/// 通用二维对齐（对齐 Flutter `Alignment`，坐标范围 [-1, 1]）
enum NNAlignment: Int {
    case topLeft
    case topCenter
    case topRight
    case centerLeft
    case center
    case centerRight
    case bottomLeft
    case bottomCenter
    case bottomRight

    /// Flutter `Alignment` 坐标，范围 [-1, 1]
    var xy: (x: CGFloat, y: CGFloat) {
        switch self {
        case .topLeft: return (-1, -1)
        case .topCenter: return (0, -1)
        case .topRight: return (1, -1)
        case .centerLeft: return (-1, 0)
        case .center: return (0, 0)
        case .centerRight: return (1, 0)
        case .bottomLeft: return (-1, 1)
        case .bottomCenter: return (0, 1)
        case .bottomRight: return (1, 1)
        }
    }

    /// Flutter `Alignment.alongOffset`：子视图在容器中的原点
    func origin(childSize: CGSize, in containerSize: CGSize) -> CGPoint {
        let (ax, ay) = xy
        let dx = (containerSize.width - childSize.width) / 2 * (1 + ax)
        let dy = (containerSize.height - childSize.height) / 2 * (1 + ay)
        return CGPoint(x: dx, y: dy)
    }
}
