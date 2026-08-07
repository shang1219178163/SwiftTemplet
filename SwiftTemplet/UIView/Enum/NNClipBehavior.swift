//
//  NNClipBehavior.swift
//  SwiftTemplet
//
//  对应 Flutter `Clip`。
//

import UIKit

/// 对应 Flutter `Clip`（`Wrap` / `AnimatedCrossFade` 等共用）
enum NNClipBehavior: Int {
    case none
    case hardEdge
    case antiAlias
    case antiAliasWithSaveLayer
}
