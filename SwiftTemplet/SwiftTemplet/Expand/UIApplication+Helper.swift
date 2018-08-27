//
//  UIApplication+Helper.swift
//  SwiftTemplet
//
//  Created by hsf on 2018/8/24.
//  Copyright © 2018年 BN. All rights reserved.
//

import UIKit

extension UIApplication{
    
    static func setupRootController(controller:AnyObject) -> Void {
        
        let contr:UIViewController = controller is NSString ? UIViewControllerFromString(vcName: controller as! String) : controller as! UIViewController;
        let rootVC = contr is UINavigationController || contr is UITabBarController ? contr : UINavigationController(rootViewController: contr);
        
        let app = UIApplication.shared.delegate as! AppDelegate;
        app.window = UIWindow(frame: UIScreen.main.bounds);
        app.window?.backgroundColor = UIColor.white;
        app.window?.rootViewController = rootVC;
        
        app.window?.makeKeyAndVisible();
        
    }
    
    static func setupNavigationBar() -> Void {
        UINavigationBar.appearance().tintColor =  UIColor.white;//界面顶部透明
        UINavigationBar.appearance().barTintColor = kC_ThemeCOLOR; //界面顶部透明
//        UINavigationBar.appearance().barTintColor = UIColor.orange; //界面顶部透明

        
//        UINavigationBar.appearance().isTranslucent = true //界面顶部透明
//        UINavigationBar.appearance().tintColor = UIColor.white//字体颜色
//        UINavigationBar.appearance().shadowImage =  UIImage.lkCreateImage(with:UIColor.clear)//阴影颜色
//        UINavigationBar.appearance().setBackgroundImage(UIImage.lkCreateImage(with:UIColor.clear), for:UIBarMetrics.default)//背景颜色
//        UINavigationBar.appearance().titleTextAttributes = [NSAttributedStringKey.foregroundColor:UIColor.white,
//                                                            NSAttributedStringKey.font:UIFont.boldSystemFont(ofSize:18)] //title 字体大小
//        UIBarButtonItem.appearance().setBackButtonTitlePositionAdjustment(UIOffsetMake(0,-60), for: UIBarMetrics.default)//去掉返回图片后面的文
    
        
        // 设置字体颜色
//        UITabBarItem.appearance().setTitleTextAttributes([NSForegroundColorAttributeName: UIColor.whiteColor()], forState: UIControlState.Normal)
//        UITabBarItem.appearance().setTitleTextAttributes([NSForegroundColorAttributeName: UIColor.greenColor()], forState: UIControlState.Selected)
//        // 设置字体大小
//        UITabBarItem.appearance().setTitleTextAttributes([NSFontAttributeName: UIFont.systemFontOfSize(8.0)], forState: UIControlState.Normal)
//        // 设置字体偏移
//        UITabBarItem.appearance().titlePositionAdjustment = UIOffsetMake(0.0, -5.0)
//        // 设置图标选中时颜色
//        UITabBar.appearance().tintColor = UIColor.redColor()

    }
    
   
}
