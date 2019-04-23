//
//  UIAlertController+Helper.swift
//  SwiftTemplet
//
//  Created by Bin Shang on 2019/1/12.
//  Copyright © 2019 BN. All rights reserved.
//

import UIKit

extension UIAlertController{
    /// 创建系统提示框
    @objc public static func createAlert(_ title: String, placeholders: [String]?, msg: String, actionTitles: [String]?, handler: ((UIAlertAction) -> Void)?) -> UIAlertController {
        let alertController = UIAlertController(title: title, message: msg, preferredStyle: .alert)
       
        placeholders?.forEach { (placeholder: String) in
            alertController.addTextField(configurationHandler: { (textField: UITextField) in
                textField.placeholder = placeholder

            })
        }
        
        actionTitles?.forEach({ (title:String) in
            let style: UIAlertActionStyle = title == kActionTitle_Cancell ? .destructive : .default
            alertController.addAction(UIAlertAction(title: title, style: style, handler: { (action: UIAlertAction) in
                if handler != nil {
                    handler!(action)
                }
            }))
        })
        return alertController
    }
    
    /// 展示提示框
    @objc public static func showAlert(_ title: String, placeholders: [String]?, msg: String, actionTitles: [String]?, handler: ((UIAlertAction) -> Void)?) -> Void {
        
        let alertController = UIAlertController.createAlert(title, placeholders: placeholders, msg: msg, actionTitles: actionTitles, handler: handler)
        if actionTitles == nil {
            UIApplication.mainWindow.rootViewController?.present(alertController, animated: true, completion: {
                DispatchQueue.main.after(TimeInterval(kDurationToast), execute: {
                    alertController.dismiss(animated: true, completion: nil)
                })
            })
            return
        }
        UIApplication.mainWindow.rootViewController?.present(alertController, animated: true, completion: nil)
    }
    
    /// 创建系统sheetView
    @objc public static func createSheet(_ title: String?, items: [String]?, completion: ((UIAlertAction) -> Void)?) -> UIAlertController {
        let alertController = UIAlertController(title: title, message: nil, preferredStyle: .actionSheet)
        
        items?.forEach({ (title:String) in
            let style: UIAlertActionStyle = title == kActionTitle_Cancell ? .cancel : .default
            alertController.addAction(UIAlertAction(title: title, style: style, handler: { (action: UIAlertAction) in
                alertController.dismiss(animated: true, completion: nil)
                if completion != nil {
                    completion!(action)
                }
            }))
        })
        
        if items?.contains(kActionTitle_Cancell) == false || items == nil {
            alertController.addAction(UIAlertAction(title: kActionTitle_Cancell, style: .cancel, handler: { (action: UIAlertAction) in
                alertController.dismiss(animated: true, completion: nil)
                if completion != nil {
                    completion!(action)
                }
            }))
        }
        return alertController
    }
    
    /// 展示提示框
    @objc public static func showSheet(_ title: String?, items: [String]?, completion: ((UIAlertAction) -> Void)?) -> Void {
        let alertController = UIAlertController.createSheet(title, items: items, completion: completion)
        UIApplication.mainWindow.rootViewController?.present(alertController, animated: true, completion: nil)
        
    }

}
