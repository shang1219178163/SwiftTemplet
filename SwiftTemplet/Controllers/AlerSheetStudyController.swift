//
//  AlerSheetStudyController.swift
//  SwiftTemplet
//
//  Created by Bin Shang on 2020/7/31.
//  Copyright © 2020 BN. All rights reserved.
//

import UIKit
import SwiftExpand
import HFNavigationController


@objcMembers class AlerSheetStudyController: UIViewController {

    //MARK: -lazy
    lazy var tableView: UITableView = {
        let view = UITableView(rect: self.view.bounds, style: .grouped, rowHeight: 50)
        view.dataSource = self
        view.delegate = self

        return view
    }()
    
    lazy var list: [[[String]]] = {
        let array: [[[String]]] = [
            [["AlertSheetStyle", "样式", ],
             ["AlertSheetStyle1", "样式", ],
             ["AlertSheetStyle2", "样式", ],
             ["AlertSheetStyle3", "样式", ],
             ["AlertSheetStyle4", "样式", ],
             ["AlertSheetStyle5", "样式", ],
             ["AlertSheetStyle6", "样式", ],
             ["AlertStyle", "默认", ],
             ["AlertStyle1", "HFNavigationController自定义", ],
             ["AlertTable", "tableAlertController自定义", ],
             ["AlertStyleHud", "HFNavigationController自定义", ],

             ],
        ]
        return array
    }()
    
    lazy var alertVC: UIAlertController = {
        let titles = ["Twitter", "Spotify", "Pinterest"]
        let images: [UIImage] = [UIImage(named:"icon_num1")!.withRenderingMode(.alwaysOriginal),
                      UIImage(named:"icon_num2")!.withRenderingMode(.alwaysOriginal),
                      UIImage(named:"icon_num3")!.withRenderingMode(.alwaysOriginal),
        ]
        
        let alertVC = UIAlertController(title: "标题", message: "这是一条提示信息", preferredStyle: .alert)
        alertVC.addActionTitles(titles) { (alertVC, action) in
            let actionIdx = alertVC.actions.firstIndex(of: action)
            DDLog(actionIdx as Any)
        }

        alertVC.actions.forEach { (action) in
            guard let actionIdx = alertVC.actions.firstIndex(of: action) else { return }
            if actionIdx < images.count {
                let image = images[actionIdx]
                action.setValue(image.withRenderingMode(.alwaysOriginal), forKey: "image")
            }
        }
        return alertVC
    }()
    
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
        
        let rect = CGRect(x: 0, y: 0, width: 60, height: 30)
        
        let btn = UIButton.create(rect, title: "Show", textColor: .white, backgroundColor: .theme)
        btn.addTarget(self, action: #selector(showActionSheet), for: .touchUpInside)
        
        let btn1 = UIButton.create(rect, title: "done", textColor: .white, backgroundColor: .theme)
        btn1.addTarget(self, action: #selector(showActionSheet1), for: .touchUpInside)
        navigationItem.rightBarButtonItems = [UIBarButtonItem(customView: btn), UIBarButtonItem(customView: btn1)]
        
        view.addSubview(tableView)
    }
    

    @objc func showActionSheet(){
      let alertVC = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
      
      let twitterAction = UIAlertAction(title: "Twitter", style: .default, handler: nil)
      // 为这个动作添加一个 icon
        twitterAction.setValue(UIImage(named:"icon_num1")?.withRenderingMode(.alwaysOriginal), forKey: "image")
      
      let spotifyAction = UIAlertAction(title: "Spotify", style: .default, handler: nil)
      spotifyAction.setValue(UIImage(named:"icon_num2")?.withRenderingMode(.alwaysOriginal), forKey: "image")
      
      let pinterestAction = UIAlertAction(title: "Pinterest", style: .default, handler: nil)
      pinterestAction.setValue(UIImage(named:"icon_num3")?.withRenderingMode(.alwaysOriginal), forKey: "image")
        pinterestAction.setValue(UIImage(named:"icon_num3")?.withRenderingMode(.alwaysOriginal), forKey: "image")
        pinterestAction.setValue(NSNumber(booleanLiteral: true), forKey: "checked")
        
      alertVC.addAction(twitterAction)
      alertVC.addAction(spotifyAction)
      alertVC.addAction(pinterestAction)
      alertVC.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
      
      self.present(alertVC, animated: true, completion: nil)
    }
    
    @objc func showActionSheet1(){
//        alertVC.view.getViewLayer()
      self.present(alertVC, animated: true, completion: nil)
    }
    
    func showActionSheet2(){
        let alertController = UIAlertController(title: "\n\n\n\n\n\n", message: nil, preferredStyle: .actionSheet)

        let margin:CGFloat = 10.0
        let rect = CGRect(x: margin, y: margin, width: alertController.view.bounds.size.width - margin * 4.0, height: 120)
        let customView = UIView(frame: rect)

        customView.backgroundColor = .green
        alertController.view.addSubview(customView)

        let somethingAction = UIAlertAction(title: "Something", style: .default, handler: {(alert: UIAlertAction!) in print("something")})

        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: {(alert: UIAlertAction!) in print("cancel")})

        alertController.addAction(somethingAction)
        alertController.addAction(cancelAction)

        DispatchQueue.main.async {
            self.present(alertController, animated: true, completion:{})
        }
        alertController.view.getViewLayer()

    }
    
