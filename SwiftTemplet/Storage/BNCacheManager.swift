//
//  BNCacheManager.swift
//  SwiftTemplet
//
//  Created by Bin Shang on 2019/4/30.
//  Copyright © 2019 BN. All rights reserved.
//

import UIKit
import YYCache

class BNCacheManager: NSObject, BNCacheProtocol {
  
    var _cache: YYCache?
    var _diskCache: BNDiskCache?
    var _memoryCache: BNMemoryCache?

    static let shared = BNCacheManager()
    private override init() {
        super.init()
        _cache = YYCache(name: "DataCache")
        _diskCache = BNDiskCache(cache: _cache!.diskCache)
        _memoryCache = BNMemoryCache(cache: _cache!.memoryCache)
    }
    
    //MARK: -BNCacheProtocol
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
