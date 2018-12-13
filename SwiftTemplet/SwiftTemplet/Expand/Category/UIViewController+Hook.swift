//
//  UIViewController+Hook.swift
//  SwiftTemplet
//
//  Created by Bin Shang on 2018/12/13.
//  Copyright © 2018 BN. All rights reserved.
//

import UIKit

extension UIViewController{
    
    class func initializeMethod() {
        // Make sure This isn't a subclass of UIViewController, So that It applies to all UIViewController childs
//        return;
        if self == UIViewController.self {
            let onceToken = "Method Swizzling_\(NSStringFromClass(classForCoder()))";
            //DispatchQueue函数保证代码只被执行一次，防止又被交换回去导致得不到想要的效果
            DispatchQueue.once(token: onceToken) {
                let oriSel0 = #selector(UIViewController.viewDidLoad)
                let repSel0 = #selector(UIViewController.swz_viewDidLoad)
                //            let _ = UIViewController.swizzleMethodInstance(oriSel, replSel: repSel);
                let _ = swizzleMethodInstance(UIViewController.self, origSel: oriSel0, replSel: repSel0);
                
                let oriSel = #selector(UIViewController.viewWillAppear(_:))
                let repSel = #selector(UIViewController.swz_viewWillAppear(animated:))
                //            let _ = UIViewController.swizzleMethodInstance(oriSel, replSel: repSel);
                let _ = swizzleMethodInstance(UIViewController.self, origSel: oriSel, replSel: repSel);
                
                
                let oriSel1 = #selector(UIViewController.viewWillDisappear(_:))
                let repSel1 = #selector(UIViewController.swz_viewWillDisappear(animated:))
                //            let _ = UIViewController.swizzleMethodInstance(oriSel1, replSel: repSel1);
                let _ = swizzleMethodInstance(UIViewController.self, origSel: oriSel1, replSel: repSel1);
                
            }
        } else if self == UINavigationController.self {
            let onceToken = "Method Swizzling_\(NSStringFromClass(classForCoder()))";
            //DispatchQueue函数保证代码只被执行一次，防止又被交换回去导致得不到想要的效果
            DispatchQueue.once(token: onceToken) {
                let oriSel = #selector(UINavigationController.pushViewController(_:animated:));
                let repSel = #selector(UINavigationController.swz_pushViewController(_:animated:));
//                let _ = UINavigationController.swizzleMethodInstance(oriSel, replSel: repSel);
                let _ = swizzleMethodInstance(UINavigationController.self, origSel:oriSel , replSel: repSel);

            }
        }
    }
    
    @objc func swz_viewDidLoad(animated: Bool) {
        //需要注入的代码写在此处
//        edgesForExtendedLayout = [];
//        edgesForExtendedLayout = UIRectEdge(rawValue: 0)
//        if iOSVer(version: 11) {
//            UIScrollView.appearance().contentInsetAdjustmentBehavior = .never;
//        } else {
//            automaticallyAdjustsScrollViewInsets = false;
//        }

        self.swz_viewDidLoad(animated: animated)

    }
    
    @objc func swz_viewWillAppear(animated: Bool) {
        //需要注入的代码写在此处
        self.swz_viewWillAppear(animated: animated)
        
        self.eventGather(isBegin: true);
    }
    @objc func swz_viewWillDisappear(animated: Bool) {
        //需要注入的代码写在此处
        self.swz_viewWillDisappear(animated: animated)
        
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
    
//    //MARK: UINavigationController
//    @objc func swz_pushViewController(_ viewController: UIViewController, animated: Bool) {
//        //需要注入的代码写在此处
//        //判断是否是根控制器
//        if self.childViewControllers.count > 0 {
//            viewController.hidesBottomBarWhenPushed = true
//        }
//        
//        //设置每一个子控制器的左边为我们自定义的放回按钮
//        viewController.navigationItem.leftBarButtonItem = UIBarButtonItem(title: "", style: .done, target: nil, action: nil);
//        viewController.view.backgroundColor = .white;
//        //push进入下一个控制器
//        //        super.pushViewController(viewController, animated: true);
//        
//    }
}
