
//
//  Macro.swift
//  SwiftTemplet
//
//  Created by hsf on 2018/8/15.
//  Copyright © 2018年 BN. All rights reserved.
//

import UIKit


let kScreen_width = UIScreen.main.bounds.width;
let kScreen_height = UIScreen.main.bounds.height;

let kScale_width = UIScreen.main.bounds.width;


var kC_ThemeCOLOR: UIColor {
    return UIColor.colorWithHexString(hex: "#0082e0");
    
}


func DDLog<T>(_ msg: T, fileName: String = #file, methodName: String = #function, lineNumber: Int = #line){
    #if DEBUG
//    print("\((fileName as NSString).lastPathComponent).\(methodName)[\(lineNumber)]:\(msg)")
    let formatter = DateFormatter.dateFormat(formatStr: "yyyy-MM-dd HH:mm:ss.SSS");
    print(formatter.string(from: Date()),"\((fileName as NSString).lastPathComponent).\(methodName)[\(lineNumber)]:\(msg)")

    #endif
}

//func NNLog(FORMAT,...) {
//    let formatter = DateFormatter.dateFormat(formatStr: "yyyy-MM-dd HH:mm:ss.SSS");
//    fprintf(stderr,"%s【line -%d】%s %s\n", formatter.string(from: Date()), #line,(fileName as NSString).lastPathComponent,NSString.init(format: FORMAT, CVarArg).UTF8String,]);
//
//    
//}


