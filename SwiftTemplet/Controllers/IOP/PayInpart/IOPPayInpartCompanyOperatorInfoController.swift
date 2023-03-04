//
//	IOPPayInpartCompanyOperatorInfoController.swift
//	MacTemplet
//
//	Created by shang on 2020/12/16 17:25
//	Copyright © 2020 shang. All rights reserved.
//


import UIKit
import SwiftExpand
import SnapKit

///企业信息-法人/经营者身份信息
@objcMembers class IOPPayInpartCompanyOperatorInfoController: UIViewController{
            
    lazy var tableView: UITableView = {
        let view = UITableView(rect: self.view.bounds, style: .plain, rowHeight: 60)
        view.dataSource = self
        view.delegate = self

        return view
    }()
    
    lazy var processingView: NNProcessingView = {
        var view = NNProcessingView(frame: CGRect(0, 0, self.view.bounds.width, 70))
        
        var list: [String] = []
        view.items = ["基础信息", "企业信息", "完成"]
        view.contentInset = UIEdgeInsetsMake(0, 20, 0, 20)
        view.padding = 90
        view.index = 1

//        view.getViewLayer()
        return view;
    }()
    
    lazy var footerView: NNTableFooterView = {
        let view = NNTableFooterView.create("下一步", topPadding: 0, height: 50);
        view.label.isHidden = true
        view.labelTop.isHidden = true

        view.btn.addActionHandler { (control) in
            DDLog(control)
        }

        return view
    }()
    
    let kContactInfo = "需在开户后进行签约，井接收日常重要管理信息和进行资金操作，请确定其为商户法定代表人或负责人。"
    let kOperatorInfo = "1. 个体户:请上传经营者的身份证件.\n2.企业/政党,机关及事业单位/其他组织:请上传法人的身份证件"
    let kBeneficiaryInfo = "若经营者/凡人不是最好总收益气人,则须填写收益所有人信息"

    lazy var list: [[[String]]] = {
        return [

        ]
    }()
        
    lazy var OperatorItem: [[String]] = {
        return [
            ["企业信息-法人/经营者身份信息", "UITableViewCellTitle", "50.0", kOperatorInfo, "",],
             ["*身份证正面".padRight(1), "UITableViewCell", "50.0", "\(kTitleLook),\(kTitleUpload)", "id_just_img", ],
             ["*身份证反面".padRight(1), "UITableViewCell", "50.0", "\(kTitleLook),\(kTitleUpload)", "id_back_img", ],
             ["*身份证姓名".padRight(1), "UITableViewCellTextField", "50.0", "请输入", "rc_name",],
             ["*身份证号码".padRight(1), "UITableViewCellTextField", "50.0", "18 位有效身份证号码", "id_card",],
             ["*身份证有效开始时间", "UITableViewCellDatePicker", "50.0", "请选择", "id_card_btime", ],
             ["*身份证有效结束时间", "UITableViewCellDatePicker", "50.0", "请选择", "id_card_etime", ],
             ["*手机号码".padRight(1), "UITableViewCellTextField", "50.0", "请输入", "rc_phone", ],
             ["*电子邮箱".padRight(1), "UITableViewCellTextField", "50.0", "后期作为更改密码等重要操作的凭证", "rc_email", ],
        ]
    }()
    
    ///企业最终受益人信息
    lazy var beneficiaryItem: [[String]] = {
        return [
            ["企业信息-最终受益人信息", "UITableViewCellTitle", "50.0", kBeneficiaryInfo, "",],
            ["*身份证正面".padRight(1), "UITableViewCell", "50.0", "\(kTitleLook),\(kTitleUpload)", "id_just_img", ],
            ["*身份证反面".padRight(1), "UITableViewCell", "50.0", "\(kTitleLook),\(kTitleUpload)", "id_back_img", ],
            ["*身份证姓名".padRight(1), "UITableViewCellTextField", "50.0", "请输入", "rc_name",],
            ["*身份证号码".padRight(1), "UITableViewCellTextField", "50.0", "18 位有效身份证号码", "id_card",],
            ["*身份证有效开始时间", "UITableViewCellDatePicker", "50.0", "请选择", "id_card_btime", ],
            ["*身份证有效结束时间", "UITableViewCellDatePicker", "50.0", "请选择", "id_card_etime", ],
           ]
    }()
    
