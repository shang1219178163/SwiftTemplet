//
//  Int+Helper.swift
//  SwiftTemplet
//
//  Created by dev on 2018/12/11.
//  Copyright © 2018年 BN. All rights reserved.
//

import UIKit

extension Int{
    public var isEven:Bool     {return (self % 2 == 0)}
    public var isOdd:Bool      {return (self % 2 != 0)}
    public var isPositive:Bool {return (self >= 0)}
    public var isNegative:Bool {return (self < 0)}
    public var toDouble: Double {return Double(self)}
    public var toFloat:Float   {return Float(self)}
    
    public var digits: Int {
        if (self == 0) {
            return 1
        }
//        if(Int(fabs(Double(self))) <= LONG_MAX){
        return Int(log10(fabs(Double(self)))) + 1
//        }
    }
    
    public var string: String {
        get {
            return NSNumber(integerLiteral: self).stringValue;
        }
    }

    public var number: NSNumber {
        get {
            return NSNumber(integerLiteral: self);
        }
    }
    
//    func number() -> NSNumber {
//        return NSNumber(integerLiteral: self)
//    }
    
}

extension Double{
    
    /// 保留n为小数
    public func roundedTo(_ n: Int) -> Double {
        let format = NumberFormatter()
        format.numberStyle = NumberFormatter.Style.decimal
        format.multiplier = 2
        format.roundingMode = .up
        format.maximumFractionDigits = n
        format.number(from: format.string(for: self )! )
        
        return (format.number(from: format.string(for: self )! )) as! Double
    }
    
    public var string: String {
        get {
            return NSNumber(floatLiteral: self).stringValue;
        }
    }
    
    func number() -> NSNumber {
        return NSNumber(floatLiteral: Double(self))
    }
    
}

