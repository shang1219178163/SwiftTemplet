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
    
}
