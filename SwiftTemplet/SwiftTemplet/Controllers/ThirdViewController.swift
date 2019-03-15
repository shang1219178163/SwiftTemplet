
//
//  ThirdViewController.swift
//  SwiftTemplet
//
//  Created by hsf on 2018/8/10.
//  Copyright © 2018年 BN. All rights reserved.
//

import UIKit
import SwiftExpand

class ThirdViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        tableView.tableFooterView = footerView
//        view.addSubview(tableView)
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
        
//        view.addSubview(dateRangeView)
        
        let layout = UICollectionViewLayout()
        layout.minimumInteritemSpacing = 0.3
        layout.minimumLineSpacing = 0.5
        layout.headerReferenceSize = CGSize(width: 33, height: 54)
        layout.sectionInset = UIEdgeInsets(top: 1, left: 2, bottom: 3, right: 4)
        DDLog(layout.minimumInteritemSpacing,layout.minimumLineSpacing,layout.headerReferenceSize,layout.sectionInset)
        
        
        view.getViewLayer()
                
    }
    
    //MARK: -lazy
    lazy var dateRangeView: BNDateRangeView = {
        let frame = CGRect(x: 20, y: 20, width: kScreenWidth - 40, height: 60)
        var view = BNDateRangeView(frame: .zero)
        view.autoresizingMask = UIViewAutoresizing(rawValue: UIViewAutoresizing.flexibleWidth.rawValue | UIViewAutoresizing.flexibleHeight.rawValue)
        view.backgroundColor = .green
        return view
    }()
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated);
        
//        list = allList.randomElement()!;
//        tableView.reloadData()
        
        var controller = "CustomViewController"
        controller = "PickerViewController"
        
//        goController(controller, obj: nil, objOne: nil)
        
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        tableView.frame = view.bounds
    }
    
    //    MARK: - tableView
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1;
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return list.count;
    };
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    };
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let itemList = list[indexPath.row]
        
        let cell = UITableViewCellZero.cellWithTableView(tableView) as! UITableViewCellZero;
        cell.textLabel!.text = itemList[0]
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let itemList = list[indexPath.row]
        goController(itemList.last, obj: nil, objOne: nil)
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 10;
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        return UIView();
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 0.01;
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        
        let label = UILabel(frame: .zero);
        //        label.backgroundColor = .green;
        //        label.text = "header\(section)";
        return label;
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    lazy var allList: [[[String]]] = {
        var array: [[[String]]] = [
            [["通用录入界面", "EntryViewController"],
             ["导航栏下拉菜单", "TitleViewController"],
             ["UICollectionView展示", "UICollectionDispalyController"],
             ["自定义View", "CustomViewController"],
             ["CalenderView", "CalendarViewController"],
             ["Timer", "TimerViewController"],
             ["PickerView", "PickerViewController"],
             ["PictureView", "PhotosViewController"],
             ["KeyBoardView", "KeyBoardViewController"],

             ],
        ]
        return array
    }()
    
    lazy var list:[[String]] = {
        return self.allList.first!;
    }()
    
    //MARK: -Lazy Property
    lazy var footerView: BNTableFooterView = {
        var view = BNTableFooterView(frame: CGRect(x: 0, y: 0, width: kScreenWidth, height: 150))
        view.label.text = ""
        view.label.textAlignment = .center
        view.btn.setTitle("提交", for: .normal)
        view.btn.addActionHandler({[weak self] (sender:UIControl) in
            let obj = sender as! UIButton
            DDLog(obj.tag)
            
            }, for: .touchUpInside)
        return view
    }()
    
    
    lazy var plainView: UIView = {
        var view = BNTablePlainView(frame: self.view.bounds)
        view.list = allList.first
        view.blockCellForRow({ (tableView, indexPath) -> UITableViewCell in
            let itemList = view.list![indexPath.row] as! [String]
            
            let cell = UITableViewCellZero.cellWithTableView(tableView) as! UITableViewCellZero;
            cell.textLabel!.text = itemList[0]
            return cell
        })
        
        view.blockDidSelectRow({ (tableView, indexPath) in
            let itemList = view.list![indexPath.row] as! [String]
            self.goController(itemList.last, obj: nil, objOne: nil)
        })
        
        return view
    }()
}
