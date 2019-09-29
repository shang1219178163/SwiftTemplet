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

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        UIViewController.initializeMethod();
        UINavigationController.initializeMethod();
        UIImageView.initializeMethod();
//        UIColor.theme = UIColor.orange
        UIColor.theme = UIColorHexValue(0x29B5FE)
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
//        controller = UICtrFromString("NNUserLogInController");
//        controller = UICtrFromString("PlateNumberController");
//        controller = UICtrFromString("TitleViewController");
//        controller = UICtrFromString("ScrollHorizontalController");        
        
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
        
//        UIApplication.tabBarController?.selectedIndex = 4;
        
        let result = resultByOpt(5, 3) { (num1, num2) -> Int in
            num1 + num2
        }
        DDLog(result);
        
//        let r = RoundFloat(23.6250)
//        DDLog(r);
        
        let a = NumberFormatter.fractionDigits(obj: 1.4988)
        let b = NumberFormatter.fractionDigits(obj: 1.4988, min: 2, max: 3, roundingMode: .down)
        let c = NumberFormatter.fractionDigits(obj: 1.4988, min: 2, max: 3, roundingMode: .up)
        let d = NumberFormatter.fractionDigits(obj: 1.4988, min: 2, max: 2, roundingMode: .up)

        let e = NSNumber(1.4988).to_string();
        let f = NSNumber(1.4988).to_string(3);

//        DDLog(self,UIApplication.shared.delegate as! AppDelegate)
//        DDLog(UIApplication.mainWindow,UIApplication.shared.delegate?.window as Any);
//        DDLog(UIApplication.shared.keyWindow);
//        DDLog(self.window);
        
        let dateStr = "2019-08-27 23:55:34";
        let end = NSString.dateTime(dateStr as NSString, isEnd: true)
        let start = NSString.dateTime(dateStr as NSString, isEnd: false)
        DDLog(end)
        DDLog(start)
        
        let obj1 = NNStringFromClass(UITableViewCellOne.classForCoder());
        let obj2 = String(describing: UITableViewCellOne.self);
        let obj3 = String(describing: NNCheckVersApi.self);
        let obj4 = String(describing: NSObject.self);

        DDLog(obj1, obj2, obj3, obj4, UIApplication.identifier, NSObject.identifier, UIApplication.appName)
        
//        DDLog(Bundle.main.infoDictionary)

        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        UIApplication.didEnterBackground()
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


extension UIApplication{
    /// block内任务后台执行(block为空可填入AppDelegate.m方法 applicationDidEnterBackground中)
//    static func didEnterBackground(_ block: (()->Void)? = nil) -> Void{
//        let application: UIApplication = UIApplication.shared;
//        var bgTask: UIBackgroundTaskIdentifier = UIBackgroundTaskIdentifier(rawValue: 0);
//        //如果要后台运行
//        bgTask = application.beginBackgroundTask(expirationHandler: {
//            if bgTask != UIBackgroundTaskIdentifier.invalid {
//                application.endBackgroundTask(bgTask)
//                bgTask = UIBackgroundTaskIdentifier.invalid
//            }
//        });
//        
//        if block != nil {
//            block!();
//            application.endBackgroundTask(bgTask)
//        }
//        bgTask = UIBackgroundTaskIdentifier.invalid
//    }
}
