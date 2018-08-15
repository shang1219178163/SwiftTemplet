
//
//  Object+Helper.swift
//  SwiftTemplet
//
//  Created by hsf on 2018/4/24.
//  Copyright © 2018年 BN. All rights reserved.
//

import Foundation
import UIKit

extension NSObject{
    
    typealias SwiftBlock = (_ obj:AnyObject, _ item:AnyObject, _ idx:NSInteger) -> Void;
//    typealias SwiftBlock = { (_ obj:uivi)->() in_
//
//    }

    var block:SwiftBlock {
        set {
            objc_setAssociatedObject(self, &self.block, newValue, objc_AssociationPolicy.OBJC_ASSOCIATION_RETAIN_NONATOMIC);
        }
        
        get {
      
            return objc_getAssociatedObject(self, &self.block) as! NSObject.SwiftBlock;
        }
        
    }
    
    func getAppName() -> String {
        let nameKey = "CFBundleName";
        //这里也是坑，请不要翻译oc的代码，而是去NSBundle类里面看它的api
        let appName = Bundle.main.infoDictionary![nameKey] as? String;
        return appName!;
    }
    
    func getClassName(className:String) -> AnyClass {
        let cls : AnyClass = NSClassFromString(getAppName() + "." + className)!;
        return cls;
        
    }
    
    func getClassVC(className:String) -> UIViewController {
        let vcCls = getClassName(className: className) as! UIViewController.Type;
        let controller:UIViewController = vcCls.init();
        return controller;
        
    }
    

    func getController(controllerName: String) ->UIViewController {
        
        // 动态获取命名空间
        let appName = Bundle.main.infoDictionary!["CFBundleName"] as! String;
        
        // 0 字符串转类
        let cls: AnyClass? =  NSClassFromString(appName + "." + controllerName);
        
        // 通过类创建对象， 不能用cls.init(),有的类可能没有init方法
        // 需将cls转换为制定类型，也就是
        let vcCls = cls as! UIViewController.Type;
        
        // 创建对象
        let childController:UIViewController = vcCls.init();
        return childController;
        
    }
    

    
}
