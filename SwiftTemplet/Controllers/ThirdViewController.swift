
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
    
    func requestInfo() {
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
            self.plainView.tableView.mj_header!.endRefreshing()
            self.plainView.tableView.mj_footer!.endRefreshing()
        }) { (manager, dic, error) in
            DDLog(error! as Any)
            
        }

    }
    
    //MARK: -lazy
    lazy var dateRangeView: NNDateRangeView = {
        let frame = CGRect(x: 20, y: 20, width: kScreenWidth - 40, height: 60)
        var view = NNDateRangeView(frame: .zero)
        view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        view.backgroundColor = .green
        return view
    }()
    
    lazy var allList: [[[String]]] = {
        var array: [[[String]]] = [
            [["UISearchStylesController", "搜索🔍样式", ],
             ["UIRecognizerController", "手势集合", ],
             ["UIRecognizerUpdateController", "手势集合升级", ],             
             ["EntryViewController", "通用录入界面", ],
             ["CellListController", "自定义Cell界面", ],
             ["TitleViewController", "导航栏下拉菜单", ],
             ["UICollectionDispalyController", "UICollectionView展示", ],
             ["PlateNumMainController", "NNTabController组件", ],
             ["NNTabViewController", "NNTabView组件", ],             
             ["CustomViewController", "自定义View", ],
             ["CalendarViewController", "CalenderView", ],
             ["TimerViewController", "Timer", ],
             ["PickerViewController", "PickerView", ],
             ["PhotosViewController", "PictureView", ],
             ["KeyBoardViewController", "KeyBoardView", ],
             ["NNUserLogInController", "函数响应型编程", ],
             ["ScrollHorizontalController", "重构", ],
             ["ScrollViewController", "分段组件", ],
             ["TestViewController", "新想法测试", ],
             ["CCSCouponRecordController", "优惠券列表", ],
             ["AppIconChangeController", "App图标更换", ],
             ["NNFormViewController", "表单视图", ],
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
            
//            let cell = UITableViewCellZero.dequeueReusableCell(tableView)
//            cell.textLabel!.text = itemList[0]
            
//            let cell = UITableViewCell.dequeueReusableCell(tableView, identifier: "cell1", style: .subtitle)
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
        
        view.tableView.mj_header = MJRefreshNormalHeader(refreshingBlock: {
            self.requestInfo()

        })
        view.tableView.mj_footer = MJRefreshBackNormalFooter(refreshingBlock: {
            self.requestInfo()

        });
        
        return view
    }()
}
