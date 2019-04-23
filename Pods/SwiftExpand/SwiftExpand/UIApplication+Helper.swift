//
//  UIApplication+Helper.swift
//  SwiftTemplet
//
//  Created by Bin Shang on 2018/8/24.
//  Copyright © 2018年 BN. All rights reserved.
//

import UIKit

extension UIApplication{
    
    @objc public static var appName: String {
        get {
            let infoDic = Bundle.main.infoDictionary;
//            let name:String = infoDic!["CFBundleDisplayName"] as? String ?? infoDic!["CFBundleName"] as! String;
            let name:String = infoDic![kCFBundleNameKey as String] != nil ? infoDic![kCFBundleNameKey as String] as! String : infoDic![kCFBundleExecutableKey as String] as! String;
            return name;
        }
    }
    
    @objc public static var appIcon: UIImage {
        get {
            let infoDic:AnyObject = Bundle.main.infoDictionary as AnyObject;
            let iconFiles:Array<Any> = infoDic.value(forKeyPath: "CFBundleIcons.CFBundlePrimaryIcon.CFBundleIconFiles") as! Array<Any>;
            let imgName:String = iconFiles.last as! String;
            return  UIImage(named: imgName)!;
        }
    }
    
    @objc public static var appVer: String {
        get {
            let infoDic = Bundle.main.infoDictionary;
            return infoDic!["CFBundleShortVersionString"] as! String;
        }
    }
    
    @objc public static var appBuild: String {
        get {
            let infoDic = Bundle.main.infoDictionary;
            return infoDic!["CFBundleVersion"] as! String;
        }
    }
    
    @objc public static var phoneSystemVer: String {
        get {
            return UIDevice.current.systemVersion;
        }
    }
    
    @objc public static var phoneSystemName: String {
        get {
            return UIDevice.current.systemName;
        }
    }
    
    @objc public static var phoneName: String {
        get {
            return UIDevice.current.name;
        }
    }
    
