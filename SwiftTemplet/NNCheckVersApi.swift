//
//  NNCheckVersApi.swift
//  SwiftTemplet
//
//  Created by Bin Shang on 2019/5/5.
//  Copyright © 2019 BN. All rights reserved.
//

import UIKit

class NNCheckVersApi: NNBaseRequestApi {
    override func requestURI() -> String {
        return "http://itunes.apple.com/cn/lookup?";
    }
    
    override func requestType() -> String {
        return kHTTPMethodGet
    }
    
    override func requestParams() -> Dictionary<String, Any> {
        return [ "id": kAppStoreID,
        ];
    }
    
    override func validateParams() -> Bool {
        return true;
    }
    
    func saveJsonOfCache(_ json: Dictionary<String, Any>?) -> Bool {
        guard let json = json else {
            return false;
        }
        NNCacheManager.shared.setObject(json, for: kCacheAppInfo);
        return false
    }
    
    func jsonFromCache() -> Dictionary<String, Any>? {
//        guard let dic = NNCacheManager.shared.object(forKey: kCacheAppInfo) else { return [String: Any] }
        if let dic = NNCacheManager.shared.object(forKey: kCacheAppInfo) as? Dictionary<String, Any> {
            return dic;
        }
        return nil
    }
    
    func clearCache() {
        NNCacheManager.shared.removeObject(forKey: kCacheAppInfo)
    }
    
}
