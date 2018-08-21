
//
//  UIButton+Helper.swift
//  SwiftTemplet
//
//  Created by hsf on 2018/8/17.
//  Copyright © 2018年 BN. All rights reserved.
//

import UIKit

typealias ButtonClick = ((_ sender:UIButton)->()) // 定义数据类型(其实就是设置别名)

extension UIButton{
    
    private struct RuntimeKey {
        static let actionBlock = UnsafeRawPointer.init(bitPattern: "actionBlock".hashValue)
        /// ...其他Key声明
    }
    
    /// 运行时关联
    private var actionBlock: ButtonClick? {
        set {
            objc_setAssociatedObject(self, UIButton.RuntimeKey.actionBlock!, newValue, .OBJC_ASSOCIATION_COPY_NONATOMIC)
        }
        get {
            return  objc_getAssociatedObject(self, UIButton.RuntimeKey.actionBlock!) as? ButtonClick
        }
    }
    /// 点击回调
    @objc func tapped(btn:UIButton){
        if self.actionBlock != nil {
            self.actionBlock!(btn);
        }
    }
    
    /// 点击回调
    @objc func addActionBlock(action:@escaping ButtonClick){
        self.actionBlock = action;
        if self.allTargets.count == 0 {
            self.addTarget(self, action:#selector(tapped(btn:)), for:.touchUpInside)
            
        }
    
    }
    
    /// 快速创建
    convenience init(action:@escaping ButtonClick){
        self.init()
        self.addTarget(self, action:#selector(tapped(btn:)), for:.touchUpInside)
        self.actionBlock = action
        self.sizeToFit()
    }

    /// 快速创建按钮 setImage: 图片名 frame:frame action:点击事件的回调
    convenience init(setImage:String, frame:CGRect, action: @escaping ButtonClick){
//        self.init()
        self.init(action: action);
        
        self.frame = frame
        self.setImage(UIImage(named:setImage), for: UIControlState.normal)
        self.addTarget(self, action:#selector(tapped(btn:)), for:.touchUpInside)
        self.actionBlock = action
        self.sizeToFit()
        
        self.frame = frame
    }
    
 
    
    static func createBtn(rect:CGRect, title:String?, font:AnyObject, image:AnyObject?,tag:NSInteger, type:NSInteger) -> UIButton {

//        assert(font is NSNull || font is NSInteger || font is UIFont, "font只能是int/UIFont类型");
//        assert(image is NSNull || image is String || image is UIImage, "image只能是String/UIImage");
        let btn = UIButton.init();
        btn.frame = rect;
        btn.tag = tag;
        if image != nil {
            if let img = image as? String {
                btn.setImage(UIImage(named:img), for: UIControlState.normal);
                
            }
            else if let img = image as? UIImage {
                btn.setImage(img, for: UIControlState.normal);
                
            }
            
        }
        else{
            if title != nil {
                btn.titleLabel?.text = title;
                btn.titleLabel?.font = font is NSInteger == false ? font as! UIFont : UIFont.systemFont(ofSize:CGFloat(font.floatValue));

            }
        }
        
        switch type {
        case 1:
            btn.setTitleColor(UIColor.red, for: UIControlState.normal);
            btn.backgroundColor = UIColor.white;
            
        default:
            btn.setTitleColor(UIColor.black, for: UIControlState.normal);
            btn.backgroundColor = UIColor.white;
        }

        
        return btn
    }
    
}
