//
//  NNLog.swift
//  SwiftTemplet
//
//  Created by Bin Shang on 2019/4/30.
//  Copyright © 2019 BN. All rights reserved.
//

import UIKit
import SwiftExpand

class NNLog: NSObject {
    
    @objc static func logRequestURI(_ uri: String) {
        DDLog("URI: >> \(uri)");

    }
    @objc static func logParams(_ params: [String: Any]) {
        let queryStr = (params as NSDictionary).jsonString;
        DDLog(queryStr as Any);
    }
    
    @objc static func logResponseJSON(_ json: [String: Any]) {
        let queryStr = (json as NSDictionary).jsonString;
        DDLog(queryStr as Any);
    }
    
    @objc static func logRequestInfo(_ uri: String, params: [String: Any]) {
        DDLog("------------ Request Info --------------");
        logRequestURI(uri)
        logParams(params)
    }
    
    @objc static func logResponseInfo(_ uri: String, json: [String: Any]) {
        DDLog("------------ Request Info --------------");
        logRequestURI(uri)
        logResponseJSON(json)
    }
}
