//
//  UIViewController+Hook.swift
//  SwiftTemplet
//
//  Created by Bin Shang on 2018/12/13.
//  Copyright © 2018 BN. All rights reserved.
//

import UIKit

extension UIViewController{
    
    public class func initializeMethod() {
        // Make sure This isn't a subclass of UIViewController, So that It applies to all UIViewController childs
        if self != UIViewController.self {
            return
        }
        
        let onceToken = "Method Swizzling_\(NSStringFromClass(classForCoder()))";
        //DispatchQueue函数保证代码只被执行一次，防止又被交换回去导致得不到想要的效果
        DispatchQueue.once(token: onceToken) {
            let oriSel = #selector(UIViewController.viewWillAppear(_:))
            let repSel = #selector(UIViewController.swz_viewWillAppear(animated:))
            let _ = UIViewController.swizzleMethodInstance(oriSel, replSel: repSel);
            
            
            let oriSel1 = #selector(UIViewController.viewWillDisappear(_:))
            let repSel1 = #selector(UIViewController.swizzled_viewWillDisappear(animated:))
            let _ = UIViewController.swizzleMethodInstance(oriSel1, replSel: repSel1);
            
        }
        
    }
    
    @objc func swz_viewWillAppear(animated: Bool) {
        //需要注入的代码写在此处
        self.swz_viewWillAppear(animated: animated)
        
        self.eventGather(isBegin: true);
    }
    @objc func swizzled_viewWillDisappear(animated: Bool) {
        //需要注入的代码写在此处
        self.swizzled_viewWillDisappear(animated: animated)
        
        self.eventGather(isBegin: false);
        
    }
    
    @objc func eventGather(isBegin: Bool) -> Void {
        let className = NSStringFromClass(classForCoder);
        //设置不允许发送数据的Controller
        let filters = ["UINavigationController","UITabBarController",];
        if filters.contains(className) {
            return ;
        }
        
        if isBegin {
            DDLog("\(NSStringFromClass(classForCoder))--Appear")
            
        }else{
            DDLog("\(NSStringFromClass(classForCoder))--Disappear")
            
        }
    }
}
