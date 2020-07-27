
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
//import Moya
import MJRefresh
import HFNavigationController

class ThirdViewController: UIViewController{

    //MARK: -lazy
    lazy var tableView: UITableView = {
        let view: UITableView = UITableView.create(self.view.bounds, style: .grouped, rowHeight: 50)
        view.dataSource = self
        view.delegate = self

        return view
    }()
    
    lazy var listiOS13: [String] = {
        return ["SystemColorShowController", "AppStoreGameController", "SubscribeListController"]
    }()

    lazy var list: [[[String]]] = {
        var array: [[[String]]] = [
            [["EntryViewController", "通用录入界面", ],
             ["SubscribeListNewController", "微信公众号信息列表1", ],

            ["ProtocolViewController", "面向协议编程", ],
            ["AppleSignInViewController", "AppleSignIn", ],
            ["PKParkCollectListController", "kOP 收藏", ],
             ["NNFeedbackController", "kOP Upload", ],
             ["NNImageAndVideoPickerController", "kOP UploadImages", ],
             ["RxRequestExampleController", "RxSwift 网络请求", ],
             ["AppStoreGameController", "AppStore游戏界面", ],
             ["SubscribeListController", "微信公众号信息列表", ],
             ["BookReaderController", "UIPageViewController", ],
             ["CalendarViewController", "CalenderView", ],
             ["NNTitleViewSelectController", "NNTitleViewSelect", ],             
             ["UICollectionMultipleSectionController", "多布局展示", ],
             ["UICollectionExcelController", "Excel", ],
             ["PlateKeybordController", "自定义车牌键盘", ],

//             ["CellListController", "自定义Cell界面", ],
             ["TextFieldStyleController", "TextField样式显示", ],                
             ["IOPPlateEntryController", "多车牌录入", ],
             ["ReuseChildsController", "控制器复用", ],
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
             ["NNButtonStudyController", "按钮研究", ],
             
             ["UICollectionDispalyController", "UICollectionView展示", ],
             ["UICollectionBatchUpdateController", "UICollectionView批量更新", ],
//             ["NNTabViewController", "NNTabView组件", ],
             ["CustomViewController", "自定义View", ],
             ["CalendarViewController", "CalenderView", ],
             ["PickerViewController", "PickerView", ],
             ["PhotosViewController", "PictureView", ],
             ["ScrollHorizontalController", "重构", ],
             ["ScrollViewController", "分段组件", ],
             ["CCSCouponRecordController", "优惠券列表", ],
             ["NNFormViewController", "表单视图", ],
             ],
            [["TableViewPrefetchRowController", "image预加载", ],
             ["AppIconChangeController", "App图标更换", ],
             ["NNUserLogInController", "RxSwift函数响应型编程", ],
             ["UIRecognizerUpdateController", "手势集合升级", ],
             ["UIRecognizerController", "手势集合", ],
             ["KeyBoardViewController", "KeyBoardView", ],
             ["TimerViewController", "Timer", ],
             ["ObserveViewController", "Observe", ],
             ["TestViewController", "新想法测试", ],
             ["IOPInvoiceCreateController", "折叠", ],
             ["SystemColorShowController", "SystemColor", ],
            ],
        ]
        return array
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
        var view = NNUpdateVersionView(frame: .zero)
        view.label.text = "发现新版本"
        view.labelOne.text = "V1.2.0"
        view.labelTwo.text = "更新内容:"
        view.labelThree.text = "1.界面改版,新增消息通知\n2.新增充值功能\n3.部分界面优化"

        view.block({ (versionView, idx) in
            DDLog(idx)
        })
        return view
    }()
    
    let updateAPi = NNCheckVersApi()

    // MARK: -lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        createBarItem( .action, isLeft: true) { (sender: AnyObject) in
            UIApplication.shared.openURL(URL(string: "wx.parkingwang.com://")!)
        }
        
        createBarItem( .done, isLeft: false) { (sender: AnyObject) in
            guard let rootViewController = UIApplication.shared.keyWindow?.rootViewController else { return }
            rootViewController.present(self.navController, animated: true, completion: nil)
        }
        
        tableView.rowHeight = 50;
        view.addSubview(tableView)

        setupRfresh()
//        view.getViewLayer()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
                
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated);
//        DDLog("viewWillAppear")

//        let string = "[[\"\\u9655A91D6P\"]]";
//        let obj = JSONSerialization.jsonObjectFromString(string);
//        DDLog(obj)
//        NSObject.printChengfaBiao()
//        tableView.nextResponder(UIWindow.self, isPrint: true)
        
//        let image = UIImage(color: .white)
//        DDLog(image.cgImage)
        
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
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
    
    func requestInfo() {
        NNProgressHUD.showLoading("努力加载中")
        updateAPi.startRequest(success: { (manager, dic) in
            
            guard let data = try? JSONSerialization.data(withJSONObject: dic as Any, options: []) as Data,
            let jsonString: String = String(data: data, encoding: .utf8),
            let string: String = jsonString.replacingOccurrences(of: "\\", with: "")
            else { return }
//            DDLog(string as Any)
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
            updateView.labelOne.text = "v\(model.version ?? "--") (\(releaseDate.substringTo(9)))"
        }
        let isUpdate: Bool = model.version?.compare(UIApplication.appVer, options: .numeric, range: nil, locale: nil) == .orderedDescending
        if isUpdate {
            updateView.show()
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
        let cell = UITableViewCell.dequeueReusableCell(tableView, identifier: "cell1", style: .subtitle);
        cell.textLabel!.font = UIFont.systemFont(ofSize: 15)
        cell.textLabel!.textColor = UIColor.theme;

        cell.textLabel!.font = UIFont.systemFont(ofSize: 13)
        cell.detailTextLabel?.textColor = UIColor.gray;
        cell.accessoryType = .disclosureIndicator;
        
        let itemList = list[indexPath.section][indexPath.row]
        cell.textLabel!.text = itemList[1]
//        cell.textLabel!.text = NSLocalizedString(itemList[1], comment: "")
        cell.textLabel!.text = Bundle.localizedString(forKey: itemList[1])

        cell.detailTextLabel?.text = itemList[0];
        
//        if #available(iOS 10.0, *) {
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
//        }
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

extension ThirdViewController{


}
