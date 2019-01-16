//
//  UIAlertController+Helper.swift
//  SwiftTemplet
//
//  Created by Bin Shang on 2019/1/12.
//  Copyright © 2019 BN. All rights reserved.
//

import UIKit

public extension UIAlertController{
    
    public static func createSheet(_ title: String?, itemDic: [String:[Any]]?, cancelTitle: String?, cancellStyle: UIAlertAction.Style, completion: ((UIAlertAction) -> Void)? = nil) -> UIAlertController {
        let alertController = UIAlertController(title: title, message: nil, preferredStyle: .actionSheet)
        itemDic?.keys.forEach({ (title:String) in
            alertController.addAction(UIAlertAction(title: title, style: .default, handler: { (action: UIAlertAction) in
                if completion != nil {
                    completion!(action)
                }
            }))
        })
        alertController.addAction(UIAlertAction(title: "取消", style: cancellStyle, handler: { (action:UIAlertAction) in
            alertController.dismiss(animated: true, completion: nil)
            if completion != nil {
                completion!(action)
            }
        }))
        return alertController
    }
    
}
