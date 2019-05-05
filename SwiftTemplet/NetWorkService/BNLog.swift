//
//  BNLog.swift
//  SwiftTemplet
//
//  Created by Bin Shang on 2019/4/30.
//  Copyright © 2019 BN. All rights reserved.
//

import UIKit
import SwiftExpand

class BNLog: NSObject {
    
    @objc static func logRequestURI(_ uri: String) -> Void {
        DDLog("URI: >> %@",uri);

    }
    @objc static func logParams(_ params: [String: Any]) -> Void {
        let queryStr = (params as NSDictionary).jsonValue();
        DDLog("%@",queryStr as Any);
    }
    
    @objc static func logResponseJSON(_ json: [String: Any]) -> Void {
        let queryStr = (json as NSDictionary).jsonValue();
        DDLog("%@",queryStr as Any);
    }
    
    @objc static func logRequestInfoWithURI(_ uri: String, params: [String: Any]) -> Void {
        DDLog("------------ Request Info --------------");
        logRequestURI(uri)
        logParams(params)
    }
    
    @objc static func logResponseInfoWithURI(_ uri: String, json: [String: Any]) -> Void {
        DDLog("------------ Request Info --------------");
        logRequestURI(uri)
        logResponseJSON(json)
    }
}
