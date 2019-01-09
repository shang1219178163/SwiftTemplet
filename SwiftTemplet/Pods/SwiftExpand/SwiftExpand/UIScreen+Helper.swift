
//
//  UIScreen+Helper.swift
//  SwiftTemplet
//
//  Created by hsf on 2018/9/7.
//  Copyright © 2018年 BN. All rights reserved.
//

import UIKit


public extension UIScreen {
    
    public static var width : CGFloat {
        get {
            return UIScreen.main.bounds.size.width
        }
    }
    
    public static var height : CGFloat {
        get {
            return UIScreen.main.bounds.size.height
        }
    }
    
    public static var statusBarHeight : CGFloat {
        get {
            return 20.0
        }
    }
    
    public static var navBarHeight : CGFloat {
        get {
            return 44.0
        }
    }
    
    public static var barHeight : CGFloat {
        get {
            return (UIScreen.statusBarHeight + UIScreen.navBarHeight)
        }
    }
    
    public static var tabBarHeight : CGFloat {
        get {
            return 49.0
        }
    }
    
  
    
}
