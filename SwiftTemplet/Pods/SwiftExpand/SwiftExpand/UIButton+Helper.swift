
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
    
    /// 验证码倒计时显示
    @objc public static func timeValueChange(_ btn:UIButton, timeOut:Int) {
        
        var time = timeOut
        let codeTimer = DispatchSource.makeTimerSource(flags: .init(rawValue: 0), queue: DispatchQueue.global())
        codeTimer.schedule(deadline: .now(), repeating: .milliseconds(1000))  //此处方法与Swift 3.0 不同
        codeTimer.setEventHandler {
            
            time -= 1
            DispatchQueue.main.async {
                if time > 0 {
                    btn.setTitle("剩余\(time)s", for: .normal)
                    return;
                }
                codeTimer.cancel()
                btn.isEnabled = true
                btn.setTitle("重新发送", for: .normal)
            }
        }
        
        codeTimer.resume()
//        codeTimer.activate()
    }
}
