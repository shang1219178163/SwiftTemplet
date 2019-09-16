
//
//  NSObject+Helper.swift
//  SwiftTemplet
//
//  Created by Bin Shang on 2019/9/12.
//  Copyright © 2019 BN. All rights reserved.
//

import UIKit

public extension NSObject{

   
    
    
  
}


public extension Bundle{
    @objc static func infoDictionary(plist: String) -> [String: AnyObject]? {
        guard
            let pList = Bundle.main.path(forResource: plist, ofType: "plist"),
            let dic = NSDictionary(contentsOfFile: pList)
            else { return nil; }
        return dic as? [String : AnyObject]
    }
    
    @objc func infoFrom(plist: String, key: String) -> AnyObject? {
        guard let dic = Bundle.infoDictionary(plist: plist) else {
            return nil
        }
        return dic[key]
    }
    
}
