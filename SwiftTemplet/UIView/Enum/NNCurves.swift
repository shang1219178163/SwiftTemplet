//
//  NNCurves.swift
//  SwiftTemplet
//
//  对应 Flutter `Curve`（常用曲线；也支持自定义 cubic）。
//

import UIKit

/// 对应 Flutter `Curve`（常用曲线；也支持自定义 cubic）
enum NNCurves: NNEnumName {
    case linear
    case easeIn
    case easeOut
    case easeInOut
    case easeInCubic
    case easeOutCubic
    case easeInOutCubic
    case bounceOut
    /// 自定义三次贝塞尔，控制点同 Flutter `Cubic`
    case cubic(CGFloat, CGFloat, CGFloat, CGFloat)

    /// 将线性进度 t∈[0,1] 映射为曲线进度
    func transform(_ t: CGFloat) -> CGFloat {
        let x = min(max(t, 0), 1)
        switch self {
        case .linear:
            return x
        case .easeIn:
            return x * x
        case .easeOut:
            return 1 - (1 - x) * (1 - x)
        case .easeInOut:
            return x < 0.5 ? 2 * x * x : 1 - pow(-2 * x + 2, 2) / 2
        case .easeInCubic:
            return x * x * x
        case .easeOutCubic:
            return 1 - pow(1 - x, 3)
        case .easeInOutCubic:
            return x < 0.5 ? 4 * x * x * x : 1 - pow(-2 * x + 2, 3) / 2
        case .bounceOut:
            return Self.bounceOut(x)
        case let .cubic(a, b, c, d):
            return Self.cubicBezier(x, x1: a, y1: b, x2: c, y2: d)
        }
    }

    private static func bounceOut(_ t: CGFloat) -> CGFloat {
        if t < 1 / 2.75 {
            return 7.5625 * t * t
        } else if t < 2 / 2.75 {
            let t = t - 1.5 / 2.75
            return 7.5625 * t * t + 0.75
        } else if t < 2.5 / 2.75 {
            let t = t - 2.25 / 2.75
            return 7.5625 * t * t + 0.9375
        } else {
            let t = t - 2.625 / 2.75
            return 7.5625 * t * t + 0.984375
        }
    }

    /// 近似求解 cubic-bezier 的 y（x∈[0,1]）
    private static func cubicBezier(
        _ t: CGFloat,
        x1: CGFloat,
        y1: CGFloat,
        x2: CGFloat,
        y2: CGFloat
    ) -> CGFloat {
        // 牛顿法求 u，使 Bx(u)=t，再算 By(u)
        var u = t
        for _ in 0..<6 {
            let bx = bezier(u, p1: x1, p2: x2)
            let dx = bezierDerivative(u, p1: x1, p2: x2)
            if abs(dx) < 1e-6 { break }
            u -= (bx - t) / dx
            u = min(max(u, 0), 1)
        }
        return bezier(u, p1: y1, p2: y2)
    }

    private static func bezier(_ u: CGFloat, p1: CGFloat, p2: CGFloat) -> CGFloat {
        // P0=0, P3=1
        let c = 3 * p1
        let b = 3 * (p2 - p1) - c
        let a = 1 - c - b
        return ((a * u + b) * u + c) * u
    }

    private static func bezierDerivative(_ u: CGFloat, p1: CGFloat, p2: CGFloat) -> CGFloat {
        let c = 3 * p1
        let b = 3 * (p2 - p1) - c
        let a = 1 - c - b
        return (3 * a * u + 2 * b) * u + c
    }
}
