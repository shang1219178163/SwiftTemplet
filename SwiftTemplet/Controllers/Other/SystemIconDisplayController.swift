//
//  SystemIconDisplayController.swift
//  SwiftTemplet
//
//  Created by Bin Shang on 2021/6/25.
//  Copyright © 2021 BN. All rights reserved.
//

import UIKit
import SwiftExpand

///系统图标
class SystemIconDisplayController: UITableViewController {

    let identifier = String(describing: UITableViewCell.self)
    
    
    lazy var searchVC: UISearchController = {
        let vc = UISearchController(searchResultsController: nil)
        vc.hidesNavigationBarDuringPresentation = true
        vc.dimsBackgroundDuringPresentation = false
        vc.searchBar.placeholder = "search"
        vc.searchBar.searchBarStyle = .minimal
        vc.searchBar.delegate = self
        vc.searchBar.backgroundColor = navigationController?.navigationBar.barTintColor
        vc.searchBar.tintColor = .gray
        vc.searchBar.textField?.backgroundColor = .white
        vc.searchBar.textField?.layer.cornerRadius = 5;
        vc.searchBar.textField?.layer.masksToBounds = true
//        vc.searchBar.scopeButtonTitles = ["种类 1", "种类 2", "种类 3", ]
        definesPresentationContext = true

        return vc
    }()
    
    var symbols: [String] {
        guard let txt = Bundle.string(forResource: "SFSafeSymbols", ofType: "txt") else {
            DDLog("文件解析失败")
            return [] }
//        DDLog(txt.count)
        let list = txt.components(separatedBy: "\n")
//        DDLog(list.count)
        return list
    }
    
    var filters: [String] {
        return symbols.filter {
            if #available(iOS 13, *) {
                return UIImage(systemName: $0) != nil
            } else {
                return false
            }
        }
    }
    
    var images: [String] = []

    // MARK: -lifecyle
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        edgesForExtendedLayout = []
        navigationItem.rightBarButtonItems = [("done", #selector(actionitem(_:)))]
            .map {
                UIBarButtonItem(title: $0.0, style: .plain, target: self, action: $0.1)
            }
        
        if #available(iOS 11, *) {
            navigationItem.hidesSearchBarWhenScrolling = false
            navigationItem.searchController = searchVC
        } else {
            tableView.tableHeaderView = searchVC.searchBar
        }
        images = filters
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        

    }
    
    @objc func actionitem(_ sender: UIBarButtonItem) {
        print(sender.title as Any)

    }
    
    // MARK: -funtions
    func search(_ searchText: String) {
        DispatchQueue.global().async { [self] in
            if searchText == "" {
                self.images = self.filters
            } else {
                self.images = self.symbols.filter {
                    if !$0.contains(searchText.lowercased()) {
                        return false
                    }
                    if #available(iOS 13, *) {
                        return UIImage(systemName: $0) != nil
                    } else {
                        return false
                    }
                }
            }
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
    

    // MARK: -UITableView
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return images.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell = tableView.dequeueReusableCell(withIdentifier: identifier, for: indexPath)
        let cell = tableView.dequeueReusableCell(for: UITableViewCell.self)
        
        cell.textLabel?.text = "\(indexPath.row)"

        let name = images[indexPath.row]
        cell.textLabel?.text = "\(name)"

        if #available(iOS 13, *) {
            cell.imageView?.image = UIImage(systemName: name) ?? UIImage(color: .red, size: CGSize(width: 30, height: 30))
        }
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let name = images[indexPath.row];
        print(name)
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "    已发现 \(images.count) 条数据"
    }
}



extension SystemIconDisplayController: UISearchBarDelegate{
    // MARK: -UISearchBar
    func searchBarShouldBeginEditing(_ searchBar: UISearchBar) -> Bool{
        return true;
    }
    
    func searchBarShouldEndEditing(_ searchBar: UISearchBar) -> Bool {
        return true;
    }
    
    func searchBarTextDidEndEditing(_ searchBar: UISearchBar) {
        
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        search(searchBar.text ?? "")
        DDLog(tableView.frame)
    }
    
    func searchBar(_ searchBar: UISearchBar, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
        searchBar.showsCancelButton = !(searchBar.text!.count == 1 && text == "")
        return true;
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        search(searchBar.text ?? "")
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {

    }
    
    func searchBar(_ searchBar: UISearchBar, selectedScopeButtonIndexDidChange selectedScope: Int) {
        DDLog(selectedScope)
    }
}
