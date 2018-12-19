//
//  UIViewController+Helper.swift
//  SwiftTemplet
//
//  Created by hsf on 2018/5/16.
//  Copyright © 2018年 BN. All rights reserved.
//

import Foundation
import UIKit

public extension UIViewController{
    
    public var controllerName: String {
        get {

            var className:String = BNStringShortFromClass(self.classForCoder);
            if className.contains("Controller") {
                var range = className.range(of: "Controller");
                if className.contains("ViewController") {
                    range = className.range(of: "ViewController");
                    
                }
                className = String(className[..<range!.lowerBound]);
            }
            return className;
        }
    }
    
    
    public func createBarItem(titile:String, imgName:AnyObject?, isLeft:Bool, isHidden:Bool, target:AnyObject, action:Selector) -> UIButton {
        
//        public var imageName : String = (imgName as? String)!;
//        assert(imgName?.isEmpty == true, "无效的图片名称");
        
        let image = UIImage(named: imgName as! String)?.withRenderingMode(.alwaysOriginal);
        
        let btn = UIButton();
        if image != nil  {
            btn.setImage(image, for: .normal);
            
        }
        else{
            if titile.isEmpty == false{
                btn.setTitle(titile, for: .normal);
                if titile.count == 4{
                    btn.titleLabel?.adjustsFontSizeToFitWidth = true;
                    btn.titleLabel?.minimumScaleFactor = 1;
                    
                }
            }
        }
        btn.addTarget(target, action:action, for: .touchUpInside);
        btn.sizeToFit();
        btn.isHidden = isHidden;
        
        if isLeft == true {
            self.navigationItem.leftBarButtonItem = UIBarButtonItem(customView: btn);
        }else{
            self.navigationItem.rightBarButtonItem = UIBarButtonItem(customView: btn);

        }
        return btn;
    }
    
    @objc private func handleActionItem(sender:UIBarButtonItem) -> Void {
        let block = objc_getAssociatedObject(self, RuntimeKey.tap) as? ObjClick;
        if block != nil {
            block!(sender);

        }
    }
    
    public func createBarItem(systemItem:UIBarButtonItem.SystemItem, isLeft:Bool, action:@escaping (ObjClick)) -> Void {

        let item:UIBarButtonItem = UIBarButtonItem(barButtonSystemItem: systemItem, target: self, action: #selector(handleActionItem(sender:)));
        item.systemType = systemItem;
        if isLeft == true {
            navigationItem.leftBarButtonItem = item;
        }
        else{
            navigationItem.rightBarButtonItem = item;
        }
        objc_setAssociatedObject(self, RuntimeKey.tap, action, .OBJC_ASSOCIATION_RETAIN_NONATOMIC);

    };
    
     public func createBtnBarItem(title:String?, image:AnyObject?, tag:NSInteger, isLeft:Bool, isHidden:Bool, action:@escaping (ViewClick)) -> UIButton! {

        let size = image != nil && UIImage(named:image as! String) != nil ? CGSize(width: 40, height: 40) : CGSize(width: 32, height: 32);
        let rect = CGRect(origin: CGPoint(x: 0, y: 0), size: size);
        
        let btn = UIButton.createBtn(rect: rect, title: title, font:16 as AnyObject, image:image, tag: tag, type: 0);
        btn.tag = isLeft == true ? kTAG_BackItem : kTAG_RightItem;
        btn.isHidden = isHidden;
        
        let view = UIView(frame: CGRect(x: 0, y: 0, width: 44, height: 44));
        view.isHidden = isHidden;
        btn.center = view.center;
        view.addSubview(btn);
        
        
        btn.addActionHandler { (tap, view, idx) in
            action(tap, view, idx);
        }
        
        let item:UIBarButtonItem = UIBarButtonItem(customView: view);
        if isLeft == true {
            navigationItem.leftBarButtonItem = item;
        }
        else{
            navigationItem.rightBarButtonItem = item;
        }
        return btn;
    }

    
//    public func createBarItem(titile:String, imgName:AnyObject?, isLeft:Bool, isHidden:Bool, handler:void(^)(id obj, id item, NSInteger idx)handler) -> UIButton {
//
//        //        public var imageName : String = (imgName as? String)!;
//
//        //        assert(imgName?.isEmpty == true, "无效的图片名称");
//        let image = UIImage(named: imgName as! String)?.withRenderingMode(.alwaysOriginal);
//
//        let btn = UIButton();
//        if image != nil  {
//            btn.setImage(image, for: .normal);
//
//        }else{
//            if titile.isEmpty == false{
//                btn.setTitle(titile, for: .normal);
//                if titile.count == 4{
//                    btn.titleLabel?.adjustsFontSizeToFitWidth = true;
//                    btn.titleLabel?.minimumScaleFactor = 1;
//
//                }
//            }
//        }
////        btn.addTarget(self, action:self, for: .touchUpInside);
//        btn.sizeToFit();
//        btn.isHidden = isHidden;
//
//        if isLeft == true {
//            self.navigationItem.leftBarButtonItem = UIBarButtonItem(customView: btn);
//        }else{
//            self.navigationItem.rightBarButtonItem = UIBarButtonItem(customView: btn);
//
//        }
//
//        return btn;
//    }

    
}


