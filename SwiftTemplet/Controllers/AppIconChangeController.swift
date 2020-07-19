//
//  AppIconChangeController.swift
//  SwiftTemplet
//
//  Created by Bin Shang on 2019/9/20.
//  Copyright © 2019 BN. All rights reserved.
//

import UIKit
import SwiftExpand

class AppIconChangeController: UIViewController {
    var dataList: NSMutableArray = [];

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        dataList = [["AppIcon", "默认",],
                    ["parkingOne", "Parking",],
                    ["parkingWang", "停车王",],
                    ["天天特价", "天天特价",],
                   ]
        view.addSubview(plainView)
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        plainView.tableView.reloadData();
    }

    
    lazy var plainView: NNTablePlainView = {
        var view = NNTablePlainView(frame: self.view.bounds)
        view.list = (dataList as! [Any])
        //        view.tableView.tableFooterView = footerView
        view.blockCellForRow({ (tableView, indexPath) -> UITableViewCell in
            let itemList = view.list![indexPath.row] as! [String]
            
            let cell = UITableViewCell.dequeueReusableCell(tableView, identifier: "cell1", style: .subtitle);
            
            cell.accessoryType = .disclosureIndicator;
            cell.imageView?.image = UIImageNamed(itemList[0])
            cell.imageView?.contentMode = .scaleAspectFit
//            cell.textLabel!.text = itemList[0]
//            cell.textLabel!.textColor = UIColor.theme;
            cell.detailTextLabel?.text = itemList[1];
            cell.detailTextLabel?.textColor = UIColor.gray;
            return cell
        })
        
        view.blockDidSelectRow({ (tableView, indexPath) in
            let itemList = view.list![indexPath.row] as! [String]
            if indexPath.row == 0 {
                UIApplication.setAppIcon(name: nil)

            } else {
                UIApplication.setAppIcon(name: itemList[0])

            }
        })
                
        return view
    }()
}
