//
//  OperatorViewController.swift
//  SwiftTemplet
//
//  Created by Bin Shang on 2023/3/4.
//  Copyright © 2023 BN. All rights reserved.
//

import UIKit

class OperatorViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        edgesForExtendedLayout = [];
        view.backgroundColor = .white;
        
        var a: String?;
        
        let b = a ??= "99";
        print("a: \(a)");//a: Optional("99")
        print("b: \(b)");//b: 99
        
        
        var a1: UIView?;
        let b1 = a1 ??= UITableView();
        print("a1: \(a1)");//a1: Optional(<UITableView: 0x7feda0830600;
        print("b1: \(b1)");//b1: <UITableView: 0x7feda0830600
    
        
        var a2: UIView?;
        if(a2 == nil) {
            a2 = UITableView();
        }
        let b2 = a2;
        print("a2: \(a2)");//a1: Optional(<UITableView: 0x7feda0830600;
        print("b2: \(b2)");//b1: <UITableView: 0x7feda0830600
        
        let c = "abc"*0;
        print("c: \(c)");//c: abcabcabc
        
        let edg1 = UIEdgeInsets(top: 1, left: 2, bottom: 3, right: 4);
        let edg2 = UIEdgeInsets(top: 4, left: 3, bottom: 2, right: 1);
        
        let e = edg1 + edg2;
//        print("edg1: \(edg1)");//edg1: UIEdgeInsets(top: 1.0, left: 2.0, bottom: 3.0, right: 4.0)
//        print("edg2: \(edg2)");//edg2: UIEdgeInsets(top: 4.0, left: 3.0, bottom: 2.0, right: 1.0)
        print("e: \(e)");//e: UIEdgeInsets(top: 5.0, left: 5.0, bottom: 5.0, right: 5.0)
        
        
//        testHightFunc();
//        testUrl();
    }
    
    func testUrl() {
//        let urlStr: String? = "https://github.com/wangyanchang21"
        let urlStr: String? = nil;
        urlStr.flatMap(URL.init).map(loadURL);
    }
    
    func loadURL(url: URL) {
        print("url.absoluteString: \(url.absoluteString)")
    }
    
    
    func testHightFunc() {
        let latticeNumbers = [[1, Optional(2), 3], [3, nil, 5]]
        // 解析首层元素, 若没有nil, 则会降维
        let flatMapArr = latticeNumbers.flatMap { $0 }
        print("flatMapArr: \(flatMapArr)");//flatMapArr: [Optional(1), Optional(2), Optional(3), Optional(3), nil, Optional(5)]
        let compactMapArr = flatMapArr.compactMap { $0 }
        print("compactMapArr: \(compactMapArr)");//compactMapArr: [1, 2, 3, 3, 5]


        let titles = ["aaa", "bbb", "ccc", "ddd"]
        let numbers = [111, 222, 333]
        let zipA = zip(titles, numbers)
        for (title, num) in zipA {
            print("\(title)-\(num)")
        }
    }
}



//precedencegroup NilEqualPrecedence {
//  /// 优先从左向右， left, right or none
//  associativity: left
//  higherThan: MultiplicationPrecedence//优先级，比乘法运算高
//  // lowerThan: AdditionPrecedence // 优先级, 比加法运算低
//  assignment: true // 是否是赋值运算
//}


//infix operator ??=: AssignmentPrecedence
infix operator ??=: NilCoalescingPrecedence;

func ??= <T>(lhs: inout T?, rhs: T) -> T {
    if lhs == nil {
        lhs = rhs;
    }
    return lhs!;
 }


//infix operator ± : AdditionPrecedence
//func ± <T: Numeric>(lhs: T, rhs: T) -> (T, T) {
//    return (lhs + rhs, lhs - rhs)
//}


public extension String{

    static func * (lhs: String, rhs: Int) -> String {
        return String(repeating: lhs, count: rhs);
     }
}


extension UIEdgeInsets{

    static func + (lhs: UIEdgeInsets, rhs: UIEdgeInsets) -> UIEdgeInsets {
        return UIEdgeInsets(lhs.top + rhs.top,
                            lhs.left + rhs.left,
                            lhs.bottom + rhs.bottom,
                            lhs.right + rhs.right
        );
     }
}


/// 自定义级联运算符
infix operator ..: AssignmentPrecedence;

func .. <T: AnyObject>(lhs: inout T, rhs: (ReferenceWritableKeyPath<AnyObject, T>, T)) -> T {
    lhs[keyPath: rhs.0] = rhs.1;
    return lhs;
 }


//func .. <T: AnyObject>(lhs: inout T,
//                       rhs: (property: ReferenceWritableKeyPath<AnyObject, T>, value: T)) -> T {
//    lhs[keyPath: rhs.property] = rhs.value;
//    return lhs;
// }
