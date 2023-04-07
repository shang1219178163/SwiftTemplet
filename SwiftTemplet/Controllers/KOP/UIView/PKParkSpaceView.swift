//
//	PKParkSpaceView.swift
//	MacTemplet
//
//	Created by shang on 2020/07/24 16:05
//	Copyright © 2020 shang. All rights reserved.
//


import UIKit
import SnapKit
import SwiftExpand
        
@objc protocol PKParkSpaceViewDelegate{
    @objc func parkspaceview(_ view: PKParkSpaceView)
    
}
        
///
@objcMembers class PKParkSpaceView: UIView {

    weak var delegate: PKParkSpaceViewDelegate?

    typealias ViewClick = (PKParkSpaceView, UIButton) -> Void;
    var viewBlock: ViewClick?;
    
    
    lazy var tableView: UITableView = {
        let view = UITableView(rect: self.bounds, style: .plain, rowHeight: 40)
        view.dataSource = self
        view.delegate = self

        return view
    }()
    
    lazy var list: [[[String]]] = {
        let array: [[[String]]] = [
            [["车场位置", "UITableViewCell", "45.0", "", "recharge", ],
            ["请输入停车场名称", "UITableViewCellButton", "45.0", "", "recharge", ],
             ["我的订单", "UITableViewCellSudokuButton", "90.0", "", "","付停车费,车位商城", ],
            ],
        ]
        return array
    }()
    
    var iconDic: [String: String] {
        return ["停车": "icon_parking_car",
                "车位商城": "icon_spaceShop",
                "我的收藏": "icon_collect",
                "我的车牌": "icon_plateNumber",
                "电子发票": "icon_eInvoice",
                "限时活动": "icon_limited_time_activity",
                "反馈与建议": "icon_feedback",
                "关于我们": "icon_about",
                "付停车费": "icon_park_fee",
        ]
    }
    
    // MARK: -lifecycle
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        var tmp = frame
        tmp.size.height = 180
        self.frame = tmp
        addSubview(tableView)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        if bounds.height <= 0.0 {
            return;
        }
        
        
    }
    
    // MARK: - funtions
    func block(_ action: @escaping ViewClick) {
        self.viewBlock = action;
    }
    
}

extension PKParkSpaceView: UITableViewDataSource, UITableViewDelegate{
    //    MARK: - tableView
    func numberOfSections(in tableView: UITableView) -> Int {
        return list.count;
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let sections = list[section]
        return sections.count;
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let sectionList = list[indexPath.section]
        let itemList = sectionList[indexPath.row]
        let height = itemList[2].cgFloatValue
        return height
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let sections = list[indexPath.section]
        let itemList = sections[indexPath.row]
        let value0 = itemList[0]
        let value1 = itemList[1]
        let value2 = itemList[2]
        let value3 = itemList[3]
        let value4 = itemList[4]
        
        switch value1 {
        case "UITableViewCell":
            let cell = UITableViewCell.dequeueReusableCell(tableView, identifier: "UITableViewCell", style: .value1)
            cell.textLabel?.font = UIFont.systemFont(ofSize: 15)
            cell.textLabel?.textColor = UIColor.textColor3;

            cell.detailTextLabel?.font = UIFont.systemFont(ofSize: 15)
            cell.detailTextLabel?.textColor = UIColor.theme
            cell.separatorInset = UIEdgeInsets(0, 0, 0, kScreenWidth);

            cell.imageView?.image = UIImage(named: "icon_park_location")
            cell.textLabel?.text = value0
//            cell.detailTextLabel?.text = "上传"
            cell.textLabel?.text = "雁塔区天谷八路211号"

//            let result: String = dataModel.valueText(forKeyPath: value4, defalut: "-")
            cell.separatorInset = UIEdgeInsets(0, 0, 0, kScreenWidth);
//            cell.getViewLayer()
            return cell;

        case "UITableViewCellButton":
            let cell = UITableViewCellButton.dequeueReusableCell(tableView);
            cell.separatorInset = UIEdgeInsets(0, 0, 0, kScreenWidth);

            cell.inset = UIEdgeInsets(0, 15, 0, 15)
            cell.btn.titleLabel?.font = UIFont.systemFont(ofSize: 15)
            cell.btn.contentEdgeInsets = UIEdgeInsets(0, 10, 0, 0)
            cell.btn.contentHorizontalAlignment = .left
            cell.btn.layer.cornerRadius = 5
            cell.btn.layer.masksToBounds = true
            
            cell.btn.setImage(UIImage(named: "icon_search"), for: .normal)
            cell.btn.setTitle("请输入停车场名称", for: .normal)
            cell.btn.setTitleColor(.textColor3, for: .normal)
            cell.btn.setBackgroundColor(UIColor.hexValue(0xdddddd), for: .normal)
            
//            cell.getViewLayer();
            return cell;
            
        case "UITableViewCellSudokuButton":
            let cell = UITableViewCellSudokuButton.dequeueReusableCell(tableView);
            cell.numOfRow = 4
            let items = itemList.last!.components(separatedBy: ",")
            
            cell.row = items.count % cell.numOfRow == 0 ? items.count/cell.numOfRow : items.count/cell.numOfRow + 1
            cell.itemType = NNButton.self
//            cell.items.forEach { $0.setTitleColor(.systemBlue, for: .normal)}
            cell.items.forEach {

                guard let sender = $0 as? NNButton else { return }
                sender.direction = .top
                sender.titleLabel?.font = UIFont.systemFont(ofSize: 12)

                sender.setImage(UIImage(named: "icon_selected_yes_blue"), for: .normal)
//                    sender.setTitle(items[sender.tag], for: .normal)
                sender.setTitleColor(.textColor3, for: .normal)
                if items.count > sender.tag {
                    if let title = items[sender.tag] as String?,  let imageName = self.iconDic[title] as String? {
                        sender.setTitle(title, for: .normal)
                        sender.setImage(UIImage(named: imageName), for: .normal)
                    }
                }

                sender.addActionHandler({ control in
                    
                    DDLog(sender.tag)
                    
                    self.viewBlock?(self, sender)
                }, for: .touchUpInside)
            }
            
            DDLog(cell.items.first!)
            cell.items.filter { $0.tag >= items.count }.forEach({ $0.isHidden = true })
            
            cell.separatorInset = UIEdgeInsets(0, 0, 0, kScreenWidth);

//            cell.getViewLayer();
            return cell;

        default:
            break
        }
        let cell = UITableViewCell.dequeueReusableCell(tableView)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        if section == 0 {
            return 0.01
        }
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
