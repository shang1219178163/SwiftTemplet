//
//  PasswordStrengthCheckSwiftController.swift
//  SwiftTemplet
//
//  Created by Bin Shang on 2021/4/19.
//  Copyright © 2021 BN. All rights reserved.
//

import UIKit
import SwiftExpand

class PasswordStrengthCheckSwiftController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        test()
    }
    
    func test() {
        var a: String = "12345678q"
        var b: String = "12345678Q"
        var c: String = "12345678qQ"
        var d: String = "12345678qQ."
        var a1 = a.passwordLevel
        var b1 = b.passwordLevel
        var c1 = c.passwordLevel
        var d1 = d.passwordLevel
        DDLog("a1:", a1)
        DDLog("b1:", b1)
        DDLog("c1:", c1)
        DDLog("d1:", d1)
    }

}

public extension String {
    
    /// 密码强度检测 (包含大小写字母、英文符号、数字四种类型中的种类数量)
    var passwordLevel: Int {
        var regex: String = "^(?=.\\d)(?=.[a-zA-Z0-9]).{8,16}$"
        var predicate = NSPredicate(format: "SELF MATCHES %@", regex)
        if !predicate.evaluate(with: self) {
            return 0
        }
        
        var index: Int = 0
        regex = ".*[0-9]+.*"
        predicate = NSPredicate(format: "SELF MATCHES %@", regex)
        if predicate.evaluate(with: self) {
            index += 1
        }
        
        regex = ".*[a-z]+.*"
        predicate = NSPredicate(format: "SELF MATCHES %@", regex)
        if predicate.evaluate(with: self) {
            index += 1
        }
        
        regex = ".*[A-Z]+.*"
        predicate = NSPredicate(format: "SELF MATCHES %@", regex)
        if predicate.evaluate(with: self) {
            index += 1
        }
        
        regex = ".*[\\x21-\\x2f\\x3a-\\x40\\x5b-\\x60\\x7B-\\x7E]+.*"
        predicate = NSPredicate(format: "SELF MATCHES %@", regex)
        if predicate.evaluate(with: self) {
            index += 1
        }
        return index
    }
}
