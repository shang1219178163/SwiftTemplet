//
//	IOPPayInpartCompanyOtherInfoController.swift
//	MacTemplet
//
//	Created by shang on 2020/12/16 17:25
//	Copyright © 2020 shang. All rights reserved.
//


import UIKit
import SwiftExpand
import SnapKit

///企业信息-其他信息
@objcMembers class IOPPayInpartCompanyOtherInfoController: UIViewController{
        
    var dataList = NSMutableArray()

    lazy var rightBtn: UIButton = {
        let view = UIButton(type: .custom)
        view.setTitle("Next", for: .normal)

        view.addActionHandler({ (sender) in
//            let controller = UIViewController()
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
    
    lazy var processingView: NNProcessingView = {
        var view = NNProcessingView(frame: CGRect(0, 0, self.view.bounds.width, 70))
        
        var list: [String] = []
        view.items = ["基础信息", "企业信息", "完成"]
        view.contentInset = UIEdgeInsets(0, 20, 0, 20)
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
        
//    lazy var uploadImageVC: IOPUploadImageController = {
//        let controller = IOPUploadImageController()
//        controller.delegate = self
//        return controller
//    }()
    
    let kOtherInfo = "1. 必须和营业执照主体相同;\n2. 该银行账号将作为收款账号；\n3. 商户号生成中该账号会涉及到收付款等操作;"
    
    lazy var list: [[[String]]] = {
        return [
            [["企业信息-其他信息", "UITableViewCellTitle", "50.0", kOtherInfo, "",],
             ["开通微信免密", "UITableViewCellSegment", "50.0", "请输入姓名", "is_free", "开通,不开通"],
            ["*停车费收费资质证明文件", "UITableViewCell", "50.0", "\(kTitleLook),\(kTitleUpload)", "certificate_img", ],
            ["*停车场备案证书", "UITableViewCell", "50.0", "\(kTitleLook),\(kTitleUpload)", "record_certificate_img", ],
            ],
        ]
    }()

    var dataModel = NSObject()
    
    
    // MARK: - lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        edgesForExtendedLayout = []
        title = ""
        setupUI()
        
//        dataModel.capital_mg_img_template = IOPAPIRequestURLDownDocMoney("1")
//        dataModel.self_sign_img_template = IOPAPIRequestURLDownDocMoney("2")
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

        navigationItem.rightBarButtonItem = UIBarButtonItem(customView: rightBtn)
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
//        let controller = IOPUploadImageController()

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
    
    func jumpFileAction(_ itemList: [String]) {
//        DDLog(itemList)

//        let urlString = dataModel.valueText(forKeyPath: itemList[4], defalut: "")
//        if urlString.hasPrefix("http") == false {
//            NNProgressHUD.showText("文件链接无效")
//            return
//        }
//
//        let controller = IOPFileUploadController()
//        controller.title = itemList[0].replacingOccurrences(of: "*", with: "")
//        controller.key = itemList[4]
//
//        controller.isUpload = urlString == ""
//        controller.fileUrl = urlString == "" ? nil : NSURL(string: urlString)
//        DDLog("isUpload:\(controller.isUpload)_fileUrl:\(controller.fileUrl)")
//        navigationController?.pushViewController(controller, animated: true);
    }
    
}
        
extension IOPPayInpartCompanyOtherInfoController: UITableViewDataSource, UITableViewDelegate{
    //    MARK: - tableView
    func numberOfSections(in tableView: UITableView) -> Int {
        return list.count;
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let sections = list[section]
//        if section == 1 && dataModel.is_free == "0" {
//            return 2
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
//                self.showAlert(value0, message: value3)

//                UIAlertController.showAlert(value0, message: value3)
                UIAlertController.showAlert(value0, message: value3) { (style) in
                    style.alignment = .left
                } handler: { (alertVC, action) in
                    
                }

            }, for: .touchUpInside)
            
            let isHiddenBtnImage = (value0 == "协议")
            cell.btn.isHidden = isHiddenBtnImage
//            cell.getViewLayer()
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
            
            if value4.contains("_img") {
                let result: String = dataModel.valueText(forKeyPath: value4, defalut: "")
                let hasPicture = result.hasPrefix("http")
                if value3.contains(",") {
                    let titles = value3.components(separatedBy: ",")
                    cell.detailTextLabel?.text = hasPicture ? titles[0] : titles[1]
                } else {
                    cell.detailTextLabel?.text = hasPicture ? kTitleLook : kTitleUpload
   //                 cell.detailTextLabel?.textColor = hasPicture ? UIColor.gray : UIColor.theme
                }
             }
//            cell.getViewLayer()
            return cell;
            
        case "UITableViewCellSegment":
            let cell = UITableViewCellSegment.dequeueReusableCell(tableView)
            cell.labelLeft.font = UIFont.systemFont(ofSize: 14)
            cell.labelLeft.textColor = UIColor.textColor3
            cell.isHidden = itemList[2].cgFloatValue <= 0.0
            cell.hasAsterisk = value0.hasPrefix("*")

            cell.labelLeft.text = value0
            cell.segmentCtl.items = (itemList.last! as NSString).components(separatedBy: ",")
            let index = dataModel.valueText(forKeyPath: value4, defalut: "0") == "1" ? 1 : 0
            cell.segmentCtl.selectedSegmentIndex = index
//            cell.segmentCtl.addTarget(self, action: #selector(handleActionSender(_:)), for: .valueChanged)
            cell.segmentCtl.addActionHandler({ (sender) in
                DDLog(sender.selectedSegmentIndex)
                let value = "\(sender.selectedSegmentIndex)"
                self.dataModel.setValue(value, forKeyPath: value4)
                self.tableView.reloadData()

            }, for: .valueChanged)
//            cell.getViewLayer()
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
        if itemList[4].contains("_img") {
            jumpUploadPicture(itemList)

//            let hasPicture = dataModel.valueText(forKeyPath: itemList[4], defalut: "").hasPrefix("http")
//            if hasPicture {
//                 jumpXiangce(itemList)
//             } else {
//                 jumpUploadPicture(itemList)
//             }
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
