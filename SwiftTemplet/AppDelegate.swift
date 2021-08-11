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
import IQKeyboardManagerSwift

let AppStoreID = "1002789852"
let AppSubtitle = "智慧停车领域专家"
let AppSerivcePhone = "400-966-8001"
let AppPlatformAgreement = "http://api.parkingwang.com/app/iop/register.html"
let AppPrivacyAgreement = "http://iop.parkingwang.com/static/protocol/parkingwang.html"


public extension Notification.Name {
    static let appLogOut = Notification.Name(rawValue: "AppLogOut")  // 值改变通知
    static let appTokenExpired = Notification.Name(rawValue: "AppTokenExpired")  // 值改变通知
}


@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.

//        NSObject.initializeMethod()
//        UIViewController.initializeMethod()
//        UINavigationController.initializeMethod()
//        UITextView.initializeMethod()
//        UIControl.initializeMethod()
////        UITapGestureRecognizer.initializeMethod()
////        UIImageView.initializeMethod()
////        UIColor.theme = UIColor.systemBlue
//        UIColor.theme = UIColor.hexValue(0x29B5FE)
//        UIApplication.setupAppearance(.white, barTintColor: .theme)
////        setupAppearance(.white, barTintColor: .theme)
//        IQKeyboardManager.shared.enable = true
//
//
//        var controller = UICtrFromString("MainViewController");
//        controller = UICtrFromString("HomeViewController");

        var controller = HomeViewController()

        window = UIApplication.mainWindow;
        window?.rootViewController = controller
