
//
//  UIScreen+Helper.swift
//  SwiftTemplet
//
//  Created by Bin Shang on 2018/9/7.
//  Copyright © 2018年 BN. All rights reserved.
//

import UIKit


extension UIScreen {
    
    @objc public static var width : CGFloat {
        get {
            return UIScreen.main.bounds.size.width
        }
    }
    
    @objc public static var height : CGFloat {
        get {
            return UIScreen.main.bounds.size.height
        }
    }
    
    @objc public static var statusBarHeight : CGFloat {
        get {
            return 20.0
        }
    }
    
    @objc public static var navBarHeight : CGFloat {
        get {
            return 44.0
        }
    }
    
    @objc public static var barHeight : CGFloat {
        get {
            return (UIScreen.statusBarHeight + UIScreen.navBarHeight)
        }
    }
    
    @objc public static var tabBarHeight : CGFloat {
        get {
            return 49.0
        }
    }
}
