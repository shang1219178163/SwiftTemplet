//
//  NSString+Helper.swift
//  SwiftTemplet
//
//  Created by hsf on 2018/8/28.
//  Copyright © 2018年 BN. All rights reserved.
//

import UIKit

public extension String{
    
    public func valid() -> Bool! {
        let array = ["","nil","null"];
        if array.contains(self){
            return false;
        }
        return true;
    }
    
    public func intValue() -> Int {
        return Int((self as NSString).intValue)
    }

    public func floatValue() -> Float {
        return (self as NSString).floatValue

    }

    public func doubleValue() -> Double {
        return (self as NSString).doubleValue
    }
    
    public func reverse() -> String {
        return String(self.reversed())
    }
    
    public func dictValue() -> Dictionary<String, Any>!{
        
        let jsonData:Data = self.data(using:.utf8)!;
        
        let dict = try? JSONSerialization.jsonObject(with: jsonData, options: .mutableContainers);
        if dict != nil {
            return (dict as! Dictionary);
        }
        return Dictionary();
    }
    
    public func arrayValue() -> Array<Any>!{
        
        let jsonData:Data = self.data(using: .utf8)!
        let array = try? JSONSerialization.jsonObject(with: jsonData, options: .mutableContainers)
        if array != nil {
            return (array as! Array);
        }
        return Array();
    }
    
    
    public func jsonFileToJSONString() -> String {
        assert(self.contains(".geojson") == true);
        
        if self.contains(".geojson") == true {
            let array: Array = self.components(separatedBy: ".");
            let path = Bundle.main.path(forResource: array.first, ofType: array.last);
            if path == nil {
                return "";
            }
            if let jsonData = try? Data(contentsOf: URL(fileURLWithPath: path!)) {
                
                if let jsonObj = try? JSONSerialization.jsonObject(with: jsonData, options: JSONSerialization.ReadingOptions(rawValue: 0)) {
                    let jsonString = ((jsonObj as! NSDictionary).jsonValue()!).removingPercentEncoding!;
                    print(jsonString);
                    return jsonString;
                }
                return "";
            }
            return "";
        }
        return "";
    }
    
    public static func timeNow() -> String {
        let fmt = DateFormatter.format(kDateFormat)
        let dateStr = fmt.string(from: Date());
        return dateStr;
        
    }
    
    public func toTimeStamp() -> String {
        let dateStr = self;
        
        var fmtStr = kDateFormat;
        if dateStr.contains("-") && dateStr.contains(":") {
            fmtStr = kDateFormat;
            
        }
        else if dateStr.contains("-") && !dateStr.contains(":") {
            fmtStr = kDateFormat_one;
            
        }
        else if !dateStr.contains("-") && !dateStr.contains(":") {
            fmtStr = kDateFormat_two;
            
        }
        else{
            DDLog("<\(dateStr)>时间格式不对");
            
        }
        
        let fmt = DateFormatter.format(fmtStr);
        let date = fmt.date(from: dateStr);
        
        let intervl:Double = (date?.timeIntervalSince1970)!;
        let doubleInt = Int(intervl);
        let timeStamp = String(doubleInt);
        return timeStamp;
    }
    
    
    /// 字符串本身大于string
    public func isCompareMore(_ string:String) -> Bool {
        return self.compare(string, options: .numeric, range: nil, locale: nil) == .orderedDescending
    }
  
}

extension CFString{
    
    
}
