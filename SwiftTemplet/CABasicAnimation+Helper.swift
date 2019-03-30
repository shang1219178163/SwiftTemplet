//
//  CABasicAnimation+Helper.swift
//  SwiftExpand
//
//  Created by Bin Shang on 2019/3/29.
//

import QuartzCore

public let kTransformMoveX           = "transform.translation.x";// x方向平移
public let kTransformMoveY           = "transform.translation.y";// y方向平移

public let kTransformScale           = "transform.scale";//比例转化
public let kTransformScaleX          = "transform.scale.x";//宽的比例
public let kTransformScaleY          = "transform.scale.y";//高的比例

public let kTransformRotationZ       = "transform.rotation.z";
public let kTransformRotationX       = "transform.rotation.x";
public let kTransformRotationY       = "transform.rotation.y";

public let kTransformSizW            = "contentsRect.size.width";//横向拉伸缩放 (0.4)最好是0~1之间的
public let kTransformPosition        = "position";//位置(中心点的改变) [NSValue valueWithCGPoint:CGPointMake(300, 300)];
public let kTransformBounds          = "bounds";//大小，中心不变  [NSValue valueWithCGRect:CGRectMake(0, 0, 200, 200)];
public let kTransformContents        = "contents";//内容,imageAnima.toValue = (id)[UIImage imageNamed:"to"].CGImage;
public let kTransformOpacity         = "opacity";//透明度
public let kTransformCornerRadius    = "cornerRadius";//圆角
public let kTransformBackgroundColor = "backgroundColor";//背景

public let kTransformPath            = "path";//
public let kTransformStrokeEnd       = "strokeEnd";//背景

public let kFunctionNames = [
                            kCAMediaTimingFunctionLinear,//匀速
                            kCAMediaTimingFunctionEaseIn,//先慢
                            kCAMediaTimingFunctionEaseOut,//后慢
                            kCAMediaTimingFunctionEaseInEaseOut,//先慢 后慢 中间快
                            kCAMediaTimingFunctionDefault//默认
                            ];

public extension CABasicAnimation{
    
    /// [源]CABasicAnimation
    public static func animKeyPath(_ keyPath: String, duration: CFTimeInterval, autoreverses:Bool, repeatCount:Float, fillMode:String, removedOnCompletion:Bool, functionName:String!) -> CABasicAnimation {
        
        let anim = CABasicAnimation(keyPath: keyPath)
        anim.duration = duration;
        anim.repeatCount = repeatCount;
        anim.fillMode = fillMode;
        anim.isRemovedOnCompletion = removedOnCompletion;
        
        let name = kFunctionNames.contains(functionName) ? functionName : kFunctionNames.first;
        anim.timingFunction = CAMediaTimingFunction(name: name!);
        anim.isCumulative = keyPath == kTransformRotationZ;
        return anim;
    }
    
    
    /// [便捷]CABasicAnimation
    public static func animKeyPath(_ keyPath: String, duration: CFTimeInterval, autoreverses:Bool, repeatCount:Float, fromValue: Any, toValue:Any) -> CABasicAnimation {
        let anim = animKeyPath(keyPath, duration: duration, autoreverses: autoreverses, repeatCount: repeatCount, fillMode: kCAFillModeForwards, removedOnCompletion: false, functionName: kFunctionNames.first!);
        anim.fromValue = fromValue;
        anim.toValue = toValue;
        return anim;
    }
    
    /// [一次性]CABasicAnimation
    public static func animKeyPath(_ keyPath: String, duration: CFTimeInterval, fromValue: Any, toValue:Any) -> CABasicAnimation {
        let anim = animKeyPath(keyPath, duration: duration, autoreverses: false, repeatCount: 1, fillMode: kCAFillModeForwards, removedOnCompletion: false, functionName: kFunctionNames.first!);
        anim.fromValue = fromValue;
        anim.toValue = toValue;
        return anim;
    }
}
