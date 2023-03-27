//
//  ClosureViewController.swift
//  SwiftTemplet
//
//  Created by shangbinbin on 2023/3/15.
//  Copyright © 2023 BN. All rights reserved.
//

import UIKit

class ClosureViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        edgesForExtendedLayout = [];
        view.backgroundColor = .white;
        
        navigationItem.rightBarButtonItems = ["hide", "dismiss"].map({
            UIBarButtonItem(obj: $0) { item in
                if item.title == "hide" {
                    self.test();
                } else {
                    self.test1();
                }
            }
        })
        
        
        getData { (data) in
            print("闭包结果返回--\(data)--\(Thread.current)")
        }
    }
    
    /// 逃逸闭包
    func getData(closure: @escaping (Any) -> Void) {
        print("函数开始执行--\(Thread.current)")
        DispatchQueue.global().async {
            DispatchQueue.main.asyncAfter(deadline: DispatchTime.now()+2, execute: {
                print("执行了闭包---\(Thread.current)")
                closure("123")
            })
        }
        print("函数执行结束---\(Thread.current)")
//        函数开始执行--
//        函数执行结束---
//        执行了闭包--
//        闭包结果--
    }
    
    /// 非逃逸闭包
    func handleData(closure: (Any) -> Void) {
        print("函数开始执行--\(Thread.current)")
        print("执行了闭包---\(Thread.current)")
        closure("4456")
        print("函数执行结束---\(Thread.current)")
        
//        函数开始执行--<NSThread: 0x60000068c1c0>{number = 1, name = main}
//        执行了闭包---<NSThread: 0x60000068c1c0>{number = 1, name = main}
//        闭包结果返回--4456--<NSThread: 0x60000068c1c0>{number = 1, name = main}
//        函数执行结束---<NSThread: 0x60000068c1c0>{number = 1, name = main}
    }
    
    func test() {
        let fn = makeIncrementer();
        print(fn());
        
        let fn1 = cache();
        print(fn1("小明", "name"));
    }
    
    func test1() {
        let fn1 = cache();
        print(fn1("name", "name"));
    }
    
    func makeIncrementer() -> () -> Int {
        var runningTotal = 10
        func incrementer() -> Int {
            runningTotal += 1
            return runningTotal
        }
        return incrementer
    }

    func cache() -> (Any, String) -> [String: Any] {
        var map = [String: Any]();
        func fn(value: Any, key: String) -> [String: Any] {
            map[key] = value;
            return map
        }
        return fn
    }
}
