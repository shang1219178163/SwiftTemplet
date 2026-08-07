
//
//  ThirdViewController.swift
//  SwiftTemplet
//
//  Created by Bin Shang on 2018/8/10.
//  Copyright © 2018年 BN. All rights reserved.
//

import UIKit
import SwiftExpand
import HandyJSON
import MJRefresh
import HFNavigationController
import Alamofire

class ThirdViewController: UIViewController{

    //MARK: -lazy
    lazy var tableView: UITableView = {
        let view = UITableView(rect: self.view.bounds, style: .grouped, rowHeight: 60)
        view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        view.dataSource = self
        view.delegate = self

        return view
    }()
    
    
    lazy var listiOS13: [String] = {
        return ["SystemColorShowController", "AppStoreGameController", "SubscribeListController"]
    }()

    lazy var list: [[[String]]] = {
        return [
            [["WrapDemoController", "WrapDemo", ],
             ["AnimatedCrossFadeDemoController", "AnimatedCrossFade", ],
             ["EntryViewController", "通用录入界面", ],
             ["XiangceChooseDemoController", "XiangceChoose", ],
             
             ["IOPFuntionListController", "iop 视图", ],
             ["SuanfaViewController", "常见算法", ],
             ["NSRegularExpressionController", "正则", ],
             
             ["AudioPlayerDemoController", "AudioPlayer", ],

             ["SystemIconDisplayController", "系统图标", ],
             ["OptionalTestController", "Optional 功能扩展", ],
             ["ScanningDocumentsController", "ScanningDocuments", ],             
             ["NNPlaceHolderViewController", "占位视图", ],
             ["ReuseChildsController", "控制器复用", ],
             ["AttrStringViewController", "优雅的富文本", ],
             ["AttrStringEffectiveController", "AttrString(OC)", ],
             ["NNButtonStudyController", "按钮封装", ],
//             ["SubscribeListNewController", "微信公众号信息列表1", ],
             ["FloatingPanelExampleController", "FloatingPanel浮层", ],             

             ["NNFeedbackController", "kOP Upload", ],
             ["NNImageAndVideoPickerController", "kOP UploadImages", ],
             ["RxRequestExampleController", "RxSwift 网络请求", ],
             ["AppStoreGameController", "AppStore游戏界面", ],
//             ["SubscribeListController", "微信公众号信息列表", ],
             ["BookReaderController", "UIPageViewController", ],
             ["CalendarViewController", "CalenderView", ],
             ["NNTitleViewSelectController", "NNTitleViewSelect", ],             
             ["UICollectionExcelController", "Excel", ],
             ["PlateKeybordController", "自定义车牌键盘", ],

//             ["CellListController", "自定义Cell界面", ],
             ["TextFieldStyleController", "TextField样式显示", ],
             ["TextFieldMaxLengthController", "MaxLength", ],
             
             ["IOPPlateEntryController", "多车牌录入", ],
             ["FlipImageViewController", "FlipImageView", ],
             ["NNTitleViewSelectController", "导航栏下拉菜单封装", ],
             ["TransitionAnimatorShowController", "动画效果", ],
             ["NNAlertShowController", "自定义 UIViewController 弹窗", ],
             ["UILabelMultipleTapController", "多点高亮点击", ],
             ["UISearchStylesController", "搜索🔍样式", ],
             ["UIStackViewController", "UIStackView", ],
             ["NNPictureViewController", "全屏图册", ],
             ["UIModalPresentationStyleController", "控制器呈现效果", ],
             ["NNPlateKeyboardController", "自定义车牌键盘重构", ],
//             ["PlateKeybordController", "自定义车牌键盘", ],
             ["TitleViewController", "导航栏下拉菜单", ],
             
            ["UICollectionListController", "FlowLayoutStyle", ],
//             ["NNTabViewController", "NNTabView组件", ],
             ["CustomViewController", "自定义View", ],
             ["CalendarViewController", "CalenderView", ],
             ["PickerViewController", "PickerView", ],
             ["PhotosViewController", "PictureView", ],
             ["ScrollViewController", "分段组件", ],
             ["CCSCouponRecordController", "优惠券列表", ],
             ["KeyBoardViewController", "KeyBoardView", ],

//             ["NNFormViewController", "表单视图", ],
             ],
            
            
            
            [["ValidateProtocolController", "MixIn协议扩展", ],
             ["NNAbsorbPointerViewController", "事件拦截", ],
             
             ["OperatorViewController", "Operator", ],
             ["GenericViewController", "Generic", ],
             ["ClosureViewController", "Closure", ],
            ["CurryViewController", "Curry", ],
            ["IteratorDemoController", "IteratorDemo", ],
            ["NNUserLogInController", "RxSwift函数响应型编程", ],
            ["TimerViewController", "Timer", ],
            ["ObserveViewController", "Observe", ],
            ["ProtocolViewController", "面向协议编程", ],
            ["AppleSignInViewController", "AppleSignIn", ],
            ["RecursionViewController", "Recursion", ],
            ["TestViewController", "新想法测试", ],
             ["TestBlockController", "新想法测试", ],

             
            ],
            
            [["SystemColorShowController", "SystemColor", ],
             ["TableViewPrefetchRowController", "image预加载", ],
             ["AppIconChangeController", "App图标更换", ],
             ["AlertSheetStudyController", "AlerSheet研究", ],             
             ["UIRecognizerUpdateController", "手势集合升级", ],
             ["UIRecognizerController", "手势集合", ],
             ["IOPInvoiceCreateController", "折叠", ],
             ["NumberFormatterExampleController", "NumberFormatter", ],
             ["ChainExampleController", "ChainExample", ],
             ["ChainExampleSwiftController", "ChainExampleSwift", ],
             ["PasswordStrengthCheckController", "PasswordStrengthCheck", ],
             ["PasswordStrengthCheckSwiftController", "PasswordStrengthCheckSwift", ],             
//             ["SwiftCollectionsController", "SwiftCollections", ],
            ],
        ]
    }()
    
