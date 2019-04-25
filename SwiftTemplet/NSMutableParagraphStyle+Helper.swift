//
//  NSMutableParagraphStyle+Helper.swift
//  SwiftTemplet
//
//  Created by Bin Shang on 2019/4/25.
//  Copyright © 2019 BN. All rights reserved.
//

import UIKit

extension NSMutableParagraphStyle{
     /// 创建NSMutableParagraphStyle
     @objc public static func create(_ lineBreakMode: NSLineBreakMode, alignment: NSTextAlignment, lineSpacing: CGFloat = 5.0) -> NSMutableParagraphStyle {
        let paraStyle = NSMutableParagraphStyle()
        paraStyle.lineBreakMode = .byCharWrapping;
        paraStyle.alignment = .left;
        paraStyle.lineSpacing = lineSpacing;
        return paraStyle
    }
}