//
//        testFunc()
        return true
    }
    
    func application(_ app: UIApplication, open url: URL, options: [UIApplication.OpenURLOptionsKey : Any] = [:]) -> Bool {
        if url.absoluteString.hasSuffix("\(kPayURLScheme)://") {
            NotificationCenter.default.post(name: NSNotification.Name(rawValue: "payReturn"), object: nil)
        } else if url.host == "safepay" || url.scheme == kWeChatAppId {
            NNPayManager.shared().handlePayResultOpen(url)
        }
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

    // MARK: -funtions
    func testFunc() {
//        let za = "12".padding(toLength: 5, withPad: "*", startingAt: 0)
//        DDLog(za)
//
//        let btime = "2020-01-13 09:43:50"
//        DDLog(btime.dayBegin, btime.dayEnd)
//
//        let date = DateFormatter.dateFromString(btime)
//        DDLog(date!.betweenInfo(Date()))
//
//        let etime = "2020-02-13 09:43:50"
//        let eDate = DateFormatter.dateFromString(etime)
//        DDLog(eDate)
//
//
//        let l = DateFormatter.betweenDateDays(btime, endTime: etime)
//        DDLog(l)
//
//        let dateStr = ("\(NSDate())" as NSString).substring(to: 19)
//        var dateStrMore = dateStr.replacingOccurrences(of: "-", with: "")
//        dateStrMore = dateStrMore.replacingOccurrences(of: ":", with: "")
//        dateStrMore = dateStrMore.replacingOccurrences(of: " ", with: "")
        
//        let dateStrMore = dateStr.replacingOccurrences(of: [" ", ":", "-"], replacement: "")
//        DDLog(dateStr, dateStrMore)
        
        DDLog("".intValue)
        DDLog("".count)
        DDLog("".isEmpty)
        
        
        let absoluteString = "iop://Goods?openNames=30027&activeName=960001"
        switch absoluteString {
        case let value where absoluteString.hasPrefix("iop://Goods"):
            DDLog(value)
            if var URL = URL(string: value) {
                DDLog(URL.queryParameters)
                
                URL = URL.appendingQueryParameters(["token": "1111111"])
//                URL.appendQueryParameters(["token": "1111111"])
                DDLog("append", URL)
                
                URL = URL.removingQueryParameters(for: ["token", "activeName"])
//                URL.removeQueryParameters(for: ["token", "activeName"])
                DDLog("delete", URL)
            }
            
        default:
            break
        }
        
        return
            
//        DDLog(#function, String(describing: self), type(of: self))
//        let r = RoundFloat(23.6250)
//        DDLog(r);
        
        
//        let a = NumberFormatter.fractionDigits(obj: 1.4988)
//        let b = NumberFormatter.fractionDigits(obj: 1.4988, min: 2, max: 3, roundingMode: .down)
//        let c = NumberFormatter.fractionDigits(obj: 1.4988, min: 2, max: 3, roundingMode: .up)
//        let d = NumberFormatter.fractionDigits(obj: 1.4988, min: 2, max: 2, roundingMode: .up)
//
//        let e = NSNumber(1.4988).toString();
//        let f = NSNumber(1.4988).toString(3);
//
//        let num: CGFloat = 3.7999
//        let fmt = NumberFormatter()
//        fmt.numberStyle = .spellOut
////        fmt.locale = NSLocale(localeIdentifier: "zh_Hans") as Locale
//        let g = fmt.string(from: NSNumber(floatLiteral: Double(num)))
//        let h = NumberFormatter.fractionDigits(obj: num, min: 1, max: 4, identify: kNumIdentifySpellOut)
//
//        let m = NumberFormatter.positiveFormat(54312346.4567, format: "¥####.##元", defalut: "-")
//        let n = NumberFormatter.positive(54312346.4567, prefix: "人", suffix: "民", defalut: "-")
//
//        let formatter = NumberFormatter()
//        formatter.positiveFormat = "####.##元"
//        let o = formatter.string(for: 1.4988) ?? "0"

//        formatter.numberStyle = .decimal
////        fmt.positiveFormat = format
//        formatter.positivePrefix = "人"
//        formatter.positiveSuffix = "民"
//        let n = formatter.string(for: 1.4988) ?? "0"
//        DDLog(a, b, c, d, e, f, g , h, m, n, o)

//        let xx = ["1", "2", "3", "4", "5", "6"]
//        let num1 = xx.map { ($0 != "3" ? $0 : nil) }
//        DDLog(num1)
//
//        let number = [[1, 2, 3, nil], [4, 5, 6]]
//        let flat = number.flatMap { $0 }
//        let compact = flat.compactMap { $0 }
//        DDLog(flat, compact)
//
//        let items = [1, 2, 3, 4, 5, ]
//        let flat2 = items.compactMap { $0 }
//        DDLog(flat2)
                
        let dic = ["1" : 11,
        "2" : 22,
        "3" : 33,
        ]
        
        let compact2 = dic.compactMapValues { $0 + 100 }
        let compact3 = dic.compactMapValues { $0 > 20 }
        DDLog(compact2, compact3)
        
//         let array = [1, 3, 5, 7, 9];
//        DDLog(array.reduce(0, +))
//        DDLog(array.reduce(0){ $0 * 10 + $1 })
//
//        let result = NSDecimalNumber.calculate { (dec) -> NSDecimalNumber in
//            let a = NSDecimalNumber(decimal: 0.1562)
//            let b = NSDecimalNumber(decimal: 0.1354554)
//            let num = a.adding(b)
//            return dec.adding(num)
//        }
//        DDLog(result)
        
//        UserDefaults.standard["a", default: "3"] = "111"
//        let aaa = UserDefaults.standard["b", default: "T"]
//        DDLog(aaa)

//        let dic = ["1" : 3, "2" : 4, "3" : nil, ]
//        let dicNew = dic.compactMapValues { $0 }
//        DDLog(dicNew)
        
//        let one = "abcdefghmno".prefix(3)
//        let one1 = "abcdefghmno".suffix(3)
//        DDLog(one, one1)
                
//        DDLog(self,UIApplication.shared.delegate as! AppDelegate)
//        DDLog(UIApplication.mainWindow,UIApplication.shared.delegate?.window);
//        DDLog(UIApplication.shared.keyWindow);
//        DDLog(self.window);
        
//        let dateStr = "2019-08-27 23:55:34";
//        let end = NSString.dateTime(dateStr as NSString, isEnd: true)
//        let start = NSString.dateTime(dateStr as NSString, isEnd: false)
//        DDLog(end)
//        DDLog(start)
//
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
        
        var a = "123_"
        var b = a*3
        DDLog(b, b*=3)
        
        
        let urlString = "https://t.bilibili.com/?spm_id_from=333.851.b_696e7465726e6174696f6e616c486561646572.28"
        if let url = URL(string: urlString) {
            DDLog(url.queryParameters as Any, url.queryValue(for: "spm_id_from"))
            DDLog(url.appendingQueryParameters(["phone": "18729742695"]))
        }
        
//        let json = Bundle.main.infoDictionary?.jsonString
//        DDLog(json?.trimmed)

        let formatter = NumberFormatter()
        formatter.roundingMode = .halfUp
        formatter.minimumFractionDigits = 1
        formatter.maximumFractionDigits = 4
        formatter.paddingPosition = .beforePrefix
        formatter.paddingCharacter = "0"
        formatter.minimumIntegerDigits = 5

        let aa = "\(Double.pi, formatter: formatter)" // 00003.1416
        let ab = "\(5, formatter: formatter)" // 00005.0
        let ac = "\(5.3, formatter: formatter)" // 00005.0
        DDLog(aa, ab, ac)

        let bb = String(11, radix: 2, uppercase: true)
        DDLog(bb)
        
    }
    
    
    func setupAppearance(_ tintColor: UIColor, barTintColor: UIColor) {

        _ = {
            $0.barTintColor = barTintColor
            $0.tintColor = tintColor
            $0.titleTextAttributes = [NSAttributedString.Key.foregroundColor: tintColor,]
          }(UINavigationBar.appearance())
                
        _ = {
            $0.setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor.black], for: .normal)
          }(UIBarButtonItem.appearance(whenContainedInInstancesOf: [UIImagePickerController.self]))
        
        
        _ = {
            $0.setTitleTextAttributes([NSAttributedString.Key.foregroundColor: tintColor], for: .normal)
          }(UIBarButtonItem.appearance(whenContainedInInstancesOf: [UISearchBar.self]))
        
        
