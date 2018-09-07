//
//  NSObject+Define.swift
//  SwiftTemplet
//
//  Created by hsf on 2018/8/28.
//  Copyright © 2018年 BN. All rights reserved.
//

import UIKit

typealias SwiftBlock = (AnyObject,AnyObject,Int);

typealias ObjClick = ((AnyObject?) ->()) // 定义数据类型(其实就是设置别名)
typealias ViewClick = ((UITapGestureRecognizer?,UIView,NSInteger)->()) // 定义数据类型(其实就是设置别名)
//typealias ViewClick = ((_ tap:UITapGestureRecognizer?, _ view:UIView, _ idx:NSInteger)->()) // 定义数据类型(其实就是设置别名)

// MARK: - 关联属性的key
struct RuntimeKey {
//    static let objBlock = UnsafeRawPointer.init(bitPattern: "objBlock".hashValue)!;
//    static let viewBlock = UnsafeRawPointer.init(bitPattern: "viewBlock".hashValue)!;
    static let tap = UnsafeRawPointer.init(bitPattern: "tap".hashValue)!;
    static let item = UnsafeRawPointer.init(bitPattern: "item".hashValue)!;

}

//属性RuntimeKey获取方法
func AssociationKeyFromSelector(_ aSelector: Selector) -> UnsafeRawPointer! {
    //    let key:UnsafeRawPointer = UnsafeRawPointer.init(bitPattern: NSStringFromSelector(aSelector).hashValue)!;
    let string = NSStringFromSelector(aSelector);
    let key:UnsafeRawPointer = UnsafeRawPointer.init(bitPattern: string.hashValue)!;
    return key;
}


