//
//  CATransaction+Helper.swift
//  SwiftExpand
//
//  Created by Bin Shang on 2019/3/29.
//
import QuartzCore

public extension CATransaction{
    
    /// [源]CATransaction动画
    public static func animDuration(_ duration: CFTimeInterval, animations: (() -> Void)?, completionBlock: (() -> Void)?) -> Void {

        CATransaction.begin()
        CATransaction.setAnimationDuration(duration)
        if animations != nil {
            animations!()
        }
        CATransaction.setCompletionBlock(completionBlock)
        CATransaction.commit()
    }
    
  
    
}
