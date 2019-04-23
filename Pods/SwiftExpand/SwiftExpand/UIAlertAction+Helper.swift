//
//  UIAlertAction+Helper.swift
//  SwiftExpand
//
//  Created by Bin Shang on 2019/1/16.
//

import UIKit

extension UIAlertAction{
    
    @objc public var tag: Int {
        get {
            if let aValue = objc_getAssociatedObject(self, RuntimeKeyFromSelector(#function)) as? Int {
                return aValue
            } else {
                return 1
            }
        }
        set {
            objc_setAssociatedObject(self, RuntimeKeyFromSelector(#function), newValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC);
        }
    }
    
    
}
