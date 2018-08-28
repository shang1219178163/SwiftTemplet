//
//  NSString+Helper.swift
//  SwiftTemplet
//
//  Created by hsf on 2018/8/28.
//  Copyright © 2018年 BN. All rights reserved.
//

import UIKit

extension String{
    
    
    
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
