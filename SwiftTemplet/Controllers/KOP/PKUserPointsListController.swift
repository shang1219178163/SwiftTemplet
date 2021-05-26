//
//  PKUserPointsListController.swift
//  SwiftTemplet
//
//  Created by Bin Shang on 2020/8/14.
//  Copyright © 2020 BN. All rights reserved.
//

import UIKit
import SwiftExpand

/// 列表
@objcMembers class PKUserPointsListController: UIViewController{
    
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
    
    lazy var headerView: PKPointsCenterHeaderView = {
        let view = PKPointsCenterHeaderView(frame: CGRectMake(0, 0, self.view.bounds.width, 120))
        
        return view
    }()
    
    let popoverTitles = ["全部", "获取", "使用", ]
    
    
    // MARK: - lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupExtendedLayout()
        title = "我的积分"
        setupUI()
    }
        
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated);
        
    }
        
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - funtions
    func setupUI() {
        edgesForExtendedLayout = []
        view.backgroundColor = UIColor.white
        
        tableView.tableHeaderView = headerView
        view.addSubview(tableView);
    }
    
    func showPopover(_ sender: UIButton) {
        PopoverView.show(sender, titles: popoverTitles, block: { (popover) in
            popover.separatorColor = UIColor.hexValue(0xE8E8E8)
            popover.cellSeparatorInset = UIEdgeInsetsMake(0, 18, 0, 18)
            popover.arrowStyle = .none
            popover.contentWidth = 120
            popover.lockArrowUp = true
            popover.textColor = .textColor3
            popover.cornerRadius = 3
            
        }) { (action) in
            sender.setTitle(action.title, for: .normal)
        }
    }

}

extension PKUserPointsListController: UITableViewDataSource, UITableViewDelegate{
    //    MARK: - tableView
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2;
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return section == 0 ? 2 : 14;
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section == 0 && indexPath.row > 0 {
            return 140
        }
        return indexPath.row == 0 ? 45 : tableView.rowHeight
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.section == 0 {
            if indexPath.row == 0 {
                let cell = UITableViewCellTitle.dequeueReusableCell(tableView)
                cell.imgViewLeft.isHidden = false
                cell.btn.isHidden = true

                cell.labelLeft.text = "每日任务"
                return cell;
            }
            
            let cell = UITableViewCellSudokuButton.dequeueReusableCell(tableView)
            cell.numOfRow = 2
            cell.row = 1
            cell.itemType = UIButton.self
            cell.items.forEach {
                guard let sender = $0 as? UIButton else { return }
                sender.imageView?.contentMode = .scaleAspectFit
                $0.setTitle(nil, for: .normal)
                sender.setImage(UIImage(named: "img_points_shop"), for: .normal)
                sender.addActionHandler({ control in
                    
                    DDLog(sender.tag)
                }, for: .touchUpInside)
            }
            
            cell.items.filter { $0.tag >= 1 }.forEach({ $0.isHidden = true })
            return cell
        }
        
        if indexPath.row == 0 {
            let cell = UITableViewCellTitle.dequeueReusableCell(tableView)
            cell.imgViewLeft.isHidden = false
            cell.btn.isHidden = true

            cell.labelLeft.text = "积分记录"
            
            let sender = cell.assoryView(UIButton.self)
            sender.frame = CGRect(x: 0, y: 0, width: 63, height: 22)
            sender.setTitleColor(.white, for: .normal)
            sender.titleLabel?.font = UIFont.systemFont(ofSize: 13)
            sender.titleEdgeInsets = UIEdgeInsetsMake(0, 0, 0, 10)
            
            sender.setBackgroundImage(UIImage(named: "bg_btn_arrow_down"), for: .normal)
            sender.setBackgroundImage(UIImage(named: "bg_btn_arrow_up"), for: .selected)

            sender.setTitle("全部", for: .normal)
            sender.addActionHandler { (control) in
                control.isSelected.toggle()
                self.showPopover(sender)

            }
            return cell;
        }
        
        let cell = UITableViewCell.dequeueReusableCell(tableView, identifier: "UITableViewCellSubtitle", style: .subtitle)
        cell.textLabel?.font = UIFont.systemFont(ofSize: 16)
        cell.textLabel?.text = "--"
        cell.textLabel?.textColor = UIColor.textColor3;

        cell.detailTextLabel?.font = UIFont.systemFont(ofSize: 12)
        cell.detailTextLabel?.text = "--"
        cell.detailTextLabel?.textColor = UIColor.textColor6;
        cell.accessoryType = .disclosureIndicator;
        
        let label = cell.assoryView(UILabel.self)
        label.text = "99999"
        label.textAlignment = .right
        
//        guard let model = dataList[indexPath.row] as? IOPParkModel else { return cell; }
//        cell.textLabel?.text = model.name
//        cell.detailTextLabel?.text = model.statusDes
//        cell.detailTextLabel?.textColor = model.statusDes == "已接入" ? UIColor.theme : UIColor.textColor9;

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
