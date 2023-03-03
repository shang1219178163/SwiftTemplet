//
//  GenericViewController.swift
//  SwiftTemplet
//
//  Created by shangbinbin on 2023/3/3.
//  Copyright © 2023 BN. All rights reserved.
//

import UIKit
import HandyJSON

class GenericViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        var list: [String] = [];
        list.append("ad");
    }
    
    
    func allItemsMatch1<C1: Container, C2: Container>(some: C1, another: C2) -> Bool where C1.ItemType == C2.ItemType {

        // 检查两个Container的元素个数是否相同
        if some.count != another.count {
            return false
        }

        // 检查两个Container相应位置的元素彼此是否相等
        for i in 0..<some.count {
            if some[i] != another[i] {
                return false
            }
        }

        // 如果所有元素检查都相同则返回true
        return true
    }
    
    func allItemsMatch<C1: BoxOne, C2: BoxTwo>(some: C1, another: C2) -> Bool
        where C1.ItemType == C2.ItemType, C1.ItemType: Equatable {
        // 检查两个Container的元素个数是否相同
        if some.count != another.count {
            return false
        }

        // 检查两个Container相应位置的元素彼此是否相等
        for i in 0..<some.count {
            if some[i] != another[i] {
                return false
            }
        }
        // 如果所有元素检查都相同则返回true
        return true
    }

}


protocol BoxOne {
    associatedtype ItemType;
    mutating func append(_ item: ItemType)
    var count: Int { get }
    subscript(i: Int) -> ItemType { get }
}


protocol BoxTwo {
    associatedtype ItemType;
    mutating func append(_ item: ItemType);
    var count: Int { get }
    subscript(i: Int) -> ItemType { get }
}


struct Stack1<T>: BoxOne {
    // original Stack<T> implementation
    var items = [T]()
    mutating func push(_ item: T) {
        items.append(item)
    }
    mutating func pop() -> T {
        return items.removeLast()
    }
    // conformance to the Container protocol
    mutating func append(_ item: T) {
        self.push(item)
    }
    var count: Int {
        return items.count
    }
    subscript(i: Int) -> T {
        return items[i]
    }
}



class Tuple2<T0, T1> where T0: Comparable & Hashable, T1: Comparable & Hashable {
    
    var t0: T0;
    var t1: T1;
    
    required init(_ t0: T0, t1: T1) {
        self.t0 = t0;
        self.t1 = t1;
    }

    var description: String {
        return "(\(self.t0), \(self.t1))";
    }
    
    var hashValue: Int {
        return self.t0.hashValue ^ self.t1.hashValue;
    }
    
    static func == (lhs: Tuple2, rhs: Tuple2) -> Bool {
        return lhs.t0 == rhs.t0 && lhs.t1 == rhs.t1;
    }

}
