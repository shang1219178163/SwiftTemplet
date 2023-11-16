//
//  NNBaseRequestApi.swift
//  SwiftTemplet
//
//  Created by Bin Shang on 2019/5/5.
//  Copyright © 2019 BN. All rights reserved.
//

import UIKit
import Alamofire

@objcMembers class NNBaseRequestAPI: NNRequstManager, NNRequestManagerProtocol {


    override init() {
        super.init()
        child = self
    }
    
    func requestURI() -> String {
        return ""
    }
    
    func requestType() -> HTTPMethod {
        return .get
    }
    
    func requestParams() -> [String: Any] {
        let dic = [String: Any]()
        return dic
    }

    func validateParams() -> (Bool, String) {
        return (true, "");
    }
    
    func needLogin() -> Bool {
        return true
    }
    
    func shouldCache() -> Bool {
        return false
    }
    
    func printLog() -> Bool {
        return true
    }


}
