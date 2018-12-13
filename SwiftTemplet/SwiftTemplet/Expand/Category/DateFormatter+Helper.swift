
//
//  NSDateFormatter+Helper.swift
//  SwiftTemplet
//
//  Created by hsf on 2018/8/28.
//  Copyright © 2018年 BN. All rights reserved.
//

import UIKit
import Foundation


let D_MINUTE = 60 ;
let D_HOUR   = 3600 ;
let D_DAY    = 86400 ;
let D_WEEK   = 604800 ;
let D_YEAR   = 31556926 ;

let kFormat_date = "yyyy-MM-dd HH:mm:ss";
let kFormat_date_one = "yyyy-MM-dd";
let kFormat_date_two = "yyyyMMdd";


extension DateFormatter{
    
    static func dateFormat(formatStr:String) -> DateFormatter {
        
        let dic = Thread.current.threadDictionary;
        if dic.object(forKey: formatStr) != nil {
            return dic.object(forKey: formatStr) as! DateFormatter;
        }

        let fmt = DateFormatter();
        fmt.dateFormat = formatStr;
        fmt.locale = .current;
        fmt.timeZone = NSTimeZone.local;
        dic.setObject(fmt, forKey: formatStr as NSCopying)
        return fmt;
    }
    
}