    var sectionTitles = ["视图相关", "其他"]
    
    let serialQueue = DispatchQueue(label: "Decode queue")
    
    let frameCenter = CGRect(x: 30,
                             y: (UIScreen.main.bounds.height - 280)*0.5 - 30,
                             width: UIScreen.main.bounds.width - 60,
                             height: 280)
    
    lazy var textController: NNAgreementAlertController = {
        let controller = NNAgreementAlertController()
//        controller.actionTitles = ["one", "two", "three"]
//        controller.actionTitles = ["one", ]
        controller.actionTitles = ["暂不使用", "同意"]
        controller.delegate = self
        return controller
    }()
    
    lazy var navController: HFNavigationController = {
        let controller = HFNavigationController(rootViewController: textController)
        controller.modalTransitionStyle = .crossDissolve
        
        controller.view.layer.cornerRadius = 15
        controller.view.layer.masksToBounds = true
        
        controller.setupDefaultFrame(self.frameCenter)

        return controller;
    }()
    
    lazy var updateView: NNUpdateVersionView = {
        let view = NNUpdateVersionView(frame: .zero)
        view.label.text = "发现新版本"
        view.labelOne.text = "V1.2.0"
        view.labelTwo.text = "更新内容:"
        view.labelThree.text = "1.界面改版,新增消息通知\n2.新增充值功能\n3.部分界面优化"

        view.block({ (versionView, idx) in
            DDLog(idx)
            versionView.dismiss()
        })
        return view
    }()
            
    lazy var updateOneView: NNUpdateVersionOneView = {
        let view = NNUpdateVersionOneView(frame: .zero)
        view.isForceUpdate = true
        view.labelContent.text = "数据显示，2020上半年全国300个大中城市住宅用地成交楼面均价5150元/平方米，同比上涨16.5%，300个大中城市土地平均溢价率13.6%。其中长三角城市的涨势尤其亮眼，在一些二三线城市房地产不景气的情况下，南京、宁波、杭州、南通、扬州等长三角城市的房价逆势上涨。"
        return view
    }()
    
    lazy var agreementView: NNAgreementView = {
        let view = NNAgreementView(frame: .zero)
        view.labelTitle.text = "温馨提示"
        view.textView.textColor = .textColor3
        view.delegate = self
                        
        let tapTexts = ["《服务协议》", "《隐私政策》",];
        let tapUrls = ["", "",];
        let string = "感谢您对停车王的信任！\n\n请注意，在您使用本软件过程中我们会按照\(tapTexts[0])、\(tapTexts[1])收集、使用和共享您的个人信息，请认真阅读并充分理解。\n\n特别提示：\n1.基于您的授权，我们可能会获取您的位置等信息，您有权拒绝或取消授权；\n2.我们会采取业界先进的安全措施保护您的信息安全；\n3.未经您同意，我们不会从第三方处获取、共享或向其提供您的信息;"
        view.textView.setupUserAgreements(string, tapTexts: tapTexts, tapUrls: tapUrls, fontSize: 16)
        view.setNeedsLayout()
        return view
    }()
    
    let updateAPi = NNCheckVersApi()

