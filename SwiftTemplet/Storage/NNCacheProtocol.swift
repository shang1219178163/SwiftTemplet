//
//  NNCacheProtocol.swift
//  SwiftTemplet
//
//  Created by Bin Shang on 2019/4/30.
//  Copyright © 2019 BN. All rights reserved.
//

import Foundation

protocol NNCacheProtocol {
    
    ///object 必须遵守NSCoding协议
    func setObject(_ object: Any, for key: String) -> Void;
    
    func object(forKey: String) -> Any;
    
    func removeObject(forKey: String) -> Void;
    
    func clearCache() -> Void;
  
}
