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

    var list = [["0,70",], [ "1,55"], ["2,90"], ["3,90"],
                ["4,90"], ["4,70"], ["4,40"], ["4,60"],]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        view.addSubview(plainView);
    }
    
    
//    override func viewWillLayoutSubviews() {
//        super.viewWillLayoutSubviews()
//
//        DDLog("__\(view.frame)")
//        var rect = view.frame
//        rect.size = view.superview!.bounds.size;
//        rect.size = CGSize(width: view.superview!.bounds.width, height: 100);
//
//        view.frame = rect;
//        DDLog("==\(view.frame)")
//        view.backgroundColor = .red
//    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
    }
    
    // MARK: -functions
    func cellForRow(_ tableView: UITableView, indexPath: IndexPath) -> UITableViewCell {

        if indexPath.row == 0 {
            let cell = UITableViewCellAfford.dequeueReusableCell(tableView);
            cell.labelRightSub.text = DateFormatter.stringFromDate(Date());

            cell.getViewLayer();
            return cell;
        } else if indexPath.row == 1 {
            let cell = IOPTableViewCellGroupView.dequeueReusableCell(tableView);
            cell.parkGroupView.items = ["异常出车", "无入场记录", "长时为出"]
            cell.parkGroupView.selectedIdxList = [0]
            return cell;

        } else if indexPath.row == 2 {
//            let cell = UITableViewCellFee.dequeueReusableCell(tableView)
            let cell = UITableViewCellFee.dequeueReusableCell(tableView)
            
            cell.isPositive = true;

            cell.labelTop.text = "临时车"
            cell.labelRight.text = "计费: ¥ 23.00"
            cell.labelMid.text = "异常出车异常出车异常出车异常出车异常出车异常出车"
            cell.labelBom.text = DateFormatter.stringFromDate(Date()) + DateFormatter.stringFromDate(Date())
            
            cell.getViewLayer();
            return cell;
               
        } else if indexPath.row == 3 {
          let cell = UITableViewCellFee.dequeueReusableCell(tableView);
            cell.isPositive = false;

           cell.labelTop.text = "临时车"
           cell.labelRight.text = "计费: ¥ 1.00"
           cell.labelMid.text = "异常出车异常出车异常出车异常出车异常出车异常出车"
           cell.labelBom.text = DateFormatter.stringFromDate(Date()) + "~" + DateFormatter.stringFromDate(Date())
           
            cell.getViewLayer();

           return cell;
               
        } else if indexPath.row == 4 {
            let cell = UITableViewCellPark.dequeueReusableCell(tableView);
            cell.getViewLayer();
            return cell;
        } else if indexPath.row == 5 {
            let cell = UITableViewCellSubtitle.dequeueReusableCell(tableView);
            cell.imgViewLeft.isHidden = true
            cell.labelRightSub.text = DateFormatter.stringFromDate(Date());

            cell.getViewLayer();
            return cell;
        } else if indexPath.row == 6 {
           let cell = UITableViewCellPayBill.dequeueReusableCell(tableView);
            cell.labelLeft.text = "¥5000.00"
            cell.pay_status = "2"

            cell.getViewLayer();
            return cell;
        }
        else if indexPath.row == 7 {
          let cell = UITableViewCellWebView.dequeueReusableCell(tableView);
           cell.loadContent = "asdfasdfasdf"

           cell.getViewLayer();
           return cell;
       }
        return UITableViewCell.dequeueReusableCell(tableView);
    }

    // MARK: -lazy
    lazy var plainView: NNTablePlainView = {
        var view = NNTablePlainView(frame: self.view.bounds)
        view.list = list
        view.tableView.rowHeight = 70;
//        view.tableView.tableFooterView = footerView
        view.blockCellForRow({ (tableView, indexPath) -> UITableViewCell in
            let itemList = view.list![indexPath.row] as! [String]
            
//        let cell = UITableViewCellZero.dequeueReusableCell(tableView) as! UITableViewCellZero;
//        cell.textLabel!.text = itemList[0]
//
//        let cell = UITableViewCell.dequeueReusableCell(tableView, identifier: "cell1", style: .subtitle);
//            let cell = UITableViewCell.dequeueCell(tableView, identifier: "cell1", style: .subtitle);
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
            self.pushVC(itemList.last!)
        })
        view.blockCellHeightForRow { (tableView, indexPath) -> CGFloat in
            let itemList = view.list![indexPath.row] as! [String]
            let cellList: String = itemList[0].components(separatedBy: ",") .last!
            return cellList.cgFloatValue;
        }
        
//        view.tableView.mj_header = MJRefreshNormalHeader(refreshingBlock: {
//
//        })
//        view.tableView.mj_footer = MJRefreshBackNormalFooter(refreshingBlock: {
//            
//        });
        
        return view
    }()
}

