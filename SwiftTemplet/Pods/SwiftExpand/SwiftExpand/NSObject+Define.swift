//
//  NSObject+Define.swift
//  SwiftTemplet
//
//  Created by hsf on 2018/8/28.
//  Copyright © 2018年 BN. All rights reserved.
//

import UIKit

public typealias SwiftBlock = (AnyObject,AnyObject,Int);

public typealias ObjClick = ((AnyObject?) ->()) // 定义数据类型(其实就是设置别名)
public typealias ViewClick = ((UITapGestureRecognizer?,UIView,NSInteger)->()) // 定义数据类型(其实就是设置别名)
public typealias ControlClick = (UIControl) ->() // 定义数据类型(其实就是设置别名)
public typealias RecognizerClick = (UIGestureRecognizer) ->()

// MARK: - 关联属性的key
public struct RuntimeKey {
//    public static let objBlock = UnsafeRawPointer.init(bitPattern: "objBlock".hashValue)!;
//    public static let viewBlock = UnsafeRawPointer.init(bitPattern: "viewBlock".hashValue)!;
    public static let tap = UnsafeRawPointer.init(bitPattern: "tap".hashValue)!;
    public static let item = UnsafeRawPointer.init(bitPattern: "item".hashValue)!;
    public static let control = UnsafeRawPointer.init(bitPattern: "control".hashValue)!;
    public static let recognizerTap = UnsafeRawPointer.init(bitPattern: "recognizerTap".hashValue)!;
    public static let recognizerSwip = UnsafeRawPointer.init(bitPattern: "recognizerSwip".hashValue)!;
    public static let recognizerLongPress = UnsafeRawPointer.init(bitPattern: "recognizerLongPress".hashValue)!;
    public static let recognizerPan = UnsafeRawPointer.init(bitPattern: "recognizerPan".hashValue)!;
    public static let recognizerPinch = UnsafeRawPointer.init(bitPattern: "recognizerPinch".hashValue)!;
    public static let recognizerRotation = UnsafeRawPointer.init(bitPattern: "recognizerRotation".hashValue)!;
    public static let recognizerEdgPan = UnsafeRawPointer.init(bitPattern: "recognizerEdgPan".hashValue)!;
   

}

//属性RuntimeKey获取方法
public func AssociationKeyFromSelector(_ aSelector: Selector) -> UnsafeRawPointer! {
    //    let key:UnsafeRawPointer = UnsafeRawPointer.init(bitPattern: NSStringFromSelector(aSelector).hashValue)!;
    let string = NSStringFromSelector(aSelector);
    let key:UnsafeRawPointer = UnsafeRawPointer.init(bitPattern: string.hashValue)!;
    return key;
}
