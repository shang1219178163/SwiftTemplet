//
//  UIView+Animation.swift
//  SwiftTemplet
//
//  Created by hsf on 2018/9/6.
//  Copyright © 2018年 BN. All rights reserved.
//

import UIKit

public extension UIView{
    
    public func animRotation(fromValue:Double,toValue:Double,duration:Double, repeatCount:Float,key:String?) {
        // 1.创建动画
        let rotationAnim = CABasicAnimation(keyPath: "transform.rotation.z")
        
        // 2.设置动画的属性
        rotationAnim.fromValue = fromValue;
        rotationAnim.toValue = toValue;
        rotationAnim.duration = duration;
        rotationAnim.repeatCount = repeatCount;
        // 这个属性很重要 如果不设置当页面运行到后台再次进入该页面的时候 动画会停止
        rotationAnim.isRemovedOnCompletion = false
        
        // 3.将动画添加到layer中
        self.layer.add(rotationAnim, forKey: key);
    }
    
    public func animRotation(isClockwise:Bool,_ duration:Double,_ repeatCount:Float,_ key:String?) {
        let fromValue = isClockwise == true ? 0 : Double.pi * 2;
        let toValue = isClockwise == true ? Double.pi * 2 : 0;
        self.animRotation(fromValue: fromValue, toValue: toValue, duration: duration, repeatCount: repeatCount, key: key);
    
    }
    
    public func addRotationAnim() {
        self.animRotation(fromValue: 0, toValue: Double.pi * 2, duration: Double(kDurationRotation), repeatCount: MAXFLOAT, key: nil);
        
    }
    
    
}
