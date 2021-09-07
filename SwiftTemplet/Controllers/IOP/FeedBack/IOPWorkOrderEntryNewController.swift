//
//    IOPWorkOrderEntryController.swift
//    MacTemplet
//
//    Created by Shang on 2021/08/17 11:42
//    Copyright © 2021 shang. All rights reserved.
//


import UIKit
import SwiftExpand

/// 用户反馈创建
@objcMembers class IOPWorkOrderEntryNewController: UIViewController {

    var dataModel = NSObject()
    
    lazy var viewModel = NSObject()

//    var isValidateParams: Bool {
//        viewModel.etcFilesAPI.dataModel = dataModel;
//        let isValid = viewModel.etcFilesAPI.validateParamsOne()
//        return isValid
//    }
    
    lazy var list: [[Tuple5<String, String, String, String, String>]] = {
        return [
            [Tuple5("*问题标题" + kBlankOne, "UITableViewCellTextField", "50.0", "请输入", "contact_phone"),
//            Tuple5("*车场名称" + kBlankOne, "UITableViewCellParkChoose", "50.0", "请选择", "etc_protocol_link"),
             Tuple5("*车场名称" + kBlankOne, "UITableViewCellRightLabel", "50.0", "请选择", "etc_protocol_link"),
             Tuple5("*发生时间" + kBlankOne, "UITableViewCellTextField", "50.0", "请输入", "etc_project_report"),
             Tuple5("*联系人" + kBlankOne*2, "UITableViewCellTextField", "50.0", "请输入", "etc_key_request_form"),
             Tuple5("*联系电话" + kBlankOne, "UITableViewCellTextField", "50.0", "请输入", "etc_key_request_form"),
             Tuple5("车牌号码" + kBlankOne + kBlankQtr, "UITableViewCellTextField", "50.0", "请输入", "etc_key_request_form"),
            ],
            
            [Tuple5("*问题描述" + kBlankOne, "UITableViewCellTextView", "150.0", "请输入名称", "equipment_receiver"),
            ],
            
            [Tuple5("图片(选填，提供问题相关图片)", "UITableViewCellDesc", "50.0", "0/8", ""),
             Tuple5("*图片（选填）" + kBlankOne, "UITableViewCellPhotoPicker", "50.0", "", "equipment_receiver"),
            ],
            
            [Tuple5("视频(选填，提供问题相关视频)", "UITableViewCellDesc", "50.0", "0/2", ""),
             Tuple5("*视频（选填）", "UITableViewCellVideoPicker", "50.0", "", "contact_phone"),
            ],
                    
            [Tuple5("附件(选填)", "UITableViewCellDesc", "50.0", "0/2", ""),
             Tuple5("附件1", "UITableViewCellValu1", "35", "上传,点击查看", "etc_1"),
             Tuple5("附件2", "UITableViewCellValu1", "35", "上传,点击查看", "etc_2"),
            ],
//            [Tuple5("附件(选填)", "UITableViewCellDesc", "50.0", "0/2", ""),
//             Tuple5("附件1", "UITableViewCellAttachment", "40", "上传,点击查看", "etc_1"),
//            Tuple5("附件2", "UITableViewCellAttachment", "40", "上传,点击查看", "etc_2"),
//            ],
            
            
        ]
    }()
    
    lazy var tableView: UITableView = {
        let view = UITableView.create(self.view.bounds, style: .plain, rowHeight: 50)
        view.dataSource = self
        view.delegate = self

        return view
    }()
    
