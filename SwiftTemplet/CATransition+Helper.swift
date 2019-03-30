//
//  CATransition+Helper.swift
//  SwiftExpand
//
//  Created by Bin Shang on 2019/3/29.
//
import QuartzCore

public let kCATransitionCube                  = "cube";
public let kCATransitionSuckEffect            = "suckEffect";
public let kCATransitionOglFlip               = "oglFlip";
public let kCATransitionRippleEffect          = "rippleEffect";
public let kCATransitionPageCurl              = "pageCurl";
public let kCATransitionPageUnCurl            = "pageUnCurl";
public let kCATransitionCameraIrisHollowOpen  = "cameraIrisHollowOpen";
public let kCATransitionCameraIrisHollowClose = "cameraIrisHollowClose";

public let kSubTypeFuntionNames = [kCATransitionFromTop,
                                   kCATransitionFromLeft,
                                   kCATransitionFromBottom,
                                   kCATransitionFromRight];

public extension CATransition{
   
    /// [源]CATransition
    public static func animDuration(_ duration: CFTimeInterval, functionName:String!, type: String, subType: String?) -> CATransition {
        
        let anim = CATransition()
        anim.duration = duration;
       
        let name = kFunctionNames.contains(functionName) ? functionName : kFunctionNames.first;
        anim.timingFunction = CAMediaTimingFunction(name: name!);
        anim.type = type as String
        anim.subtype = subType
        return anim;
    }
    
}
