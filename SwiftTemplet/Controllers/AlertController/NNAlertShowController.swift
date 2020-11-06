//
//  NNAlertShowController.swift
//  SwiftTemplet
//
//  Created by Bin Shang on 2020/4/17.
//  Copyright © 2020 BN. All rights reserved.
//

import UIKit
import SwiftExpand
import HFNavigationController

class NNAlertShowController: UIViewController {

    let frameCenter = CGRect(x: UIScreen.main.bounds.width*0.05,
                             y: UIScreen.main.bounds.height*0.25,
                             width: UIScreen.main.bounds.width*0.9,
                             height: 300)
    
    lazy var textController: NNAlertTextViewController = {
        let controller = NNAlertTextViewController()
//        controller.actionTitles = ["one", "two", "three"]
//        controller.actionTitles = ["one", ]
        controller.actionTitles = ["暂不使用", "同意"]
        controller.delegate = self
        return controller
    }()
    
    lazy var navController: HFNavigationController = {
        let controller = HFNavigationController(rootViewController: textController)
        controller.modalPresentationStyle = .custom
        controller.modalTransitionStyle = .crossDissolve
        controller.transitioningDelegate = controller as UIViewControllerTransitioningDelegate
        
        controller.view.layer.cornerRadius = 18
        controller.view.layer.masksToBounds = true
        
        controller.setupDefaultFrame(self.frameCenter)

        return controller;
    }()
    
    // MARK: -lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        createBarItem( .done, isLeft: false) { (sender: AnyObject) in
//            self.goController("IOPAuthDetailController", obj: nil, objOne: nil)
            guard let rootViewController = UIApplication.shared.keyWindow?.rootViewController else { return }
            rootViewController.present(self.navController, animated: true, completion: nil)
        }
        setupAlertContent()
    }
    

    func setupAlertContent() {
        textController.title = "用户协议和隐私政策"
        let textView = textController.textView

        let tapTexts = ["《用户协议》", "《隐私政策》",];
        let tapUrls = ["", "",];
        let string = "\t用户协议和隐私政策请您务必审值阅读、充分理解 “用户协议” 和 ”隐私政策” 各项条款，包括但不限于：为了向您提供即时通讯、内容分享等服务，我们需要收集您的设备信息、操作日志等个人信息。\n\t您可阅读\(tapTexts[0])和\(tapTexts[1])了解详细信息。如果您同意，请点击 “同意” 开始接受我们的服务;"
        textView.setupUserAgreements(string, tapTexts: tapTexts, tapUrls: tapUrls)
        textView.delegate = self
    }

}

extension NNAlertShowController: UITextViewDelegate{

    func textView(_ textView: UITextView, shouldInteractWith URL: URL, in characterRange: NSRange) -> Bool {
        DDLog(URL.absoluteString)
        if URL.scheme == "" {
            return false
        }
        return true
    }
}

extension NNAlertShowController: NNAlertViewControllerDelegate{
    func alertVC(_ controller: NNAlertTextViewController, sender: UIButton) {
        DDLog(sender.currentTitle, sender.tag)
        switch sender.tag {
        case 0:
            exit(0)
        default:
            controller.dismiss(animated: true, completion: nil)
        }
    }
}
