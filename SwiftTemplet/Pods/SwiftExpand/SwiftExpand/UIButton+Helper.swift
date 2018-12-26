
//
//  UIButton+Helper.swift
//  SwiftTemplet
//
//  Created by hsf on 2018/8/17.
//  Copyright © 2018年 BN. All rights reserved.
//

import UIKit

public typealias ButtonClick = ((_ sender:UIButton)->()) // 定义数据类型(其实就是设置别名)

public extension UIButton{

//    /// 快速创建
//    convenience init(action:@escaping ButtonClick){
//        self.init()
//        self.addTarget(self, action:#selector(tapped(btn:)), for:.touchUpInside)
//        self.actionBlock = action
//        self.sizeToFit()
//    }
//
//    /// 快速创建按钮 setImage: 图片名 frame:frame action:点击事件的回调
//    convenience init(setImage:String, frame:CGRect, action: @escaping ButtonClick){
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
    
    
    public static func createBtnImg(rect:CGRect, image_N:String!, image_H:String?) -> UIButton {
        let btn = UIButton(type:.custom);
        btn.frame = rect;
        if UIImage(named:image_N) != nil {
            btn.setImage(UIImage(named:image_N), for: .normal);
        }
        
        if UIImage(named:image_H!) != nil {
            btn.setImage(UIImage(named:image_H!), for: .highlighted);
        }
        btn.sizeToFit();
        return btn;
    }
    
    public static func createBtnTitle(rect:CGRect, title:String!, font:CGFloat, type:NSInteger) -> UIButton {
        let btn = UIButton(type:.custom);
        btn.frame = rect;
        btn.titleLabel?.font = UIFont.systemFont(ofSize:font);
        btn.setTitle(title, for: .normal);
        btn.isExclusiveTouch = true;
        btn.adjustsImageWhenHighlighted = false;
//        btn.sizeToFit();
//        if title.count >= 3 {
//            let textSize:CGSize = btn.sizeThatFits(CGSize.zero);
//            btn.frame = CGRect(origin: rect.origin, size: textSize);
//            btn.titleEdgeInsets = UIEdgeInsets.init(top: -10, left: -20, bottom: -10, right: -20);
//            if title.count >= 4 {
//                btn.titleLabel?.adjustsFontSizeToFitWidth = true;
//                btn.titleLabel?.minimumScaleFactor = 1.0;
//
//            }
//        }
        
        switch type {
        case 1:
            btn.setTitle(title, for: .normal);
            
            btn.setTitleColor(.black, for: .normal);
            btn.backgroundColor = .white;
            
        case 2:
            btn.setTitle(title, for: .normal);
            
            btn.setTitleColor(.red, for: .normal);
            btn.backgroundColor = .white;
            
        case 3:
            btn.setTitle(title, for: .normal);
            
            btn.setTitleColor(.white, for: .normal);
            btn.setBackgroundImage(UIImage(color: .theme), for: .normal)
//            btn.setBackgroundImage(UIImage(color: .red), for: .selected)
            
        default:
            btn.setTitle(title, for: .normal);
            btn.setTitleColor(UIColor.black, for: .normal)
        }
        return btn;
    }
    
    public static func createBtn(rect:CGRect, title:String?, font:CGFloat, image:String?,tag:NSInteger, type:NSInteger) -> UIButton {
        let btn = UIButton.createBtnTitle(rect: rect,title: title, font:font, type: type);
        btn.tag = tag;
        if let obj = image {
            if UIImage(named:obj) != nil {
                btn.setImage(UIImage(named:obj), for: .normal);
            }
        }
        return btn;
    }
    
    public static func createBtn(rect:CGRect, title:String?, font:CGFloat, image:String?,tag:NSInteger, type:NSInteger, action:@escaping (ControlBlock)) -> UIButton {
        let btn = UIButton.createBtn(rect: rect, title: title, font: font, image:image, tag:tag, type: type);
        btn.addActionHandler(action, for: UIControl.Event.touchUpInside)
        return btn;
    }
}
