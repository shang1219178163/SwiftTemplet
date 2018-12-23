//
//  UIGestureRecognizer+Helper.swift
//  SwiftExpand
//
//  Created by Bin Shang on 2018/12/23.
//

import Foundation

public extension UIGestureRecognizer{
    
    public var keyOfUnsafeRawPointer: UnsafeRawPointer {
        get {
            return objc_getAssociatedObject(self, AssociationKeyFromSelector(#function)) as! UnsafeRawPointer
        }
        set {
            objc_setAssociatedObject(self, AssociationKeyFromSelector(#function), newValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC);
        }
    }
    
    
}
