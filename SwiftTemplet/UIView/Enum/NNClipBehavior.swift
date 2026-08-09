//
//  NNClipBehavior.swift
//  SwiftTemplet
//
//  对应 Flutter `Clip`。
//

import UIKit

/// 对应 Flutter `Clip`（`Wrap` / `AnimatedCrossFade` 等共用）
enum NNClipBehavior: Int, NNEnumName {
    case none
    case hardEdge
    case antiAlias
    case antiAliasWithSaveLayer

    /// 按 `clipBehavior` 配置 `clipsToBounds` 与抗锯齿 / 栅格化（对齐 Flutter `Clip`）。
    /// - Note: `antiAliasWithSaveLayer` 使用离屏栅格化近似，非完全等价 Flutter save-layer。
    func apply(to view: UIView) {
        switch self {
        case .none:
            view.clipsToBounds = false
            view.layer.allowsEdgeAntialiasing = false
            view.layer.shouldRasterize = false
        case .hardEdge:
            view.clipsToBounds = true
            view.layer.allowsEdgeAntialiasing = false
            view.layer.shouldRasterize = false
        case .antiAlias:
            view.clipsToBounds = true
            view.layer.allowsEdgeAntialiasing = true
            view.layer.shouldRasterize = false
        case .antiAliasWithSaveLayer:
            view.clipsToBounds = true
            view.layer.allowsEdgeAntialiasing = true
            view.layer.shouldRasterize = true
            view.layer.rasterizationScale = UIScreen.main.scale
        }
    }
}
