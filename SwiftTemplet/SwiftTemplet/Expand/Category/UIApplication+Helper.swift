//
//  UIApplication+Helper.swift
//  SwiftTemplet
//
//  Created by hsf on 2018/8/24.
//  Copyright © 2018年 BN. All rights reserved.
//

import UIKit

extension UIApplication{
    
    static var mainWindow: UIWindow {
        get {
            let app = UIApplication.shared.delegate as! AppDelegate;
            if app.window != nil {
                app.window!.backgroundColor = UIColor.white;
                app.window!.makeKeyAndVisible();
                return app.window!;
            }
            app.window = UIWindow.init(frame: UIScreen.main.bounds);
            app.window?.backgroundColor = UIColor.white;
            app.window?.makeKeyAndVisible();
            return app.window!;
        }
        set {
            let app = UIApplication.shared.delegate as! AppDelegate;
            app.window = newValue;
            
        }
    }
    
    static var rootController: UIViewController {
        get {
            return UIApplication.mainWindow.rootViewController!;
        }
        set {
            UIApplication.mainWindow.rootViewController = newValue;
        }
    }
    
    static func setupRootController(_ controller:AnyObject,_ isAdjust:Bool) -> Void {
        var contr = controller;
        if controller is String {
            contr = UICtrFromString(controller as! String);
        }
        
        if !isAdjust {
            UIApplication.rootController = contr as! UIViewController;
            return;
        }
        
        if controller is UINavigationController || controller is UITabBarController {
            UIApplication.rootController = contr as! UIViewController;
        }else{
            UIApplication.rootController = UINavigationController(rootViewController: contr as! UIViewController);
        }
    }
    
    static func setupAppearance() -> Void {
        self.setupAppearanceTabBar();
        self.setupAppearanceNavigationBar();
        
        if iOSVer(version: 11) {
            UITableView.appearance().estimatedRowHeight = 0.0;
            UITableView.appearance().estimatedSectionHeaderHeight = 0.0;
            UITableView.appearance().estimatedSectionFooterHeight = 0.0;
            
            UICollectionView.appearance().contentInsetAdjustmentBehavior = .never;
            UIScrollView.appearance().contentInsetAdjustmentBehavior = .never;
            UIScrollView.appearance().keyboardDismissMode = .onDrag;
        }
        UIButton.appearance().isExclusiveTouch = false;
    }
    
    static func setupAppearanceNavigationBar() -> Void {
        UINavigationBar.appearance().tintColor =  UIColor.white;//界面顶部透明
        UINavigationBar.appearance().barTintColor = UIColor.theme; //界面顶部透明
        //        UINavigationBar.appearance().barTintColor = UIColor.orange; //界面顶部透明
        
        let attDic = [NSAttributedStringKey.foregroundColor :   UIColor.white,
                      NSAttributedStringKey.font    :   UIFont.boldSystemFont(ofSize:18)];
        UINavigationBar.appearance().titleTextAttributes = attDic;
        
//        UINavigationBar.appearance().isTranslucent = true //界面顶部透明
//        UINavigationBar.appearance().shadowImage =  UIImage.lkCreateImage(with:UIColor.clear)//阴影颜色
//        UINavigationBar.appearance().setBackgroundImage(UIImage.lkCreateImage(with:UIColor.clear), for:UIBarMetrics.default)//背景颜色

//        UIBarButtonItem.appearance().setBackButtonTitlePositionAdjustment(UIOffsetMake(0,-60), for: UIBarMetrics.default)//去掉返回图片后面的文
        
    }
    
    static func setupAppearanceTabBar() -> Void {
        //         设置字体颜色
//        let attDic_N = [NSAttributedStringKey.foregroundColor:UIColor.black];
        let attDic_H = [NSAttributedStringKey.foregroundColor:UIColor.theme];
//        UITabBarItem.appearance().setTitleTextAttributes(attDic_N, for: .normal);
        UITabBarItem.appearance().setTitleTextAttributes(attDic_H, for: .selected);
        // 设置字体偏移
        UITabBarItem.appearance().titlePositionAdjustment = UIOffsetMake(0.0, -5.0)
        // 设置图标选中时颜色
        UITabBar.appearance().tintColor = UIColor.red;
        
    }
}
