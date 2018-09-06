
//
//  NSArray+Helper.swift
//  SwiftTemplet
//
//  Created by hsf on 2018/9/6.
//  Copyright © 2018年 BN. All rights reserved.
//

import UIKit

extension Array{
    
    func randomElement() -> Element {
        let idx = Int(arc4random_uniform(UInt32(self.count)));
        return self[idx];
    }
    

    public func shuffled() -> Array {
        var list = self
        for index in 0..<list.count {
            let newIndex = Int(arc4random_uniform(UInt32(list.count-index))) + index
            if index != newIndex {
                list.swapAt(index, newIndex)
            }
        }
        return list
    }
    

    func subarray(_ range:NSRange) -> Array {
        return self.subarray(range.location, range.length)
//        assert(range.location < self.count);
//        return Array(self[range.location...range.length]);
    }
    
    func subarray(_ loc: Int, _ len: Int) -> Array {
        assert(loc < self.count);
        return Array(self[loc...len]);
    }

    
}

extension NSArray{
    
    
    
}
