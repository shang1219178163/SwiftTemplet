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

    let list = [UIButton].init(count: 12) {
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
                    MBProgressHUD.hideHud(delay: 0)
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
        
        
        list.updateItemsConstraint(CGRectMake(10, 10, kScreenWidth - 20, 200))
    }

    
    @objc func handleAction(_ sender: UIButton) {
        switch sender.tag {
        case 0:
            //显示成功消息
            MBProgressHUD.showSuccess("操作成功")
        case 1:
            //显示失败消息
            MBProgressHUD.showError("操作失败")
        case 2:
            //显示普通消息
            MBProgressHUD.showInfo("这是普通提示消息")
        case 3:
            //显示等待消息
            MBProgressHUD.showLoading("请稍等")
            DDLog(MBProgressHUD.isShowing)
            MBProgressHUD.hideHud(delay: 0)
            
            DispatchQueue.main.after(1) {
                DDLog(MBProgressHUD.isShowing)
            }

            
        case 4:
            //显示等待消息
            view.showSuccess("操作成功")
        case 5:
            //显示失败消息
            view.showError("操作失败")
        case 6:
            //显示普通消息
            view.showInfo("这是普通提示消息")
        case 7:
            view.showLoading("请稍等")
            DDLog(view.isShowing)
            view.hideHud(delay: 0)
            DispatchQueue.main.after(1) {
                DDLog(MBProgressHUD.isShowing)
            }
            
        case 8:
            //显示等待消息
            ZZProgressHUD.showSuccess("操作成功")
        case 9:
            //显示失败消息
            ZZProgressHUD.showError("操作失败")
        case 10:
            //显示普通消息
            ZZProgressHUD.showInfo("这是普通提示消息")
        case 11:
            ZZProgressHUD.showLoading("请稍等")
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
        default:
            DDLog(sender.tag)
            break
        }
        
    }

}
