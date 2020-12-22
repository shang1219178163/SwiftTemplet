//
//	IOPPayInpartCompanyMaterialInfoController.swift
//	MacTemplet
//
//	Created by shang on 2020/12/16 17:25
//	Copyright © 2020 shang. All rights reserved.
//


import UIKit
import SwiftExpand
import SnapKit
import HFNavigationController

///企业信息-经营资料
@objcMembers class IOPPayInpartCompanyMaterialInfoController: UIViewController{
    
    lazy var tableView: UITableView = {
        let view = UITableView.create(self.view.bounds, style: .plain, rowHeight: 50)
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
    
        
    let kMaterialInfo = "请填写商家的经营业务信息、 售卖商品/提供服务场景信息。"
    
    lazy var list: [[[String]]] = {
        return [
            [["企业信息-经营资料", "UITableViewCellTitle", "50.0", kMaterialInfo, "",],
            ["*商户简称" + kBlankOne, "UITableViewCellTextField", "50.0", "简称会出现在用户支付成功后的订单页面上", "merchant_name",],
            ["*客服电话" + kBlankOne, "UITableViewCellTextField", "50.0", "请输入客服电话", "telephone", ],
            ["*车场位置" + kBlankOne, "UITableViewCell", "50.0", "请选择所在地", "parkModel.positionDes", ],
            ["*详细地址" + kBlankOne, "UITableViewCellTextField", "50.0", "请输入车场详细地址", "parkModel.address", ],
            ["*车场门头照片" + kBlankOne, "UITableViewCell", "50.0", "\(kTitleLook),\(kTitleUpload)", "parkModel.park_door_pic", ],
            ["*车场环境照片1" + kBlankOne, "UITableViewCell", "50.0", "\(kTitleLook),\(kTitleUpload)", "parkModel.park_ambient_pic", ],
            ["*车场环境照片2" + kBlankOne, "UITableViewCell", "50.0", "\(kTitleLook),\(kTitleUpload)", "parkModel.park_ambient_pic_1", ],
            ["*车场环境照片3" + kBlankOne, "UITableViewCell", "50.0", "\(kTitleLook),\(kTitleUpload)", "parkModel.park_ambient_pic_2", ],
            ],
        ]
    }()

    var dataModel = NSObject()
    
//    lazy var uploadImageVC: IOPUploadImageController = {
//        let controller = IOPUploadImageController()
//        controller.delegate = self
//        return controller
//    }()
    
    lazy var addressPickerVC: NNAddressPickerController = {
        let controller = NNAddressPickerController()
        controller.addressDelegate = self
//        controller.level = 2
      return controller;
    }()

    lazy var navController: HFNavigationController = {
        let controller = HFNavigationController(rootViewController: addressPickerVC)
        controller.modalPresentationStyle = .custom
        controller.transitioningDelegate = controller as UIViewControllerTransitioningDelegate
        controller.setupDefaultHeight(UIScreen.main.bounds.height*0.8)
        return controller;
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

        view.addSubview(tableView);
        tableView.tableHeaderView = processingView;
//        tableView.tableFooterView = footerView;
    }
    // MARK: -funtions
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
//        navigationController?.pushViewController(controller, animated: true)
    }
}
        
extension IOPPayInpartCompanyMaterialInfoController: UITableViewDataSource, UITableViewDelegate{
    
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
            let cell = UITableViewCellTitle.cellWithTableView(tableView)
            cell.labelLeft.font = UIFont.systemFont(ofSize: 15, weight: .bold)
            cell.labelLeft.textColor = UIColor.textColor3
            cell.isHidden = value2.cgFloatValue <= 0.0
            
            cell.labelLeft.text = value0
            cell.btn.addActionHandler({ (control) in
//                UIAlertController.showAlert(value0, message: value3, alignment: .left)
                if value0 == "营业执照" {

                } else {
                    UIAlertController.showAlert(value0, message: value3) { (style) in
                        style.alignment = .left
                    } handler: { (action) in
                        
                    }
                }
                
            }, for: .touchUpInside)

//            cell.getViewLayer()
            return cell
            
        case "UITableViewCellTextField":
            let cell = UITableViewCellTextField.cellWithTableView(tableView)
            cell.labelLeft.font = UIFont.systemFont(ofSize: 14)
            cell.labelLeft.textColor = UIColor.textColor3
            cell.textfield.font = UIFont.systemFont(ofSize: 14)

            cell.isHidden = value2.cgFloatValue <= 0.0
            cell.hasAsterisk = value0.contains("*")
            
            cell.inset = UIEdgeInsets(top: 10, left: 15, bottom: 10, right: 15)

            cell.textfield.rightViewMode = .never;
            cell.textfield.textAlignment = .left

