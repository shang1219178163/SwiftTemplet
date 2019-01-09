//
//  NSObject+Define.swift
//  SwiftTemplet
//
//  Created by hsf on 2018/8/28.
//  Copyright © 2018年 BN. All rights reserved.
//

import UIKit

public typealias SwiftClosure = (AnyObject,AnyObject,Int);

public typealias ObjClosure = ((AnyObject?) ->()) // 定义数据类型(其实就是设置别名)
public typealias ViewClosure = ((UITapGestureRecognizer?,UIView,NSInteger)->()) // 定义数据类型(其实就是设置别名)
public typealias ControlClosure = (UIControl) ->() // 定义数据类型(其实就是设置别名)
public typealias RecognizerClosure = (UIGestureRecognizer) ->()

// MARK: - 关联属性的key
public struct RuntimeKey {
    public static let tap = UnsafeRawPointer(bitPattern: "tap".hashValue)!;
    public static let item = UnsafeRawPointer(bitPattern: "item".hashValue)!;
//    public static let control = UnsafeRawPointer(bitPattern: "control".hashValue)!;

}

public func RuntimeKeyFromParams(_ obj: NSObject!, funcAbount: String!) -> UnsafeRawPointer! {
    let unique = "\(obj.hashValue)," + funcAbount
    let key:UnsafeRawPointer = UnsafeRawPointer(bitPattern: unique.hashValue)!
    return key;
}

public func RuntimeKeyFromString(_ obj: String) -> UnsafeRawPointer! {
    let key:UnsafeRawPointer = UnsafeRawPointer(bitPattern: obj.hashValue)!
    return key;
}

public func RuntimeKeyFromSelector(_ aSelector: Selector) -> UnsafeRawPointer! {
    let aSelectorName = NSStringFromSelector(aSelector);
    let key:UnsafeRawPointer = RuntimeKeyFromString(aSelectorName)
    return key;
}



