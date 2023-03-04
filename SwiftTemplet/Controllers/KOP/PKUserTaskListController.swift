//
//	PKUserTaskListController.swift
//	MacTemplet
//
//	Created by shang on 2020/08/12 11:36
//	Copyright © 2020 shang. All rights reserved.
//


import UIKit
import SwiftExpand

/// 列表
@objcMembers class PKUserTaskListController: UIViewController{
    
    /// 数据请求返回
    var dataModel = NSObject()
    
    var dataList = NSMutableArray()

    // MARK: - lazy
    lazy var tableView: UITableView = {
        let view = UITableView(rect: self.view.bounds, style: .plain, rowHeight: 86)
        view.dataSource = self
        view.delegate = self

        return view
    }()
    
    lazy var headerView: NNTaskCenterHeaderView = {
        let view = NNTaskCenterHeaderView(frame: CGRect(0, 0, self.view.bounds.width, 95))
        
        return view
    }()
    
    // MARK: - lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        edgesForExtendedLayout = []
        title = "我的任务"
        setupUI()
    }
        
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated);
        
    }
        

    
    // MARK: - funtions
    func setupUI() {
        edgesForExtendedLayout = []
        view.backgroundColor = UIColor.white
        
        tableView.tableHeaderView = headerView
        view.addSubview(tableView);
    }


}

extension PKUserTaskListController: UITableViewDataSource, UITableViewDelegate{
    //    MARK: - tableView
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3;
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4;
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return indexPath.row == 0 ? 45 : tableView.rowHeight
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.row == 0 {
            let cell = UITableViewCellTitle.dequeueReusableCell(tableView)
            cell.imgViewLeft.isHidden = false
            cell.btn.isHidden = true

            cell.labelLeft.text = "每日任务"
            
            return cell;
        }
        let cell = UITableViewCellTask.dequeueReusableCell(tableView)

//        guard let model = dataList[indexPath.row] as? IOPParkModel else { return cell; }
//        cell.textLabel?.text = model.name
//        cell.detailTextLabel?.text = model.statusDes
//        cell.detailTextLabel?.textColor = model.statusDes == "已接入" ? UIColor.theme : UIColor.textColor9;

        switch indexPath.row {
        case 2:
            cell.btn.isSelected = true
            
        case 3:
            cell.btn.isEnabled = false
        default:
            cell.btn.isSelected = false
            cell.btn.isEnabled = true
        }
//        cell.getViewLayer()
        return cell;
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        guard let model = dataList[indexPath.row] as? IOPParkModel else { return }
//        let controller = IOPParkDetailController()
//        controller.parkModel = model
//        navigationController?.pushViewController(controller, animated: true)
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