    lazy var footerView: NNTableFooterView = {
        let view = NNTableFooterView.create("提交反馈", topPadding: 15);
        view.btn.addTarget(self, action: #selector(handleAction(_:)), for: .touchUpInside)
        return view
    }()
    
    @objc func handleAction(_ sender: UIButton) {
        view.endEditing(true)
//        DDLog(sender.currentTitle)
//        if isValidateParams == false {
//            return
//        }
//        requestAdd()
    }
    
    lazy var uploadImageView: NNUploadImagesView = {
        let view = NNUploadImagesView()
        view.frame = CGRectMake(0, 0, self.view.bounds.width, 110)
        view.currrentVC = self
        view.images = [view.imageDefault]
        view.maxCount = 8
        view.rowHeight = view.frame.height
        view.delegate = self

        view.tag = 1000
        
        view.tapBlock = {
            DDLog($0)
        }
        return view
    }()
    
    
    lazy var uploadVideoView: NNUploadImagesView = {
        let view = NNUploadImagesView()
        view.frame = CGRectMake(0, 0, self.view.bounds.width, 110)
        view.currrentVC = self
        view.images = [view.imageDefault]
        view.maxCount = 2
        view.rowHeight = view.frame.height
        
        view.pickerVC.allowPickingImage = false
        view.pickerVC.allowPickingGif = false
        view.pickerVC.allowPickingMuitlpleVideo = true
        view.pickerVC.allowPickingVideo = true

        view.delegate = self

        view.tag = 1000
        
        view.tapBlock = {
            DDLog($0)
        }
        return view
    }()
        
    
    lazy var uploadFileVC: IOPFileUploadController = {
        let vc = IOPFileUploadController()
        vc.delegate = self
        return vc
    }()
    
    /// 文件选择器
    lazy var docPickVC: UIDocumentPickerViewController = {
        let vc = UIDocumentPickerViewController(documentTypes: IOPFileUploadController.docTypes, in: .import)
        vc.modalPresentationStyle = .fullScreen
        vc.allowsMultipleSelection = true
        vc.delegate = self
        
        vc.edgesForExtendedLayout = []

        return vc
    }()
        
    // MARK: -lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        edgesForExtendedLayout = []
        view.backgroundColor = .white
        title = "创建"
        navigationItem.rightBarButtonItems = ["Next"].map({
            return UIBarButtonItem(obj: $0) { item in
                DDLog(item.title)
            }
        })

        tableView.tableFooterView = footerView
        view.addSubview(tableView)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        tableView.reloadData()
    }
    // MARK: -funtions
    func updateAttachmentLabel(_ title: String = " 附件1", count: Int = 0, maxCount: Int = 2) -> NSAttributedString {
        let image: UIImage? = UIImage(named: "file_link")?
            .byResize(to: CGSize(width: 12, height: 12))!
            .maskWithColor(color: .gray)

        let str2: AttrString = """
          \(image: image!, scale: 1.0)\(" " + title, .color(.textColor9), .font(UIFont.systemFont(ofSize: 15)))
          """
        return str2.attributedString
    }
    
    func jumpFileAction(_ tuple: Tuple5<String, String, String, String, String>) {
        let urlString = dataModel.valueText(forKeyPath: tuple.t4, defalut: "")

        let vc = IOPFileUploadController()
        vc.delegate = self
        vc.title = tuple.t0.replacingOccurrences(of: "*", with: "")
        vc.key = tuple.t4

        vc.isUpload = urlString == ""
        vc.fileUrl = urlString == "" ? nil : NSURL(string: urlString)
        DDLog("isUpload:%@_fileUrl:%@", vc.isUpload, vc.fileUrl)
        navigationController?.pushViewController(vc, animated: true);
    }

//    func jumpXiangce(_ tuple: Tuple5) {
//        let vc = UIStoryboard.storyboard(with: "ParkRecord", identifier: "IOPParkRecordImageViewController") as! IOPParkRecordImageViewController
//        vc.title = tuple.t0.replacingOccurrences(of: "*", with: "")
//        if let url = URL(string: dataModel.value(forKeyPath: tuple.t4) as! String) {
//            vc.inImageUrlArray = [url]
//        }
//        navigationController?.pushViewController(vc, animated: true)
//    }
//
//    func jumpUploadPicture(_ tuple: Tuple5) {
//        let vc = IOPUploadImageController()
//        vc.delegate = self
//        vc.title = tuple.t0.replacingOccurrences(of: "*", with: "")
//        vc.key = tuple.t4
//
//        let imgUrl = dataModel.valueText(forKeyPath: tuple.t4, defalut: "")
//        vc.imgUrl = imgUrl
//        vc.isFromPickerVC = false
//        vc.showImageDefault = true
//        navigationController?.pushViewController(vc, animated: true)
//    }

//    func requestAdd() {
//        viewModel.etcFilesAPI.dataModel = dataModel
//        viewModel.requestETCFilesAdd { (dic) in
//            DDLog(dic)
//            if let code = dic["code"] as? String {
//                if code == "1" {
//                    IOPProgressHUD.showSuccess(withStatus: kAPISuccess)
//                    DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
//                        self.popToListController()
//                    }
//                }
//            } else {
//                IOPProgressHUD.showError(withStatus: dic["message"] as? String)
//            }
//        }
//    }
}

