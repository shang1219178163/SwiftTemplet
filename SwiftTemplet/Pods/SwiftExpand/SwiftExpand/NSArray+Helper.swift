
//
//  NSArray+Helper.swift
//  SwiftTemplet
//
//  Created by hsf on 2018/9/6.
//  Copyright © 2018年 BN. All rights reserved.
//

import UIKit

public extension Array{
    
    public var random: Element? {
        if self.count == 0 {
            return nil;
        }
        let idx = Int(arc4random_uniform(UInt32(self.count)));
        return self[idx];
    }
    //弃用
    public func randomElement() -> Element? {
        return self.random;
    }
    
    public var shuffle: Array! {
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
    

    public func subarray(_ range:NSRange) -> Array {
        return self.subarray(range.location, range.length)
//        assert(range.location < self.count);
//        return Array(self[range.location...range.length]);
    }
    
    public func subarray(_ loc: Int, _ len: Int) -> Array {
        assert(loc < self.count);
        return Array(self[loc...len]);
    }

    public static func itemPrefix(prefix:String, count:Int, type:Int) -> Array! {
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
        return (marr as! Array<Element>);
    }
    
    ///添加多个相同元素到数组
    public mutating func appendSame(_ item:Element, count: Int) -> Void {
        for _ in self.enumerated() {
            append(item)
        }
    }
    
    ///添加多个相同元素到数组
    public static func appendSame(_ item:AnyObject, count: Int) -> [AnyObject] {
        var list: [AnyObject] = []
        for _ in 0..<count {
            list.append(item)
        }
        return list
    }
    
    ///模型(继承于NSObject)query对应属性为@objc声明的字符串
    public func filterModelList(_ list:[AnyObject]!, querys:[String]) -> [[String]] {
        var listArr: [[String]]?
        for e in list.enumerated() {
            var itemList:[String]?
            querys.forEach({ (query) in
                let value = e.element.value(forKeyPath: query) ?? ""
                itemList?.append(value as! String)
            })
            listArr?.append(itemList!)
        }
        return listArr!
    }
    
    ///模型(继承于NSObject)query对应属性为@objc声明的字符串
    public func filterModelList(_ list:[AnyObject], query:String) -> [String] {
        var itemList:[String] = []
        list.forEach { (obj:AnyObject) in
            
            let value = obj.value(forKeyPath: query) != nil ? obj.value(forKeyPath: query) : ""
            itemList.append(value as! String)
            
        }
        return itemList
    }
    
}

public extension NSArray{

    
    
}
