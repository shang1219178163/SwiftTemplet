//
//  UIFont+Hook.swift
//  SwiftTemplet
//
//  Created by Bin Shang on 2019/7/13.
//  Copyright © 2019 BN. All rights reserved.
//

import UIKit

extension UIFont{
    public class func initializeMethod() {
        if self == UIFont.self {
            let onceToken = "Method Swizzling_\(NSStringFromClass(classForCoder()))";
            //DispatchQueue函数保证代码只被执行一次，防止又被交换回去导致得不到想要的效果
            DispatchQueue.once(token: onceToken) {
                let oriSel0 = #selector(systemFont(ofSize:))
                let repSel0 = #selector(swz_systemFont(ofSize:))
                
                let _ = swizzleMethodInstance(UIImageView.self, origSel: oriSel0, replSel: repSel0);
                
            }
        }
    }
    
    @objc public class func swz_systemFont(ofSize fontSize: CGFloat) -> UIFont{        
        return UIFont(name: "PingFangSC-Light", size: fontSize)!
    }

}
