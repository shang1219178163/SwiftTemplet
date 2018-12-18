//
//  NSDictionary+Helper.swift
//  SwiftTemplet
//
//  Created by hsf on 2018/9/4.
//  Copyright © 2018年 BN. All rights reserved.
//

import UIKit


extension Dictionary{
    

}

extension NSDictionary{
    
    func toJsonString() -> String! {
        let jsonString = self.jsonValue().removingPercentEncoding!;
        return jsonString;
    }
    
    
    
}
