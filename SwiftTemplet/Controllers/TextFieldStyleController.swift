//
//  TextFieldStyleController.swift
//  SwiftTemplet
//
//  Created by Bin Shang on 2020/5/19.
//  Copyright © 2020 BN. All rights reserved.
//

import UIKit

import SwiftExpand
import SDWebImage

class TextFieldStyleController: UIViewController {
    
    var dataModel = NSObject()

    //MARK: -lazy
    lazy var tableView: UITableView = {
        let view = UITableView(rect: self.view.bounds, style: .plain, rowHeight: 50)
        view.dataSource = self
        view.delegate = self

        return view
    }()
        
    lazy var rightBtn: UIButton = {
        let view = UIButton(type: .custom)
        view.setTitle("优惠券", for: .normal)
        
        view.sizeToFit()
        view.addActionHandler({ (sender) in
            let controller = CCSCouponRecordController()
            self.navigationController?.pushViewController(controller, animated: true)
            
        }, for: .touchUpInside)
        return view
    }()
    
    // MARK: -life cycle
    deinit {
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardDidShowNotification, object: nil)
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillHideNotification, object: nil)
        DDLog(1111)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "文本框样式"
        navigationItem.rightBarButtonItem = UIBarButtonItem(customView: rightBtn)

        tableView.rowHeight = UITableView.automaticDimension;
        tableView.estimatedRowHeight = 70;

//        _ScrollView.keyboardDismissMode = UIScrollViewKeyboardDismissModeInteractive;
        view.addSubview(tableView);
        
        titleViewTap()
        
        //监听键盘
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardShow(_ :)), name: UIResponder.keyboardDidShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardDismiss(_ :)), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    //MARK: -func
    //键盘弹出监听
    @objc func keyboardShow(_ noti: Notification)  {
        navigationController?.preferredContentSize = CGSize(width: kScreenWidth, height: 560)
    }
    
    //键盘隐藏监听
    @objc func keyboardDismiss(_ noti: Notification){
        navigationController?.preferredContentSize = CGSize(width: kScreenWidth, height: 370)
    }
    
    func titleViewTap() {
        textField.text = "闭包的回调方法"
        textField.addGestureTap { (reco) in
            DDLog(reco)
        }
        navigationItem.titleView = textField
    }
    
    lazy var textField: UITextField = {
        let view = UITextField(frame: .zero);
        view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        view.textAlignment = .left;
        view.contentVerticalAlignment = .center;
        view.autocapitalizationType = .none;
        view.autocorrectionType = .no;
        view.clearButtonMode = .whileEditing;
        view.backgroundColor = .clear;
        view.returnKeyType = .done
        
        view.textColor = .white
        view.textAlignment = .center;
        
        view.textColor = .red

        view.backgroundColor = .yellow
//        let image = UIImage(named: "img_arrowDown_black", podName: "SwiftExpand")
        let image = UIImage(named: "img_arrowDown_black", podName: "SwiftExpand")

        view.addLeftViewButton { (sender) in
            sender.setImage(image, for: .normal)
        }
//        _ = view.asoryView(true, image: image!)
        
        return view
    }()
    
    //MARK: -lazy
    lazy var list: [[[String]]] = {
        return [
            [["账号:", "UITableViewCellTextField", "60.0", "手机号码或者邮箱", "recharge",  "icon_username"],
            ["密码:", "UITableViewCellTextField", "60.0", "8位数字字符组合", "recharge",  "icon_password"],
            ["价格:", "UITableViewCellTextField", "60.0", "1-9999", "recharge",  "元"],
            ["价格:", "UITableViewCellTextField", "60.0", "1-9999", "recharge",  "小时"],
            ["价格:", "UITableViewCellTextField", "60.0", "1-9999", "recharge",  "金圆券"],
            ["价格:", "UITableViewCellTextField", "60.0", "1-9999", "recharge",  "美元 💵"],
             ],
        ]
    }()

    // MARK: -funtions

    
}

extension TextFieldStyleController: UITableViewDataSource, UITableViewDelegate {
    func numberOfSections(in tableView: UITableView) -> Int {
        return list.count;
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let sectionList = list[section]
        return sectionList.count;
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let sectionList = list[indexPath.section]
        let itemList = sectionList[indexPath.row]
        if itemList[2] == "" {
            return  UITableView.automaticDimension;
        }
        let height = itemList[2].cgFloatValue
        return height
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let sectionList = list[indexPath.section]
        let itemList = sectionList[indexPath.row]
        let value0 = itemList[0]
        let value1 = itemList[1]
        let value2 = itemList[2]
        let value3 = itemList[3]
        let value4 = itemList[4]
        
        switch value1 {
        case "UITableViewCellTextField":
            let cell = UITableViewCellTextField.dequeueReusableCell(tableView)
            cell.labelLeft.font = UIFont.systemFont(ofSize: 14)
            cell.labelLeft.textColor = UIColor.textColor3
            cell.isHidden = value2.cgFloatValue <= 0.0
            cell.hasAsterisk = value0.hasPrefix("*")
            
            cell.textfield.rightViewMode = .never;
            cell.textfield.textAlignment = .left
            cell.textfield.placeholder = value3
            cell.textfield.isSecureTextEntry = false
            cell.textfield.font = UIFont.systemFont(ofSize: 14)

            cell.labelLeft.text = value0
                        
            switch indexPath.row {
            case 0:
//                cell.textfield.asoryView(false, obj: itemList.last!, viewSize: CGSize(width: 40, height: 35))
                cell.textfield.addLeftViewButton(CGSize(width: 30, height: 30)) { (sender) in
                    sender.setImage(UIImage(named: "icon_username"), for: .normal)
                } action: { (sender) in
                    DDLog(sender.isSelected)
                }

            case 1:
//                cell.textfield.addPasswordEveBlock { (sender) in
//                    DDLog(sender.isSelected)
//                }
                cell.textfield.addRightViewButton { (sender) in
                    sender.setImage(UIImage(named: "icon_eye_close"), for: .normal)
                    sender.setImage(UIImage(named: "icon_eye_open"), for: .selected)
                } action: { (sender) in
                    DDLog(sender.isSelected)
                }

            default:
//                cell.textfield.textAlignment = .right
//                cell.textfield.addRightViewLabel { (sender) in
//                    sender.font = UIFont.systemFont(ofSize: 14)
//                    sender.text = itemList.last!
//                    sender.sizeToFit()
//                    DDLog(sender.text)
//                }
                cell.textfield.rightView(UILabel.self, viewMode: .always) { (sender) in
                    sender.font = UIFont.systemFont(ofSize: 14)
                    sender.text = itemList.last!
                }

                cell.textfield.leftView(UILabel.self, viewMode: .always) { (sender) in
                    sender.font = UIFont.systemFont(ofSize: 14)
                    sender.text = "手机号码:"
                }
            }
            
            cell.block { (textField) in
                DDLog(textField.text)
            }
//            cell.getViewLayer()
            return cell
        default:
            break
        }
        let cell = UITableViewCell.dequeueReusableCell(tableView, identifier: "UITableViewCellValue1", style: .value1)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 30;
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let label = UILabel(frame: .zero);
//        label.backgroundColor = .green;
        label.textColor = UIColor.orange
        label.font = UIFont.systemFont(ofSize: 12)
        label.text = "header\(section)";
        
        switch section {
        case 1:
            label.text = kBlankOne + "通用Cell视图"
        default:
            label.text = kBlankOne + "定制Cell视图"
        }
        return label;
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 0.01;
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        return UIView();
    }
        
}

extension UITextField {
    


}
