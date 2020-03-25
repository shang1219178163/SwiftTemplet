//
//  NNBaseRequestApi.swift
//  SwiftTemplet
//
//  Created by Bin Shang on 2019/5/5.
//  Copyright © 2019 BN. All rights reserved.
//

import UIKit

class NNBaseRequestApi: NNRequstManager, NNRequestManagerProtocol {

    
  
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
    
    func requestParams() -> [String : Any] {
        let dic:[String : Any] = [:]
        return dic;
    }

    func validateParams() -> Bool {
        return true;
    }
    
    func printLog() -> Bool {
        return true;
    }


}
