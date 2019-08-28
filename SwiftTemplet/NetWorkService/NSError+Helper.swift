//
//  NSError+Helper.swift
//  SwiftTemplet
//
//  Created by Bin Shang on 2019/4/30.
//  Copyright © 2019 BN. All rights reserved.
//

import UIKit

import SwiftExpand

public extension NSError{
    
    @objc var message: String {
        get {
            let obj = objc_getAssociatedObject(self, RuntimeKeyFromSelector(#function)) as! String;
            return obj;
        }
        set {
            objc_setAssociatedObject(self, RuntimeKeyFromSelector(#function), newValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC);
        }
    }
    
    @objc var requstCode: Int {
        get {
            let obj = objc_getAssociatedObject(self, RuntimeKeyFromSelector(#function)) as! Int;
            return obj;
        }
        set {
            objc_setAssociatedObject(self, RuntimeKeyFromSelector(#function), newValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC);
        }
    }
    
    @objc var obj: Any {
        get {
            let obj = objc_getAssociatedObject(self, RuntimeKeyFromSelector(#function)) as Any;
            return obj;
        }
        set {
            objc_setAssociatedObject(self, RuntimeKeyFromSelector(#function), newValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC);
        }
    }
    
    static func error(_ message: String, code: Int, obj: Any? = nil) -> NSError {
        let model = NSError()
        model.message = message
        model.requstCode = code
        model.obj = obj
        return model;
    }
}

