//
//  UINavigationController+Hook.swift
//  SwiftTemplet
//
//  Created by Bin Shang on 2018/12/13.
//  Copyright © 2018 BN. All rights reserved.
//

import UIKit

extension UINavigationController{
    
//    public class func initializeMethod() {
//        // Make sure This isn't a subclass of UIViewController, So that It applies to all UIViewController childs
//        if self != UINavigationController.self {
//            return
//        }
//        
//        let onceToken = "Method Swizzling_\(NSStringFromClass(classForCoder()))";
//        //DispatchQueue函数保证代码只被执行一次，防止又被交换回去导致得不到想要的效果
//        DispatchQueue.once(token: onceToken) {
//            let oriSel = #selector(UINavigationController.pushViewController(_:animated:));
//            let repSel = #selector(UINavigationController.swz_pushViewController(_:animated:));
//            let _ = UINavigationController.swizzleMethodInstance(oriSel, replSel: repSel);
//            
//        }
//    }
    @objc public func swz_pushViewController(_ viewController: UIViewController, animated: Bool) {
        //需要注入的代码写在此处
//        viewController.navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .done, target: nil, action: nil);
        viewController.view.backgroundColor = .white;
        //判断是否是根控制器
        if viewControllers.count > 0 {
            viewController.hidesBottomBarWhenPushed = true
            _ = viewController.createBackItem(UIImageNamed("icon_arowLeft_black")!)

        }
        
        //push进入下一个控制器
        swz_pushViewController(viewController, animated: animated);
        
    }
    
}
