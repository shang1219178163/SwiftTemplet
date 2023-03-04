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
infix operator ??=: NilCoalescingPrecedence

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
