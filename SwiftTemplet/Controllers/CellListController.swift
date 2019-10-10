//
//  CellListController.swift
//  SwiftTemplet
//
//  Created by Bin Shang on 2019/10/8.
//  Copyright © 2019 BN. All rights reserved.
//

import UIKit
import SwiftExpand
import MJRefresh

class CellListController: UIViewController {

    var list = [["0,0",],
                [ "1,1"],
                ["2,2"],]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        view.addSubview(plainView);
    }
    
    // MARK: -functions
    func cellForRow(_ tableView: UITableView, indexPath: IndexPath) -> UITableViewCell {

        if indexPath.row == 0 {
            let cell = UITableViewCellAfford.cellWithTableView(tableView) as! UITableViewCellAfford;
            cell.labelRightSub.text = DateFormatter.stringFromDate(Date());

            cell.getViewLayer();
            return cell;
        } else {
            let cell = UITableViewCellPark.cellWithTableView(tableView) as! UITableViewCellPark;
            cell.getViewLayer();
            return cell;
        }
 
    }

    // MARK: -lazy
    lazy var plainView: NNTablePlainView = {
        var view = NNTablePlainView(frame: self.view.bounds)
        view.list = list
        view.tableView.rowHeight = 70;
//        view.tableView.tableFooterView = footerView
        view.blockCellForRow({ (tableView, indexPath) -> UITableViewCell in
            let itemList = view.list![indexPath.row] as! [String]
            
//        let cell = UITableViewCellZero.cellWithTableView(tableView) as! UITableViewCellZero;
//        cell.textLabel!.text = itemList[0]
//
//        let cell = UITableViewCell.cellWithTableView(tableView, identifier: "cell1", style: .subtitle) as UITableViewCell;
//            let cell = UITableViewCell.dequeueCell(tableView, identifier: "cell1", style: .subtitle) as UITableViewCell;
//
//            cell.accessoryType = .disclosureIndicator;
//
//            cell.textLabel!.text = itemList[0]
//            cell.textLabel!.textColor = UIColor.theme;
//
//            return cell
            return self.cellForRow(tableView, indexPath: indexPath);
        })
        
        view.blockDidSelectRow({ (tableView, indexPath) in
            let itemList = view.list![indexPath.row] as! [String]
            DDLog(itemList);
            self.goController(itemList.last, obj: itemList.first as AnyObject?, objOne: nil)
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

