//
//  AlertSheetStudyController.swift
//  SwiftTemplet
//
//  Created by Bin Shang on 2020/7/31.
//  Copyright © 2020 BN. All rights reserved.
//

import UIKit
import SwiftExpand
import HFNavigationController
import Then

import RxCocoa


@objcMembers class AlertSheetStudyController: UIViewController {

    //MARK: -lazy
    lazy var tableView: UITableView = {
        let view = UITableView(rect: self.view.bounds, style: .grouped, rowHeight: 60)
        view.dataSource = self
        view.delegate = self

        return view
    }()
    
    lazy var datePicker: UIDatePicker = {
        $0.date = Date()
        if #available(iOS 13.4, *) {
            $0.preferredDatePickerStyle = .wheels
        }
        
//        $0.minimumDate = minimumDate
//        $0.maximumDate = maximumDate
        $0.backgroundColor = .clear
        $0.addActionHandler { sender in
            DDLog(sender.date)
        }
        return $0
    }(UIDatePicker())
    
    
    var preferredStyle: UIAlertController.Style = .alert
    
    
    lazy var list: [(Selector, String)] = {
        return [
            (#selector(showActionSheet), "✔️样式" ),
            (#selector(showActionSheet3), "自定位视图"),
            (#selector(showActionSheet4), "图片展示"),
            (#selector(showActionSheet5), "长列表"),
            (#selector(showActionSheet7), "action自定义"),
            
//            (#selector(showAlert), "默认"),
            (#selector(showAlert1), "HFNavigationController自定义"),
            (#selector(showAlertTableView), "tableAlertController自定义"),
            (#selector(showAlertHud), "HFNavigationController自定义"),
            (#selector(showAlertDatePicker), "showAlertDatePicker"),
            (#selector(showAlertLoading), "Loading"),
            
            (#selector(showAlertContentVC), "嵌套导航"),
            (#selector(showAlertExamineApproved), "showAlertTextView"),
            (#selector(showAlertExamineRejected), "showAlertTextView1"),
            (#selector(showAlertAgreement), "showAlertAgreement"),
            
        ]
    }()
    
    // MARK: -HFNavigationController
    let frameCenter = CGRect(x: 30,
                             y: (UIScreen.main.bounds.height - 380)*0.5 - 30,
                             width: UIScreen.main.bounds.width - 60,
                             height: 380)
    
    lazy var customVc: NNAlertController = {
        let vc = NNAlertController()
        
        let customView = UIView(frame: .zero)
        customView.backgroundColor = .systemRed
        vc.customView = customView
        return vc
    }()
    
    lazy var navController: HFNavigationController = {
        let vc = HFNavigationController(rootViewController: customVc)
        vc.modalTransitionStyle = .crossDissolve
        vc.tapBackViewDismiss = false
        vc.view.layer.cornerRadius = 15
        vc.view.layer.masksToBounds = true
        
        vc.setupDefaultFrame(self.frameCenter)
        return vc
    }()
    
    
    lazy var hudController: NNAlertController = {
        let vc = NNAlertController()
        
        let hud = UIActivityIndicatorView(style: .gray)
        hud.startAnimating()

        vc.customView = hud
        return vc
    }()
    
    lazy var navHudController: HFNavigationController = {
        let vc = HFNavigationController(rootViewController: hudController)
        vc.modalTransitionStyle = .crossDissolve
        vc.tapBackViewDismiss = false
        vc.view.layer.cornerRadius = 15
        vc.view.layer.masksToBounds = true
        
        return vc
    }()
    
    lazy var tableAlertController: NNAlertTableController = {
        let vc = NNAlertTableController()
        return vc
    }()
    
    lazy var navTableAlertController: HFNavigationController = {
        let vc = HFNavigationController(rootViewController: tableAlertController)
        vc.modalTransitionStyle = .crossDissolve
        vc.tapBackViewDismiss = false
        vc.view.layer.cornerRadius = 15
        vc.view.layer.masksToBounds = true

        let frame = CGRect(x: 30,
                           y: (UIScreen.main.bounds.height - 470)*0.5 - 30,
                        width: UIScreen.main.bounds.width - 60,
                        height: 470)
        vc.setupDefaultFrame(frame)
        return vc
    }()
    
    // MARK: -lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        edgesForExtendedLayout = []
        view.backgroundColor = .white
        
        navigationItem.rightBarButtonItems = [("change", #selector(showActionSheetOrAlert(_:))),
                                              ("done", #selector(showWebViewVC))].map({
            let btn = UIButton(type: .custom)
            btn.setTitle($0.0, for: .normal)
            btn.addTarget(self, action: $0.1, for: .touchUpInside)
            return UIBarButtonItem(customView: btn)
        })
            
        view.addSubview(tableView)
    }
    
    @objc func showActionSheetOrAlert(_ sender: UIButton){
        sender.isSelected.toggle()
        preferredStyle = sender.isSelected ? .actionSheet : .alert
    }

    @objc func showActionSheet(){
        let tuples: [(String ,UIImage, Int)] = [
            ("Twitter", UIImage(named:"icon_num1")!.withRenderingMode(.alwaysOriginal), 0),
            ("Spotify", UIImage(named:"icon_num2")!.withRenderingMode(.alwaysOriginal), 0),
            ("Pinterest", UIImage(named:"icon_num3")!.withRenderingMode(.alwaysOriginal), 1),
        ]
        let titles = tuples.map { $0.0 }

        let alertVC = UIAlertController(title: "标题", message: "这是一条提示信息", preferredStyle: preferredStyle)
            .addActionTitles(titles) { (alertVC, action) in
                let actionIdx = alertVC.actions.firstIndex(of: action)
                DDLog(actionIdx)
            }

        alertVC.actions.forEach { (action) in
            guard let idx = alertVC.actions.firstIndex(of: action) else { return }
            let tuple = tuples[idx]
            action.setValue(tuple.1, forKey: "image")
            action.setValue(NSNumber(booleanLiteral: tuple.2 == 1), forKey: "checked")
        }
        alertVC.present()
    }
    
    
    @objc func showActionSheet3(){
        let text = "我试图解决UIAlertController的局限性，但是无论如何管理，它都不够好。如果您仍在为此苦苦挣扎，那么我创建了 一个库 可能会有所帮助。它使您可以创建具有一系列内置类型的自定义工作表。也可以扩展和重新设置样式。我试图解决UIAlertController的局限性，但是无论如何管理，它都不够好。如果您仍在为此苦苦挣扎，那么我创建了 一个库 可能会有所帮助。它使您可以创建具有一系列内置类型的自定义工作表。也可以扩展和重新设置样式。"
        
        let contentView = UILabel().then({
            $0.numberOfLines = 0
            $0.text = text
            $0.font = UIFont.systemFont(ofSize: 15)
            $0.backgroundColor = .systemGreen
        })
                    
        let bgView = UIView().then({
            $0.backgroundColor = .red
        })
        bgView.addSubview(contentView)
        
        let inset: UIEdgeInsets = UIEdgeInsets(top: 8, left: 15, bottom: 8, right: 15)
        contentView.topAnchor.constraint(equalTo: bgView.topAnchor, constant: inset.top).isActive = true
        contentView.rightAnchor.constraint(equalTo: bgView.rightAnchor, constant: -inset.right).isActive = true
        contentView.leftAnchor.constraint(equalTo: bgView.leftAnchor, constant: inset.left).isActive = true
        contentView.bottomAnchor.constraint(equalTo: bgView.bottomAnchor, constant: -inset.bottom).isActive = true
        contentView.translatesAutoresizingMaskIntoConstraints = false
        
        //
        UIAlertController(title: "Translation Language", message: "我试图解决UIAlertController的局限性", preferredStyle: preferredStyle)
            .addActionTitles()
            .setContent(view: bgView, height: 300, inset: .zero)
            .present()
    }
    
    @objc func showActionSheet4(){
        let message = """
        /// 我试图解决UIAlertController的局限性。
        """;
        
        let contentView = UIImageView(image: UIImage(named: "Skull.jpg"))
        contentView.contentMode = .scaleAspectFit

        UIAlertController(title: "展示图片", message: message, preferredStyle: preferredStyle)
            .addActionTitles()
            .setContent(view: contentView, height: 300)
            .present()
    }
    
    @objc func showActionSheet5(){
        var list = Array.init(count: 15) { "item_\($0)" }
        list.append(kTitleCancell)
        UIAlertController.createSheet("请选择", message: "-", items: list) { ( alertVC, action) in
            if action.title != kTitleCancell {
                alertVC.message = "已选择:\(action.title ?? "")"
            }
        }.present()
    }
    
    @objc func showActionSheet7(){
        var list = Array.init(count: 20) { "item_\($0)" }
        list.append(kTitleCancell)
        
        let alertVC = UIAlertController(title: "请选择", message: "UIAlertAction 自定义 ", preferredStyle: preferredStyle)
        
        list.map { e in
            if e == kTitleCancell {
                let action = UIAlertAction(title: e, style: .cancel, handler: { action in
                    DDLog(action.title)
                })
                return action
            }
            
            let action = UIAlertAction(title: "", style: .default, handler: nil)
                            
            let contentView = NNAlertActionView()
            contentView.imageView.image = UIImage(named: "Skull.jpg")
            contentView.textLabel.text = e
            contentView.detailTextLabel.text = "detailTextLabel"
            
//            if #available(iOS 13.0, *) {
//                contentView.accessoryView = UIImageView(image: UIImage.chevron_right ?? UIImage(color: .red, size: CGSize(width: 20, height: 20)))
//            }
            
            contentView.addGestureTap { reco in
                action.setValue(NSNumber(booleanLiteral: true), forKey: "checked")
                alertVC.dismiss(animated: true, completion: nil)
                DDLog(e)
            }
            action.setContent(view: contentView, inset: .zero)

            return action
        }.forEach {
            alertVC.addAction($0)
        }
        alertVC.present()
    }

    
    @objc func showAlert1(){
        navController.present()
    }
    
//    @objc func showAlert1(){
//        navController.modalTransitionStyle = .crossDissolve
//        navController.present(false)
//    }
    
    @objc func showAlertTableView(){
        navTableAlertController.present()
    }
    
    @objc func showAlertHud(){
        let myAlert = CustomAlertController()
        myAlert.modalPresentationStyle = .overCurrentContext
        myAlert.modalTransitionStyle = .crossDissolve
        present(myAlert, animated: true, completion: nil)
    }
    
    @objc func showAlertDatePicker() {
        let message = """
        /// Create new alert view vc.
        """;

        UIAlertController(title: "Select color", message: message, preferredStyle: preferredStyle)
            .addActionTitles()
            .setContent(view: datePicker, height: 218, inset: .zero)
            .present()
    }
    
    @objc func showAlertContentVC() {
        let message = """
        /// 弹窗内嵌套了一个导航控制器
        """;

        UIAlertController(title: "嵌套导航", message: message, preferredStyle: preferredStyle)
            .addActionTitles([kTitleCancell])
//          .setContent(vc: ThirdViewController(), height: 300)
            .setContent(vc: UINavigationController(rootViewController: ThirdViewController()), height: 300)
            .present()
    }
    
    @objc func showAlertExamineApproved() {
        let textView = UITextView()

        let message = "备注：（非必填）"

        UIAlertController(title: "审核通过", message: message, preferredStyle: preferredStyle)
            .addActionTitles([kTitleCancell, "确认通过"]) { vc, action in
                textView.resignFirstResponder()
                DDLog(action.title)
                DDLog(textView.text)
            }
            .setMessageParaStyle(NSMutableParagraphStyle().alignmentChain(.left))
            .setContent(view: textView, height: 80, inset: UIEdgeInsets(top: 0, left: 15, bottom: 8, right: 15))
            .present()
    }
    
    ///协议弹窗
    @objc func showAlertAgreement() {
        let title = "用户协议和隐私政策"

        let linkDic = ["《用户协议》": "http://api.irainone.com/app/iop/register.html",
                       "《隐私政策》": "http://api.irainone.com/app/iop/register.html",]
        let string = "\t用户协议和隐私政策请您务必审值阅读、充分理解 “用户协议” 和 ”隐私政策” 各项条款，包括但不限于：为了向您提供即时通讯、内容分享等服务，我们需要收集您的设备信息、操作日志等个人信息。\n\t您可阅读《用户协议》和《隐私政策》了解详细信息。如果您同意，请点击 “同意” 开始接受我们的服务;"
        
        let attributedText = NSAttributedString.create(string, textTaps: Array(linkDic.keys))
        
        let alertVC = UIAlertController(title: title, message: nil, preferredStyle: preferredStyle)
            .addActionTitles([kTitleCancell, "同意"]) { vc, action in
                DDLog(action.title)
            }
        
        alertVC.setValue(attributedText, forKey: kAlertMessage)
        alertVC.messageLabel?.addGestureTap { reco in
            reco.didTapLabelAttributedText(linkDic) { text, url in
                DDLog("\(text), \(url ?? "_")")
            }
        }
        
        alertVC.changeWidth(UIScreen.main.bounds.width * 0.8)
        alertVC.present()
    }
    
    @objc func showAlertExamineRejected() {
        let textView = UITextView()

        let message = "*原因："
        let alertVC = UIAlertController(title: "审核驳回", message: message, preferredStyle: preferredStyle)
            .addActionTitles([kTitleCancell, "确认驳回"]) { vc, action in
                textView.resignFirstResponder()
                DDLog(action.title)
                DDLog(textView.text)
            }
        
        let attrMsg = message.matt
            .fontChain(UIFont.systemFont(ofSize: 15))
            .foregroundColorChain(UIColor.gray)
            .paraStyleChain(.left)
            .appendPrefix(font: UIFont.systemFont(ofSize: 15))
        alertVC.setValue(attrMsg, forKey: kAlertMessage)

        alertVC.setContent(view: textView, height: 80, inset: UIEdgeInsets(top: 0, left: 15, bottom: 10, right: 15))
        alertVC.present()
    }
    
    
    @objc func showAlertLoading() {
        
        if #available(iOS 13.0, *) {
            let message = "加载中"
            let alertVC = UIAlertController(title: nil, message: "加载中...", preferredStyle: preferredStyle)
    //            .addActionTitles([kTitleCancell, "确认驳回"]) { vc, action in
    //                textView.resignFirstResponder()
    //                DDLog(action.title)
    //                DDLog(textView.text)
    //            }

            let indicator = UIActivityIndicatorView(style: .large)
            indicator.startAnimating()
            
            alertVC.setContent(view: indicator, height: 40, inset: UIEdgeInsets(top: 0, left: 15, bottom: 10, right: 15))
//            alertVC.present()
            self.present(alertVC, animated: true, completion: nil)
        }

    }
    
    @objc func showWebViewVC() {
        let agreementVC = NNWebViewController()
        agreementVC.urlString = "https://www.baidu.com/"
        navigationController?.pushViewController(agreementVC, animated: true)
    }
        
}


extension AlertSheetStudyController: UITableViewDataSource, UITableViewDelegate{

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return list.count;
    };
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return tableView.rowHeight
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(for: UITableViewCell.self, identifier: "subtitle", style: .subtitle)
        cell.textLabel?.font = UIFont.systemFont(ofSize: 15)
        cell.textLabel?.textColor = UIColor.theme;

        cell.textLabel?.font = UIFont.systemFont(ofSize: 13)
        cell.detailTextLabel?.textColor = UIColor.gray;
        cell.accessoryType = .disclosureIndicator;
        
        let tuple = list[indexPath.row]
        cell.textLabel?.text = tuple.1

        cell.detailTextLabel?.text = "\(tuple.0)"
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: false)
        let tuple = list[indexPath.row]
        DDLog(tuple);
        self.perform(tuple.0, with: nil, afterDelay: 0.1)

//        DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
//            self.perform(tuple.0, with: nil, afterDelay: 0.1)
//        }
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 10;
    }

//    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
//        return UIView();
//    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 0.01;
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        let label = UILabel(frame: .zero);
        return label;
    }
    
}


extension AlertSheetStudyController: UIPickerViewDelegate, UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
       return 10
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return "\(row)"
    }
}



class CustomAlertController: UIViewController {
    
    var edge = UIEdgeInsetsMake(0, 0, 0, 0)
    
    var size = CGSize(width: kScreenWidth - 60, height: 216)

    fileprivate var action: ((Date) -> Void)?

    private(set) lazy var datePicker: UIDatePicker = {
        $0.date = Date()
        if #available(iOS 13.4, *) {
            $0.preferredDatePickerStyle = .wheels
        }
        $0.backgroundColor = .white

//        $0.minimumDate = minimumDate
//        $0.maximumDate = maximumDate
        $0.addTarget(self, action: #selector(handleActionDatePicker(_:)), for: .valueChanged)
        return $0
    }(UIDatePicker())
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        datePicker.frame = CGRectMake(0, 0, size.width, size.height)
        datePicker.center = view.center
        view.addSubview(datePicker)
        
        view.backgroundColor = UIColor.gray.withAlphaComponent(0.4)
        view.addGestureTap { (reco) in
            if let _ = self.presentingViewController {
                self.dismiss(animated: true, completion: nil)
            }
        }
//        let blurFx = UIBlurEffect(style: .light)
//        let blurFxView = UIVisualEffectView(effect: blurFx)
//        blurFxView.frame = view.bounds
//        blurFxView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
//        view.insertSubview(blurFxView, at: 0)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
    }
    
    @objc func handleActionDatePicker(_ sender: UIDatePicker) {
        action?(sender.date)
    }
}


extension AlertSheetStudyController: UITextViewDelegate{
    func textView(_ textView: UITextView, shouldInteractWith URL: URL, in characterRange: NSRange) -> Bool {
        DDLog(URL.absoluteString)
        if URL.absoluteString.contains("_") == true {
            guard let urlString = URL.absoluteString.components(separatedBy: "_").last else { return false}
            UIApplication.openURLString(urlString)
        }
        return true
    }
}

//fileprivate extension UIAlertController{
//
//    /// 改变宽度
//    @discardableResult
//    func changeWidth(_ newWidth: CGFloat = UIScreen.main.bounds.width * 0.8) -> Self {
//        if preferredStyle != .alert {
//            return self
//        }
////        let newWidth = UIScreen.main.bounds.width * 0.90 - 270
//        // Filtering width constraints of alert base view width
//        let widthConstraints = view.constraints.filter({ return $0.firstAttribute == .width})
//        view.removeConstraints(widthConstraints)
//        // Here you can enter any width that you want
////        let newWidth = UIScreen.main.bounds.width * 0.90
//        // Adding constraint for alert base view
//        let widthConstraint = NSLayoutConstraint(item: view as Any,
//                                                 attribute: .width,
//                                                 relatedBy: .equal,
//                                                 toItem: nil,
//                                                 attribute: .notAnAttribute,
//                                                 multiplier: 1,
//                                                 constant: newWidth)
//        view.addConstraint(widthConstraint)
//        let firstContainer = view.subviews[0]
//        // Finding first child width constraint
//        let constraint = firstContainer.constraints.filter({ return $0.firstAttribute == .width && $0.secondItem == nil })
//        firstContainer.removeConstraints(constraint)
//        // And replacing with new constraint equal to view width constraint that we setup earlier
//        view.addConstraint(NSLayoutConstraint(item: firstContainer,
//                                                    attribute: .width,
//                                                    relatedBy: .equal,
//                                                    toItem: view,
//                                                    attribute: .width,
//                                                    multiplier: 1.0,
//                                                    constant: 0))
//        // Same for the second child with width constraint with 998 priority
//        let innerBackground = firstContainer.subviews[0]
//        let innerConstraints = innerBackground.constraints.filter({ return $0.firstAttribute == .width && $0.secondItem == nil })
//        innerBackground.removeConstraints(innerConstraints)
//        firstContainer.addConstraint(NSLayoutConstraint(item: innerBackground,
//                                                        attribute: .width,
//                                                        relatedBy: .equal,
//                                                        toItem: firstContainer,
//                                                        attribute: .width,
//                                                        multiplier: 1.0,
//                                                        constant: 0))
//        return self
//    }
//}
//
