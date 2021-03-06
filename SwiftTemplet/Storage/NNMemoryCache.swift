//
//  NNMemoryCache.swift
//  SwiftTemplet
//
//  Created by Bin Shang on 2019/4/30.
//  Copyright © 2019 BN. All rights reserved.
//

import UIKit
import YYCache

class NNMemoryCache: NSObject, NNCacheProtocol {
   

    var _memoryCache: YYMemoryCache?
   
    convenience init(cache: YYMemoryCache) {
        self.init()
        _memoryCache = cache;
    }
    
    //MARK: -NNCacheProtocol
    func setObject(_ object: Any, for key: String) {
        _memoryCache?.setObject((object as! NSCoding), forKey: key)
    }
    
    func object(forKey: String) -> Any {
        return _memoryCache?.object(forKey: forKey) as Any
    }
    
    func removeObject(forKey: String) {
        _memoryCache?.removeObject(forKey: forKey);
    }
    
    func clearCache() {
        _memoryCache?.removeAllObjects()
    }
    
}
