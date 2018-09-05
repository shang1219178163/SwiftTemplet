//
//  NSString+Helper.swift
//  SwiftTemplet
//
//  Created by hsf on 2018/8/28.
//  Copyright © 2018年 BN. All rights reserved.
//

import UIKit

extension String{
    
    func dictValue() -> Dictionary<String, Any>!{
        
        let jsonData:Data = self.data(using:.utf8)!;
        
        let dict = try? JSONSerialization.jsonObject(with: jsonData, options: .mutableContainers);
        if dict != nil {
            return dict as! Dictionary;
        }
        return Dictionary();
    }
    
    func arrayValue() -> Array<Any>!{
        
        let jsonData:Data = self.data(using: .utf8)!
        let array = try? JSONSerialization.jsonObject(with: jsonData, options: .mutableContainers)
        if array != nil {
            return array as! Array;
        }
        return Array();
        
    }
    
    
    func jsonFileToJSONString() -> String {
        assert(self.contains(".geojson") == true);
        
        if self.contains(".geojson") == true {
            let array: Array = self.components(separatedBy: ".");
            let path = Bundle.main.path(forResource: array.first, ofType: array.last);
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
    
    static func timeNow() -> String {
        let fmt = DateFormatter.dateFormat(formatStr:kFormat_date);
        let dateStr = fmt.string(from: Date());
        return dateStr;
        
    }
    
    func toTimeStamp() -> String {
        let dateStr = self;
        
        var fmtStr = kFormat_date;
        if dateStr.contains("-") && dateStr.contains(":") {
            fmtStr = kFormat_date;
            
        }
        else if dateStr.contains("-") && !dateStr.contains(":") {
            fmtStr = kFormat_date_one;
            
        }
        else if !dateStr.contains("-") && !dateStr.contains(":") {
            fmtStr = kFormat_date_two;
            
        }
        else{
            DDLog("<\(dateStr)>时间格式不对");
            
        }
        
        let fmt = DateFormatter.dateFormat(formatStr: fmtStr);
        let date = fmt.date(from: dateStr);
        
        let intervl:Double = (date?.timeIntervalSince1970)!;
        let doubleInt = Int(intervl);
        let timeStamp = String(doubleInt);
        return timeStamp;
        
    }
    
}
