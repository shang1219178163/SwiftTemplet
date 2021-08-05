//
//	PKUserInfoEditController.swift
//	MacTemplet
//
//	Created by shang on 2020/07/16 18:26
//	Copyright © 2020 shang. All rights reserved.
//


import UIKit
import SwiftExpand
import SnapKit

class PKUserInfoEditController: UIViewController{

    var dataModel = NSObject()
    
    
    lazy var tableView: UITableView = {
        guard let tableView = view.findSubView(UITableView.self) as? UITableView else {
            let view = UITableView(rect: self.view.bounds, style: .plain, rowHeight: 50)
            view.dataSource = self
            view.delegate = self
            return view
        }
        return tableView
    }()
        
    lazy var list: [[[String]]] = {
        let array: [[[String]]] = [
            [["用户头像", "UITableViewCellRightAvart", "50.0", "", "seller_bank_account", ],
             ["昵称", "UITableViewCell", "50.0", "", "seller_bank_account", ],
             ["真实姓名", "UITableViewCell", "50.0", "", "seller_bank_account", ],
             ["性别", "UITableViewCellSheet", "50.0", "", "seller_bank_account", ],
             ["生日", "UITableViewCellDatePicker", "50.0", "", "seller_bank_account", ],
            ],
        ]
        return array
    }()
    
    var image = UIImage(named: "icon_avatar")
    
    lazy var pickerVC: NNImageAndVideoPickerController = {
        let controller = NNImageAndVideoPickerController()
        controller.maxCount = 1
        controller.didFinishPickerBlock = { images, assets, isOriginImage in
            DDLog(images)
            
            self.image = images.first
            self.tableView.reloadData()
        }
        return controller
    }()
    
    // MARK: -lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        edgesForExtendedLayout = []
        view.backgroundColor = .white
        
        title = "编辑资料"
        view.addSubview(tableView)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
    }


}

extension PKUserInfoEditController: UITableViewDataSource, UITableViewDelegate{
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
        case "UITableViewCellRightAvart":
            let cell = UITableViewCellRightAvart.dequeueReusableCell(tableView)
            cell.textLabel?.font = UIFont.systemFont(ofSize: 14)
            cell.textLabel?.textColor = UIColor.textColor3
            cell.isHidden = value2.cgFloatValue <= 0.0
            cell.accessoryType = .disclosureIndicator

            cell.textLabel?.text = value0
            cell.btn.setBackgroundColor(.systemBlue, for: .normal)
            cell.btn.setBackgroundImage(self.image, for: .normal)
            
            cell.getViewLayer()
            return cell
            
        case "UITableViewCellDatePicker":
            let cell = UITableViewCellDatePicker.dequeueReusableCell(tableView)
            cell.labelLeft.font = UIFont.systemFont(ofSize: 14)
            cell.labelLeft.textColor = UIColor.textColor3
            cell.textfield.textAlignment = .right
            cell.isHidden = value2.cgFloatValue <= 0.0
            cell.hasAsterisk = value0.hasPrefix("*")

            cell.labelLeft.text = value0
//            cell.textfield.text = dataModel.valueText(forKeyPath: value4, defalut: "请选择")

            cell.datePicker.block { (datePicker, idx) in
                let time = DateFormatter.stringFromDate(datePicker.datePicker.date)
                DDLog(time, idx)
                if idx == 1 {
                    cell.textfield.text = "\(time.prefix(10))"
                }
            }

            cell.getViewLayer()
            return cell
            
        case "UITableViewCellSheet":
            let cell = UITableViewCellSheet.dequeueReusableCell(tableView)
            cell.labelLeft.font = UIFont.systemFont(ofSize: 14)
            cell.labelLeft.textColor = UIColor.textColor3
            cell.textfield.textAlignment = .right
            cell.isHidden = value2.cgFloatValue <= 0.0
            cell.hasAsterisk = value0.hasPrefix("*")

            cell.labelLeft.text = value0
            cell.itemList = ["男","女",]
            cell.block { (title) in
                DDLog(title)
            }
            cell.getViewLayer()
            return cell
        default:
            break
        }
        
        let cell = UITableViewCell.dequeueReusableCell(tableView, identifier: "UITableViewCellValue1", style: .value1)
        cell.textLabel?.textColor = UIColor.textColor3
        cell.textLabel?.font = UIFont.systemFont(ofSize: 14)
        cell.detailTextLabel?.font = UIFont.systemFont(ofSize: 14)
        cell.detailTextLabel?.textColor = UIColor.textColor3
        cell.accessoryType = .disclosureIndicator

        cell.textLabel?.text = value0
        cell.detailTextLabel?.text = "未填写"
        
        if indexPath.section == 0 && indexPath.row == 0 {
            cell.imageView?.image = UIImage(named: "img_meetStandard")
            cell.detailTextLabel?.text = "修改头像"
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let sections = list[indexPath.section]
        let itemList = sections[indexPath.row]
        
        switch itemList.first {
        case "用户头像":
            pickerVC.show()
            
        case "昵称","真实姓名":
            navigationController?.pushVC(PKTextFieldInputController.self, animated: true) { (vc) in
                vc.title = itemList.first!
            }
            
        default:
            break
        }
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