            cell.labelLeft.text = value0
            cell.textfield.placeholder = value3
            cell.textfield.setPlaceHolder(baseline: -1)
            
            cell.textfield.text = dataModel.valueText(forKeyPath: value4, defalut: "")
            cell.block { (textField) in
                self.dataModel.setValue(textField.text ?? "", forKeyPath: value4)
                DDLog("\(value4)_\(self.dataModel.valueText(forKeyPath: value4))")
            }
//            cell.getViewLayer()
            return cell
            
        case "UITableViewCell":
            let cell = UITableViewCell.dequeueReusableCell(tableView, identifier: "UITableViewCellValue1", style: .value1)
            cell.textLabel?.font = UIFont.systemFont(ofSize: 14)
            cell.textLabel?.textColor = .textColor3;

            cell.detailTextLabel?.font = UIFont.systemFont(ofSize: 14)
            cell.detailTextLabel?.textColor = .theme
            cell.accessoryType = .disclosureIndicator;
            
            cell.textLabel?.text = value0
            cell.detailTextLabel?.text = "上传"

            let hasAsterisk = value0.contains("*")
            if hasAsterisk {
                cell.textLabel?.attributedText = cell.textLabel!.text!.toAsterisk(cell.textLabel!.textColor, font: cell.textLabel!.font.pointSize)
            }
            
            if value4.contains("_img") || value4.contains("_pic") {
                let result: String = dataModel.valueText(forKeyPath: value4, defalut: "")
                let hasPicture = result.hasPrefix("http")
                cell.detailTextLabel?.text = hasPicture ? kTitleLook : kTitleUpload
//                cell.detailTextLabel?.textColor = hasPicture ? UIColor.gray : UIColor.theme
            }
            
            if value0.contains("开户行所在地") || value0.contains("*车场位置") {
                let result: String = dataModel.valueText(forKeyPath: value4, defalut: "")
                let isValid = result != ""
                cell.detailTextLabel?.text = isValid ? result : value3
            }

//            cell.getViewLayer()
            return cell;
            
        case "UITableViewCellSegment":
            let cell = UITableViewCellSegment.dequeueReusableCell(tableView)
            cell.labelLeft.font = UIFont.systemFont(ofSize: 14)
            cell.labelLeft.textColor = UIColor.textColor3
            cell.isHidden = itemList[2].cgFloatValue <= 0.0
            cell.hasAsterisk = value0.contains("*")

            cell.labelLeft.text = value0
            cell.segmentCtl.items = (itemList.last! as NSString).components(separatedBy: ",")
            let index = dataModel.valueText(forKeyPath: value4, defalut: "0") == "0" ? 0 : 1
            cell.segmentCtl.selectedSegmentIndex = index
//            cell.segmentCtl.addTarget(self, action: #selector(handleActionSender(_:)), for: .valueChanged)
            cell.segmentCtl.addActionHandler({ (sender) in
//                DDLog(sender.selectedSegmentIndex)
                let value = "\(sender.selectedSegmentIndex)"
//                let value: String = sender.selectedSegmentIndex == 0 ? "0" : "1"
                self.dataModel.setValue(value, forKeyPath: value4)
                self.tableView.reloadData()
                DDLog("\(sender.selectedSegmentIndex), \(value4), \(value)")

            }, for: .valueChanged)
//            cell.getViewLayer()
            return cell
            
        default:
            break
        }
        let cell = UITableViewCellZero.cellWithTableView(tableView)
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
            if value0.contains("车场位置") {
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

extension IOPPayInpartCompanyMaterialInfoController: IOPUploadImageControllerDelegate{
    func uploadImage(_ url: String, forKey key: String) {
        DDLog(key, url)
        dataModel.setValue(url, forKeyPath: key)
        tableView.reloadData()
    }
}

extension IOPPayInpartCompanyMaterialInfoController: NNAddressPickerControllerDelegate {

    func addressPickerVC(_ controller: NNAddressPickerController) {
        if controller == addressPickerVC {
            guard let provinceModel = controller.provinceModel,
                let cityModel = controller.cityModel else { return }
//            dataModel.bank_province_name = provinceModel.label
//            dataModel.bank_province = provinceModel.value
//
//            dataModel.bank_city_name = cityModel.label
//            dataModel.bank_city = cityModel.value
            
        } else {
            guard let provinceModel = controller.provinceModel,
                let cityModel = controller.cityModel,
                let areaModel = controller.areaModel else { return }
//            dataModel.parkModel.province_name = provinceModel.label
//            dataModel.parkModel.province = provinceModel.value
//
//            dataModel.parkModel.city_name = cityModel.label
//            dataModel.parkModel.city = cityModel.value
//
//            dataModel.parkModel.area_name = areaModel.label
//            dataModel.parkModel.area = areaModel.value
        }
        tableView.reloadData()
    }
}
