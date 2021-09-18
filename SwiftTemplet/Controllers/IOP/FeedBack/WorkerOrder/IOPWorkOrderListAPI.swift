//
//	IOPWorkOrderListAPI.swift
//	MacTemplet
//
//	Created by Shang on 2021/08/26 18:33
//	Copyright © 2021 shang. All rights reserved.
//


import UIKit
import Alamofire

import SwiftExpand

/// 列表
@objcMembers class IOPWorkOrderListAPI: NNBaseRequestAPI {
    ///工单名称
    var title: String?
    
    var start_time: String = DateFormatter.stringFromDate(Date().adding(-30), fmt: kDateFormatDay)
    
    var end_time: String = DateFormatter.stringFromDate(Date(), fmt: kDateFormatDay)
    
    var park_code: String?
    ///不传表示全部 0 未处理 1：处理中 ,2：已完成, 3：已评价
    var state: String?

    var pageModel = NNPageModel(limit: 30)

    override func requestURI() -> String {
//        #if DEBUG
//        return "http://wxy-lar-iopapi.kf.irainone.com/api" + IOPAPIRequestURLWorkOrder
//        #endif
        return "IOPAPIRequestURLWorkOrder"
    }
    
    override func requestType() -> HTTPMethod {
        return .get
    }
    
    override func requestParams() -> [String: Any] {
        var params: [String: Any] = ["page" : pageModel.currPage,
                                           "limit": pageModel.limit,
                                           "start_time": start_time,
                                           "end_time": end_time,
        ]
        
        if let title = title, title.isEmpty == false {
            params["title"] = title
        }
        if let park_code = park_code, park_code.isEmpty == false {
            params["park_code"] = park_code
        }
        
        if let state = state, state.isEmpty == false {
            params["state"] = state
        }
        return params
    }
    
    override func validateParams() -> Bool {
        if let title = title, title.isEmpty == false, title.count < 2 {
            NNProgressHUD.showError("最少需要输入两个字才能搜索哦！")
            return false;
        }
        if start_time.count < 10 {
            NNProgressHUD.showText("起始时间无效")
            return false;
        }
        if start_time.count < 10 {
            NNProgressHUD.showText("起始时间无效")
            return false;
        }
        if end_time.count < 10 {
            NNProgressHUD.showText("截止时间无效")
            return false;
        }
        return true;
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
