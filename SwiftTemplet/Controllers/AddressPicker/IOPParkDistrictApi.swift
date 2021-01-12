//
//  IOPParkDistrictApi.swift
//  IntelligentOfParking
//
//  Created by Bin Shang on 2020/1/2.
//  Copyright © 2020 Xi'an iRain IoT. Technology Service CO., Ltd. . All rights reserved.
//

import UIKit

/// 获取省-市-区
class IOPParkDistrictApi: NNBaseRequestApi {
    
    ///1省级 2市级 3区域级
    @objc var leveltype: String = ""
    ///父级编号
    @objc var parent: String?
        
    override func requestURI() -> String {
        return "IOPAPIRequestURLSaasParkDistrict"
    }

    override func requestType() -> String {
        return kHTTPMethodGet
    }
    
    
    override func requestParams() -> [String: Any] {
        var params: [String : Any] = ["leveltype" : leveltype,
                                            ]
        if parent != nil {
            params["parent"] = parent
        }
        return params
    }
    
    func jsonFromCache() -> [AnyHashable: Any]? {
        return NNCacheManager.shared.object(forKey: cacheKey()) as? [String : Any]
    }
    
    func saveJson(ofCache json: [String : Any]) -> Bool {
        if let cacheData = json as NSCoding? {
            NNCacheManager.shared.setObject(cacheData, for: cacheKey())
            return true
        }
        return false
    }
    
    // MARK: -funtions
    func cacheKey() -> String {
        let cacheKey = "\(self.classForCoder),\(leveltype),\(parent ?? "");"
        return cacheKey;
    }
    
    func clearCache() {
        NNCacheManager.shared.removeObject(forKey: cacheKey())
    }
    
//    override func printLog() -> Bool {
//        return true
//    }
}
