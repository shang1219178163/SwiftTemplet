//
//  CAGradientLayer+Helper.swift
//  SwiftTemplet
//
//  Created by Bin Shang on 2019/2/26.
//  Copyright © 2019 BN. All rights reserved.
//

import UIKit

public extension CAGradientLayer{
    
    public static func layerRect(_ rect: CGRect, colors: [Any], start: CGPoint, end: CGPoint) -> CAGradientLayer {
        let layer = CAGradientLayer()
        layer.frame = rect
        layer.colors = colors
        layer.startPoint = start
        layer.endPoint = end
        
        return layer
    }
    
    public static func gradientColor(_ from: UIColor, to: UIColor) -> [Any] {
       return [from.cgColor, to.cgColor]
    }
    
    /// 十六进制字符串
    public static func gradientColorHex(_ from: String, fromAlpha: CGFloat, to: String, toAlpha: CGFloat) -> [Any] {
        return [UIColorHex(from, fromAlpha).cgColor, UIColorHex(to, toAlpha).cgColor]
    }
    
    /// 0x开头的十六进制数字
    public static func gradientColorHexValue(_ from: Int, fromAlpha: CGFloat, to: Int, toAlpha: CGFloat) -> [Any] {
        return [UIColorHexValue(from, fromAlpha).cgColor, UIColorHexValue(to, toAlpha).cgColor]
    }
    
    public static var defaultColors: [Any] {
        get {
            var obj = objc_getAssociatedObject(self, RuntimeKeyFromSelector(#function)) as? [Any];
            if obj == nil {
                obj = [UIColorHexValue(0x6cda53, 0.9).cgColor, UIColorHexValue(0x1a965a, 0.9).cgColor]
                objc_setAssociatedObject(self, RuntimeKeyFromSelector(#function), obj, .OBJC_ASSOCIATION_RETAIN_NONATOMIC);
            }
            return obj!;
        }
        set {
            objc_setAssociatedObject(self, RuntimeKeyFromSelector(#function), newValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC);
        }
    }
}
