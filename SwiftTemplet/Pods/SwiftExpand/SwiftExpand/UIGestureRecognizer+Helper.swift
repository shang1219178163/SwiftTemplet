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
            return objc_getAssociatedObject(self, RuntimeKeyFromSelector(#function)) as! UnsafeRawPointer
        }
        set {
            objc_setAssociatedObject(self, RuntimeKeyFromSelector(#function), newValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC);
        }
    }
    
    public var funcName: String {
        get {
            return objc_getAssociatedObject(self, RuntimeKeyFromSelector(#function)) as! String
        }
        set {
            objc_setAssociatedObject(self, RuntimeKeyFromSelector(#function), newValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC);
        }
    }
}
