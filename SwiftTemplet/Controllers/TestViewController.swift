//
//  TestViewController.swift
//  SwiftTemplet
//
//  Created by Bin Shang on 2019/8/20.
//  Copyright © 2019 BN. All rights reserved.
//

import UIKit
import SwiftExpand

class TestViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
//        DDLog(NSArray.range(0, 10, 1));
//        DDLog(NSArray.range(1, 11, 1));
//        DDLog(NSArray.range(0, 30, 5));
//        DDLog(NSArray.range(-10, 0, 1));

        DDLog("\("小刚".transformToPinyin())")
        DDLog("\("韩梅梅".transformToPinyin())")

        let array = [1,2,3,4,5,6,7]
        let list = array.shuffled()
        DDLog(list)
        array.randomElement()
    }
    
    
}

public extension String{
    func transformToPinyin() -> String {
        let chinese: String = self;
        let mutableStr = NSMutableString(string: chinese) as CFMutableString
        let canTransform: Bool = CFStringTransform(mutableStr, nil, kCFStringTransformToLatin, false) &&
            CFStringTransform(mutableStr, nil, kCFStringTransformStripCombiningMarks, false);
        if canTransform == true {
            return mutableStr as String
        }
        return ""
    }
    
    
}

public extension NSDictionary{
    
    
}
