//
//	PKTextFieldInputController.swift
//	MacTemplet
//
//	Created by shang on 2020/07/18 15:57
//	Copyright © 2020 shang. All rights reserved.
//


import UIKit
import SwiftExpand
import SnapKit

class PKTextFieldInputController: UIViewController{

    var dataModel = NSObject()
    
    lazy var tableView: UITableView = {
        guard let tableView = view.subView(UITableView.self) as? UITableView else {
            let view = UITableView.create(self.view.bounds, style: .plain, rowHeight: 50)
            view.dataSource = self
            view.delegate = self
            return view
        }
        return tableView
    }()
    
    @objc func handleAction(_ sender: UIButton) {
        view.endEditing(true)

    }
    
    lazy var btn: UIButton = {
        let view = UIButton(type: .custom)
        view.setBackgroundColor(.theme, for: .normal)
        view.setBackgroundColor(.gray, for: .disabled)

        view.setTitle("确定", for: .normal)
        view.addTarget(self, action: #selector(handleAction(_:)), for: .touchUpInside)

        return view
    }()
        
    lazy var list: [[[String]]] = {
        let array: [[[String]]] = [
            [["昵称", "UITableViewCellTextField", "50.0", "", "seller_bank_account", ],
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
        
        view.addSubview(tableView)
        view.addSubview(btn)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        btn.snp.makeConstraints { (make) in
            make.left.equalToSuperview().offset(20);
            make.right.equalToSuperview().offset(-20);
            make.bottom.equalToSuperview().offset(-10);
            make.height.equalTo(45);
        }
        
        tableView.snp.makeConstraints { (make) in
            make.top.equalToSuperview().offset(0);
            make.left.equalToSuperview().offset(0);
            make.right.equalToSuperview().offset(0);
            make.bottom.equalTo(btn.snp.top).offset(0);
        }
    }


}

extension PKTextFieldInputController: UITableViewDataSource, UITableViewDelegate{
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
        case "UITableViewCellTextField":
            let cell = UITableViewCellTextField.dequeueReusableCell(tableView)
            cell.labelLeft.font = UIFont.systemFont(ofSize: 14)
            cell.labelLeft.textColor = UIColor.textColor3
            cell.isHidden = value2.cgFloatValue <= 0.0
            cell.hasAsterisk = value0.contains("*")
            
            cell.labelLeft.isHidden = true
            cell.textfield.rightViewMode = .never;
//            cell.labelLeft.text = value0
            cell.labelLeft.text = self.title ?? ""
//            cell.textfield.asoryView(true, text: itemList.last!)
//            cell.textfield.rightView = nil;
            cell.textfield.textAlignment = .left
            
            cell.block { (textField) in
                DDLog(textField.text as Any)
            }
            cell.getViewLayer()
            return cell
        default:
            break
        }
        
        let cell = UITableViewCell.dequeueReusableCell(tableView)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let sections = list[indexPath.section]
        let itemList = sections[indexPath.row]
        
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
