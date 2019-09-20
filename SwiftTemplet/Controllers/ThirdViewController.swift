
//
//  ThirdViewController.swift
//  SwiftTemplet
//
//  Created by Bin Shang on 2018/8/10.
//  Copyright © 2018年 BN. All rights reserved.
//

import UIKit
import SwiftExpand
import HandyJSON
import Moya
import MJRefresh

//class ThirdViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {
class ThirdViewController: UIViewController{

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(plainView)
        
        if title == nil {
            title = self.controllerName;
        }
        
        createBarItem( .action, isLeft: true) { (sender: AnyObject) in
            self.goController("FleetDetailControllerNew", obj: nil, objOne: nil)
        }
        
        createBarItem( .done, isLeft: false) { (sender: AnyObject) in
            self.goController("IOPAuthDetailController", obj: nil, objOne: nil)
            
        }
        
//        let layout = UICollectionViewLayout()
//        layout.minimumInteritemSpacing = 0.3
//        layout.minimumLineSpacing = 0.5
//        layout.headerReferenceSize = CGSize(width: 33, height: 54)
//        layout.sectionInset = UIEdgeInsets(top: 1, left: 2, bottom: 3, right: 4)
//        DDLog(layout.minimumInteritemSpacing,layout.minimumLineSpacing,layout.headerReferenceSize,layout.sectionInset)
//        UIApplication.updateVersion(appStoreID: kAppStoreID, isForce: false);
        view.getViewLayer()
     
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated);
        
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        plainView.frame = view.bounds
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: -funtions
    
    func requestInfo() -> Void {
        NNProgressHUD.showLoadingText("努力加载中")
        let updateAPi = NNCheckVersApi()
        updateAPi.startRequest(success: { (manager, dic, error) in
            
            let data: Data! = try? JSONSerialization.data(withJSONObject: dic as Any, options: []);
            let jsonString: String! = String(data: data, encoding: .utf8);
            let string: String! = jsonString.replacingOccurrences(of: "\\", with: "")
            //            DDLog(string)
//            if let response = NNCheckVersRootClass.deserialize(from: dic) {
            if let response = ESCheckVersRootClass.deserialize(from: dic) {
                //                DDLog(response)
            }
            NNProgressHUD.showSuccessText("请求成功");
            self.plainView.tableView.mj_header.endRefreshing()
            self.plainView.tableView.mj_footer.endRefreshing()
        }) { (manager, dic, error) in
            DDLog(error! as Any)
            
        }

    }
    
    //MARK: -lazy
    lazy var dateRangeView: NNDateRangeView = {
        let frame = CGRect(x: 20, y: 20, width: kScreenWidth - 40, height: 60)
        var view = NNDateRangeView(frame: .zero)
        view.autoresizingMask = UIView.AutoresizingMask(rawValue: UIView.AutoresizingMask.flexibleWidth.rawValue | UIView.AutoresizingMask.flexibleHeight.rawValue)
        view.backgroundColor = .green
        return view
    }()
    
    lazy var allList: [[[String]]] = {
        var array: [[[String]]] = [
            [["通用录入界面", "EntryViewController"],
             ["导航栏下拉菜单", "TitleViewController"],
             ["UICollectionView展示", "UICollectionDispalyController"],
             ["tabViewController展示", "NNTabController"],
             ["自定义View", "CustomViewController"],
             ["CalenderView", "CalendarViewController"],
             ["Timer", "TimerViewController"],
             ["PickerView", "PickerViewController"],
             ["PictureView", "PhotosViewController"],
             ["KeyBoardView", "KeyBoardViewController"],
             ["函数响应型编程", "NNUserLogInController"],
             ["重构", "ScrollHorizontalController"],
             ["分段组件", "ScrollViewController"],             
             ["新想法测试", "TestViewController"],
             ["优惠券列表", "CCSCouponRecordController"],
             ["App图标更换", "AppIconChangeController"],

             ],
        ]
        return array
    }()
    
    lazy var list:[[String]] = {
        return self.allList.first!;
    }()
    
    //MARK: -Lazy Property
    lazy var footerView: NNTableFooterView = {
        var view = NNTableFooterView(frame: CGRect(x: 0, y: 0, width: kScreenWidth, height: 150))
        view.label.text = ""
        view.label.textAlignment = .center
        view.btn.setTitle("提交", for: .normal)
        view.btn.addActionHandler({[weak self] (sender:UIControl) in
            let obj = sender as! UIButton
            DDLog(obj.tag)
            
            }, for: .touchUpInside)
        return view
    }()
    
    lazy var plainView: NNTablePlainView = {
        var view = NNTablePlainView(frame: self.view.bounds)
        view.list = allList.first
//        view.tableView.tableFooterView = footerView
        view.blockCellForRow({ (tableView, indexPath) -> UITableViewCell in
            let itemList = view.list![indexPath.row] as! [String]
            
//            let cell = UITableViewCellZero.cellWithTableView(tableView) as! UITableViewCellZero;
//            cell.textLabel!.text = itemList[0]
            
//            let cell = UITableViewCell.cellWithTableView(tableView, identifier: "cell1", style: .subtitle) as UITableViewCell;
            let cell = UITableViewCell.dequeueCell(tableView, identifier: "cell1", style: .subtitle) as UITableViewCell;

            cell.accessoryType = .disclosureIndicator;
            
            cell.textLabel!.text = itemList[0]
            cell.textLabel!.textColor = UIColor.theme;
            cell.detailTextLabel?.text = itemList[1];
            cell.detailTextLabel?.textColor = UIColor.gray;
            return cell
        })
        
        view.blockDidSelectRow({ (tableView, indexPath) in
            let itemList = view.list![indexPath.row] as! [String]
            DDLog(itemList);
            self.goController(itemList.last, obj: itemList.first as AnyObject?, objOne: nil)
        })
        
        view.tableView.mj_header = MJRefreshNormalHeader(refreshingBlock: {
            self.requestInfo()

        })
        view.tableView.mj_footer = MJRefreshBackNormalFooter(refreshingBlock: {
            self.requestInfo()

        });
        
        return view
    }()
}