    func showActionSheet3(){
        let message = "我试图解决UIAlertController的局限性，但是无论如何管理，它都不够好。如果您仍在为此苦苦挣扎，那么我创建了 一个库 可能会有所帮助。它使您可以创建具有一系列内置类型的自定义工作表。也可以扩展和重新设置样式。我试图解决UIAlertController的局限性，但是无论如何管理，它都不够好。如果您仍在为此苦苦挣扎，那么我创建了 一个库 可能会有所帮助。它使您可以创建具有一系列内置类型的自定义工作表。也可以扩展和重新设置样式。"
        let alertController = UIAlertController(title: "Translation Language",
                                                message: message,
                                                preferredStyle: .actionSheet)

        var top: CGFloat = alertController.title == nil ? 0.0 : 45
        if let message = alertController.message {
            let messageSize = message.size(with: kScreenWidth - 52, font: UIFont.systemFont(ofSize:15))
//            let attDic = [NSAttributedString.Key.font: UIFont.systemFont(ofSize:15),];
//            var size = message.boundingRect(with: CGSize(width: kScreenWidth - 52, height: CGFloat(MAXFLOAT)),
//                                            options: [.usesLineFragmentOrigin, .usesFontLeading],
//                                            attributes: attDic, context: nil).size;
//            size.width = ceil(size.width);
//            size.height = ceil(size.height);
//            let messageSize = CGSize(width: size.width, height: size.height)
            
            top += messageSize.height
        }
        
        let inset = UIEdgeInsetsMake(top + 3, 10, 75, 10)
        alertController.addCustomView(UIView.self, height: 200, inset: inset, block: { (sender) in
            sender.backgroundColor = .systemBlue
        })

        alertController.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        present(alertController, animated: true, completion: nil)

//        alertController.view.getViewLayer()
    }
    
    func showActionSheet4(){
        let alertVC = UIAlertController.createAlertImage("提示", image: "Skull.jpg", contentMode: .scaleToFill, count: 17, actionTitles: [kTitleKnow]) { (alertVC, action) in
            DDLog(action.title as Any)
        }
        self.present(alertVC, animated: true, completion: nil)

    }
    
    func showActionSheet5(){
        let title = "Translation Language"
        let message = "我试图解决UIAlertController的局限性，但是无论如何管理，它都不够好。如果您仍在为此苦苦挣扎，那么我创建了 一个库 可能会有所帮助。它使您可以创建具有一系列内置类型的自定义工作表。也可以扩展和重新设置样式。我试图解决UIAlertController的局限性，但是无论如何管理，它都不够好。如果您仍在为此苦苦挣扎，那么我创建了 一个库 可能会有所帮助。它使您可以创建具有一系列内置类型的自定义工作表。也可以扩展和重新设置样式。"

        UIAlertController.showSheet(title,
                                    message: message,
                                    type: UIButton.self,
                                    height: 300,
                                    block: { (sender) in
                                        sender.setBackgroundColor(.systemRed, for: .normal)
                                        sender.setTitle(sender.className(), for: .normal)
                                        sender.setTitleColor(.white, for: .normal)
                                    }) { (alertVC, action) in
            DDLog(action.title as Any)
        }

    }
    
