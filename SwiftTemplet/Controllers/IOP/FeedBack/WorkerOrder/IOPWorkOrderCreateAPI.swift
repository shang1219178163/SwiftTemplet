//
//	IOPWorkOrderCreateAPI.swift
//	MacTemplet
//
//	Created by Shang on 2021/08/23 18:04
//	Copyright © 2021 shang. All rights reserved.
//
import Alamofire

/// 创建工单
@objcMembers class IOPWorkOrderCreateAPI: NNBaseRequestAPI {
    //标题
    var title: String = ""
    //车场编码
    var park_code: String = ""
    //问题发生时间
    var time_of_occurrence: String = ""
    //联系人
    var contact: String = ""
    //联系人手机号
    var phone: String = ""
    //车牌号
    var vpl_number: String = ""
    //问题描述
    var describe: String = ""
    //图片视频链接
    var picture: [String] = []
    //附件链接
    var annex: [String] = []
    //不传表示全部 1：处理中 ,2：已完成,3：已评价
    var state: String = ""

    override func requestURI() -> String {
        return "IOPAPIRequestURLWebWorkOrderCreate"
    }

    override func requestType() -> HTTPMethod {
        return .get
    }

    
    override func requestParams() -> [String: Any] {
        let params: [String : Any] = ["title": title,
                                           "park_code": park_code,
                                           "time_of_occurrence": time_of_occurrence,
                                           "contact": contact,
                                           "phone": phone,
                                           "vpl_number": vpl_number,
                                           "describe": describe,
                                           "picture": picture,
                                           "annex": annex,
        ]
        return params
    }

    override func validateParams() -> (Bool, String) {
        if park_code.isEmpty {
            return (false, "请选择车场");
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
