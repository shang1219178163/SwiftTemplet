//
//  ZMKeyBoardUtil.swift
//  SwiftProject
//
//  Created by 牛新怀 on 2018/7/6.
//  Copyright © 2018年 牛新怀. All rights reserved.
//

import UIKit

class ZMKeyBoardUtil: NSObject {

    
    
    static var dataSource = [["Q","W","E","R","T","Y","U","I","O","P"],
                      ["A","S","D","F","G","H","J","K","L"],
                      ["Z","X","C","V","B","N","M"]]
    
    static var secondSource = [["1","2","3","4","5","6","7","8","9","0"],
                               ["-","/",":","﹔","(",")","$","&","@"],
                               ["“","”",".","...","?","!","’"]]
    
    static var thirdSource = [["[","]","{","}","#","%","^","*","+","="],
                             ["_","\\","|","~","<",">","≈","≠","||"],
                             ["“","”",".","...","?","!","’"]]
}

extension ZMKeyBoardUtil {
    
    static func getDataSourceBy() -> [[ZMKeyBoadModel]] {
        var array = [[ZMKeyBoadModel]]()
        for i in 0...ZMKeyBoardUtil.dataSource.count - 1 {
            var sourceArray = [ZMKeyBoadModel]()
            let mSource = ZMKeyBoardUtil.dataSource[i]
            for m in 0...mSource.count - 1 {
                let str = mSource[m]
                let model = ZMKeyBoadModel.init(str: str, flag: false)
                sourceArray.append(model)
            }
            array.append(sourceArray)
        }
        return array
    }
    
    static func getSecondDataSourceBy() -> [[ZMKeyBoadModel]] {
        var array = [[ZMKeyBoadModel]]()
        for i in 0...ZMKeyBoardUtil.secondSource.count - 1 {
            var sourceArray = [ZMKeyBoadModel]()
            let mSource = ZMKeyBoardUtil.secondSource[i]
            for m in 0...mSource.count - 1 {
                let str = mSource[m]
                let model = ZMKeyBoadModel.init(str: str, flag: false)
                sourceArray.append(model)
            }
            array.append(sourceArray)
        }
        return array
    }
    
    static func getThirdDataSourceBy() -> [[ZMKeyBoadModel]] {
        var array = [[ZMKeyBoadModel]]()
        for i in 0...ZMKeyBoardUtil.thirdSource.count - 1 {
            var sourceArray = [ZMKeyBoadModel]()
            let mSource = ZMKeyBoardUtil.thirdSource[i]
            for m in 0...mSource.count - 1 {
                let str = mSource[m]
                let model = ZMKeyBoadModel.init(str: str, flag: false)
                sourceArray.append(model)
            }
            array.append(sourceArray)
        }
        return array
    }
}
