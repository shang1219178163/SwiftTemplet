//
//  EventBus.swift
//  SwiftTemplet
//
//  Created by Bin Shang on 2023/8/13.
//  Copyright © 2023 BN. All rights reserved.
//

import Foundation



class EventBus {

    var listeners: [(String, (AnyObject?) -> ())] = [];

//    func addListener(name: String, action: (_ value: AnyObject?) -> ()) {
//       self.listeners.append((name, action))
//    }
//
//    func removeListener(name: String) {
//        if let idx = listeners.indexOf({ e in return e.0 == name }) {
//            listeners.removeAtIndex(idx)
//        }
//    }
//
//    func execute(value: Int) {
//        for (_, listener) in listeners {
//            listener(value)
//        }
//    }
//
}
