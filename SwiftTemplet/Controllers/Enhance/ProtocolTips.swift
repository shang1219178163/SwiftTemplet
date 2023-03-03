//
//  ProtocolTips.swift
//  SwiftTemplet
//
//  Created by Bin Shang on 2021/6/29.
//  Copyright © 2021 BN. All rights reserved.
//

import UIKit

///模型映射描述
public extension CustomStringConvertible {
    
    var description: String {
        var result = "\n---- \(type(of: self)) ----\n"
        let mirror = Mirror(reflecting: self)
        for child in mirror.children {
            if let propertyName = child.label {
                result += "\(propertyName):\t\(child.value)\n"
            }
        }
        return result
    }
}

///映射协议
public protocol MirrorReflectingConvertible {
    
    var mirror: Mirror { get };
    
    func value(for label: String) -> Any?;
}

public extension MirrorReflectingConvertible {
    
    var mirror: Mirror{
        return Mirror(reflecting: self)
    }
    
    func value(for label: String) -> Any?{
        return mirror.children.filter { $0.label == label }.first?.value
    }
}
