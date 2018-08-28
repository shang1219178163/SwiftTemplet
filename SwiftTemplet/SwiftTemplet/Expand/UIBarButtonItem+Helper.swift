//
//  UIBarButtonItem+Helper.swift
//  SwiftTemplet
//
//  Created by hsf on 2018/8/28.
//  Copyright © 2018年 BN. All rights reserved.
//

import UIKit

extension UIBarButtonItem{
    
   var systemType: UIBarButtonSystemItem {
        get {
            return  objc_getAssociatedObject(self, RuntimeKey.item!) as! UIBarButtonSystemItem;

        }
        set {
            objc_setAssociatedObject(self, RuntimeKey.item!, newValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC);

        }
    }
    
    
//    func isOneItem(sysItem:UIBarButtonSystemItem!) -> Bool {
//        
//        let style = self.value(forKey: "systemItem");
//        if UIBarButtonSystemItem(rawValue: style as! Int) == sysItem {
//            return true;
//            
//        }
//        return false;
//    }
}
