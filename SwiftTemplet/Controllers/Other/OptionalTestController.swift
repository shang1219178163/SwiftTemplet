//
//  OptionalTestController.swift
//  SwiftTemplet
//
//  Created by Bin Shang on 2021/7/1.
//  Copyright © 2021 BN. All rights reserved.
//

import UIKit
import SwiftExpand


enum APPError: Error {
    case login
    case tokenExpired
    case otherError(message: String, code: String? = nil)
}


class OptionalTestController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        testOptinal()
    }
    

    func testOptinal() {
        let a: String? = nil
        let b: [String]? = nil


        DDLog(a ?? "a")
        DDLog(a?.isEmpty)
        
        func defaultValue() -> Int {
            return 1111
        }

        let optional: Int? = nil
//        print("[line \(#line)]", optional.or(10))
        print("[line \(#line)]", optional.or(else: defaultValue()))
        print("[line \(#line)]", optional.or(else: {
            return 12
        }))
        
        
//        print("[line \(#line)]", a.or("10"))
//        print("[line \(#line)]", a.or(else: "11"))
        print("[line \(#line)]", a.or(else: {
            return "12"
        }))
        
//        print("[line \(#line)]", b.or(["10"]))
//        print("[line \(#line)]", b.or(else: ["11"]))
        print("[line \(#line)]", b.or(else: {
            return ["12"]
        }))

        
        let optional1: String? = "appventure"
        let optional2: String? = nil

        // 使用前
        print(optional1.map({ $0.count }) ?? 0)
        print(optional2.map({ $0.count }) ?? 0)
        
        let err: Error? = nil
        print(err ?? APPError.otherError(message: "其他错误"))
        
        
        var dic: Dictionary<String, String?> = [:]
        dic["a"] = "aa";
        print("dic:\(dic)")
        dic["a"] = nil;
        print("dic1:\(dic)")

    }
}
