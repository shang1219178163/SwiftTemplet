//
//  NNEnumName.swift
//  SwiftTemplet
//
//  为 Flutter 对齐相关枚举提供统一的 case 名访问。
//

import Foundation

/// 提供枚举 case 名字符串（`String(describing:)`）
protocol NNEnumName {}

/// 提供枚举 case 名字符串 name/shortName
extension NNEnumName {
    /// 枚举 case 名（如 `topLeft`、`showFirst`）
    var name: String { String(describing: self) }
    
    /// 枚举名按驼峰拆词后取首字母（如 `topLeft` → `TL`）
    var shortName: String {
        var initials = ""
        for (index, character) in name.enumerated() {
            if index == 0 || character.isUppercase {
                initials.append(character.uppercased())
            }
        }
        return initials
    }
}
