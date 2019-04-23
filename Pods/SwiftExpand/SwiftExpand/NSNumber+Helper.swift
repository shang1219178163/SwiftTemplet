
//
//  Number+Helper.swift
//  IntelligentOfParking
//
//  Created by Bin Shang on 2018/12/22.
//  Copyright © 2018 Xi'an iRain IoT. Technology Service CO., Ltd. . All rights reserved.
//

import Foundation

/// #,##0.00
public let kNumFormat = "#,##0.00";
/// 四舍五入
public let kNumIdentify = "四舍五入";
/// 分隔符,
public let kNumIdentify_decimal = "分隔符,";
/// 百分比
public let kNumIdentify_percent = "百分比";
/// 货币$
public let kNumIdentify_currency = "货币$";
/// 科学计数法 1.234E8
public let kNumIdentify_scientific = "科学计数法 1.234E8";
/// 加号符号
public let kNumIdentify_plusSign = "加号符号";
/// 减号符号
public let kNumIdentify_minusSign = "减号符号";
/// 指数符号
public let kNumIdentify_exponentSymbol = "指数符号";

//MARK: -NumberFormatter
extension NumberFormatter{
    
    @objc public static func identify(_ identify:String = kNumIdentify) -> NumberFormatter {
        
        let dic = Thread.current.threadDictionary;
        if dic.object(forKey: identify) != nil {
            return dic.object(forKey: identify) as! NumberFormatter;
        }
        
        let fmt = NumberFormatter();
        fmt.locale = .current;
        dic.setObject(fmt, forKey: identify as NSCopying)
        return fmt;
    }
    
    @objc public static func format(_ identify:String, format: String = kNumFormat) -> NumberFormatter {
        let fmt = NumberFormatter.identify(identify);
        fmt.positiveFormat = format;
        fmt.numberStyle = .none;
        return fmt;
    }
    
    /// number为NSNumber/String
    @objc public static func numStyle(_ numberStyle:NumberFormatter.Style, number: Any) -> String? {
        if let obj = number as? NSNumber {
            return NumberFormatter.localizedString(from: obj, number: numberStyle);
        }
        
        if let obj = number as? String {
            let set = CharacterSet(charactersIn: kSetFloat).inverted
            let result = obj.components(separatedBy: set).joined(separator: "")
            if obj == result {
                return NumberFormatter.localizedString(from: NSNumber(value: obj.floatValue()), number: numberStyle);
                
            }
        }
        return ""
    }
}

//MARK: -Number
extension NSNumber{
    
//    @objc public func string() -> String{
//        return "\(self.classForCoder)"    
//    }
    
}