//        _ = {
//            $0.barTintColor = barTintColor
//            $0.tintColor = tintColor
//            $0.isTranslucent = false
//            if #available(iOS 10.0, *) {
//                $0.unselectedItemTintColor = .gray
//            }
//          }(UITabBar.appearance())
        
        
//        _ = {
//            $0.titlePositionAdjustment = UIOffset(horizontal: 0, vertical: -5.0)
//          }(UITabBarItem.appearance())
        
        _ = {
            $0.setTitleColor(tintColor, for: .normal)
            $0.titleLabel?.adjustsFontSizeToFitWidth = true
            $0.titleLabel?.minimumScaleFactor = 1.0
            $0.imageView?.contentMode = .scaleAspectFit
            $0.isExclusiveTouch = true
            $0.adjustsImageWhenHighlighted = false
          }(UIButton.appearance(whenContainedInInstancesOf: [UINavigationBar.self]))
        
        
        _ = {
//            $0.setTitleColor(.black, for: .normal)
            $0.titleLabel?.adjustsFontSizeToFitWidth = true
            $0.titleLabel?.minimumScaleFactor = 1.0
            $0.imageView?.contentMode = .scaleAspectFit
            $0.isExclusiveTouch = true
            $0.adjustsImageWhenHighlighted = false
          }(UIButton.appearance())
        

        _ = {
            $0.tintColor = tintColor

            $0.setTitleTextAttributes([NSAttributedString.Key.foregroundColor: tintColor,
            ], for: .normal)
            $0.setTitleTextAttributes([NSAttributedString.Key.foregroundColor: barTintColor,
            ], for: .selected)
          }(UISegmentedControl.appearance(whenContainedInInstancesOf: [UINavigationBar.self]))

        
        _ = {
            $0.tintColor = tintColor
          }(UISegmentedControl.appearance())

                
        _ = {
            $0.autoresizingMask = [.flexibleWidth, .flexibleHeight]
            $0.showsHorizontalScrollIndicator = false
            $0.keyboardDismissMode = .onDrag
            if #available(iOS 11.0, *) {
                $0.contentInsetAdjustmentBehavior = .never
            }
          }(UIScrollView.appearance())
        
        
        _ = {
            $0.separatorInset = .zero
            $0.separatorStyle = .singleLine
            $0.rowHeight = 60
            $0.backgroundColor = .groupTableViewBackground
            if #available(iOS 11.0, *) {
                $0.estimatedRowHeight = 0.0
                $0.estimatedSectionHeaderHeight = 0.0
                $0.estimatedSectionFooterHeight = 0.0
            }
          }(UITableView.appearance())
        

        _ = {
            $0.layoutMargins = .zero
            $0.separatorInset = .zero
            $0.selectionStyle = .none
            $0.backgroundColor = .white
          }(UITableViewCell.appearance())

        
        _ = {
            $0.scrollsToTop = false
            $0.isPagingEnabled = true
            $0.bounces = false
          }(UICollectionView.appearance())
        
        
        _ = {
            $0.layoutMargins = .zero
            $0.backgroundColor = .white
          }(UICollectionViewCell.appearance())
 
        
        _ = {
            $0.isUserInteractionEnabled = true
          }(UIImageView.appearance())
        
        
        _ = {
            $0.isUserInteractionEnabled = true
          }(UILabel.appearance())
        
        
        _ = {
            $0.pageIndicatorTintColor = barTintColor
            $0.currentPageIndicatorTintColor = tintColor
            $0.isUserInteractionEnabled = true
            $0.hidesForSinglePage = true
          }(UIPageControl.appearance())
        
        
        _ = {
            $0.progressTintColor = barTintColor
            $0.trackTintColor = .clear
          }(UIProgressView.appearance())
        
        
        _ = {
            $0.datePickerMode = .date
            $0.locale = Locale(identifier: "zh_CN")
            $0.backgroundColor = .white
            if #available(iOS 13.4, *) {
                $0.preferredDatePickerStyle = .wheels
            }
          }(UIDatePicker.appearance())
        
        
        _ = {
            $0.minimumTrackTintColor = tintColor
            $0.autoresizingMask = .flexibleWidth
          }(UISlider.appearance())
        
        
        _ = {
            $0.onTintColor = tintColor
            $0.autoresizingMask = .flexibleWidth
          }(UISwitch.appearance())
        
        _ = {
            $0.tintColor = barTintColor
          }(UIToolbar.appearance())
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
