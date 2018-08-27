


//
//  UIView+Helper.swift
//  SwiftTemplet
//
//  Created by hsf on 2018/8/14.
//  Copyright © 2018年 BN. All rights reserved.
//

import Foundation
import UIKit

typealias ViewClick = ((UITapGestureRecognizer?,UIView,NSInteger)->()) // 定义数据类型(其实就是设置别名)
//typealias ViewClick = ((_ tap:UITapGestureRecognizer?, _ view:UIView, _ idx:NSInteger)->()) // 定义数据类型(其实就是设置别名)

extension UIView{
    
    private struct RuntimeKey {
        static let viewBlock = UnsafeRawPointer.init(bitPattern: "viewBlock".hashValue);
        static let tap = UnsafeRawPointer.init(bitPattern: "tap".hashValue);
        
    }
    
    func getViewLayer() -> () {
        let subviews = self.subviews;
        if subviews.count == 0 {
            return;
        }
        for view in subviews {
            view.layer.borderWidth = 0.5;
            view.layer.borderColor = UIColor.blue.cgColor;
//            view.layer.borderColor = UIColor.clear;

        }
    }
    
//    /// 运行时关联
//    private var viewBlock: ViewClick? {
//        set {
//            objc_setAssociatedObject(self, RuntimeKey.viewBlock!, newValue, .OBJC_ASSOCIATION_COPY_NONATOMIC);
//        }
//        get {
//            return  objc_getAssociatedObject(self, RuntimeKey.viewBlock!) as? ViewClick;
//        }
//    }
   
    func addActionHandler(action:@escaping (ViewClick)) -> Void {
//        func addActionHandler(action:@escaping ((UITapGestureRecognizer?,UIView,NSInteger)->())) -> Void {

        if let sender = self as? UIButton {
            sender.addTarget(self, action:#selector(handleActionSender(sender:)), for:.touchUpInside);

        }
        else if let sender = self as? UIControl {
            sender.addTarget(self, action:#selector(handleActionSender(sender:)), for:.valueChanged);

        }
        else{
            let recoginzer = objc_getAssociatedObject(self, RuntimeKey.tap!);
            if recoginzer == nil {
                let recoginzer = UITapGestureRecognizer(target: self, action: #selector(handleActionTap(tap:)));
                
                self.isUserInteractionEnabled = true;
                self.addGestureRecognizer(recoginzer);
                
            }
        }
        objc_setAssociatedObject(self, RuntimeKey.tap!, action, .OBJC_ASSOCIATION_RETAIN_NONATOMIC);
        
    }
    
    /// 点击回调
    @objc func handleActionTap(tap:UITapGestureRecognizer) -> Void {
       let block = objc_getAssociatedObject(self, RuntimeKey.tap!) as? ViewClick;
        if block != nil{
            block!(tap, tap.view!, tap.view!.tag);
        }
    }
    
    @objc func handleActionSender(sender:UIControl) -> Void {
        let block = objc_getAssociatedObject(self, RuntimeKey.tap!) as? ViewClick;
        if let sender = self as? UISegmentedControl {
            if block != nil {
                block!(nil, sender, sender.selectedSegmentIndex);
            }
            
        }
        else{
            if block != nil {
                block!(nil, sender, sender.tag);
            }
        }
    }
    

    func isContainRecognizer(recognizer:String?) -> Bool {
        
        for obj in (self.gestureRecognizers?.enumerated())! {
            
            if obj is UITapGestureRecognizer {
                return true;
                
            }
        }
        return false;
        
    }
    
    
    
    
}
