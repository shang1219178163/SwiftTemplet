//
//  UIAlertController+Helper.swift
//  SwiftTemplet
//
//  Created by Bin Shang on 2019/1/12.
//  Copyright © 2019 BN. All rights reserved.
//

import UIKit

public extension UIAlertController{
    
    public static func createSheet(_ title: String?, itemDic: [String:[Any]]?, completion: ((UIAlertAction) -> Void)?) -> UIAlertController {
        let alertController = UIAlertController(title: title, message: nil, preferredStyle: .actionSheet)
      
        itemDic?.keys.forEach({ (title:String) in
            let style: UIAlertActionStyle = title == kActionTitle_Cancell ? .destructive : .default
            alertController.addAction(UIAlertAction(title: title, style: style, handler: { (action: UIAlertAction) in
                alertController.dismiss(animated: true, completion: nil)
                if completion != nil {
                    completion!(action)
                }
            }))
        })
        
        if itemDic?.keys.contains(kActionTitle_Cancell) == false || itemDic == nil {
            alertController.addAction(UIAlertAction(title: kActionTitle_Cancell, style: .destructive, handler: { (action: UIAlertAction) in
                alertController.dismiss(animated: true, completion: nil)
                if completion != nil {
                    completion!(action)
                }
            }))
        }
        return alertController
    }
    
    public static func createAlert(_ title: String, placeholderList: [String]?, msg: String, actionTitleList: [String]?, handler: ((UIAlertAction) -> Void)?) -> UIAlertController {
        let alertController = UIAlertController(title: title, message: msg, preferredStyle: .alert)
       
        placeholderList?.forEach { (placeholder: String) in
            alertController.addTextField(configurationHandler: { (textField: UITextField) in
                textField.placeholder = placeholder

            })
        }
    
        if actionTitleList == nil {
            UIApplication.mainWindow.rootViewController?.present(alertController, animated: true, completion: {
                DispatchQueue.main.after(TimeInterval(kAnimDuration_Toast), execute: {
                    alertController.dismiss(animated: true, completion: nil)
                })
            })
            return alertController
        }
        
        actionTitleList?.forEach({ (title:String) in
            let style: UIAlertActionStyle = title == kActionTitle_Cancell ? .destructive : .default
            alertController.addAction(UIAlertAction(title: title, style: style, handler: { (action: UIAlertAction) in
                if handler != nil {
                    handler!(action)
                }
            }))
        })
        UIApplication.mainWindow.rootViewController?.present(alertController, animated: true, completion: nil)
        return alertController
    }
    
}
