//
//  UINavigationBar+Helper.swift
//  SwiftTemplet
//
//  Created by Bin Shang on 2020/7/30.
//  Copyright © 2020 BN. All rights reserved.
//

import UIKit

@objc public extension UINavigationBar {
    
    func setClearColor(_ isClear: Bool) {
        let image = isClear ? nil : UIImage()
        setBackgroundImage(UIImage(), for: .default)
        shadowImage = image
    }
    ///设置背景色
    func setBackgroudColor(_ color: UIColor?) {
        guard let color = color else {
            setBackgroundImage(nil, for: .default)
            shadowImage = nil
            return
        }
        let image = UIImage(color: color)
        setBackgroundImage(image, for: .default)
        shadowImage = image
    }
    
    ///设置标题颜色
    func setTextColor(_ color: UIColor) {
        tintColor = color
        titleTextAttributes = [NSAttributedString.Key.foregroundColor: color,]
    }

}
