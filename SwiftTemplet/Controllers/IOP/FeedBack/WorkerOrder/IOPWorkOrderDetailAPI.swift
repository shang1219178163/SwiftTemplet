//
//	IOPWorkOrderDetailAPI.swift
//	MacTemplet
//
//	Created by Shang on 2021/08/26 19:01
//	Copyright © 2021 shang. All rights reserved.
//


import UIKit
import Alamofire

import SwiftExpand
/// 详情
@objcMembers class IOPWorkOrderDetailAPI: NNBaseRequestAPI {
    
    public var recordID: String = ""

    override func requestURI() -> String {
//        #if DEBUG
//        return "http://wxy-lar-iopapi.kf.irainone.com/api" + IOPAPIRequestURLWorkOrderDetail(recordID)
//        #endif
        return "IOPAPIRequestURLWorkOrderDetail(recordID)"
    }
    
    override func requestType() -> HTTPMethod {
        return .get
    }
    
//        override func requestParams() -> [String: Any] {
//        let params: [String : Any] = ["parkCode" : parkCode,
//
//        ]
//        return params
//    }
//

    override func validateParams() -> (Bool, String) {
        if recordID.isEmpty {
            return (false, "id 不能为空");
        }
        return (true, "");
    }
       
//    override func isOriginDic() -> Bool {
//        return true
//    }

//    override func needLogin() -> Bool {
//        return true
//    }

    override func printLog() -> Bool {
        return true
    }
}
