//
//  UIBarButtonItem+Helper.swift
//  SwiftTemplet
//
//  Created by hsf on 2018/8/28.
//  Copyright © 2018年 BN. All rights reserved.
//

import UIKit

public extension UIBarButtonItem{
    
   public var systemType: UIBarButtonItem.SystemItem {
        get {
            return objc_getAssociatedObject(self, RuntimeKeyFromSelector(#function)) as! UIBarButtonItem.SystemItem;
        }
        set {
            objc_setAssociatedObject(self, RuntimeKeyFromSelector(#function), newValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC);
        }
    }
    //待优化
//    public static func create(title:String?, image:AnyObject?, tag:NSInteger, action:@escaping (ControlClick)) -> UIBarButtonItem? {
//        let font = UIFont.systemFont(ofSize: UIFont.buttonFontSize - 1.0)
//        let btn = UIView.createBtn(.zero, title: title, imgeName: image, tag: tag, type: 0,  action:action)
//        let barItem = UIBarButtonItem(customView: btn!)
//        barItem.tag = tag
//        return barItem
//    }

}
