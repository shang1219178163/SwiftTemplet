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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "搜索结果列表"
        
        view.addSubview(tbView)
        tbView.tableFooterView = UIView();

    }

}
extension NNSearchResultController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3;
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCellOne.cellWithTableView(tableView) as! UITableViewCellOne
        cell.labelLeft.text = "\(indexPath.section),\(indexPath.row)"
        return cell;
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        DDLog(indexPath.row)
    }
}

extension NNSearchResultController: UISearchControllerDelegate, UISearchBarDelegate {

}
