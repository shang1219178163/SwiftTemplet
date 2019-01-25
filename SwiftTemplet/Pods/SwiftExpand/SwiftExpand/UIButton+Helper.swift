
//
//  UIButton+Helper.swift
//  SwiftTemplet
//
//  Created by hsf on 2018/8/17.
//  Copyright © 2018年 BN. All rights reserved.
//

import UIKit

public extension UIButton{

//    /// 快速创建
//    convenience init(action:@escaping ControlClosure){
//        self.init()
//        self.addTarget(self, action:#selector(tapped(btn:)), for:.touchUpInside)
//        self.actionBlock = action
//        self.sizeToFit()
//    }
//
//    /// 快速创建按钮 setImage: 图片名 frame:frame action:点击事件的回调
//    convenience init(setImage:String, frame:CGRect, action: @escaping ControlClosure){
////        self.init()
//        self.init(action: action);
//
//        self.frame = frame
//        self.setImage(UIImage(named:setImage), for: .normal)
//        self.addTarget(self, action:#selector(tapped(btn:)), for:.touchUpInside)
//        self.actionBlock = action
//        self.sizeToFit()
//
//        self.frame = frame
//    }
    
    /// UIButton不同状态下设置富文本标题
    public func setContent(_ content: String, attDic: Dictionary<NSAttributedStringKey, Any>, for state: UIControl.State) -> NSMutableAttributedString{
        assert((self.titleLabel!.text?.contains(content))!)
        let attString = self.titleLabel!.setContent(content, attDic: attDic)
        setAttributedTitle(attString, for: state)
        return attString
    }
    
}