    func showActionSheet6(){
        // Create a custom view for testing...
        let customView = UIView()
        customView.translatesAutoresizingMaskIntoConstraints = false
        customView.backgroundColor = .red

        // Set the custom view to a fixed height. In a real world application, you could use autolayouted content for height constraints
        customView.addConstraint(NSLayoutConstraint(item: customView,
                                                    attribute: .height,
                                                    relatedBy: .equal,
                                                    toItem: nil,
                                                    attribute: .notAnAttribute,
                                                    multiplier: 1,
                                                    constant: 100))

        // Create the alert and show it
        let alertVC = UIAlertController(title: "Alert Title",
                                        customView: customView,
                                        fallbackMessage: "This should be a red rectangle",
                                        preferredStyle: .actionSheet)

        alertVC.addAction(UIAlertAction(title: "Yay!", style: .default, handler: nil))
        alertVC.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))

        self.present(alertVC, animated: true, completion: nil)
        alertVC.view.getViewLayer()

    }

    
    func showAlert() {
        let message = "我试图解决UIAlertController的局限性，但是无论如何管理，它都不够好。如果您仍在为此苦苦挣扎，那么我创建了 一个库 可能会有所帮助。它使您可以创建具有一系列内置类型的自定义工作表。也可以扩展和重新设置样式。我试图解决UIAlertController的局限性，但是无论如何管理，它都不够好。如果您仍在为此苦苦挣扎，那么我创建了 一个库 可能会有所帮助。它使您可以创建具有一系列内置类型的自定义工作表。也可以扩展和重新设置样式。"
        let alertController = UIAlertController(title: "Translation Language",
                                                message: message,
                                                preferredStyle: .alert)

        var top: CGFloat = alertController.title == nil ? 0.0 : 45
        if let message = alertController.message {
            let messageSize = message.size(with: kScreenWidth - 88, font: UIFont.systemFont(ofSize:16))

            top += messageSize.height
        }
        
        let inset = UIEdgeInsetsMake(top + 60, 16, 8, 16)
        alertController.addCustomView(UIView.self, height: 200, inset: inset, block: { (sender) in
            sender.backgroundColor = .systemBlue
        })

        alertController.addAction(UIAlertAction(title: "sure", style: .default, handler: nil))
        alertController.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        present(alertController, animated: true, completion: nil)

        alertController.view.getViewLayer()
    }
    
    func showAlert1(){
        navController.present()
    }
    
    func showAlertTableView(){
        navTableAlertController.present()
    }
    
    func showAlertHud(){
//        navHudController.present()
        UIAlertController.createSheet("title", message: "message", type: UIActivityIndicatorView.self, height: 60) {
            if #available(iOS 13.0, *) {
                $0.style = .large
            } else {
                $0.style = .gray
            }
            $0.startAnimating()
        } handler: { (alertVC, action) in
            DDLog(action.title ?? "-")
        }
        .present()
    }
}


extension AlerSheetStudyController: UITableViewDataSource, UITableViewDelegate{
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

        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: false)
        let itemList = list[indexPath.section][indexPath.row]
//        DDLog(itemList);

        switch itemList[0] {
        case "AlertSheetStyle":
            showActionSheet()
            
        case "AlertSheetStyle1":
            showActionSheet1()
            
        case "AlertSheetStyle2":
            showActionSheet2()
            
        case "AlertSheetStyle3":
            showActionSheet3()
            
        case "AlertSheetStyle4":
            showActionSheet4()
            
        case "AlertSheetStyle5":
            showActionSheet5()
            
        case "AlertSheetStyle6":
            showActionSheet6()
            
        case "AlertStyle":
            showAlert()
        
        case "AlertStyle1":
            showAlert1()
            
        case "AlertTable":
            showAlertTableView()
            
        case "AlertStyleHud":
            showAlertHud()
            
        default:
            break
        }
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


