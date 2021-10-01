//
//  MBProgressHUDDemoController.swift
//  SwiftTemplet
//
//  Created by Bin Shang on 2021/8/28.
//  Copyright © 2021 BN. All rights reserved.
//

import UIKit
import SwiftExpand

import MBProgressHUD

class MBProgressHUDDemoController: UIViewController {

    let list = [UIButton].init(count: 16) {
        let sender = UIButton(type: .custom)
        sender.setTitle("\($0)", for: .normal)
        sender.addTarget(self, action: #selector(handleAction(_:)), for: .touchUpInside)
        sender.tag = $0
        sender.layer.borderWidth = 1
        sender.layer.borderColor = UIColor.gray.cgColor
        return sender
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        edgesForExtendedLayout = []
        view.backgroundColor = .white
        
        navigationItem.rightBarButtonItems = ["hide", "dismiss"].map({
            UIBarButtonItem(obj: $0) { item in
                if item.title == "hide" {
                    ZZProgressHUD.hideHud(delay: 0)
                } else {
                    self.view.hideHud(delay: 0)
                }
            }
        })
        
        list.forEach {
            self.view.addSubview($0)
        }
        
    }
    
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        
        list.updateItemsConstraint(CGRectMake(10, 10, kScreenWidth - 20, 260), sectionInset: EdgeInsets(all: 10))
    }

    
    @objc func handleAction(_ sender: UIButton) {
        let keyWindow: UIWindow = UIApplication.shared.keyWindow ?? UIApplication.shared.windows.first!

        switch sender.tag {
        case 0:
            //显示成功消息
            keyWindow.showSuccess("操作成功")
        case 1:
            //显示失败消息
            keyWindow.showError("操作失败")
        case 2:
            //显示普通消息
            keyWindow.showInfo("这是普通提示消息")
        case 3:
            //显示等待消息
            keyWindow.showLoading("请稍等")
            DDLog(keyWindow.isShowing)
            keyWindow.hideHud(delay: 2)
            
            DispatchQueue.main.after(3) {
                DDLog(keyWindow.isShowing)
            }
            
        case 4:
            //显示等待消息
            view.showSuccess("操作成功", image: nil)
        case 5:
            //显示失败消息
            view.showError("操作失败", image: nil)
        case 6:
            //显示普通消息
            view.showInfo("这是普通提示消息")
        case 7:
            view.showLoading("请稍等")
            DDLog(view.isShowing)
            view.hideHud(delay: 2)
            DispatchQueue.main.after(3) {
                DDLog(self.view.isShowing)
            }
            
        case 8:
            //显示等待消息
            ZZProgressHUD.showSuccess("操作成功", isDefaultAppearance: false)
        case 9:
            //显示失败消息
            ZZProgressHUD.showError("操作失败", isDefaultAppearance: false)
        case 10:
            //显示普通消息
            ZZProgressHUD.showInfo("这是普通提示消息", isDefaultAppearance: false)
        case 11:
            ZZProgressHUD.showLoading(kRequestLoading, cancellBlock: { sender in
                DDLog(sender.currentTitle)
                
            }, isDefaultAppearance: false)
            DDLog(ZZProgressHUD.isShowing)
            DispatchQueue.main.after(2) {
                ZZProgressHUD.updateLoading("第二标题")
            }
//            DispatchQueue.main.after(2) {
//                NNProgressHUD.hide(delay: 0)
//            }
//            DispatchQueue.main.after(1) {
//                DDLog(NNProgressHUD.isShowing)
//            }
        
        case 12:
            ZZProgressHUD.showText(kRequestSuccess)
            
        case 13:
            ZZProgressHUD.showText(kRequestSuccess, isDefaultAppearance: false)
            
        case 14:
            ZZProgressHUD.showProgressLoading(.annularDeterminate, title: "下载中...", cancellBlock: { sender in
                DDLog(sender.currentTitle)
            }, isDefaultAppearance: true)
            
            var progress: Float = 0.0
            while progress < 1.0 {
                progress += 0.01
                DispatchQueue.main.async {
                    ZZProgressHUD.updateProgressLoading(progress)
                }
                usleep(50000)
            }

        default:
            DDLog(sender.tag)
            break
        }
        
    }

}
