//
//  Hook.swift
//  SwiftTemplet
//
//  Created by dev on 2018/12/11.
//  Copyright © 2018年 BN. All rights reserved.
//

import UIKit

//private let onceToken = "Method Swizzling";

extension NSObject{
    
    static func swizzleMethodInstance(_ origSel:Selector, replSel:Selector) -> Bool {

        let clz:AnyClass = classForCoder();
        
        let oriMethod = class_getInstanceMethod(clz, origSel);
        let repMethod = class_getInstanceMethod(clz, replSel);
        if oriMethod == nil ||  repMethod == nil {
            print("Swizzling Method(s) not found while swizzling class \(NSStringFromClass(classForCoder())).")
            return false;
        }
        //在进行 Swizzling 的时候,需要用 class_addMethod 先进行判断一下原有类中是否有要替换方法的实现
        let didAddMethod: Bool = class_addMethod(clz, origSel, method_getImplementation(repMethod!), method_getTypeEncoding(repMethod!))
        //如果 class_addMethod 返回 yes,说明当前类中没有要替换方法的实现,所以需要在父类中查找,这时候就用到 method_getImplemetation 去获取 class_getInstanceMethod 里面的方法实现,然后再进行 class_replaceMethod 来实现 Swizzing
        if didAddMethod {
            class_replaceMethod(clz, replSel, method_getImplementation(oriMethod!), method_getTypeEncoding(oriMethod!))
        } else {
            method_exchangeImplementations(oriMethod!, repMethod!)
        }
        return true;
    }
}

