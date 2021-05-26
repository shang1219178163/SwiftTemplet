//
//	IOPPayInpartCompanyEntityInfoController.swift
//	MacTemplet
//
//	Created by shang on 2020/12/16 17:25
//	Copyright © 2020 shang. All rights reserved.
//


import UIKit
import SwiftExpand
import SnapKit
import HFNavigationController

///企业信息-主体资料
@objcMembers class IOPPayInpartCompanyEntityInfoController: UIViewController{
    
    lazy var tableView: UITableView = {
        let view = UITableView(rect: self.view.bounds, style: .plain, rowHeight: 50)
        view.dataSource = self
        view.delegate = self

        return view
    }()
    
    lazy var processingView: NNProcessingView = {
        var view = NNProcessingView(frame: CGRectMake(0, 0, self.view.bounds.width, 70))
        
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
                        
    var kUltimateBeneficiaryExplain = """
    最终受益人说明：
    1、直接或者间接拥有超过25%公司股权或者表决权的自然人。
    2、通过人事、财务等其他方式对公司进行控制的自然人。
    3、公司的高级管理人员，包括公司的经理、副经理、财务负责人、上市公司董事会秘书和公司章程规定的其他人员。
    """

    let kEntityInfo = "主体资料营业执照主体必须和第项公司公户信息主体保持一致；\n请上传彩色照片或彩色扫描件或复印件 （需加盖公章鲜章)"

    lazy var list: [[[String]]] = {
        return [

        ]
    }()
    
    lazy var companyList: [[[String]]] = {
        return [
            [["企业信息-主体资料", "UITableViewCellTitle", "50.0", kEntityInfo, "",],
             ["*营业执照" + kBlankThree, "UITableViewCell", "50.0", "\(kTitleLook),\(kTitleUpload)", "license_img", ],
             ["*商户名称" + kBlankOne, "UITableViewCellTextField", "50.0", "请输入", "merchant_name",],
                          
             ["*营业地址" + kBlankOne, "UITableViewCell", "50.0", "请选择所在地", "license_address", ],
             ["*详细地址" + kBlankOne, "UITableViewCellTextField", "50.0", "请输入", "license_detailed_address",],
             
             ["*注册号/统一社会信用代码", "UITableViewCellTextField", "50.0", "请输入", "registration_number", ],
             ["*组织机构代码证照片", "UITableViewCell", "50.0", "\(kTitleLook),\(kTitleUpload)", "organization_img", ],
             ["*组织机构代码" + kBlankOne, "UITableViewCellTextField", "50.0", "请输入组织机构代码", "organization_code", ],
             ["*组织机构有效开始时间", "UITableViewCellDatePicker", "50.0", "请选择", "organization_strat_time", ],
             ["*组织机构有效结束时间", "UITableViewCellDatePicker", "50.0", "请请选择", "organization_end_time", ],
             
             ["*企查查截图" + kBlankTwo, "UITableViewCell", "50.0", "\(kTitleLook),\(kTitleUpload)", "qcc_img", ],
            ],
        ]
    }()
    
    lazy var individualList: [[[String]]] = {
        return [
            [["企业信息-主体资料", "UITableViewCellTitle", "50.0", kEntityInfo, "",],
             ["*营业执照" + kBlankThree, "UITableViewCell", "50.0", "\(kTitleLook),\(kTitleUpload)", "license_img", ],
             ["*商户名称" + kBlankOne, "UITableViewCellTextField", "50.0", "请输入", "merchant_name",],
                      
             ["*注册号/统一社会信用代码", "UITableViewCellTextField", "50.0", "请输入", "registration_number", ],
             
             ["*营业地址" + kBlankOne, "UITableViewCell", "50.0", "请选择所在地", "license_address", ],
             ["*详细地址" + kBlankOne, "UITableViewCellTextField", "50.0", "请输入", "license_detailed_address",],
                          
             ["*企查查截图" + kBlankTwo, "UITableViewCell", "50.0", "\(kTitleLook),\(kTitleUpload)", "qcc_img", ],
            ],
        ]
    }()
    
    lazy var governmentList: [[[String]]] = {
        return [
            [["企业信息-主体资料", "UITableViewCellTitle", "50.0", kEntityInfo, "",],
             ["*营业执照" + kBlankThree, "UITableViewCell", "50.0", "\(kTitleLook),\(kTitleUpload)", "license_img", ],
             ["*商户名称" + kBlankOne, "UITableViewCellTextField", "50.0", "请输入", "merchant_name",],
                          
             ["*营业地址" + kBlankOne, "UITableViewCell", "50.0", "请选择所在地", "license_address", ],
             ["*详细地址" + kBlankOne, "UITableViewCellTextField", "50.0", "请输入", "license_detailed_address",],
             
             ["*证书号", "UITableViewCellTextField", "50.0", "请输入", "register_certificate_no", ],
             ["*组织机构代码证照片", "UITableViewCell", "50.0", "\(kTitleLook),\(kTitleUpload)", "organization_img", ],
             ["*组织机构代码" + kBlankOne, "UITableViewCellTextField", "50.0", "请输入组织机构代码", "organization_code", ],
             ["*组织机构有效开始时间", "UITableViewCellDatePicker", "50.0", "请选择", "organization_strat_time", ],
             ["*组织机构有效结束时间", "UITableViewCellDatePicker", "50.0", "请请选择", "organization_end_time", ],
             
             ["*登记证书照片", "UITableViewCell", "50.0", "\(kTitleLook),\(kTitleUpload)", "register_certificate_img", ],
             ["*登记证书类型", "UITableViewCellPickerView", "50.0", "请选择", "register_certificate_type", self.types,],
             ["*登记证书有效开始日期", "UITableViewCellDatePicker", "50.0", "请选择", "register_certificate_strat_time", ],
             ["*登记证书有效结束时间", "UITableViewCellDatePicker", "50.0", "请请选择", "register_certificate_end_time", ],
            ],
        ]
    }()
    
    lazy var othersList: [[[String]]] = {
        return [
            [["企业信息-主体资料", "UITableViewCellTitle", "50.0", kEntityInfo, "",],
             ["*营业执照" + kBlankThree, "UITableViewCell", "50.0", "\(kTitleLook),\(kTitleUpload)", "license_img", ],
             ["*商户名称" + kBlankOne, "UITableViewCellTextField", "50.0", "请输入", "merchant_name",],
                          
             ["*营业地址" + kBlankOne, "UITableViewCell", "50.0", "请选择所在地", "license_address", ],
             ["*详细地址" + kBlankOne, "UITableViewCellTextField", "50.0", "请输入", "license_detailed_address",],
             
             ["*注册号/统一社会信用代码", "UITableViewCellTextField", "50.0", "请输入", "registration_number", ],
             ["*组织机构代码证照片", "UITableViewCell", "50.0", "\(kTitleLook),\(kTitleUpload)", "organization_img", ],
             ["*组织机构代码" + kBlankOne, "UITableViewCellTextField", "50.0", "请输入组织机构代码", "organization_code", ],
             ["*组织机构有效开始时间", "UITableViewCellDatePicker", "50.0", "请选择", "organization_strat_time", ],
             ["*组织机构有效结束时间", "UITableViewCellDatePicker", "50.0", "请请选择", "organization_end_time", ],
             
             ["*登记证书照片", "UITableViewCell", "50.0", "\(kTitleLook),\(kTitleUpload)", "register_certificate_img", ],
             ["*登记证书类型", "UITableViewCellPickerView", "50.0", "请选择", "register_certificate_type", self.types,],
             ["*登记证书有效开始日期", "UITableViewCellDatePicker", "50.0", "请选择", "register_certificate_strat_time", ],
             ["*登记证书有效结束时间", "UITableViewCellDatePicker", "50.0", "请请选择", "register_certificate_end_time", ],
            ],
        ]
    }()

    var dataModel = NSObject()
    
    var hasOranization = true{
        willSet{
            let height = newValue == true ? "50" : "0"
            list[0][6][2] = height
            list[0][7][2] = height
            list[0][8][2] = height
            list[0][9][2] = height
            tableView.reloadData()
        }
    }
    
    ///
    var orgType: OrganizationType = .company{
        willSet{
            list.removeAll()
            switch newValue {
            case .company:
                list.append(contentsOf: companyList)
            case .individual:
                list.append(contentsOf: individualList)

            case .gov:
                list.append(contentsOf: governmentList)

            case .other:
                list.append(contentsOf: othersList)

            default:
                break
            }
            tableView.reloadData()
        }
    }
    
    var types = IOPUserDetailModel.certificateTypeDic.valuesByKeySorted().joined(separator: ",")
    
//    lazy var uploadImageVC: IOPUploadImageController = {
//        let controller = IOPUploadImageController()
//        controller.delegate = self
//        return controller
//    }()
    
    lazy var navController: HFNavigationController = {
        let pickerVC = NNAddressPickerController()
//        pickerVC.level = 2
        pickerVC.addressBlock = { vc in
            guard let provinceModel = vc.provinceModel,
                  let cityModel = vc.cityModel,
                  let areaModel = vc.areaModel
            else { return }
//            dataModel.bank_province_name = provinceModel.label
//            dataModel.bank_province = provinceModel.value
//
//            dataModel.bank_city_name = cityModel.label
//            dataModel.bank_city = cityModel.value
            if let indexP = vc.indexP {
                self.tableView.reloadRows(at: [indexP], with: .automatic)
            }
        }
        
        let nav = HFNavigationController(rootViewController: pickerVC)
        nav.setupDefaultHeight(UIScreen.main.bounds.height*0.8)
        return nav;
    }()
    
    // MARK: - lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupExtendedLayout()
        title = ""
        setupUI()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        tableView.tableHeaderView = processingView;
        view.addSubview(tableView);
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
        
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - funtions
    func setupUI() {
        edgesForExtendedLayout = []
        view.backgroundColor = .white

//        tableView.tableFooterView = footerView;
        
        createBarItem("next") { (item) in
            self.hasOranization.toggle()
        }
    }
    
    func jumpXiangce(_ itemList:[String]) {
//        let controller = UIStoryboard.storyboard(with: "ParkRecord", identifier: "IOPParkRecordImageViewController") as! IOPParkRecordImageViewController
//        controller.title = itemList[0].replacingOccurrences(of: "*", with: "")
//        if let url = URL(string: dataModel.value(forKeyPath: itemList[4])) {
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

}
        
extension IOPPayInpartCompanyEntityInfoController: UITableViewDataSource, UITableViewDelegate{
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

//            cell.getViewLayer()
            return cell
            
        case "UITableViewCellTextField":
            let cell = UITableViewCellTextField.dequeueReusableCell(tableView)
            cell.labelLeft.font = UIFont.systemFont(ofSize: 14)
            cell.labelLeft.textColor = UIColor.textColor3
            cell.textfield.font = UIFont.systemFont(ofSize: 14)

            cell.isHidden = value2.cgFloatValue <= 0.0
            cell.hasAsterisk = value0.contains("*")
            
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
            cell.isHidden = value2.cgFloatValue <= 0.0

            cell.textLabel?.text = value0
            cell.detailTextLabel?.text = "上传"

            let hasAsterisk = value0.contains("*")
            if hasAsterisk {
                cell.textLabel?.attributedText = cell.textLabel!.text!.insertPrefix(cell.textLabel!.textColor, font: cell.textLabel!.font)
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
            cell.labelLeft.textColor = .textColor3
            cell.textfield.font = UIFont.systemFont(ofSize: 14)
            cell.textfield.textAlignment = .right
            cell.isHidden = value2.cgFloatValue <= 0.0
            cell.hasAsterisk = value0.contains("*")

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
            
            cell.hasAsterisk = value0.contains("*")
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
        let cell = UITableViewCellZero.dequeueReusableCell(tableView)
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
                navController.present()
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

