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
        
        view.addSubview(plainView)
        
        if title == nil {
            title = controllerName;
        }
        
        view.getViewLayer()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated);
        
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: -funtions
    

    lazy var allList: [[[String]]] = {
        var array: [[[String]]] = [
            [["PopViewController", "titleView🔍", ],
            ["CCSDeskViewController", "titleView自定义🔍", ],
            ["NNSearchController", "复合🔍", ],
            ],
        ]
        return array
    }()
    
    lazy var list:[[String]] = {
        return self.allList.first!;
    }()
    
    
    lazy var plainView: NNTablePlainView = {
        var view = NNTablePlainView(frame: self.view.bounds)
        view.list = allList.first
        //        view.tableView.tableFooterView = footerView
        view.blockCellForRow({ (tableView, indexPath) -> UITableViewCell in
            let itemList = view.list![indexPath.row] as! [String]
            
//            let cell = UITableViewCellZero.dequeueReusableCell(tableView) as! UITableViewCellZero;
//            cell.textLabel!.text = itemList[0]

//            let cell = UITableViewCell.dequeueReusableCell(tableView, identifier: "cell1", style: .subtitle) as UITableViewCell;
            let cell = UITableViewCell.dequeueReusableCell(tableView, identifier: "cell1", style: .subtitle);
            
            cell.accessoryType = .disclosureIndicator;
            
            cell.textLabel!.text = itemList[1]
            cell.textLabel!.textColor = UIColor.theme;
            cell.detailTextLabel?.text = itemList[0];
            cell.detailTextLabel?.textColor = UIColor.gray;
            return cell
        })
        
        view.blockDidSelectRow({ (tableView, indexPath) in
            let itemList = view.list![indexPath.row] as! [String]
            DDLog(itemList);
            
            let controller = UICtrFromString(itemList.first!)
            controller.title = itemList.last!
            self.navigationController?.pushViewController(controller, animated: true);
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
