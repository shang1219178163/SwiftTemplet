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
import IQKeyboardManagerSwift


@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        NSObject.initializeMethod()
        UIViewController.initializeMethod();
        UINavigationController.initializeMethod();
        UIImageView.initializeMethod();
//        UIColor.theme = UIColor.systemBlue
        UIColor.theme = UIColor.hexValue(0x29B5FE)
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
        
        let num: CGFloat = 3.7999
        let fmt = NumberFormatter()
        fmt.numberStyle = .spellOut
//        fmt.locale = NSLocale(localeIdentifier: "zh_Hans") as Locale
        let g = fmt.string(from: NSNumber(floatLiteral: Double(num)))
        let h = NumberFormatter.fractionDigits(obj: num, min: 1, max: 4, identify: kNumIdentifySpellOut)
        
        let m = NumberFormatter.positiveFormat(54312346.4567, format: "¥####.##元", defalut: "-")
        let n = NumberFormatter.positive(54312346.4567, prefix: "人", suffix: "民", defalut: "-")

        let formatter = NumberFormatter()
        formatter.positiveFormat = "####.##元"
        let o = formatter.string(for: 1.4988) ?? "0"

//        formatter.numberStyle = .decimal
////        fmt.positiveFormat = format
//        formatter.positivePrefix = "人"
//        formatter.positiveSuffix = "民"
//        let n = formatter.string(for: 1.4988) ?? "0"
//        DDLog(a, b, c, d, e, f, g , h, m, n, o)

        let xx = ["1", "2", "3", "4", "5", "6"]
        let num1 = xx.map { ($0 != "3" ? $0 : nil) }
        DDLog(num1)
        
        let number = [[1, 2, 3, nil], [4, 5, 6]]
        let flat = number.flatMap { $0 }
        let compact = flat.compactMap { $0 }
        DDLog(flat, compact)
        
        let items = [1, 2, 3, 4, 5, ]
        let flat2 = items.compactMap { $0 }
        DDLog(flat2)
                
        let dic = ["1" : 11,
        "2" : 22,
        "3" : 33,
        ]
        
        let compact2 = dic.compactMapValues { $0 + 100 }
        let compact3 = dic.compactMapValues { $0 > 20 }
        DDLog(compact2, compact3)
        
         let array = [1, 3, 5, 7, 9];
        DDLog(array.reduce(0, +))
        DDLog(array.reduce(0){ $0 * 10 + $1 })


//        let dic = ["1" : 3, "2" : 4, "3" : nil, ]
//        let dicNew = dic.compactMapValues { $0 }
//        DDLog(dicNew)
        
//        let one = "abcdefghmno".prefix(3)
//        let one1 = "abcdefghmno".suffix(3)
//        DDLog(one, one1)
                
//        DDLog(self,UIApplication.shared.delegate as! AppDelegate)
//        DDLog(UIApplication.mainWindow,UIApplication.shared.delegate?.window as Any);
//        DDLog(UIApplication.shared.keyWindow);
//        DDLog(self.window);
        
//        let dateStr = "2019-08-27 23:55:34";
//        let end = NSString.dateTime(dateStr as NSString, isEnd: true)
//        let start = NSString.dateTime(dateStr as NSString, isEnd: false)
//        DDLog(end)
//        DDLog(start)
//
//        let obj1 = NNStringFromClass(UITableViewCellOne.self);
//        let obj2 = String(describing: UITableViewCellOne.self);
//        let obj3 = String(describing: NNCheckVersApi.self);
//        let obj4 = String(describing: NSObject.self);
//        DDLog(obj1, obj2, obj3, obj4, UIApplication.identifier, NSObject.identifier, UIApplication.appName)
//        DDLog(Bundle.main.infoDictionary)
//
//        let now = NSDate()
//        let isValid = NSDate().hour > 7 || NSDate().hour > 23
//        DDLog(now.year, now.month, now.day, now.hour, now.minute, now.second, isValid)
//
//        UIApplication.token = "123456789";
//        DDLog( UIApplication.token)
//
//        DDLog("".count)
        
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
