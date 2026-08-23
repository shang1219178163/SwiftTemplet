//
//  RoutePageSearchHelper.swift
//  SwiftTemplet
//
//  Created by shang on 2026/8/23.
//  Copyright © 2026 BN. All rights reserved.
//

import UIKit
import ObjectiveC.runtime

/// 路由页面搜索工具
enum RoutePageSearchHelper {

    /// 获取主工程内全部控制器页面名称，按名称排序
    static func fetchAllPageNames() -> [String] {
        let classCount: Int32 = objc_getClassList(nil, 0)
        guard classCount > 0 else { return [] }
        let rawPointer = UnsafeMutablePointer<AnyClass>.allocate(capacity: Int(classCount))
        defer { rawPointer.deallocate() }
        let classList = AutoreleasingUnsafeMutablePointer<AnyClass>(rawPointer)
        let actualCount: Int32 = objc_getClassList(classList, classCount)
        guard actualCount > 0 else { return [] }
        let buffer = UnsafeBufferPointer(start: rawPointer, count: Int(actualCount))
        // UICollectionMainController 已横向分页集成，子页面无需在路由列表单独展示
        let subPageNames: Set<String> = [
            "UICollectionMultipleSectionController",
            "NNCollectionViewHorizontalController",
            "UICollectionViewCardController",
            "UICollectionDispalyController",
            "UICollectionBatchUpdateController",
            "UICollectionTagsController",
        ]
        let excludedNames: Set<String> = ["HomeViewController", "RouteSearchController"]
        var pageNames: [String] = []
        for cls in buffer {
            guard Bundle(for: cls) == Bundle.main,
                  cls is UIViewController.Type,
                  NSStringFromClass(cls).hasSuffix("Controller")
            else { continue }
            let fullName: String = NSStringFromClass(cls)
            let pageName: String = fullName.components(separatedBy: ".").last ?? fullName
            // 排除抽象基类控制器，它们无法独立导航
            guard !excludedNames.contains(pageName),
                  !isAbstractController(pageName)
            else { continue }
            pageNames.append(pageName)
        }
        return pageNames.sorted { $0.localizedStandardCompare($1) == .orderedAscending }
    }

    /// 抽象基类控制器名称（不可独立导航）
    private static func isAbstractController(_ name: String) -> Bool {
        let suffixes = ["BaseController", "ProtocolController", "RootController", "AbstractController"]
        return suffixes.contains { name.hasSuffix($0) }
    }

    /// 页面名称是否匹配搜索词：忽略大小写，支持包含匹配与驼峰首字母缩写匹配
    static func isMatched(_ pageName: String, query: String) -> Bool {
        guard !query.isEmpty else { return true }
        let lowerPageName: String = pageName.lowercased()
        let lowerQuery: String = query.lowercased()
        if lowerPageName.contains(lowerQuery) {
            return true
        }
        // 驼峰首字母缩写串中匹配，如 "hvc" 命中 HomeViewController
        return abbreviation(of: pageName).lowercased().contains(lowerQuery)
    }

    /// 提取驼峰命名的首字母缩写，如 HomeViewController -> HVC
    private static func abbreviation(of name: String) -> String {
        var result = ""
        var isNewWord = true
        for char in name {
            if char.isUppercase {
                result.append(char)
                isNewWord = false
            } else if isNewWord {
                result.append(char)
                isNewWord = false
            }
        }
        return result
    }
}
