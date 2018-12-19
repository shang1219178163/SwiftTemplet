//
//  Int+Helper.swift
//  SwiftTemplet
//
//  Created by dev on 2018/12/11.
//  Copyright © 2018年 BN. All rights reserved.
//

import UIKit

public extension Int{
    public var isEven:Bool     {return (self % 2 == 0)}
    public var isOdd:Bool      {return (self % 2 != 0)}
    public var isPositive:Bool {return (self >= 0)}
    public var isNegative:Bool {return (self < 0)}
    public var toDouble:Double {return Double(self)}
    public var toFloat:Float   {return Float(self)}
    
    public var digits: Int {
        if (self == 0) {
            return 1
        } else if(Int(fabs(Double(self))) <= LONG_MAX){
            return Int(log10(fabs(Double(self)))) + 1
        } else {
            print("Out of bounds")
            return -1;
        }
    }
    
    public var string: String {
        get {
            var str = objc_getAssociatedObject(self, AssociationKeyFromSelector(#function)) as? String;
            if str == nil {
                str = NSNumber(integerLiteral: self).stringValue;
                objc_setAssociatedObject(self, AssociationKeyFromSelector(#function), str, .OBJC_ASSOCIATION_RETAIN_NONATOMIC);
            }
            return str!;
        }
    }
    
}

extension Double{
    public func roundedTo(decimals: Int) -> Double {
        let format = NumberFormatter()
        format.numberStyle = NumberFormatter.Style.decimal
        format.multiplier = 2
        format.roundingMode = .up
        format.maximumFractionDigits = decimals
        format.number(from: format.string(for: self )! )
        
        return (format.number(from: format.string(for: self )! )) as! Double
    }
    
    public var string: String {
        get {
            var str = objc_getAssociatedObject(self, AssociationKeyFromSelector(#function)) as? String;
            if str == nil {
                str = NSNumber(floatLiteral:self).stringValue;
                objc_setAssociatedObject(self, AssociationKeyFromSelector(#function), str, .OBJC_ASSOCIATION_RETAIN_NONATOMIC);
            }
            return str!;
        }
    }
    
}

