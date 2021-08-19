//
//  StringInterpolation+Helper.swift
//  SwiftTemplet
//
//  Created by Bin Shang on 2020/12/17.
//  Copyright © 2020 BN. All rights reserved.
//

import UIKit

public extension String.StringInterpolation {
  
    /// Interpolates a floating point value using a
    /// number formatter.
    mutating func appendInterpolation<Value: FloatingPoint>(_ number: Value, formatter: NumberFormatter) {
        if let value = number as? NSNumber,
            let string = formatter.string(from: value) {
            appendLiteral(string)
        } else {
            appendLiteral("Unformattable<\(number)>")
        }
    }
  
    /// Interpolates an integer value using a number formatter
    mutating func appendInterpolation<Value: BinaryInteger>(_ number: Value, formatter: NumberFormatter) {
        if let value = number as? NSNumber,
            let string = formatter.string(from: value) {
            appendLiteral(string)
        } else {
            appendLiteral("Unformattable<\(number)>")
        }
    }
    
    mutating func appendInterpolation(_ value: Date, _ formatter: DateFormatter) {
        appendLiteral(formatter.string(from: value))
    }
    
    mutating func appendInterpolation(localized key: String, _ args: CVarArg...) {
        let localized = String(format: NSLocalizedString(key, comment: ""), arguments: args)
        appendLiteral(localized)
    }
    
}

//public extension String.StringInterpolation {
//    
//    /// Return padded version of the value using a specified radix
//    mutating func appendInterpolation<T: BinaryInteger>(_ value: T, radix: Int = 10, prefix: Bool = false, toWidth width: Int = 0) {
//        
//        // Values are uppercased, producing `FF` instead of `ff`
//        var string = String(value, radix: radix).uppercased()
//        // Strings are pre-padded with 0 to match target widths
//        if string.count < width {
//            string = String(repeating: "0", count: max(0, width - string.count)) + string
//        }
//        
//        // Prefixes use lower case, sourced from `String.StringInterpolation.Radix`
//        if prefix {
//            var prefixStr = ""
//            switch radix {
//            case 2:
//                prefixStr = "0b"
//                
//            case 8:
//                prefixStr = "0o"
//                
//            case 16:
//                prefixStr = "0x"
//                
//            default:
//                break
//            }
//            string = prefixStr + string
//        }
//        appendInterpolation(string)
//    }
//}

