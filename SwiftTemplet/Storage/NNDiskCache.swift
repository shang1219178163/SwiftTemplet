//
//  NNDiskCache.swift
//  SwiftTemplet
//
//  Created by Bin Shang on 2019/4/30.
//  Copyright © 2019 BN. All rights reserved.
//

import UIKit
import YYCache

class NNDiskCache: NSObject, NNCacheProtocol {
  
    var _diskCache: YYDiskCache?
    
    convenience init(cache: YYDiskCache) {
        self.init()
        _diskCache = cache;
    }
    
    //MARK: -NNCacheProtocol
    func setObject(_ object: Any, for key: String) {
        _diskCache?.setObject((object as! NSCoding), forKey: key)
    }
    
    func object(forKey: String) -> Any {
        return _diskCache?.object(forKey: forKey) as Any
    }
    
    func removeObject(forKey: String) -> Void {
        _diskCache?.removeObject(forKey: forKey);
    }
    
    func clearCache() -> Void {
        _diskCache?.removeAllObjects()
    }
    
}
