//
//  BaseProtocol.swift
//  ExtensionProtocol
//
//  Created by hsf on 2018/9/17.
//  Copyright © 2018年 pgq. All rights reserved.
//

import UIKit

/// 新建一个协议
public protocol BaseTypeAble {
    /// 关联类型
    associatedtype WarpperType;
    var type: WarpperType { get };
}

/// 定义一个类
public final class ExtensionBaseTypeAble<T>: BaseTypeAble {
    /// 泛型
    public let type: T;
    /// 构造方法
    public init(_ type: T) {
        self.type = type;
    }
}

/// 为协议实现默认方法
public extension BaseTypeAble where WarpperType == UIColor{
    /// 获取红色
    public func red() -> CGFloat {
        var value: CGFloat = 0
        type.getRed(&value, green: nil, blue: nil, alpha: nil)
        return value
    }
    /// 获取绿色
    public func green() -> CGFloat {
        var value: CGFloat = 0
        type.getRed(nil, green: &value, blue: nil, alpha: nil)
        return value
    }
    /// 获取蓝色
    public func blue() -> CGFloat {
        var value: CGFloat = 0
        type.getRed(nil, green: nil, blue: &value, alpha: nil)
        return value
    }
}

public extension UIColor{
    public var type: ExtensionBaseTypeAble<UIColor> {
        return ExtensionBaseTypeAble(self);
    }
    
}

public extension BaseTypeAble where WarpperType == Data{
    
    public func toUInt8() -> [UInt8] {
        var bytes = [UInt8](repeatElement(0, count: type.count));
        type.copyBytes(to: &bytes, count: type.count);
        return bytes;
    }
    
    public func toHex() -> String {
        var hex: String = "";
        for i in 0..<toUInt8().count {
            hex.append(String(format: "%02x", type[i]) as String);
            if (i + 1) % 4 == 0 {
                hex.append(" ");
            }
        }
        return hex;
    }
}

public extension Data{
    public var type: ExtensionBaseTypeAble<Data> {
        return ExtensionBaseTypeAble(self);
    }
    
}
