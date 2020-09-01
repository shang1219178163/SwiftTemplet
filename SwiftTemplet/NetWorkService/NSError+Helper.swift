//
//  NSError+Helper.swift
//  SwiftTemplet
//
//  Created by Bin Shang on 2019/4/30.
//  Copyright © 2019 BN. All rights reserved.
//

import UIKit

import SwiftExpand

@objc public extension NSError{
    private struct AssociateKeys {
        static var message    = "NSError" + "message"
        static var requstCode = "NSError" + "requstCode"
        static var obj        = "NSError" + "obj"
    }
    
    var message: String {
        get {
            let obj = objc_getAssociatedObject(self, &AssociateKeys.message) as! String;
            return obj;
        }
        set {
            objc_setAssociatedObject(self, &AssociateKeys.message, newValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC);
        }
    }
    
    var requstCode: Int {
        get {
            let obj = objc_getAssociatedObject(self, &AssociateKeys.requstCode) as! Int;
            return obj;
        }
        set {
            objc_setAssociatedObject(self, &AssociateKeys.requstCode, newValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC);
        }
    }
    
    var obj: Any {
        get {
            let obj = objc_getAssociatedObject(self, &AssociateKeys.obj) as Any;
            return obj;
        }
        set {
            objc_setAssociatedObject(self, &AssociateKeys.obj, newValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC);
        }
    }
    
    static func error(_ message: String, code: Int, obj: Any? = nil) -> NSError {
        let model = NSError()
        model.message = message
        model.requstCode = code
        model.obj = obj as Any
        return model;
    }
}

