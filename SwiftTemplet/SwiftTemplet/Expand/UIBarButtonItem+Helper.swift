//
//  UIBarButtonItem+Helper.swift
//  SwiftTemplet
//
//  Created by hsf on 2018/8/28.
//  Copyright © 2018年 BN. All rights reserved.
//

import UIKit

extension UIBarButtonItem{
    
    static func isOneItem(item:AnyObject!, sysItem:UIBarButtonSystemItem!) -> Bool {
        
        let style = (item as! UIBarButtonItem).value(forKey: "systemItem");
        if UIBarButtonSystemItem(rawValue: style as! Int) == sysItem {
            return true;
            
        }
        return false;
    }
    
    func isOneItem(sysItem:UIBarButtonSystemItem!) -> Bool {
        
        let style = self.value(forKey: "systemItem");
        if UIBarButtonSystemItem(rawValue: style as! Int) == sysItem {
            return true;
            
        }
        return false;
    }
}