extension IOPWorkOrderEntryNewController: UITableViewDataSource, UITableViewDelegate{
    //    MARK: - tableView
    func numberOfSections(in tableView: UITableView) -> Int {
        return list.count;
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let sections = list[section]
        return sections.count;
    }
    
//    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//        let sections = list[indexPath.section]
//        let tuple = sections[indexPath.row]
//        return tuple.t2.cgFloatValue
//    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let sectionList = list[indexPath.section]
        let tuple = sectionList[indexPath.row]
        if tuple.t2 == "" {
            return UITableView.automaticDimension
        }
        if tuple.t1 == "UITableViewCellPhotoPicker" {
            return uploadImageView.totalHeight
        }
        if tuple.t1 == "UITableViewCellVideoPicker" {
            return uploadVideoView.totalHeight
        }
        let height = tuple.t2.cgFloatValue
        return height
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let sections = list[indexPath.section]
        let tuple = sections[indexPath.row]
        let value0 = tuple.t0
        let value1 = tuple.t1
        let value2 = tuple.t2
        let value3 = tuple.t3
        let value4 = tuple.t4
        
        switch value1 {
        case "UITableViewCellValu1":
            let cell = UITableViewCell.dequeueReusableCell(tableView, identifier: "UITableViewCellValu1", style: .value1)
            cell.textLabel?.font = UIFont.systemFont(ofSize: 15)
            cell.textLabel?.textColor = .textColor3;

            cell.detailTextLabel?.font = UIFont.systemFont(ofSize: 15)
            cell.detailTextLabel?.textColor = .theme
            cell.accessoryType = .disclosureIndicator;

            cell.textLabel?.text = value0
            cell.detailTextLabel?.text = value4

            let fileTitles: [String] = value3.components(separatedBy: ",")
            cell.detailTextLabel?.text = fileTitles.first!

            cell.separatorHidden()
//            cell.getViewLayer()
            return cell
        case "UITableViewCellParkChoose":
            let cell = UITableViewCell.dequeueReusableCell(tableView, identifier: "UITableViewCellParkChoose", style: .value1)
            cell.textLabel?.font = UIFont.systemFont(ofSize: 15)
            cell.textLabel?.textColor = .textColor3;

            cell.detailTextLabel?.font = UIFont.systemFont(ofSize: 15)
            cell.detailTextLabel?.textColor = .theme
            cell.accessoryType = .disclosureIndicator;
            
            cell.textLabel?.text = value0
            cell.detailTextLabel?.text = value4
            
            let fileTitles: [String] = value3.components(separatedBy: ",")
            cell.detailTextLabel?.text = fileTitles.first!
            
            let hasAsterisk = value0.contains("*")
            if hasAsterisk {
                cell.textLabel?.attributedText = cell.textLabel!.text!.matt.appendPrefix(font: cell.textLabel!.font)
            }

//            cell.getViewLayer()
            return cell
            
        case "UITableViewCellRightLabel":
            let cell = UITableViewCellRightLabel.dequeueReusableCell(tableView)
            cell.isHidden = value2.cgFloatValue <= 0.0
            cell.accessoryType = .disclosureIndicator
            cell.hasAsterisk = value0.contains("*")

            cell.labelLeft.text = value0
            cell.labelRight.text = value3
            
//            cell.getViewLayer()
            return cell
            
        case "UITableViewCellTitle":
            let cell = UITableViewCellTitle.dequeueReusableCell(tableView)
            cell.labelLeft.font = UIFont.systemFont(ofSize: 15)
            cell.labelLeft.textColor = .textColor3
            cell.isHidden = value2.cgFloatValue <= 0.0
            cell.btn.isHidden = value3 == ""
            
            cell.labelLeft.text = value0
            cell.btn.addActionHandler({ (control) in
                UIAlertController.showAlert(message: value3)
                
            }, for: .touchUpInside)
            
            
//            cell.getViewLayer()
            return cell
            
        case "UITableViewCellTextField":
            let cell = UITableViewCellTextField.dequeueReusableCell(tableView)
            cell.labelLeft.font = UIFont.systemFont(ofSize: 15)
            cell.labelLeft.textColor = .textColor3
            cell.isHidden = value2.cgFloatValue <= 0.0
            cell.hasAsterisk = value0.contains("*")

            cell.textfield.rightViewMode = .never;
            cell.textfield.textAlignment = .left
//            cell.inset = cell.inset + UIEdgeInsets(0, 5, 0, 0)

            cell.labelLeft.text = value0
            cell.textfield.placeholder = value3
            cell.textfield.text = dataModel.valueText(forKeyPath: value4, defalut: "")
            cell.block { (textField) in
                self.dataModel.setValue(textField.text ?? "", forKeyPath: value4)
//              DDLog("%@_%@_", value4, self.dataModel.valueText(forKeyPath: value4))
            }
//            cell.getViewLayer()
            return cell
            
        case "UITableViewCellTextView":
            let cell = UITableViewCellTextView.dequeueReusableCell(tableView)
            cell.labelLeft.font = UIFont.systemFont(ofSize: 15)
            cell.labelLeft.textColor = .textColor3
            cell.isHidden = value2.cgFloatValue <= 0.0
            cell.hasAsterisk = value0.contains("*")
            
            cell.wordCount = 200
            cell.labelLeft.text = value0
            cell.textView.placeHolderLabel.text = "请填写您的问题或功能建议，感谢您的使用(必填)"

            cell.block { ( view, text) in
                DDLog(text)
            }
            
            cell.getViewLayer()
            return cell
            
        case "UITableViewCellPhotoPicker":
            let cell = UITableViewCell.dequeueReusableCell(tableView, identifier: value1)
            if let view = cell.contentView.viewWithTag(1000) as? NNUploadImagesView {
                DDLog(view.self)
            } else {
                cell.contentView.addSubview(uploadImageView)
            }
            
//            cell.getViewLayer()
            return cell
            
        case "UITableViewCellVideoPicker":
            let cell = UITableViewCell.dequeueReusableCell(tableView, identifier: value1)
            if let view = cell.contentView.viewWithTag(1001) as? NNUploadImagesView {
                DDLog(view.self)
            } else {
                cell.contentView.addSubview(uploadVideoView)
            }
            
//            cell.getViewLayer()
            return cell
            
        case "UITableViewCellDesc":
            let cell = UITableViewCell.dequeueReusableCell(tableView, identifier: "UITableViewCellDesc", style: .value1)
            cell.textLabel?.font = UIFont.systemFont(ofSize: 15)
            cell.textLabel?.textColor = .textColor3;

            cell.detailTextLabel?.font = UIFont.systemFont(ofSize: 15)
//            cell.detailTextLabel?.textColor = .theme
//            cell.accessoryType = .disclosureIndicator
            
            cell.textLabel?.text = value0
            cell.detailTextLabel?.text = value3
                        
//            let titles: [String] = value0.components(separatedBy: "(")
//            cell.textLabel?.attributedText = titles.first?.matt + "(\(titles.last?)".matt

            let titles: [String] = value0.components(separatedBy: "(")
            if titles.count > 1  {
                cell.textLabel?.attributedText = titles.first!.matt + "(\(titles.last!)".matt.foregroundColorChain(.textColor9)
            }
//            let attributedText = updateAttachmentTitleLabel()
//            cell.detailTextLabel?.attributedText = attributedText

            let hasAsterisk = value0.contains("*")
            if hasAsterisk {
                cell.textLabel?.attributedText = cell.textLabel!.text!.matt.appendPrefix(font: cell.textLabel!.font)
            }
            
//            if value4.contains("etc_") {
//                let result: String = dataModel.valueText(forKeyPath: value4, defalut: "")
//                let validUrl = result.hasPrefix("http")
//                cell.detailTextLabel?.text = validUrl ? fileTitles.first : fileTitles.last
////                cell.detailTextLabel?.textColor = hasPicture ? UIColor.gray : UIColor.theme
//            }
            if [2, 3, 4].contains(indexPath.section) {
                cell.separatorHidden()
            }
//            cell.getViewLayer()
            return cell
            
        case "UITableViewCellAttachment":
            let cell = UITableViewCell.dequeueReusableCell(tableView, identifier: "UITableViewCellAttachment", style: .value1)
            cell.textLabel?.font = UIFont.systemFont(ofSize: 15)
            cell.textLabel?.textColor = .textColor3;

            cell.detailTextLabel?.font = UIFont.systemFont(ofSize: 15)
            cell.detailTextLabel?.textColor = .theme
//            cell.accessoryType = .disclosureIndicator
            
            cell.textLabel?.text = value0
            cell.detailTextLabel?.text = value4
                        
            let attributedText = updateAttachmentLabel(value0)
            cell.textLabel?.attributedText = attributedText
            
            let titles: [String] = value0.components(separatedBy: "(")
            if titles.count > 1  {
                cell.textLabel?.attributedText = titles.first!.matt + "(\(titles.last!)".matt.foregroundColorChain(.textColor9)
            }

            let fileTitles: [String] = value3.components(separatedBy: ",")
            if value4.contains("etc_") {
                let result: String = dataModel.valueText(forKeyPath: value4, defalut: "")
                let validUrl = result.hasPrefix("http")
                cell.detailTextLabel?.text = validUrl ? fileTitles.first : fileTitles.last
                cell.accessoryType = validUrl ? .none : .disclosureIndicator
            }
            if [2, 3, 4].contains(indexPath.section) {
                cell.separatorHidden()
            }
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
        let tuple = sections[indexPath.row]
        if tuple.t4.contains("_img") {
//            jumpUploadPicture(tuple)
        } else if tuple.t4.contains("etc_") {
            jumpFileAction(tuple)

        } else if tuple.t0.contains("附件") {
            jumpFileAction(tuple)
//            self.docPickVC.setupContentInsetAdjustmentBehavior(true)
//            self.docPickVC.present(true, style: .fullScreen)
        }
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return [3, 4].contains(section) ? 1 : 10.01
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        return UILabel()
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return section == tableView.numberOfSections - 1 ? 10.01 : 0.01
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        return UILabel()
    }
}
        
