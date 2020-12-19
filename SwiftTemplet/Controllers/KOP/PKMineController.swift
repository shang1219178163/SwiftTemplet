//
//  PKMineController.swift
//  SwiftTemplet
//
//  Created by Bin Shang on 2020/7/17.
//  Copyright © 2020 BN. All rights reserved.
//

import UIKit
import SwiftExpand

class PKMineController: UIViewController {

    lazy var tableView: UITableView = {
        guard let tableView = view.findSubView(UITableView.self) as? UITableView else {
            let view = UITableView.create(self.view.bounds, style: .plain, rowHeight: 50)
            view.dataSource = self
            view.delegate = self
            return view
        }
        return tableView
    }()
    
    lazy var centerView: NNUserCenterHeaderView = {
        let view = NNUserCenterHeaderView(frame: CGRectMake(0, 0, kScreenWidth, 90+170+UIScreen.navBarHeight))
        view.userInfoView.inset = .zero
        view.userInfoView.name = "王小兰"
        view.userInfoView.level = "30"
        view.userInfoView.points = "3300"
        view.userInfoView.couponNumber = "12"
        view.userInfoView.btnLevel.addActionHandler({ (control) in
            self.navigationController?.pushVC(PKUserLevelController.self, animated: true) { (vc) in
                
            }
        }, for: .touchUpInside)
        return view
    }()
    
    lazy var list: [[[String]]] = {
        let array: [[[String]]] = [
            [["我的订单", "UITableViewCell", "40.0", "", "invoicing_name", ],
             ["我的订单", "UITableViewCellSudokuButton", "80.0", "", "","停车,车位商城", ],
            ],
            [["邀请好友", "UITableViewCell", "60.0", "", "ti_number", ],
            ],
            [["更多服务", "UITableViewCell", "40.0", "", "invoicing_name", ],
            ["更多服务", "UITableViewCellSudokuButton", "160.0", "", "","我的收藏,我的车牌,电子发票,限时活动,反馈与建议,关于我们", ],
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
        ]
    }
    
    // MARK: -lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        edgesForExtendedLayout = .all
        tableView.tableHeaderView = centerView
        view.addSubview(tableView)

    }
    

}

extension PKMineController: UITableViewDataSource, UITableViewDelegate{
    //    MARK: - tableView
    func numberOfSections(in tableView: UITableView) -> Int {
        return list.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let sections = list[section]
        return sections.count;
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let sections = list[indexPath.section]
        let itemList = sections[indexPath.row]
//        return tableView.rowHeight
        return itemList[2].cgFloatValue
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
                let cell = UITableViewCellShare.dequeueReusableCell(tableView, identifier: "UITableViewCellShare", style: .subtitle);
    //            cell.accessoryType = .disclosureIndicator
                cell.textLabel?.font = UIFont.systemFont(ofSize: 14)
                cell.textLabel?.text = value0
                if value0 == "邀请好友" {
                    cell.detailTextLabel?.textColor = .textColor9
                    cell.detailTextLabel?.font = UIFont.systemFont(ofSize: 12)
                    
                    cell.imageView?.image = UIImage(named: "icon_shareToFriends")
                    cell.imageView?.contentMode = .scaleAspectFit
                    
                    cell.textLabel?.text = value0
                    cell.detailTextLabel?.text = "快速出行，共享停车"
//                    cell.accessoryType = .disclosureIndicator
                    
                    if let btn = cell.viewWithTag(100) as? UIButton {
                        
                    } else {
                        let btn: UIButton = {
                            let rect = CGRectMake(0, 0, 60, 11)
                            let view = UIButton(type: .custom)
                            view.titleLabel?.font = UIFont.systemFont(ofSize: 11)
                            view.frame = rect
                            return view
                        }()
                        btn.setTitleColor(.textColor3, for: .normal)
//                        btn.setTitle("点击邀请", for: .normal)
//                        btn.setImage(UIImage(named: "icon_arrow_right_black"), for: .normal)
                        btn.setBackgroundImage(UIImage(named: "icon_invite"), for: .normal)
                        cell.accessoryView = btn
                    }
                }

                cell.getViewLayer();
                return cell;
//            case "UITableViewCell":
//                let cell = UITableViewCell.dequeueReusableCell(tableView, identifier: "UITableViewCellValue1", style: .subtitle);
//    //            cell.accessoryType = .disclosureIndicator
//                cell.textLabel?.font = UIFont.systemFont(ofSize: 14)
//
//                cell.textLabel?.text = value0
//                if value0 == "邀请好友" {
//                    cell.imageView!.transform = cell.imageView!.transform.scaledBy(x: 0.6, y: 0.6)
//                    cell.detailTextLabel?.textColor = .textColor3
//
//                    cell.imageView?.image = UIImage(named: "icon_shareToFriends")
//                    if let imageView = cell.imageView, imageView.transform == .identity {
//                        imageView.transform = imageView.transform.scaledBy(x: 0.55, y: 0.55)
//                        imageView.contentMode = .center
//                    }
//
//                    cell.textLabel?.text = value0
//                    cell.detailTextLabel?.text = "快速出行，共享停车"
////                    cell.accessoryType = .disclosureIndicator
//
//                    if let btn = cell.viewWithTag(100) as? UIButton {
//
//                    } else {
//                        let btn: UIButton = {
//                            let rect = CGRectMake(0, 0, 60, 11)
//                            let view = UIButton(type: .custom)
//                            view.titleLabel?.font = UIFont.systemFont(ofSize: 11)
//                            view.frame = rect
//                            return view
//                        }()
//                        btn.setTitleColor(.textColor3, for: .normal)
////                        btn.setTitle("点击邀请", for: .normal)
////                        btn.setImage(UIImage(named: "icon_arrow_right_black"), for: .normal)
//                        btn.setBackgroundImage(UIImage(named: "icon_invite"), for: .normal)
//                        cell.accessoryView = btn
//                    }
//                }
//
//                cell.getViewLayer();
//                return cell;
            
            case "UITableViewCellSudokuButton":
                let cell = UITableViewCellSudokuButton.dequeueReusableCell(tableView, identifier: "UITableViewCellSudokuButton\(value0)");
                cell.numOfRow = 4
                let items = itemList.last!.components(separatedBy: ",")
                
                cell.row = items.count % cell.numOfRow == 0 ? items.count/cell.numOfRow : items.count/cell.numOfRow + 1
                cell.itemType = NNButton.self
    //            cell.items.forEach { $0.setTitleColor(.systemBlue, for: .normal)}
                cell.items.forEach {

                    guard let sender = $0 as? NNButton else { return }
                    sender.direction = .top
                    sender.titleLabel?.font = UIFont.systemFont(ofSize: 12)

                    sender.setImage(UIImage(named: "btn_selected_YES"), for: .normal)
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
                    }, for: .touchUpInside)
                }
                
                DDLog(cell.items.first!)
                
                cell.items.filter { $0.tag >= items.count }.forEach({ $0.isHidden = true })

                cell.getViewLayer();
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
