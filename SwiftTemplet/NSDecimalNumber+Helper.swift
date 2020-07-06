//
//  NSDecimalNumber+Helper.swift
//  SwiftTemplet
//
//  Created by Bin Shang on 2020/6/28.
//  Copyright © 2020 BN. All rights reserved.
//

import UIKit

@objc public extension NSDecimalNumber {
    
    override var stringValue: String {
        return "\(self.doubleValue)"
    }

    ///block 中加减乘除
    func calculate(_ block: @escaping (()->NSDecimalNumber)) -> NSDecimalNumber {
        /**
         该方法需要我们设置六个参数，
         第一个参数为舍入模式(roundingMode)，
         第二个参数为保留位数(scale，以小数点为中心，正数为小数位，负数为整数位)，
         第三个参数为数值精度异常捕获(raiseOnExactness)，
         第四个参数为数值上溢异常捕获(raiseOnOverflow)，
         第五个参数为数值下溢异常捕获(raiseOnUnderflow)，
         最后一个参数为数值除数为零异常捕获(raiseOnDivideByZero)：
         */
        let handler = NSDecimalNumberHandler(roundingMode: .bankers,
                                         scale: 2,
                                         raiseOnExactness: false,
                                         raiseOnOverflow: false,
                                         raiseOnUnderflow: false,
                                         raiseOnDivideByZero: true)
        let result: NSDecimalNumber = block().rounding(accordingToBehavior: handler)
        return result
    }
}
