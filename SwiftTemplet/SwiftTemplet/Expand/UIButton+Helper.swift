
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
    
   static func createBtnImg(rect:CGRect, image_N:String!, image_H:String?) -> UIButton {
        let btn = UIButton(type:.custom);
        btn.frame = rect;
        if UIImage(named:image_N) != nil {
            btn.setImage(UIImage(named:image_N), for: UIControlState.normal);
            
        }
        
        if UIImage(named:image_H!) != nil {
            btn.setImage(UIImage(named:image_H!), for: UIControlState.highlighted);
            
        }
        btn.sizeToFit();
        return btn;
    }
    
    static func createBtnTitle(rect:CGRect, title:String!, font:AnyObject, type:NSInteger) -> UIButton! {
        let btn = UIButton(type:.custom);
        btn.frame = rect;
//        btn.titleLabel?.text = title;//无法显示title
        let font = font is NSInteger == false ? font as! UIFont : UIFont.systemFont(ofSize:CGFloat(font.floatValue));
        btn.titleLabel?.font = font;
        btn.setTitle(title, for: UIControlState.normal);
        btn.isExclusiveTouch = true;

        if title.count >= 3 {
            let textSize:CGSize = btn.sizeThatFits(CGSize.zero);
            btn.frame = CGRect(x: 0, y: 0, width: textSize.width, height: textSize.height);
            btn.titleEdgeInsets = UIEdgeInsetsMake(-10, -20, -10, -20);
            
            if title.count >= 4 {
                btn.titleLabel?.adjustsFontSizeToFitWidth = true;
                btn.titleLabel?.minimumScaleFactor = 1.0;
                
            }
        }
        
        switch type {
            case 1:
                btn.setTitle(title, for: UIControlState.normal);

                btn.setTitleColor(UIColor.black, for: UIControlState.normal);
                btn.backgroundColor = UIColor.white;
            case 2:
                btn.setTitle(title, for: UIControlState.normal);

                btn.setTitleColor(UIColor.red, for: UIControlState.normal);
                btn.backgroundColor = UIColor.white;

            default:
                btn.setTitle(title, for: UIControlState.normal);

            }
        return btn;
    }
 
    static func createBtn(rect:CGRect,title:String?, font:AnyObject, image:AnyObject?,tag:NSInteger, type:NSInteger) -> UIButton {
        if image != nil && image is String {
            let btn = UIButton.createBtnImg(rect:rect, image_N: image as! String, image_H: image as? String);
            return btn;
        }
  
        let btnTitle = title != nil ? title : "UIbutton";
        let btn = UIButton.createBtnTitle(rect:rect, title: btnTitle, font:font as AnyObject, type:0);
        return btn!;
    }
    
    static func createBtn(rect:CGRect, title:String?, font:AnyObject, image:AnyObject?,tag:NSInteger, type:NSInteger, action:@escaping (ViewClick)) -> UIButton? {
        
        let btn = UIButton.createBtn(rect: rect,title: title, font:font, image:image, tag: tag, type: type);
        btn.addActionHandler { (tap, view, idx) in
            action(tap, view, idx);
        }
     
        return btn;
    }
   

}
