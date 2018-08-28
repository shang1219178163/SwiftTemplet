//
//  NSObject+Define.swift
//  SwiftTemplet
//
//  Created by hsf on 2018/8/28.
//  Copyright © 2018年 BN. All rights reserved.
//

import UIKit

typealias ObjClick = ((AnyObject?) ->()) // 定义数据类型(其实就是设置别名)
//typealias ObjClick = ((AnyObject?,Bool) ->()) // 定义数据类型(其实就是设置别名)
typealias ViewClick = ((UITapGestureRecognizer?,UIView,NSInteger)->()) // 定义数据类型(其实就是设置别名)
//typealias ViewClick = ((_ tap:UITapGestureRecognizer?, _ view:UIView, _ idx:NSInteger)->()) // 定义数据类型(其实就是设置别名)


struct RuntimeKey {
    static let objBlock = UnsafeRawPointer.init(bitPattern: "objBlock".hashValue);
    static let viewBlock = UnsafeRawPointer.init(bitPattern: "viewBlock".hashValue);
    static let tap = UnsafeRawPointer.init(bitPattern: "tap".hashValue);
    static let item = UnsafeRawPointer.init(bitPattern: "item".hashValue);

}
