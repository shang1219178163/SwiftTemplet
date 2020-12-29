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
        static var requstCode = "NSError" + "code"
        static var obj        = "NSError" + "obj"
    }
    
    var message: String {
        get {
            if let obj = objc_getAssociatedObject(self, &AssociateKeys.message) as? String {
                return obj
            }
            return ""
        }
        set {
            objc_setAssociatedObject(self, &AssociateKeys.message, newValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC);
        }
    }
    
    var code: Int {
        get {
            if let obj = objc_getAssociatedObject(self, &AssociateKeys.requstCode) as? Int {
                return obj
            }
            return 0
        }
        set {
            objc_setAssociatedObject(self, &AssociateKeys.requstCode, newValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC);
        }
    }
    
    var obj: Any? {
        get {
            let obj = objc_getAssociatedObject(self, &AssociateKeys.obj)
            return obj
        }
        set {
            guard let newValue = newValue else { return }
            objc_setAssociatedObject(self, &AssociateKeys.obj, newValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC);
        }
    }
    
    static func error(_ message: String, code: Int, obj: Any? = nil) -> NSError {
        let model = NSError()
        model.message = message
        model.code = code
        model.obj = obj
        return model;
    }
}

