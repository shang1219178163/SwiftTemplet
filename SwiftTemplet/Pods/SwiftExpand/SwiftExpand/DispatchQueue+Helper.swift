//
//  DispatchQueue+Helper.swift
//  SwiftTemplet
//
//  Created by Bin Shang on 2018/12/13.
//  Copyright © 2018 BN. All rights reserved.
//

import UIKit

public extension DispatchQueue{
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
    
    public func after(_ delay: TimeInterval, execute closure: @escaping () -> Void) {
        asyncAfter(deadline: .now() + delay, execute: closure)
    }
}
