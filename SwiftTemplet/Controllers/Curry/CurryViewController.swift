//
//  CurryViewController.swift
//  SwiftTemplet
//
//  Created by Bin Shang on 2021/1/18.
//  Copyright © 2021 BN. All rights reserved.
//

import UIKit
import SwiftExpand

class CurryViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        let input = ["a", "b", "c"];
        let a = input.filter(containsAtSign);
        let b = input.filter(containsA("@"));
        print(a, b);
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        let a = [1, 2, 4].reduce(0, +)
        let b = [1, 2, 4].reduce(1, *)
        DDLog(a, b)

        let f = curry(myAdd)(5) // 这样就可以变为只接受一个参数的函数，
         // 可以这样来调用，并且结果是15
        DDLog(f(10))
    }
    
    public func curry<A, B, C>(_ function: @escaping ((A, B)) -> C) -> (A) -> (B) -> C {
        return { (a: A) -> (B) -> C in
                    { (b: B) -> C in
                        function((a, b))
                    }
                }
    }

    // 自定义函数
    func myAdd(a: Int, b: Int) -> Int {
        return a + b
    }
    
    // 可以绑定2、3参数的curry化函数
    private func curry2_3<A, B, C, D, E, F>(_ function: @escaping (A, B, C, D, E) -> F) -> (C, D) -> (A, B, E) -> F {
        return { c, d in { a, b, e in
            function(a, b, c, d, e) }
        }
    }
    
    func containsAtSign(_ string: String) -> Bool {
        return string.contains("@");
    }
    
    func containsA(_ substring: String) -> (String) -> Bool {
        return { str -> Bool in
            return str.contains(substring);
        }
    }
}

protocol Validator {
    func isValidName(_ string: String) -> Bool
    func isValidPwd(_ string: String) -> Bool
}

extension Validator {
    /// 密码长度验证
    func isValidName(_ string: String) -> Bool {
        return string.count > 6 && string.count < 20
    }
    
    /// 密码长度验证
    func isValidPwd(_ string: String) -> Bool {
        if string.count < 6 || string.count > 12 {
            return false
        }
        return true
    }
}
 //使用：
class NNLoginController: UIViewController, Validator {
     //想怎么用怎么用
    

}


/// 缓存函数
func cached<In: Hashable, Out>(_ f: @escaping (In) -> Out) -> (In) -> Out {
    var cache = [In: Out]()
    
    return { (input: In) -> Out in
        if let cachedValue = cache[input] {
            return cachedValue
        }
        let result = f(input)
        cache[input] = result
        return result
    }
}


class FuncCachedController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        let cachedCos = cached { (x: Double) in cos(x) }
//
//        cachedCos(.pi * 2) // value of cos for 2π is now cached
    }
}
