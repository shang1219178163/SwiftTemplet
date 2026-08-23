//
//  RouteSearchController.swift
//  SwiftTemplet
//
//  Created by shang on 2026/8/23.
//  Copyright © 2026 BN. All rights reserved.
//

import UIKit
import SwiftExpand

/// 路由搜索页
class RouteSearchController: UIViewController {

    /// 全部页面名称
    private var allPageNames: [String] = []
    /// 过滤后的页面名称
    private var filteredPageNames: [String] = []
    /// 页面真实标题缓存（键为页面类名，空串表示无标题）
    private var titleCache: [String: String] = [:]
    /// 已实例化的控制器缓存，避免 ARC 释放触发 deinit（部分控制器 deinit 有副作用，未加载 view 时会崩溃）
    private var controllerCache: [String: UIViewController] = [:]

    // MARK: -lazy
    lazy var searchBar: UISearchBar = {
        let view = UISearchBar(frame: CGRect(x: 0, y: 0, width: kScreenWidth, height: 50))
        view.textField?.placeholder = "搜索页面"
        view.delegate = self
        return view
    }()

    lazy var tableView: UITableView = {
        let view = UITableView(rect: self.view.bounds, style: .plain, rowHeight: 60)
        view.dataSource = self
        view.delegate = self
        view.placeHolderView.setTitle("无匹配页面", for: .empty)
        view.placeHolderView.setImage(UIImage(named: "img_placeholder_search")!, for: .empty)
        view.tableHeaderView = searchBar
        return view
    }()

    // MARK: -lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()

        edgesForExtendedLayout = []
        view.backgroundColor = .white
        title = "路由搜索"
        allPageNames = RoutePageSearchHelper.fetchAllPageNames()
        filteredPageNames = allPageNames
        view.addSubview(tableView)
        tableView.reloadData()
    }

    // MARK: -funtions
    private func updateFilteredPages(with query: String) {
        let trimmedQuery: String = query.trimmingCharacters(in: .whitespacesAndNewlines)
        filteredPageNames = allPageNames.filter { RoutePageSearchHelper.isMatched($0, query: trimmedQuery) }
        tableView.reloadData()
    }

    /// 读取页面真实标题并缓存，滚动到时才实例化
    /// 不访问 view（避免 viewDidLoad 副作用），并强引用缓存避免 deinit 副作用
    private func pageTitle(for pageName: String) -> String? {
        if let cached = titleCache[pageName] {
            return cached.isEmpty ? nil : cached
        }
        guard let cls: AnyClass = NSClassFromString(pageName) ?? NSClassFromString("\(UIApplication.appBundleName).\(pageName)"),
              let vcClass = cls as? UIViewController.Type
        else { return nil }
        let controller: UIViewController = vcClass.init()
        controllerCache[pageName] = controller
        let title = controller.title
        titleCache[pageName] = title ?? ""
        return title
    }

    private func pushPage(with pageName: String) {
        let controller: UIViewController = UICtrFromString(pageName)
        controller.title = pageName
        navigationController?.pushViewController(controller, animated: true)
    }
}

extension RouteSearchController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        updateFilteredPages(with: searchText)
    }

    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchBar.resignFirstResponder()
    }
}

extension RouteSearchController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return filteredPageNames.count
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return tableView.rowHeight
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(for: UITableViewCell.self, identifier: "subtitle", style: .subtitle)
        let pageName = filteredPageNames[indexPath.row]
        cell.accessoryType = .disclosureIndicator
        cell.textLabel?.text = pageName
        cell.textLabel?.textColor = UIColor.theme
        cell.textLabel?.font = UIFont.systemFont(ofSize: 15)
        cell.detailTextLabel?.text = pageTitle(for: pageName)
        cell.detailTextLabel?.textColor = UIColor.gray
        cell.detailTextLabel?.font = UIFont.systemFont(ofSize: 13)
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        pushPage(with: filteredPageNames[indexPath.row])
    }
}
