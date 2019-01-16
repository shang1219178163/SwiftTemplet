
//
//  UIColor+Helper.swift
//  SwiftTemplet
//
//  Created by hsf on 2018/8/24.
//  Copyright © 2018年 BN. All rights reserved.
//

import UIKit

public extension UIColor{
    
    //MARK: - -属性
    public static var random : UIColor {
        get{
            return UIColor.randomColor();
        }
    }
    
    public static var theme : UIColor {
        get{
            var color = objc_getAssociatedObject(self, RuntimeKeyFromSelector(#function)) as? UIColor;
            color = color ?? UIColor.orange
//            return UIColor.hex("#0082e0");
//            return UIColor.orange;
            return color!;
        }
        set{
            objc_setAssociatedObject(self, RuntimeKeyFromSelector(#function), newValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC);

        }
    }
        
    public static var background : UIColor {
        get{
            return UIColor.hex("#E9E9E9");
        }
    }
    
    public static var line : UIColor {
        get{
            return UIColor.hex("#e0e0e0");
        }
    }
    
    public static var btnN : UIColor {
        get{
            return UIColor.hex("#fea914");
        }
    }
    
    public static var btnH : UIColor {
        get{
            return UIColor.hex("#f1a013");
        }
    }
    
    public static var btnD : UIColor {
        get{
            return UIColor.hex("#999999");
        }
    }
    
    public static var excel : UIColor {
        get{
            return UIColor(red: 238/255.0, green: 238/255.0, blue: 238/255.0, alpha: 1.0);
        }
    }
    
    //MARK:  -项目定制
    public static var textColorTitle : UIColor {
        get{
            return UIColor.hex("#333333");
        }
    }
    
    public static var textColorSub : UIColor {
        get{
            return UIColor.hex("#999999");
        }
    }
    
    //MARK: - -方法
    public static func hex(_ hex:String) -> UIColor {
        var cString = hex.trimmingCharacters(in: CharacterSet.whitespaces).uppercased();
        if cString.hasPrefix("#") {
            let index = cString.index(cString.startIndex, offsetBy:1);
            cString = String(cString[index...]);
        }
        
        if cString.count != 6 {
            return .red;
        }
        
        let rIndex = cString.index(cString.startIndex, offsetBy: 2);
        let rString = String(cString[..<rIndex]);
        
        let otherString = String(cString[rIndex...]);
        let gIndex = otherString.index(otherString.startIndex, offsetBy: 2);
        let gString = String(otherString[..<gIndex]);
        
        let bIndex = cString.index(cString.endIndex, offsetBy: -2);
        let bString = String(cString[bIndex...]);
        
        var r:CUnsignedInt = 0, g:CUnsignedInt = 0, b:CUnsignedInt = 0
        Scanner(string: rString).scanHexInt32(&r);
        Scanner(string: gString).scanHexInt32(&g);
        Scanner(string: bString).scanHexInt32(&b);
        
        //        print(hex,rString,gString,bString,otherString)
        return UIColor(red:CGFloat(r)/255.0, green: CGFloat(g)/255.0, blue: CGFloat(b)/255.0, alpha: CGFloat(1.0));
    }
    
    public static func randomColor() -> UIColor {
        let r = arc4random_uniform(256);
        let g = arc4random_uniform(256);
        let b = arc4random_uniform(256);
        return UIColor(red:CGFloat(r)/255.0, green: CGFloat(g)/255.0, blue: CGFloat(b)/255.0, alpha: CGFloat(1.0));
    }
    
}

