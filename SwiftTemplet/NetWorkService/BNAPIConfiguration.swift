//
//  BNAPIConfiguration.swift
//  SwiftTemplet
//
//  Created by Bin Shang on 2019/4/30.
//  Copyright © 2019 BN. All rights reserved.
//

import UIKit


class BNAPIConfiguration: NSObject {
    
    //正式接口
    static var apiServiceUrl: String {
        return ""
    }
    //测试接口集合
    static var urlTestList: [String]{
        return [
                "测试接口一",
                "测试接口二",
                "测试接口三",
            ];
    }
    
    //当前测试接口(必须是urlTestList成员)
    static var urlTest: String = urlTestList.first!;
    
    static var serviceURLString: String{
        var apiUrl = ""
    #if DEBUG
        apiUrl = urlTest;
    #else
        apiUrl = BNAPIConfiguration.apiServiceUrl;
    #endif
        return apiUrl;
    }
    
    static var headerUserAgent: String{
        return UIApplication.iphoneType + "," + UIApplication.phoneSystemVer ;
    }
    
    static var headerAcceptVersion: String{
        return "1.3"
    }
    
    static var timeOut: CGFloat{
        return 6.0
    }

    

}
