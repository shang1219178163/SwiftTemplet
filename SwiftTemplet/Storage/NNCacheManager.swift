//
//  NNCacheManager.swift
//  SwiftTemplet
//
//  Created by Bin Shang on 2019/4/30.
//  Copyright © 2019 BN. All rights reserved.
//

import UIKit
import YYCache

class NNCacheManager: NSObject, NNCacheProtocol {
  
    var _cache: YYCache?
    var _diskCache: NNDiskCache?
    var _memoryCache: NNMemoryCache?

    static let shared = NNCacheManager()
    private override init() {
        super.init()
        _cache = YYCache(name: "DataCache")
        _diskCache = NNDiskCache(cache: _cache!.diskCache)
        _memoryCache = NNMemoryCache(cache: _cache!.memoryCache)
    }
    
    //MARK: -NNCacheProtocol
    func setObject(_ object: Any, for key: String) {
        _cache?.setObject((object as! NSCoding), forKey: key)
    }
    
    func object(forKey: String) -> Any {
        return _cache?.object(forKey: forKey) as Any
    }
    
    func removeObject(forKey: String) -> Void {
        _cache?.removeObject(forKey: forKey);
    }
    
    func clearCache() -> Void {
        _cache?.removeAllObjects()
    }
}
