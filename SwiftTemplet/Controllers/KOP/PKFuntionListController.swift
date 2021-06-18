//
//	PKFuntionListController.swift
//	MacTemplet
//
//	Created by shang on 2020/07/24 14:19
//	Copyright © 2020 shang. All rights reserved.
//


import UIKit
import SwiftExpand

/// 列表
@objcMembers class PKFuntionListController: UIViewController{
    
    lazy var list: [[[String]]] = {
        var array: [[[String]]] = [
            [
            ["PKLoginController", "kOP 登录页", ],
             ["PKAccountLogOffOneController", "AccountLogOff", ],
             ["EDriverViewController", "E代驾", ],
             ["AliBianXianKeController", "变现客", ],
             ["BXKViewController", "变现客", ],

             ["PKParkBriefController", "车场空车位", ],
             ["PKParkCollectListController", "kOP 收藏", ],
             ["PKRegionParkListController", "当前区域车场", ],
             ["PKParkDetailController", "车场详情", ],
             ["PKMineController", "kOP 我的", ],
             ["PKSettingsController", "kOP 设置页", ],
             ["PKUserInfoEditController", "kOP 用户信息", ],
             ["PKRecommendToFriendsController", "kOP 推荐给好友", ],
             ["PKAccountAboutController", "kOP 账户与安全", ],
             ["PKAppAbountController", "kOP 关于停车王", ],
             ["PKUserLevelController", "用户等级", ],
             ["PKUserTaskListController", "我的任务", ],
             ["PKUserPointsListController", "我的积分", ],
             
            ["PKTabBarViewController", "PKTabBar", ],
                
            ],
        ]
        return array
    }()

    // MARK: - lazy
    lazy var tableView: UITableView = {
        let view = UITableView(rect: self.view.bounds, style: .plain, rowHeight: 50)
        view.dataSource = self
        view.delegate = self

        return view
    }()
        
    lazy var rightBtn: UIButton = {
        let view = UIButton(type: .custom)
        view.setTitle("保存", for: .normal)
//        view.isHidden = true;
        view.sizeToFit()
        view.addActionHandler({ (sender) in
//            DDLog(control)
            self.navigationController?.pushVC(SimpleListController.self, animated: true, block: { (vc) in
                vc.label.text = "SimpleListController"
            })
            
        }, for: .touchUpInside)
        return view
    }()
    
    @objc func handleAction(_ sender: UIButton) {
        
    }
    
    
    // MARK: - lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "KOP功能"
        setupExtendedLayout()
        setupUI()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated);
        
//        pushVC(PKRegionParkListController.self, animated: false, block: nil)
//        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
//        navigationController?.navigationBar.shadowImage = UIImage()
        
        navigationController?.navigationBar.setBackgroudColor(.clear, for: .default)
        navigationController?.navigationBar.setTextColor(.systemGreen)
    }
        
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - funtions
    func setupUI() {
        view.backgroundColor = UIColor.white

        navigationItem.rightBarButtonItem = UIBarButtonItem(customView: rightBtn)
        
        view.addSubview(tableView);
    }


}

extension PKFuntionListController: UITableViewDataSource, UITableViewDelegate{
    //    MARK: - tableView
    func numberOfSections(in tableView: UITableView) -> Int {
        return list.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return list[section].count;
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return tableView.rowHeight
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell.dequeueReusableCell(tableView, identifier: "cell1", style: .subtitle);
        cell.textLabel!.font = UIFont.systemFont(ofSize: 15)
        cell.textLabel!.textColor = UIColor.theme;

        cell.textLabel!.font = UIFont.systemFont(ofSize: 13)
        cell.detailTextLabel?.textColor = UIColor.gray;
        cell.accessoryType = .disclosureIndicator;
        
        let itemList = list[indexPath.section][indexPath.row]
        cell.textLabel!.text = itemList[1]
//        cell.textLabel!.text = NSLocalizedString(itemList[1], comment: "")
        cell.textLabel!.text = Bundle.localizedString(forKey: itemList[1])

        cell.detailTextLabel?.text = itemList[0];

        return cell;
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let itemList = list[indexPath.section][indexPath.row]
//        DDLog(itemList);
        
        let controller = UICtrFromString(itemList.first!)
        controller.title = itemList.last!
        navigationController?.pushViewController(controller, animated: true);
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 10.01;
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        return UILabel();
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 0.01;
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        return UILabel();
    }
}
