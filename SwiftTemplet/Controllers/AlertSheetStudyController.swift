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

@objcMembers class AlertSheetStudyController: UIViewController {

    //MARK: -lazy
    lazy var tableView: UITableView = {
        let view = UITableView(rect: self.view.bounds, style: .grouped, rowHeight: 50)
        view.dataSource = self
        view.delegate = self

        return view
    }()
    
    lazy var list: [(Selector, String)] = {
        return [
            (#selector(showActionSheet), "样式" ),
            (#selector(showActionSheet1), "样式"),
            (#selector(showActionSheet2), "样式"),
            (#selector(showActionSheet3), "样式"),
            (#selector(showActionSheet4), "样式"),
            (#selector(showActionSheet5), "样式"),
            (#selector(showActionSheet6), "样式"),
            (#selector(showAlert), "默认"),
            (#selector(showAlert1), "HFNavigationController自定义"),
            (#selector(showAlertTableView), "tableAlertController自定义"),
            (#selector(showAlertHud), "HFNavigationController自定义"),
            (#selector(showAlertDatePicker), "showAlertDatePicker"),
            (#selector(showAlertContentVC), "showAlertContentVC"),
        ]
    }()
    
//
//    lazy var alertVC: UIAlertController = {
//        let titles = ["Twitter", "Spotify", "Pinterest"]
//        let images: [UIImage] = [
//            UIImage(named:"icon_num1")!.withRenderingMode(.alwaysOriginal),
//            UIImage(named:"icon_num2")!.withRenderingMode(.alwaysOriginal),
//            UIImage(named:"icon_num3")!.withRenderingMode(.alwaysOriginal),
//        ]
//
//        let alertVC = UIAlertController(title: "标题", message: "这是一条提示信息", preferredStyle: .alert)
//        alertVC.addActionTitles(titles) { (alertVC, action) in
//            let actionIdx = alertVC.actions.firstIndex(of: action)
//            DDLog(actionIdx)
//        }
//
//        alertVC.actions.forEach { (action) in
//            guard let actionIdx = alertVC.actions.firstIndex(of: action) else { return }
//            if actionIdx < images.count {
//                let image = images[actionIdx]
//                action.setValue(image.withRenderingMode(.alwaysOriginal), forKey: "image")
//            }
//        }
//        return alertVC
//    }()
    
    // MARK: -HFNavigationController
    let frameCenter = CGRect(x: 30,
                             y: (UIScreen.main.bounds.height - 380)*0.5 - 30,
                             width: UIScreen.main.bounds.width - 60,
                             height: 380)
    
    lazy var textController: NNAlertController = {
        let controller = NNAlertController()
        
        let customView = UIView(frame: .zero)
        customView.backgroundColor = .systemRed
        controller.customView = customView
        return controller
    }()
    
    lazy var navController: HFNavigationController = {
        let controller = HFNavigationController(rootViewController: textController)
        controller.modalTransitionStyle = .crossDissolve
        controller.tapBackViewDismiss = false
        controller.view.layer.cornerRadius = 15
        controller.view.layer.masksToBounds = true
        
        controller.setupDefaultFrame(self.frameCenter)

        return controller;
    }()
    
    
    lazy var hudController: NNAlertController = {
        let controller = NNAlertController()
        
        let hud = UIActivityIndicatorView(style: .gray)
        hud.startAnimating()

        controller.customView = hud
        return controller
    }()
    
    lazy var navHudController: HFNavigationController = {
        let controller = HFNavigationController(rootViewController: hudController)
        controller.modalTransitionStyle = .crossDissolve
        controller.tapBackViewDismiss = false
        controller.view.layer.cornerRadius = 15
        controller.view.layer.masksToBounds = true
        
        controller.setupDefaultFrame(self.frameCenter)

        return controller;
    }()
    
    lazy var tableAlertController: NNAlertTableController = {
        let controller = NNAlertTableController()
        return controller
    }()
    
    lazy var navTableAlertController: HFNavigationController = {
        let controller = HFNavigationController(rootViewController: tableAlertController)
        controller.modalTransitionStyle = .crossDissolve
        controller.tapBackViewDismiss = false
        controller.view.layer.cornerRadius = 15
        controller.view.layer.masksToBounds = true
        
        
        let frame = CGRect(x: 30,
                           y: (UIScreen.main.bounds.height - 470)*0.5 - 30,
                        width: UIScreen.main.bounds.width - 60,
                        height: 470)
        controller.setupDefaultFrame(frame)
        return controller;
    }()
    
    // MARK: -lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        view.backgroundColor = .white
        
        navigationItem.rightBarButtonItems = [("Show", #selector(showActionSheet)), ("done", #selector(showWebViewVC))].map({
            let btn = UIButton(type: .custom)
            btn.setTitle($0.0, for: .normal)
            btn.addTarget(self, action: $0.1, for: .touchUpInside)
            return UIBarButtonItem(customView: btn)
        })
            
        view.addSubview(tableView)
    }
    

    @objc func showActionSheet(){
        let tuples: [(String ,UIImage, Int)] = [
            ("Twitter", UIImage(named:"icon_num1")!.withRenderingMode(.alwaysOriginal), 0),
            ("Spotify", UIImage(named:"icon_num2")!.withRenderingMode(.alwaysOriginal), 1),
            ("Pinterest", UIImage(named:"icon_num3")!.withRenderingMode(.alwaysOriginal), 0),
        ]
              
        let alertVC = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
        tuples.forEach { (tuple) in
            let action = UIAlertAction(title: tuple.0, style: .default, handler: nil)
            // 为这个动作添加一个 icon
            action.setValue(tuple.1, forKey: "image")
            action.setValue(NSNumber(booleanLiteral: tuple.2 == 1), forKey: "checked")
            
            alertVC.addAction(action)
        }
        alertVC.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        present(alertVC, animated: true, completion: nil)
    }
    
    @objc func showActionSheet1(){
//        alertVC.view.getViewLayer()
//        present(alertVC, animated: true, completion: nil)
        let tuples: [(String ,UIImage, Int)] = [
            ("Twitter", UIImage(named:"icon_num1")!.withRenderingMode(.alwaysOriginal), 0),
            ("Spotify", UIImage(named:"icon_num2")!.withRenderingMode(.alwaysOriginal), 0),
            ("Pinterest", UIImage(named:"icon_num3")!.withRenderingMode(.alwaysOriginal), 1),
        ]
        let titles = tuples.map { $0.0 }

        let alertVC = UIAlertController(title: "标题", message: "这是一条提示信息", preferredStyle: .alert)
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
    
    @objc func showActionSheet2(){
        let alertVC = UIAlertController(title: "\n\n\n\n\n\n", message: nil, preferredStyle: .actionSheet)

        let margin: CGFloat = 10.0
        let rect = CGRect(x: margin, y: margin, width: alertVC.view.bounds.size.width - margin * 4.0, height: 120)
        let customView = UIView(frame: rect)

        customView.backgroundColor = .green
        alertVC.view.addSubview(customView)

        let somethingAction = UIAlertAction(title: "Something", style: .default, handler: {(alert: UIAlertAction!) in print("something")})

        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: {(alert: UIAlertAction!) in print("cancel")})

        alertVC.addAction(somethingAction)
        alertVC.addAction(cancelAction)

        DispatchQueue.main.async {
            self.present(alertVC, animated: true, completion:{})
        }
        alertVC.view.getViewLayer()
    }
    
    @objc func showActionSheet3(){
        let message = "我试图解决UIAlertController的局限性，但是无论如何管理，它都不够好。如果您仍在为此苦苦挣扎，那么我创建了 一个库 可能会有所帮助。它使您可以创建具有一系列内置类型的自定义工作表。也可以扩展和重新设置样式。我试图解决UIAlertController的局限性，但是无论如何管理，它都不够好。如果您仍在为此苦苦挣扎，那么我创建了 一个库 可能会有所帮助。它使您可以创建具有一系列内置类型的自定义工作表。也可以扩展和重新设置样式。"
        let alertVC = UIAlertController(title: "Translation Language",
                                        message: "我试图解决UIAlertController的局限性",
                                        preferredStyle: .actionSheet)
            .addActionTitles()
            
            
        let contentView = UILabel().then({
            $0.numberOfLines = 0
            $0.text = message
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
        
        alertVC.setContent(view: bgView, height: 300, inset: .zero)
            .present()
    }
    
    @objc func showActionSheet4(){
        let message = """
        /// Create new alert view controller.
        """;
        
        let contentView = UIImageView(image: UIImage(named: "Skull.jpg"))

        UIAlertController(title: "Select date", message: message, preferredStyle: .actionSheet)
            .addActionTitles()
            .setContent(view: contentView, height: 300)
            .present()
        
//        UIAlertController(title: "Select date", message: message, preferredStyle: .actionSheet)
//            .do { (sender) in
//                sender.addActionTitles()
//                sender.setContent(view: contentView, height: 300)
//                sender.present()
//            }
    }
    
    @objc func showActionSheet5(){
        let message = "我试图解决UIAlertController的局限性。"
        
        let sender = UIImageView(image: UIImage(named: "Skull.jpg"))

        UIAlertController(title: "请选择", message: message, preferredStyle: .alert)
            .addActionTitles()
            .setContent(view: sender, height: 300)
            .present()
        
    }
    
    @objc func showActionSheet6(){
        var list = Array.init(count: 15) { "item_\($0)" }
        list.append(kTitleCancell)
        UIAlertController.createSheet("请选择", message: "-", items: list) { ( alertVC, action) in
            if action.title != kTitleCancell {
                alertVC.message = "已选择:\(action.title ?? "")"
            }
        }.present()
    }

    
    @objc func showAlert() {
        let message = "我试图解决UIAlertController的局限性，但是无论如何管理，它都不够好。如果您仍在为此苦苦挣扎，那么我创建了 一个库 可能会有所帮助。它使您可以创建具有一系列内置类型的自定义工作表。也可以扩展和重新设置样式。我试图解决UIAlertController的局限性，但是无论如何管理，它都不够好。如果您仍在为此苦苦挣扎，那么我创建了 一个库 可能会有所帮助。它使您可以创建具有一系列内置类型的自定义工作表。也可以扩展和重新设置样式。"
        let alertVC = UIAlertController(title: "Translation Language",
                                        message: message,
                                        preferredStyle: .alert)

        var top: CGFloat = alertVC.title == nil ? 0.0 : 45
        if let message = alertVC.message {
            let messageSize = message.size(with: kScreenWidth - 88, font: UIFont.systemFont(ofSize:16))

            top += messageSize.height
        }
        
        let inset = UIEdgeInsetsMake(top + 60, 16, 8, 16)
//        alertVC.addCustomView(UIView.self, height: 200, inset: inset, block: { (sender) in
//            sender.backgroundColor = .systemBlue
//        })

        alertVC.addAction(UIAlertAction(title: "sure", style: .default, handler: nil))
        alertVC.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        present(alertVC, animated: true, completion: nil)

        alertVC.view.getViewLayer()
    }
    
    @objc func showAlert1(){
        navController.present()
    }
    
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
        /// Create new alert view controller.
        """;

        let alertVC = UIAlertController(title: "Select color", message: message, preferredStyle: .actionSheet)
            .addActionTitles()
        let datePicker = DatePickerController(mode: .dateAndTime) { (date) in
            DDLog(date)
        }
        alertVC.setContent(vc: datePicker, height: 218)
        alertVC.present()
    }
    
    @objc func showAlertContentVC() {
        let message = """
        /// Create new alert view controller.
        """;

        let alertVC = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
            .addActionTitles()
        
//        alertVC.setContent(vc: ThirdViewController(), height: 300)
        alertVC.setContent(vc: UINavigationController(rootViewController: ThirdViewController()), height: 300)
        alertVC.present()
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
        let cell = UITableViewCell.dequeueReusableCell(tableView, identifier: "cell1", style: .subtitle);
        cell.textLabel!.font = UIFont.systemFont(ofSize: 15)
        cell.textLabel!.textColor = UIColor.theme;

        cell.textLabel!.font = UIFont.systemFont(ofSize: 13)
        cell.detailTextLabel?.textColor = UIColor.gray;
        cell.accessoryType = .disclosureIndicator;
        
        let tuple = list[indexPath.row]
        cell.textLabel!.text = tuple.1

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


final class DatePickerController: UIViewController {
        
    fileprivate var action: ((Date) -> Void)?
    
    private(set) lazy var datePicker: UIDatePicker = { [unowned self] in
        $0.addTarget(self, action: #selector(actionForDatePicker), for: .valueChanged)
        return $0
    }(UIDatePicker())
    
    
    convenience init(mode: UIDatePicker.Mode, action: ((Date) -> Void)? = nil) {
        self.init()
        datePicker.datePickerMode = mode
        datePicker.date = Date()
//        datePicker.minimumDate = minimumDate
//        datePicker.maximumDate = maximumDate
        self.action = action
    }
    
    deinit {
        DDLog("has deinitialized")
    }
    
//    override func loadView() {
//        view = datePicker
//    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(datePicker)
    }
    
//    override func viewDidLayoutSubviews() {
//        super.viewDidLayoutSubviews()
//        datePicker.frame = view.bounds
//    }
    
    @objc func actionForDatePicker() {
        action?(datePicker.date)
    }
}



class CustomAlertController: UIViewController {
    
    var edge = UIEdgeInsetsMake(0, 0, 0, 0)
    
    var size = CGSize(width: kScreenWidth - 60, height: 216)

    private(set) lazy var datePicker: UIDatePicker = { [unowned self] in
        $0.backgroundColor = .white
        $0.addTarget(self, action: #selector(actionForDatePicker), for: .valueChanged)
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
    
    @objc func actionForDatePicker() {
        DDLog(datePicker.date)
    }
}
