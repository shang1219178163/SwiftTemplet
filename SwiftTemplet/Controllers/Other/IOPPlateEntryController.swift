//
//	IOPGoodsEntryController.swift
//	MacTemplet
//
//	Created by shang on 2020/05/11 08:38
//	Copyright © 2020 shang. All rights reserved.
//


import UIKit
import SwiftExpand

/// 创建
@objcMembers class IOPPlateEntryController: UIViewController {

    var model = NSObject()

    var dataModel = NSObject()
    
    lazy var viewModel = NSObject()
    
    lazy var plateList: [String] = [""]

    lazy var list: [[[String]]] = {
        var array: [[[String]]] = [
            [["*缴费金额".padRight(1), "UITableViewCellTextField", "50.0", "请输入", "etc_key_request_form", ],
            ],
        ]
        return array
    }()
    
    lazy var rightBtn: UIButton = {
        let view = UIButton(type: .custom)
        view.setTitle("进件须知", for: .normal)

        view.sizeToFit()
        view.addActionHandler({ (sender) in
//            let controller = IOPInPartAgreementController()
//            controller.type = "1"
//            self.navigationController?.pushViewController(controller, animated: true)
            
        }, for: .touchUpInside)
        return view
    }()
    
    lazy var tableView: UITableView = {
        let view = UITableView(rect: self.view.bounds, style: .plain, rowHeight: 60)
        view.dataSource = self
        view.delegate = self

        return view
    }()
    
    lazy var footerView: NNTableFooterView = {
        let view = NNTableFooterView.create("提交", topPadding: 30);
        view.btn.addTarget(self, action: #selector(handleActionSend(_:)), for: .touchUpInside)
        return view
    }()
    
    @objc func handleActionSend(_ sender: UIButton) {
        view.endEditing(true)
//        DDLog(sender.currentTitle)
    }
        
    // MARK: -lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        edgesForExtendedLayout = []
        title = "多车牌录入"
//        navigationItem.rightBarButtonItem = UIBarButtonItem(customView: rightBtn)

        tableView.tableFooterView = footerView;
        view.addSubview(tableView)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        tableView.reloadData()
    }
    // MARK: -funtions
    

}

extension IOPPlateEntryController: UITableViewDataSource, UITableViewDelegate{
    //    MARK: - tableView
    func numberOfSections(in tableView: UITableView) -> Int {
        return list.count;
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return plateList.count
        }
        let sections = list[section]
        return sections.count;
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return tableView.rowHeight
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.section == 0 && indexPath.row < plateList.count {
            let cell = UITableViewCellTextField.dequeueReusableCell(tableView)
            cell.labelLeft.font = UIFont.systemFont(ofSize: 14)
            cell.labelLeft.textColor = UIColor.textColor3
            cell.textfield.rightViewMode = .never;
            cell.textfield.textAlignment = .left

            cell.labelLeft.text = "车牌号码"
            cell.textfield.placeholder = "请输入"
            cell.textfield.text = plateList[indexPath.row]
            cell.block { (textField) in
                self.plateList[indexPath.row] = textField.text ?? ""
                DDLog("\(self.plateList[indexPath.row])")
            }
            
            let btn: UIButton = {
                let rect = CGRectMake(0, 0, 22, 22)
                let view = UIButton(type: .custom)
                view.frame = rect
                return view
            }()
            
            let imageAdd = UIImage(named: "img_elemet_increase")
            let imageDelete = UIImage(named: "img_elemet_decrease")

            let image = indexPath.row == 0 ? imageAdd : imageDelete
            btn.setBackgroundImage(image, for: .normal)
            
            btn.addActionHandler({ (sender) in
                if sender.backgroundImage(for: .normal) == imageAdd {
                    self.plateList.append("")
                } else {
                    self.plateList.remove(at: indexPath.row)
                }
                tableView.reloadSections(IndexSet(integer: 0), with: .fade)
                DDLog(self.plateList)
            }, for: .touchUpInside)
            
            cell.accessoryView = btn

//            cell.getViewLayer()
            return cell;
        }
        
        let sections = list[indexPath.section]
        let itemList = sections[indexPath.row]
        let value0 = itemList[0]
        let value2 = itemList[2]
        let value3 = itemList[3]
        let value4 = itemList[4]
        
        switch itemList[1] {
        case "UITableViewCellTextField":
            let cell = UITableViewCellTextField.dequeueReusableCell(tableView)
            cell.labelLeft.font = UIFont.systemFont(ofSize: 14)
            cell.labelLeft.textColor = UIColor.textColor3
            cell.isHidden = value2.cgFloatValue <= 0.0
            cell.hasAsterisk = value0.hasPrefix("*")
            
            cell.textfield.rightViewMode = .never;
            cell.textfield.textAlignment = .left

            cell.labelLeft.text = value0
            cell.textfield.placeholder = value3
            cell.textfield.text = dataModel.valueText(forKeyPath: value4, defalut: "")
            cell.block { (textField) in
                self.dataModel.setValue(textField.text ?? "", forKeyPath: value4)
                DDLog("\(value4)_\(self.dataModel.value(forKeyPath: value4))")
            }
            
//            if indexPath.row != list.count - 1 {
                let btn: UIButton = {
                    let rect = CGRectMake(0, 0, 20, 20)
                    let view = UIButton(type: .custom)
                    view.frame = rect
                    return view
                }()
                
                let imageName = (indexPath.row == list.count - 2) ? "img_elemet_decrease" : "img_elemet_increase"
                btn.setBackgroundImage(UIImage(named: imageName), for: .normal)
                cell.accessoryView = btn
//            }

//            cell.getViewLayer()
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
        
