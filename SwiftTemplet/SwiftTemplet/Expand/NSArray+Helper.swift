
//
//  NSArray+Helper.swift
//  SwiftTemplet
//
//  Created by hsf on 2018/9/6.
//  Copyright © 2018年 BN. All rights reserved.
//

import UIKit

extension Array{
    
    var random: Element? {
        if self.count == 0 {
            return nil;
        }
        let idx = Int(arc4random_uniform(UInt32(self.count)));
        return self[idx];
    }
    //弃用
    func randomElement() -> Element? {
        return self.random;
    }
    
    var shuffle: Array! {
        if self.count == 0 {
            return self;
        }
        var list = self;
        for index in 0..<list.count {
            let newIndex = Int(arc4random_uniform(UInt32(list.count-index))) + index;
            if index != newIndex {
                list.swapAt(index, newIndex);
            }
        }
        return list;
    }

    //弃用
    public func shuffled() -> Array {
        return self.shuffle;
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

   static func arrayWithItemPrefix(prefix:String, count:Int, type:Int) -> Array! {
        
        var marr:[Any] = [];
        
        for i in 0...count {
            
            let item = String(format: "%@%d", prefix,i);
            
            switch type {
            case 1:
                let image = UIImage(named: item)!;
                marr.append(image);
            default:
                marr.append(item);
            }
        }
        return marr as! Array<Element>;
    }
    
}

extension NSArray{

    
    
}