    @objc public static var mainWindow: UIWindow {
        get {
            var window = objc_getAssociatedObject(self, RuntimeKeyFromSelector(#function)) as? UIWindow;
            if window == nil {
                window = UIWindow(frame: UIScreen.main.bounds)
                
                objc_setAssociatedObject(self, RuntimeKeyFromSelector(#function), window, .OBJC_ASSOCIATION_RETAIN_NONATOMIC);
            }
            window!.backgroundColor = UIColor.white
            window!.makeKeyAndVisible()
            return window!;
        }
        set {
            objc_setAssociatedObject(self, RuntimeKeyFromSelector(#function), newValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC);
        }
    }
    
//    @objc public static var mainWindow: UIWindow {
//        get {
//            let app = UIApplication.shared.delegate as! AppDelegate;
//            if app.window != nil {
//                app.window!.backgroundColor = .white;
//                app.window!.makeKeyAndVisible();
//                return app.window!;
//            }
//            app.window = UIWindow.init(frame: UIScreen.main.bounds);
//            app.window?.backgroundColor = .white;
//            app.window?.makeKeyAndVisible();
//            return app.window!;
//        }
//        set {
//            let app = UIApplication.shared.delegate as! AppDelegate;
//            app.window = newValue;
//
//        }
//    }
    
    @objc public static var rootController: UIViewController {
        get {
            return UIApplication.mainWindow.rootViewController!;
        }
        set {
            UIApplication.mainWindow.rootViewController = newValue;
        }
    }
    
    @objc public static var tabBarController: UITabBarController? {
        get {
            var tabBarVC = objc_getAssociatedObject(self, RuntimeKeyFromSelector(#function)) as? UITabBarController;
            if tabBarVC == nil {
                if UIApplication.mainWindow.rootViewController is UITabBarController {
                    tabBarVC = (UIApplication.mainWindow.rootViewController as! UITabBarController);
                }
            }
            return tabBarVC;
        }
        set {
            objc_setAssociatedObject(self, RuntimeKeyFromSelector(#function), newValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC);
        }
    }
    
    //MARK: func
    public static func setupRootController(_ window:inout UIWindow,_ controller:AnyObject,_ isAdjust:Bool) -> Void {
        window = UIApplication.mainWindow;
        UIApplication.setupRootController(controller, isAdjust);
    }
    
    @objc public static func setupRootController(_ controller:AnyObject,_ isAdjust:Bool) -> Void {
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
        } else {
            UIApplication.rootController = UINavigationController(rootViewController: contr as! UIViewController);
        }
    }
    
    @objc public static func setupRootController(_ controller:AnyObject) -> Void {
        return UIApplication.setupRootController(controller, true);
    }
    
    ///默认风格是白色导航栏黑色标题
    @objc public static func setupAppearanceDefault(_ isDefault: Bool = true) -> Void {
        let barTintColor: UIColor = isDefault ? UIColor.white : UIColor.theme
        setupAppearanceNavigationBar(barTintColor)
        setupAppearanceScrollView()
        setupAppearanceOthers();

    }
    
    /// 配置UIScrollView默认值
    @objc public static func setupAppearanceScrollView() -> Void {
        UITableView.appearance().separatorStyle = .singleLine;
        UITableView.appearance().separatorInset = .zero;
        UITableView.appearance().rowHeight = 60;
        
        UITableViewCell.appearance().layoutMargins = .zero;
        UITableViewCell.appearance().separatorInset = .zero;
        UITableViewCell.appearance().selectionStyle = .none;
        
        UIScrollView.appearance().keyboardDismissMode = .onDrag;
        
        if #available(iOS 11.0, *) {
            UITableView.appearance().estimatedRowHeight = 0.0;
            UITableView.appearance().estimatedSectionHeaderHeight = 0.0;
            UITableView.appearance().estimatedSectionFooterHeight = 0.0;
            
            UICollectionView.appearance().contentInsetAdjustmentBehavior = .never;
            UIScrollView.appearance().contentInsetAdjustmentBehavior = .never;
        }
    }
    
    @objc public static func setupAppearanceOthers() -> Void {
        UIButton.appearance().isExclusiveTouch = false;

        UITabBar.appearance().tintColor = UIColor.theme;
        UITabBar.appearance().barTintColor = UIColor.white;
        UITabBar.appearance().isTranslucent = false;
        
        if #available(iOS 10.0, *) {
            UITabBar.appearance().unselectedItemTintColor = UIColor.gray;
        }
        UITabBarItem.appearance().titlePositionAdjustment = UIOffset(horizontal: 0, vertical: -5.0)
    }
    
    /// 配置UINavigationBar默认值
    @objc public static func setupAppearanceNavigationBar(_ barTintColor: UIColor) -> Void {
        let isDefault: Bool = UIColor.white.equalTo(barTintColor);
        let tintColor = isDefault ? UIColor.black : UIColor.white;
        
        UINavigationBar.appearance().tintColor = tintColor;
        UINavigationBar.appearance().barTintColor = barTintColor;
        UINavigationBar.appearance().setBackgroundImage(UIImageColor(barTintColor), for: UIBarPosition.any, barMetrics: .default)
        UINavigationBar.appearance().shadowImage = UIImageColor(barTintColor);
        
        let attDic = [NSAttributedString.Key.foregroundColor :   tintColor,
//                      NSAttributedString.Key.font    :   UIFont.boldSystemFont(ofSize:18)
                    ];
        UINavigationBar.appearance().titleTextAttributes = attDic;
//
//        let dicNomal = [NSAttributedStringKey.foregroundColor: UIColor.white,
//        ]
//        UIBarButtonItem.appearance().setTitleTextAttributes(dicNomal, for: .normal)
    }
    
    @objc public static func setupAppearanceTabBar() -> Void {
        //         设置字体颜色
//        let attDic_N = [NSAttributedString.Key.foregroundColor:.black];
//        let attDic_H = [NSAttributedString.Key.foregroundColor: UIColor.theme];
////        UITabBarItem.appearance().setTitleTextAttributes(attDic_N, for: .normal);
//        UITabBarItem.appearance().setTitleTextAttributes(attDic_H, for: .selected);
        // 设置字体偏移
        UITabBarItem.appearance().titlePositionAdjustment = UIOffset.init(horizontal: 0, vertical: -5.0);
        // 设置图标选中时颜色
//        UITabBar.appearance().tintColor = .red;
    }
    
    @objc public static func openURL(_ urlStr:String, _ tips:String) {
        let set = NSCharacterSet(charactersIn: "!*'();:@&=+$,/?%#[]").inverted;
        let str:String = urlStr.addingPercentEncoding(withAllowedCharacters: set)!;
        //        let str:String = urlStr.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)!;
        
        let url:NSURL? = NSURL(string:str);
        if UIApplication.shared.canOpenURL(url! as URL) {
            if #available(iOS 10.0, *) {
                UIApplication.shared.open(url! as URL, options: [:], completionHandler: nil)
            } else {
                UIApplication.shared.openURL(url! as URL);
                
            }
        } else {
            print("链接无法打开!!!\n%@",url as Any);
            
        }
    }
}