    // MARK: -lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        edgesForExtendedLayout = []
        view.backgroundColor = .white
        title = "总览"

        
        let list: [(String, Selector)] = [
            ("升级", #selector(handleActionItem(_:))),
            ("协议", #selector(handleActionItem(_:))),
            ("弹窗", #selector(handleActionItem(_:))),
            ("升级", #selector(handleActionItem(_:))),
            ("展示", #selector(handleActionItem(_:))),
            ("协议", #selector(handleActionItem(_:))),
             ];
        
        let barItems = list.enumerated().map { e -> UIBarButtonItem in
            let barItem = UIBarButtonItem(title: e.element.0, style: .plain, target: self, action: e.element.1)
            barItem.tag = e.offset
            return barItem
        }
        
        navigationItem.leftBarButtonItems = barItems.subarray(with: NSRange(location: 0, length: 3))
        navigationItem.rightBarButtonItems = barItems.subarray(with: NSRange(location: 3, length: 3))
        

        tableView.rowHeight = 50;
        view.addSubview(tableView)

        setupRfresh()
//        view.getViewLayer()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
                
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        navigationController?.navigationBar.setColor(.theme, background: .white)

//        let string = "[[\"\\u9655A91D6P\"]]";
//        let obj = JSONSerialization.jsonObjectFromString(string);
//        DDLog(obj)
//        9.printChengfaBiao()
//        tableView.nextResponder(UIWindow.self, isPrint: true)
        
//        let image = UIImage(color: .white)
//        DDLog(image.cgImage)
        let string = """
        {"status":"success",
        "object":{
        "blocks":[
        {"id":1,"value":1,"level":0,"name":"A区","description":"描述信息","disabled":false},
        {"id":2,"value":2,"level":0,"name":"B区","disabled":false},
        {"id":3,"value":3,"level":0,"name":"C区","disabled":false},
        {"id":4,"value":4,"level":0,"name":"D区","disabled":false}],
            "floors":[
        {"id":51,"value":1,"level":2,"name":"1层","disabled":false},
        {"id":52,"value":2,"level":2,"name":"2层","disabled":false},
        {"id":53,"value":3,"level":2,"name":"3层","disabled":false},
        {"id":54,"value":4,"level":2,"name":"4层","disabled":false}],
            "buildings":[
        {"id":11,"value":1,"level":1,"name":"1栋","disabled":false},
        {"id":12,"value":2,"level":1,"name":"2栋","disabled":false},
        {"id":13,"value":3,"level":1,"name":"3栋","disabled":false},
        {"id":14,"value":4,"level":1,"name":"4栋","disabled":false}]
                }
        }
        """
//        guard let dic = JSONSerialization.jsonObjectFromString(string) as? [AnyHashable : Any] else { return }
//        let rootModel = PKRootModel.yy_model(with: dic)
//        DDLog(dic, rootModel?.object?.floors)
        
//        hookRequest()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)

//        let controller = CellListController()
//        navigationController?.pushViewController(controller, animated: true);

    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        
        updateAPi.clearCache()
    }
    

    
    // MARK: -funtions
    func setupRfresh() {
//        var header: MJRefreshNormalHeader {
//            let header = MJRefreshNormalHeader {
//                self.requestInfo()
//            }
//            header.lastUpdatedTimeLabel?.isHidden = true
////            header.stateLabel?.isHidden = true
//            header.stateLabel?.textColor = UIColor.white
//            header.backgroundColor = UIColor.theme;
//            return header;
//        }
        
//        let backView = UIView(frame: CGRect(x: 0, y: -1000, width: UIScreen.main.bounds.width, height: 960))
//        backView.backgroundColor = UIColor.theme
//        tableView.addSubview(backView)

        tableView.headerColorRefresh({
            self.requestInfo()
        }, textColor: UIColor.white, backgroundColor: UIColor.theme)
        
        tableView.footerRefresh {
            self.requestInfo()
        }
    }
    
    @objc func handleActionItem(_ item: UIBarButtonItem) {
        switch item.tag {
        case 0:
            updateOneView.check()

        case 1:
            agreementView.show()
        
        case 2:
            navController.present()
            
        case 3:
            let message = "我想要的功能非常简单。我已经设置了两个手指平移手势，并且我希望能够通过一些图像进行洗牌，具体取决于我移动的像素数。"
            UIAlertController.showAlert("提示", message: message)
            
        case 4:
            let message = "我想要的功能非常简单。我已经设置了两个手指平移手势，并且我希望能够通过一些图像进行洗牌，具体取决于我移动的像素数。"
            UIAlertController(title: "提示", message: message, preferredStyle: .alert)
                .addActionTitles([kTitleCancell, kTitleSure], handler: { (alertVC, action) in
                    DDLog(action.title)
                })
                .addTextFieldPlaceholders(["请输入"], handler: { (textfield) in
                DDLog(textfield.text)
                })
                .present {
//                DDLog("present")
                }
            
        case 5:
            let message = "我想要的功能非常简单。我已经设置了两个手指平移手势，并且我希望能够通过一些图像进行洗牌，具体取决于我移动的像素数。我已经解决了所有问题，但是我希望能够捕捉平移手势是否被反转。"
//            UIAlertController(title: "提示", message: message, preferredStyle: .alert)
//                .addActionTitles([kTitleCancell, kTitleSure]) { (alertVC, action) in
//                    DDLog(action.title)
//            }
////            .addTextFields(["请输入账号", "请输入密码"]) { (textfield) in
////                DDLog(textfield.text)
////                textfield.addTarget(self, action: #selector(self.handleTextfield(_:)), for: [.editingChanged, .editingDidEnd, .editingDidEndOnExit])
////            }
//            .present {
////                DDLog("present")
//            }
//            UIApplication.shared.keyWindow?.endEditing(true)
            
            let alertVC = UIAlertController(title: "提示", message: message, preferredStyle: .alert)
            alertVC.addAction(UIAlertAction(title: kTitleSure, style: .default, handler: { (action) in
                DDLog(action.title)
            }))
            alertVC.present()
        default:
            UIApplication.shared.openURL(URL(string: "wx.parkingwang.com://")!)
            break
        }
    }
    
    @objc func handleTextfield(_ sender: UITextField) {
        DDLog(sender.text)

    }
    
    func showAlert() {
        UIAlertController(title: "提示", message: "xinx", preferredStyle: .alert)
            .addActionTitles([kTitleCancell, kTitleSure], handler: { (alertVC, action) in
                DDLog(action.title)
            })
            .addTextFieldPlaceholders(["请输入"], handler: { (textfield) in
                DDLog(textfield.text)
        
            }).present {
                DDLog("present")
            }
    }
    
    
    func requestInfo() {
        NNProgressHUD.showLoading("努力加载中")
        updateAPi.startRequest(success: { (manager, dic) in
            
            guard let data = try? JSONSerialization.data(withJSONObject: dic as Any, options: []) as Data,
            let jsonString = String(data: data, encoding: .utf8)
            else { return }
            let string: String = jsonString.replacingOccurrences(of: "\\", with: "")
//            DDLog(string)
//            if let response = NNCheckVersRootClass.deserialize(from: dic) {
            if let response = ESCheckVersRootClass.deserialize(from: dic) {
//                DDLog(response)
                self.showUpdateInfo(response.results!.first!)
                
//                let dic = response.results!.first!.toDictionary()
//                DDLog(dic)
            }
//            NNProgressHUD.showSuccess("请求成功");
            NNProgressHUD.dismiss()
            self.tableView.mj_header!.endRefreshing()
            self.tableView.mj_footer!.endRefreshing()
        }) { (manager, error) in
            NNProgressHUD.showError(error.debugDescription)
        }
    }
    ///显示新版本信息弹窗
    func showUpdateInfo(_ model: ESCheckVersResult) {
        updateView.appStoreID = "\(model.trackId)"
        updateView.label.text = "发现新版本"
        updateView.labelOne.text = "v\(model.version ?? "--")"
        updateView.labelTwo.text = "更新内容:"
        updateView.labelThree.text = "\(model.releaseNotes ?? "--")"
        if let releaseDate = model.currentVersionReleaseDate, releaseDate.count >= 10 {
            updateView.labelOne.text = "v\(model.version ?? "--") (\(releaseDate.substring(to: 9)))"
        }
        let isUpdate: Bool = model.version?.compare(UIApplication.appVer, options: .numeric, range: nil, locale: nil) == .orderedDescending
        if isUpdate {
            updateView.show()
        }
    }
    
    func hookRequest() {
        let url = UIApplication.appDetailUrlWithID(kAppStoreID)
        OHHTTPStubsHelper.installStubs(url: url, jsonName: nil)
//        UIApplication.updateVersion(appStoreID: kAppStoreID) { (dic, ver, notes, isUpdate) in
//            DDLog(dic)
//        }
        
        guard let URL = URL(string: url) else { return  }
        AF.request(URL, method: .get, parameters: nil, headers: nil)
            .response { (response) in
                guard let data = response.data,
                    let jsonDic = data.objValue as? [String : Any] else {
                    DDLog("数据解析错误")
                    return;
                }
                DDLog(jsonDic.jsonString)
        }
    }
}

extension ThirdViewController: UITableViewDataSource, UITableViewDelegate{
    //    MARK: - tableView
    func numberOfSections(in tableView: UITableView) -> Int {
        return list.count;
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return list[section].count;
    };
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return tableView.rowHeight
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(for: UITableViewCell.self, identifier: "subtitle", style: .subtitle);
        cell.textLabel?.font = UIFont.systemFont(ofSize: 15)
        cell.textLabel?.textColor = UIColor.theme;

        cell.textLabel?.font = UIFont.systemFont(ofSize: 13)
        cell.detailTextLabel?.textColor = UIColor.gray;
        cell.accessoryType = .disclosureIndicator;
        
        let itemList = list[indexPath.section][indexPath.row]
        cell.textLabel?.text = itemList[1]
//        cell.textLabel?.text = NSLocalizedString(itemList[1], comment: "")
        cell.textLabel?.text = Bundle.localizedString(forKey: itemList[1])

        cell.detailTextLabel?.text = itemList[0];
        
//            let circleSize = CGSize(width: tableView.rowHeight - 10, height: tableView.rowHeight - 10)
//            let renderer = UIGraphicsImageRenderer(bounds: CGRect(x: 0, y: 0, width: circleSize.width, height: circleSize.height))
//
//            let circleImage = renderer.image{ ctx in
//                UIColor.red.setFill()
//                ctx.cgContext.setFillColor(UIColor.random.cgColor)
//                ctx.cgContext.addEllipse(in: CGRect(x: 0, y: 0, width: circleSize.width, height: circleSize.height))
//                ctx.cgContext.drawPath(using: .fill)
//            }
//            cell.imageView?.image = circleImage

        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let itemList = list[indexPath.section][indexPath.row]
//        DDLog(itemList);
        
        if #available(iOS 13.0, *) {

        } else {
            if listiOS13.contains(itemList.first!) {
                UIAlertController.showAlert(message: "@available(iOS 13.0, *)")
                return
            }
        }
        
        let controller = UICtrFromString(itemList.first!)
        controller.title = itemList.last!
        navigationController?.pushViewController(controller, animated: true);
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 25;
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if sectionTitles.count > section {
            return kBlankOne + sectionTitles[section]
        }
        return ""
    }
    
//    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
//        return UIView();
//    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 0.01;
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        let label = UILabel(frame: .zero);
        //        label.backgroundColor = .green;
        //        label.text = "header\(section)";
        return label;
    }
    
}

extension ThirdViewController: UITableViewDataSourcePrefetching{
    
    func tableView(_ tableView: UITableView, prefetchRowsAt indexPaths: [IndexPath]) {
        for indexPath in indexPaths {
            serialQueue.async {
//                ///大图下采样
//                let downsampledImage = UIImage.downsample(images[indexPath.row])
//                DispatchQueue.main.async {
//                    self.update(at: indexPath, with: downsampledImage)
//                }
            }
        }
    }
    
}

extension ThirdViewController: NNAgreementAlertControllerDelegate{
    func agreementAlertVC(_ controller: NNAgreementAlertController, sender: UIButton) {
        DDLog(sender.currentTitle, sender.tag)
        switch sender.tag {
        case 0:
            exit(0)
        default:
            controller.dismiss(animated: true, completion: nil)
        }
    }
    
    func agreementAlertTextView(_ textView: UITextView, shouldInteractWith URL: URL, in characterRange: NSRange) -> Bool {
        DDLog(URL.absoluteString)
        if URL.scheme?.contains("_") == true {
            guard let urlString = URL.absoluteString.components(separatedBy: "_").last else { return false}
            UIApplication.openURLString(urlString)
        }

//        if URL.scheme == "" {
//            return false
//        }
 
        return true
    }
    

}

extension ThirdViewController: NNAgreementViewDelegate{
    func agreementView(_ view: NNAgreementView, sender: UIButton) {
        DDLog(sender.currentTitle, sender.tag)
        switch sender.tag {
        case 0:
            exit(0)
        default:
            view.dismiss()
            break
        }
    }
    
    func agreementView(_ textView: UITextView, shouldInteractWith URL: URL, in characterRange: NSRange) -> Bool {
        DDLog(URL.absoluteString)
        if URL.scheme?.contains("_") == true {
            guard let urlString = URL.absoluteString.components(separatedBy: "_").last else { return false}
            UIApplication.openURLString(urlString)
        }

//        if URL.scheme == "" {
//            return false
//        }
        return true
    }
    


}
