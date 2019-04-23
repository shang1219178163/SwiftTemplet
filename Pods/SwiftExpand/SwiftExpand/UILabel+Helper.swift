//
//  UILabel+Helper.swift
//  SwiftExpand
//
//  Created by Bin Shang on 2019/1/4.
//

/*
 Range与NSRange区别很大
 */

import UIKit

extension UILabel{
    /// UILabel富文本设置
    @objc public func setContent(_ content: String, attDic: Dictionary<NSAttributedStringKey, Any>) -> NSMutableAttributedString{
        assert((self.text?.contains(content))!)
        
        let text: NSString = self.text! as NSString
        let attString = NSMutableAttributedString(string: text as String)
        let range:NSRange = text.range(of: content)
        attString.addAttributes(attDic, range: range)
        attributedText = attString
        return attString
    }
    
}