extension IOPWorkOrderEntryNewController: IOPUploadImageControllerDelegate{
    func uploadImage(_ vc: IOPImageUploadController, url: String, forKey key: String) {
        DDLog("%@_%@", key, url)
        dataModel.setValue(url, forKeyPath: key)
        tableView.reloadData()
    }
}
        
extension IOPWorkOrderEntryNewController: IOPFileUploadControllerDelegate{
    func fileUpload(_ url: String, forKey key: String) {
        DDLog("%@_%@", key, url)
        dataModel.setValue(url, forKeyPath: key)
        tableView.reloadData()
    }
}


extension IOPWorkOrderEntryNewController: NNUploadImagesViewDelegate {
    func didFinishPicker(_ images: [UIImage], isSelectOriginalPhoto: Bool) {
        DDLog(images.count)
    }
}


extension IOPWorkOrderEntryNewController: UIDocumentPickerDelegate{
    func documentPicker(_ controller: UIDocumentPickerViewController, didPickDocumentsAt urls: [URL]) {
        guard let url = urls.first else {
            return
        }
        DDLog(urls)
//        localFileUrl = url as NSURL
    }
    func documentPicker(_ controller: UIDocumentPickerViewController, didPickDocumentAt url: URL) {
//        localFileUrl = url as NSURL
        DDLog(url)
    }
    func documentPickerWasCancelled(_ controller: UIDocumentPickerViewController) {
        setupContentInsetAdjustmentBehavior(false)
    }
}

//struct StringTuple5 {
//    var t0: String
//    var t1: String
//    var t2: String
//    var t3: String
//    var t4: String
//
//    init(_ t0: String, _ t1: String, _ t2: String, _ t3: String, _ t4: String) {
//        self.t0 = t0
//        self.t1 = t1
//        self.t2 = t2
//        self.t3 = t3
//        self.t4 = t4
//    }
//}


//struct CellModel {
//    var title = "标题"
//    var cellName = "UITableViewCell"
//    var cellHeight = "60"
//    var placeholder = "请输入"
//    var modelProportyName = "请输入"
//
//    init(_ title: String, _ cellName: String, _ cellHeight: String, _ placeholder: String, _ modelProportyName: String) {
//        self.title = title
//        self.cellName = cellName
//        self.cellHeight = cellHeight
//        self.placeholder = placeholder
//        self.modelProportyName = modelProportyName
//    }
//}
