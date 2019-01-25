//
//  NSObject+Define.swift
//  SwiftTemplet
//
//  Created by hsf on 2018/8/28.
//  Copyright © 2018年 BN. All rights reserved.
//

import UIKit

// 定义数据类型(其实就是设置别名)
public typealias SwiftClosure = (AnyObject, AnyObject, Int) -> Void

public typealias ObjClosure = ((AnyObject) -> Void)
public typealias ViewClosure = ((UITapGestureRecognizer?, UIView, NSInteger) -> Void)
public typealias ControlClosure = (UIControl) -> Void
public typealias RecognizerClosure = (UIGestureRecognizer) -> Void

public typealias CellForRowClosure = ((UITableView, IndexPath) -> UITableViewCell)
public typealias DidSelectRowClosure = ((UITableView, IndexPath) -> Void)

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

public func CGRectMake(_ x: CGFloat,_ y: CGFloat,_ w: CGFloat,_ h: CGFloat) -> CGRect{
    return CGRect(x: x, y: y, width: w, height: h)
}

public func CGRectMake(_ x: Double,_ y: Double,_ w: Double,_ h: Double) -> CGRect{
    return CGRect(x: x, y: y, width: w, height: h)
}

public func CGRectMake(_ x: Int,_ y: Int,_ w: Int,_ h: Int) -> CGRect{
    return CGRect(x: x, y: y, width: w, height: h)
}


