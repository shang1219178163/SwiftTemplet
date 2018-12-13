//
//  DispatchQueue+Helper.swift
//  SwiftTemplet
//
//  Created by Bin Shang on 2018/12/13.
//  Copyright © 2018 BN. All rights reserved.
//

import UIKit

extension DispatchQueue{
    private static var _onceTracker = [String]();
    public class func once(token: String, block: () -> ()) {
        objc_sync_enter(self);
        defer {
            objc_sync_exit(self);
        }
        
        if _onceTracker.contains(token) {
            return;
        }

        _onceTracker.append(token);
        block();
    }
    
    func async(block: @escaping() ->()) {
        self.async(execute: block);
    }
    
    func after(time: DispatchTime, block:@escaping() -> ()) {
        self.asyncAfter(deadline: time, execute: block);
    }
}
