//
//  NNSearchResultController.swift
//  SwiftTemplet
//
//  Created by Bin Shang on 2019/10/15.
//  Copyright © 2019 BN. All rights reserved.
//

import UIKit
import SwiftExpand

class NNSearchResultController: UIViewController {
    
    var list = [String].init(count: 100) { "\($0)" }

    var items = [String]()
    
    var query: String?{
        willSet{
            guard let newValue = newValue, newValue != "" else { return }
            items = list.filter({ $0.lowercased().contains(newValue.lowercased()) })
            tbView.reloadData()
        }
    }

    var block: ((String)->Void)?
    
    // MARK: -lifcycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupExtendedLayout()
        title = "搜索结果列表"
        
        view.addSubview(tbView)
        tbView.tableFooterView = UIView();
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
    }

}

extension NNSearchResultController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return query != nil ? items.count : list.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell.dequeueReusableCell(tableView)
        
        let text = query != nil ? items[indexPath.row] : list[indexPath.row]
        cell.textLabel?.text = "\(text)"
        return cell;
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        DDLog(indexPath.row)
        
        let text = query != nil ? items[indexPath.row] : list[indexPath.row]
        block?(text)
    }
}

