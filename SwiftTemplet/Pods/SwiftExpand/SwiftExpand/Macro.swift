
//
//  Macro.swift
//  SwiftTemplet
//
//  Created by hsf on 2018/8/15.
//  Copyright © 2018年 BN. All rights reserved.
//

import UIKit

public let kScreenWidth = UIScreen.main.bounds.width;
public let kScreenHeight = UIScreen.main.bounds.height;

public func DDLog(_ msgs: Any..., fileName: String = #file, methodName: String = #function, lineNumber: Int = #line){
    #if DEBUG
    let params = msgs.compactMap{ "\($0)" }.joined(separator: "\n__");
    let formatter = DateFormatter.format("yyyy-MM-dd HH:mm:ss.SSS");
    print(formatter.string(from: Date()),"\((fileName as NSString).lastPathComponent).\(methodName)[\(lineNumber)]:\n__\(params)")

    #endif
}

//func NNLog(FORMAT,...) {
//    let formatter = DateFormatter.format(f"yyyy-MM-dd HH:mm:ss.SSS");
//    fprintf(stderr,"%s【line -%d】%s %s\n", formatter.string(from: Date()), #line,(fileName as NSString).lastPathComponent,NSString.init(format: FORMAT, CVarArg).UTF8String,]);
//
//    
//}


// 日志打印，支持传入不同类型的多个参数
//
// - Parameters:
//   - message: 内容
//   - file: 文件名
//   - function: 方法名
//   - line: 行号
public func printLog(_ messages: Any..., file: String = #file, function: String = #function, line: Int = #line) {
    #if DEBUG
    let message = messages.compactMap{ "\($0)" }.joined(separator: "\n__")
    print("\((file as NSString).lastPathComponent)[\(line)] - \(function): \n__\(message)")
    #endif
}