    ///企业联系人
    lazy var contactItem: [[String]] = {
        return [
            ["企业信息-联系人信息", "UITableViewCellTitle", "50.0", kContactInfo, "",],
             ["*联系人身份".padRight(1), "UITableViewCellPickerView", "50.0", "请选择", "rc_type","法人,实际控制人,代理人,其他", ],
             ["*身份证姓名".padRight(1), "UITableViewCellTextField", "50.0", "请输入", "rc_name",],
             ["*身份证号".padRight(2), "UITableViewCellTextField", "50.0", "18 位有效身份证号码", "id_card",],
             ["*手机号码".padRight(2), "UITableViewCellTextField", "50.0", "需微信实名认证，与提供的联系人姓名一致", "rc_phone", ],
             ["*电子邮箱".padRight(2), "UITableViewCellTextField", "50.0", "后期作为更改密码等重要操作的凭证", "rc_email", ],
        ]
    }()
    
    lazy var beneficiarys = [IOPUserDetailModel]()

//    lazy var uploadImageVC: IOPUploadImageController = {
//        let controller = IOPUploadImageController()
//        controller.delegate = self
//        return controller
//    }()

    let isOnePeople = false

    var dataModel = NSObject()
    // MARK: - lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        edgesForExtendedLayout = []
        title = ""
        setupUI()
        
        
        list.append(OperatorItem)
        if isOnePeople == false {
            beneficiarys.append(IOPUserDetailModel())
            beneficiarys.append(IOPUserDetailModel())
            beneficiarys.forEach { (model) in
                list.append(beneficiaryItem)
            }
            list.append(contactItem)

        } else {
            list.append(contactItem)
        }
        tableView.reloadData()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        view.addSubview(footerView);
        footerView.snp.makeConstraints { (make) in
            make.left.equalToSuperview().offset(0);
            make.right.equalToSuperview().offset(0);
            make.bottom.equalToSuperview().offset(0);
            make.height.equalTo(60);
        }
        
        tableView.snp.makeConstraints { (make) in
            make.top.equalToSuperview().offset(0);
            make.left.equalToSuperview().offset(0);
            make.right.equalToSuperview().offset(0);
            make.bottom.equalTo(footerView.snp.top).offset(0);
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated);
        
    }
        

    
    // MARK: - funtions
    func setupUI() {
        edgesForExtendedLayout = []
        view.backgroundColor = .white

        view.addSubview(tableView);
        tableView.tableHeaderView = processingView;
//        tableView.tableFooterView = footerView;
    }

    func jumpXiangce(_ itemList:[String]) {
//        let controller = UIStoryboard.storyboard(with: "ParkRecord", identifier: "IOPParkRecordImageViewController") as! IOPParkRecordImageViewController
//        controller.title = itemList[0].replacingOccurrences(of: "*", with: "")
//        if let url = URL(string: dataModel.value(forKeyPath: itemList[4]) as! String) {
//            controller.inImageUrlArray = [url]
//        }
//        navigationController?.pushViewController(controller, animated: true)
    }
    
    func jumpUploadPicture(_ itemList: [String]) {
//        DDLog(itemList)
        
//        let controller = uploadImageVC
//        controller.title = itemList[0].replacingOccurrences(of: "*", with: "")
//        controller.key = itemList[4]
//
//        let imgUrl = dataModel.valueText(forKeyPath: itemList[4], defalut: "")
//        controller.imgUrl = imgUrl
//        controller.isFromPickerVC = false
//        controller.showImageDefault = true
//        controller.block = { vc in
//            dataModel.setValue(vc.imgUrl, forKeyPath: vc.key)
//            self.tableView.reloadData()
//        }
//        navigationController?.pushViewController(controller, animated: true)
    }
    
    func changeBeneficiarys() {
        self.list.removeAll()
        self.list.append(self.OperatorItem)
        self.beneficiarys.forEach { (model) in
            self.list.append(self.beneficiaryItem)
        }
        self.list.append(self.contactItem)
        self.tableView.reloadData()
        
        self.tableView.scrollToRow(at: IndexPath(row: 0, section: tableView.numberOfSections - 2), at: .top, animated: true)
    }
}
        