extension UIView{
    
    /// 寻找子视图
    public func logSubview(type: UIResponder.Type, resursion: Bool) {
        for e in self.subviews.enumerated() {
            if e.element.isKind(of: type) {
                DDLog(e.element)
            }
        }
        
        if resursion == true {
            for e in self.subviews.enumerated() {
                if let tmpView = e.element.findSubview(type: type, resursion: resursion) {
                    DDLog(tmpView)
                }
            }
        }
    }
}
//extension UIAlertController {
//
//    ///添加子视图
//    final func addCustomView<T:UIView>(_ type: T.Type, height: CGFloat, inset: UIEdgeInsets, block: ((T)->Void)?) {
//        let customView = type.init()
//        view.addSubview(customView)
//        customView.translatesAutoresizingMaskIntoConstraints = false
//        customView.topAnchor.constraint(equalTo: view.topAnchor, constant: inset.top).isActive = true
//        customView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -inset.right).isActive = true
//        customView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: inset.left).isActive = true
//        customView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -inset.bottom).isActive = true
//        customView.backgroundColor = .systemGreen
//
//        view.translatesAutoresizingMaskIntoConstraints = false
//        view.heightAnchor.constraint(equalToConstant: height).isActive = true
//        block?(customView)
//    }
//}

extension UIAlertController {

    /// Creates a `UIAlertController` with a custom `UIView` instead the message text.
    /// - Note: In case anything goes wrong during replacing the message string with the custom view, a fallback message will
    /// be used as normal message string.
    ///
    /// - Parameters:
    ///   - title: The title text of the alert controller
    ///   - customView: A `UIView` which will be displayed in place of the message string.
    ///   - fallbackMessage: An optional fallback message string, which will be displayed in case something went wrong with inserting the custom view.
    ///   - preferredStyle: The preferred style of the `UIAlertController`.
    convenience init(title: String?, customView: UIView, fallbackMessage: String?, preferredStyle: UIAlertController.Style) {

        let marker = "__CUSTOM_CONTENT_MARKER__"
        self.init(title: title, message: marker, preferredStyle: preferredStyle)

        // Try to find the message label in the alert controller's view hierarchie
        if let customContentPlaceholder = self.view.findLabel(withText: marker),
            let customContainer = customContentPlaceholder.superview {

            // The message label was found. Add the custom view over it and fix the autolayout...
            customContainer.addSubview(customView)

            customView.translatesAutoresizingMaskIntoConstraints = false
            customContainer.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-[customView]-|", options: [], metrics: nil, views: ["customView": customView]))
            customContainer.addConstraint(NSLayoutConstraint(item: customContentPlaceholder,
                                                             attribute: .top,
                                                             relatedBy: .equal,
                                                             toItem: customView,
                                                             attribute: .top,
                                                             multiplier: 1,
                                                             constant: 0))
            customContainer.addConstraint(NSLayoutConstraint(item: customContentPlaceholder,
                                                             attribute: .height,
                                                             relatedBy: .equal,
                                                             toItem: customView,
                                                             attribute: .height,
                                                             multiplier: 1,
                                                             constant: 0))
            customContentPlaceholder.text = ""
        } else { // In case something fishy is going on, fall back to the standard behaviour and display a fallback message string
            self.message = fallbackMessage
        }
    }
}

private extension UIView {

    /// Searches a `UILabel` with the given text in the view's subviews hierarchy.
    ///
    /// - Parameter text: The label text to search
    /// - Returns: A `UILabel` in the view's subview hierarchy, containing the searched text or `nil` if no `UILabel` was found.
    func findLabel(withText text: String) -> UILabel? {
        if let label = self as? UILabel, label.text == text {
            return label
        }
        for subview in subviews {
            if let found = subview.findLabel(withText: text) {
                return found
            }
        }
        return nil
    }
}
