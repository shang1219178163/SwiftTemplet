//
//  UISearchStylesController.swift
//  SwiftTemplet
//
//  Created by Bin Shang on 2019/10/16.
//  Copyright © 2019 BN. All rights reserved.
//

import UIKit
import SwiftExpand

class UISearchStylesController: UIViewController{
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupExtendedLayout()
        title = vcName
        
        view.addSubview(plainView)
    }
    

    // MARK: -funtions

    lazy var allList: [[[String]]] = {
        let array: [[[String]]] = [
            [["NNSearchController", "复合🔍", ],
             ["NNSearchNoResultPageController", "复合🔍无结果页", ],
             ["NNSearchListController", "titleView🔍", ],
             ["NNSearchOneController", "SearchOne🔍", ],

//                ["PopViewController", "titleView🔍", ],
//            ["CCSDeskViewController", "titleView自定义🔍", ],
            ],
        ]
        return array
    }()
    
    lazy var list:[[String]] = {
        return self.allList.first!;
    }()
    
    
    lazy var plainView: NNTablePlainView = {
        let view = NNTablePlainView(frame: self.view.bounds)
        view.list = allList.first
        //        view.tableView.tableFooterView = footerView
        view.blockCellForRow({ (tableView, indexPath) -> UITableViewCell in
            let itemList = view.list![indexPath.row] as! [String]
            
            let cell = UITableViewCell.dequeueReusableCell(tableView, identifier: "cell1", style: .subtitle);
            cell.accessoryType = .disclosureIndicator;
            
            cell.textLabel?.text = itemList[1]
            cell.textLabel?.textColor = UIColor.theme;
            cell.detailTextLabel?.text = itemList[0];
            cell.detailTextLabel?.textColor = UIColor.gray;
            return cell
        })
        
        view.blockDidSelectRow({ (tableView, indexPath) in
            let itemList = view.list![indexPath.row] as! [String]
            DDLog(itemList);
            
            let controller = UICtrFromString(itemList.first!)
            controller.title = itemList.last!
            self.navigationController?.pushViewController(controller, animated: true)
        })
        
//        view.tableView.mj_header = MJRefreshNormalHeader(refreshingBlock: {
//
//        })
//        view.tableView.mj_footer = MJRefreshBackNormalFooter(refreshingBlock: {
//
//        });
        
        return view
    }()
}
