//
//  AppDelegate.swift
//  SwiftTemplet
//
//  Created by Bin Shang on 2018/4/24.
//  Copyright © 2018年 BN. All rights reserved.
//

import UIKit
import Foundation

import SwiftExpand

import Kingfisher

import Alamofire
import IQKeyboardManagerSwift


@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        UIViewController.initializeMethod();
        UINavigationController.initializeMethod();
        UIImageView.initializeMethod();
        UIColor.theme = UIColor.orange
        UIApplication.setupAppearanceDefault(false);

        IQKeyboardManager.shared.enable = true;
        
        // Override point for customization after application launch.
        
        //方式一
//        window = UIWindow(frame:UIScreen.main.bounds);
//        window?.backgroundColor = .white;
//        var controller = BNControllerFromString("MainViewController");
//        controller = BNControllerFromString("HomeViewController");
//        window?.rootViewController = controller is UINavigationController || controller is UITabBarController ? controller : UINavigationController(rootViewController: controller);
//        window?.makeKeyAndVisible();
        //方式二
        var controller = UICtrFromString("MainViewController");
        controller = UICtrFromString("HomeViewController");
//        controller = UICtrFromString("UIRecognizerController");
//        controller = UICtrFromString("IOPAuthRechargeController");
        
        UIApplication.setupRootController(controller, true);
        window = UIApplication.mainWindow;
        
//        UIApplication.setupRootController(&(window!), controller, true);
        //方式三
//        let list:Array = [
//            ["FirstViewController", "首页", "Item_first_N", "Item_first_H"],
//            ["SecondViewController", "圈子", "Item_second_N", "Item_second_H"],
//            //            ["CenterViewController", "概况",  "Item_center_N",  "Item_center_H"],
//            ["FifthViewControlle", "概况",  "Item_center_N",  "Item_center_H"],
//            ["ThirdViewController", "消息", "Item_third_N", "Item_third_H"],
//            ["FourthViewController", "我的",  "Item_fourth_N",  "Item_fourth_H"],
//
//            ];
//        let tabBarController = UITarBarCtrFromList(list);
//        UIApplication.setupRootController(tabBarController!);
        
        UIApplication.tabBarController?.selectedIndex = 2;
       
        
//        DDLog(self,UIApplication.shared.delegate as! AppDelegate)
//        DDLog(UIApplication.mainWindow,UIApplication.shared.delegate?.window as Any);
//        DDLog(UIApplication.shared.keyWindow);
//        DDLog(self.window);
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

