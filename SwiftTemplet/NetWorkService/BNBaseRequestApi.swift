//
//  BNBaseRequestApi.swift
//  SwiftTemplet
//
//  Created by Bin Shang on 2019/5/5.
//  Copyright © 2019 BN. All rights reserved.
//

import UIKit

class BNBaseRequestApi: BNRequstManager, BNRequestManagerProtocol {
  
    override init() {
        super.init()
        child = self;
    }
    
    func requestURI() -> String {
        return "";
    }
    
    func requestType() -> String {
        return kRequestGET;
    }
    
    func requestParams() -> Dictionary<String, Any> {
        let dic: Dictionary<String, Any> = [:]
        return dic;
    }
    
    func validateParams() -> Bool {
        return true;
    }
    
    

}