extension IOPPayInpartCompanyOperatorInfoController: UITableViewDataSource, UITableViewDelegate{
    //    MARK: - tableView
    func numberOfSections(in tableView: UITableView) -> Int {
        return list.count;
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let sections = list[section]
//        if section == 0 && dataModel.license_type == "0" {
//            return sections.count - 2;
//        }
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
        let value2 = itemList[2]
        let value3 = itemList[3]
        let value4 = itemList[4]
        
        switch itemList[1] {
        case "UITableViewCellTitle":
            let cell = UITableViewCellTitle.dequeueReusableCell(tableView)
            cell.labelLeft.font = UIFont.systemFont(ofSize: 15, weight: .bold)
            cell.labelLeft.textColor = UIColor.textColor3
            cell.isHidden = value2.cgFloatValue <= 0.0
            
            cell.labelLeft.text = value0
            cell.btn.addActionHandler({ (sender) in
//                UIAlertController.showAlert(value0, message: value3, alignment: .left)
                if value0 == "营业执照" {

                } else {
                    UIAlertController.showAlert(value0, message: value3) { (style) in
                        style.alignment = .left
                    } handler: { (alertVC, action) in
                        
                    }
                }
                
            }, for: .touchUpInside)

            
            cell.assoryView(UIButton.self, size: CGSize(width: 20, height: 20)) { (view) in
                view.isHidden = (indexPath.section == 0 || indexPath.section == tableView.numberOfSections - 1)
                if self.isOnePeople == false {
                    let imgName = indexPath.section == 1 ? "icon_add" : "icon_delete"
                    view.setBackgroundImage(UIImage(named: imgName), for: .normal)
//                    sender.setImage(UIImage(named: imgName), for: .normal)
//                    sender.setTitle("\(indexPath.section)_\(sender.isHidden)", for: .normal)
//                    sender.setTitleColor(.red, for: .normal)
                    view.addActionHandler { (sender) in
                        switch sender.backgroundImage(for: .normal){
                        case UIImage(named: "icon_add"):
                            self.beneficiarys.append(IOPUserDetailModel())

                        case UIImage(named: "icon_delete"):
                            self.beneficiarys.remove(at: indexPath.section - 1)

                        default:
                            break
                        }
                        self.changeBeneficiarys()
                    }
                }
            }

//            cell.getViewLayer()
            return cell
            
        case "UITableViewCellTextField":
            let cell = UITableViewCellTextField.dequeueReusableCell(tableView)
            cell.labelLeft.font = UIFont.systemFont(ofSize: 14)
            cell.labelLeft.textColor = UIColor.textColor3
            cell.textfield.font = UIFont.systemFont(ofSize: 14)
            cell.isHidden = value2.cgFloatValue <= 0.0
            cell.hasAsterisk = value0.hasPrefix("*")
            
            cell.textfield.rightViewMode = .never;
            cell.textfield.textAlignment = .left

            cell.labelLeft.text = value0
            cell.textfield.placeholder = value3//
            cell.textfield.setPlaceHolder(baseline: -1)

            cell.textfield.text = dataModel.valueText(forKeyPath: value4, defalut: "")
            cell.block { (textField) in
                self.dataModel.setValue(textField.text ?? "", forKeyPath: value4)
                DDLog("\(value4)_\(self.dataModel.valueText(forKeyPath: value4))")
            }
            cell.getViewLayer()
            return cell
            
        case "UITableViewCell":
            let cell = UITableViewCell.dequeueReusableCell(tableView, identifier: "UITableViewCellValue1", style: .value1)
            cell.textLabel?.font = UIFont.systemFont(ofSize: 14)
            cell.textLabel?.textColor = UIColor.textColor3;

            cell.detailTextLabel?.font = UIFont.systemFont(ofSize: 14)
            cell.detailTextLabel?.textColor = UIColor.theme
            cell.accessoryType = .disclosureIndicator;
            
            cell.textLabel?.text = value0
            cell.detailTextLabel?.text = "上传"

            let hasAsterisk = value0.contains("*")
            if hasAsterisk {
                cell.textLabel?.attributedText = cell.textLabel!.text!.matt.appendPrefix(font: cell.textLabel!.font)
            }
            
            if value4.contains("_img") || value4.contains("_pic") {
                let result: String = dataModel.valueText(forKeyPath: value4, defalut: "")
                let hasPicture = result.hasPrefix("http")
                cell.detailTextLabel?.text = hasPicture ? kTitleLook : kTitleUpload
//                cell.detailTextLabel?.textColor = hasPicture ? UIColor.gray : UIColor.theme
            }
            
            if value0.contains("营业地址") {
                let result: String = dataModel.valueText(forKeyPath: value4, defalut: "")
                let isValid = result != ""
                cell.detailTextLabel?.text = isValid ? result : value3
            }

//            cell.getViewLayer()
            return cell;
        case "UITableViewCellDatePicker":
            let cell = UITableViewCellDatePicker.dequeueReusableCell(tableView)
            cell.labelLeft.font = UIFont.systemFont(ofSize: 14)
            cell.labelLeft.textColor = UIColor.textColor3
            cell.textfield.font = UIFont.systemFont(ofSize: 14)
            cell.textfield.textAlignment = .right
            cell.isHidden = value2.cgFloatValue <= 0.0
            cell.hasAsterisk = value0.hasPrefix("*")

            cell.labelLeft.text = value0
            cell.textfield.text = dataModel.valueText(forKeyPath: value4, defalut: "请选择")

            cell.datePicker.block { (datePicker, idx) in
                let time = DateFormatter.stringFromDate(datePicker.datePicker.date)
                DDLog(time, idx)
                if idx == 1 {
                    cell.textfield.text = "\(time.prefix(10))"
                }
            }

            cell.getViewLayer()
            return cell
            
        case "UITableViewCellPickerView":
            let cell = UITableViewCellPickerView.dequeueReusableCell(tableView)
            cell.labelLeft.font = UIFont.systemFont(ofSize: 14)
            cell.labelLeft.textColor = UIColor.textColor3
            cell.textfield.font = UIFont.systemFont(ofSize: 14)
            cell.textfield.textAlignment = .right
            cell.isHidden = value2.cgFloatValue <= 0.0
            cell.hasAsterisk = value0.hasPrefix("*")
            cell.textfield.rightViewMode = .never
            cell.accessoryType = .disclosureIndicator
            
            cell.labelLeft.text = value0
            let items = itemList.last!.components(separatedBy: ",")
            cell.pickView.items = items
            cell.textfield.text = items.first

            cell.pickView.block = { picker, idx in
                DDLog(idx, picker.selectedItem, picker.selectedValue)
                if idx == 1 {
                    cell.textfield.text = picker.selectedItem
                }
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
        let value0 = itemList[0]
        let value4 = itemList[4]
        if value4.contains("_img") || value4.contains("_pic") {
            jumpUploadPicture(itemList)
            
        } else {
            if value0.contains("营业地址") {
//                present(navController, animated: true, completion: nil)
                
            } else if value0.contains("车场位置") {
//                present(parkNavController, animated: true, completion: nil)

            }
        }
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 10.01;
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        return UILabel();
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        if section == tableView.numberOfSections - 1 {
            return 10.01;
        }
        return 0.01;
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        return UILabel();
    }
}
