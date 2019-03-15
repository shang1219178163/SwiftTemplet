//
//  ZMKeyBoadModel.swift
//  SwiftProject
//
//  Created by 牛新怀 on 2018/7/6.
//  Copyright © 2018年 牛新怀. All rights reserved.
//

import UIKit

class ZMKeyBoadModel: NSObject {

    var keyBoadString: String? // 键盘上的字母
    var isCapital: Bool? = false // 是否大写
    
    init(str: String, flag: Bool) {
        self.keyBoadString = str
        self.isCapital = flag
    }
}

extension ZMKeyBoadModel {
    
}
