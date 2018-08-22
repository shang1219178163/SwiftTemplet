


//
//  UIView+Helper.swift
//  SwiftTemplet
//
//  Created by hsf on 2018/8/14.
//  Copyright © 2018年 BN. All rights reserved.
//

import Foundation
import UIKit

//typealias ViewClick = (()->()) // 定义数据类型(其实就是设置别名)
typealias ViewClick = ((_ view:UIView)->()) // 定义数据类型(其实就是设置别名)

extension UIView{
    
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
    
    private struct RuntimeKey {
        static let viewBlock = UnsafeRawPointer.init(bitPattern: "viewBlock".hashValue);
        static let tap = UnsafeRawPointer.init(bitPattern: "tap".hashValue);
        
    }
    
    /// 运行时关联
    private var viewBlock: ViewClick? {
        set {
            objc_setAssociatedObject(self, RuntimeKey.viewBlock!, newValue, .OBJC_ASSOCIATION_COPY_NONATOMIC);
        }
        get {
            return  objc_getAssociatedObject(self, RuntimeKey.viewBlock!) as? ViewClick;
        }
    }
    /// 点击回调
    @objc func handleActionTap(view:UIView){
        if self.viewBlock != nil {
            self.viewBlock!(view);
        }        
    }
    
    func addActionHandler(action:@escaping ViewClick) -> Void {
        self.viewBlock = action;
        
        let recoginzer = objc_getAssociatedObject(self, RuntimeKey.tap!);
        if recoginzer == nil {
            let recoginzer = UITapGestureRecognizer(target: self, action: #selector(handleActionTap(view:)));
            
            self.isUserInteractionEnabled = true;
            self.addGestureRecognizer(recoginzer);
            
        }
        objc_setAssociatedObject(self, RuntimeKey.tap!, action, .OBJC_ASSOCIATION_RETAIN_NONATOMIC);
        
    }
    
    func isContainRecognizer(recognizer:String?) -> Bool {
        
        for obj in (self.gestureRecognizers?.enumerated())! {
            
            if obj is UITapGestureRecognizer {
                return true;
                
            }
        }
        return false;
        
    }
    
    
//    func addActionHandler(_ block:SwiftBlock) -> Void {
//            var tap = objc_getAssociatedObject(self, NSStringFromSelector(#function));
//            if tap == nil {
//                tap = UITapGestureRecognizer(target: self, action: #selector(handleActionTapGesture(_:)));
//                self.isUserInteractionEnabled = true;
//
//                self.addGestureRecognizer(tap as! UIGestureRecognizer);
//            }
//            objc_setAssociatedObject(self, &key, block, objc_AssociationPolicy.OBJC_ASSOCIATION_RETAIN_NONATOMIC);
//
//        }
//
//    @objc func handleActionTapGesture(_ recognizer:UITapGestureRecognizer) -> (){
//        let block = objc_getAssociatedObject(self, &key) as! NSObject.SwiftBlock;
////        block(recognizer, recognizer.view, recognizer.view?.tag);
//
//
//    }
    
//    @objc func addActionHandler(_ block:SwiftBlock) -> Void {
//        if let sender = self as? UIButton {
//            sender.addTarget(self, action:#selector(handleActionSender(_:)), for: .touchUpInside);
//            
//        }
//        else if let sender = self as? UISegmentedControl {
//            sender.addTarget(self, action: #selector(handleActionSender(_:)), for: .valueChanged);
//            
//        }
//        else {
//            var tap = objc_getAssociatedObject(self, NSStringFromSelector(#function));
//            if tap == nil {
//                tap = UITapGestureRecognizer(target: self, action: #selector(handleActionTapGesture(_:)));
//                self.isUserInteractionEnabled = true;
//                
//                self.addGestureRecognizer(tap as! UIGestureRecognizer);
//            }
//        }
//        objc_setAssociatedObject(self, NSStringFromSelector(#function), block, objc_AssociationPolicy.OBJC_ASSOCIATION_RETAIN_NONATOMIC);
//        
//    }
//    
//    
//    @objc func handleActionSender(_ sender:AnyObject) -> (){
//        let block = objc_getAssociatedObject(self, NSStringFromSelector(#selector(addActionHandler(_:)))) as? SwiftBlock;
//        if let control = sender as? UISegmentedControl {
//            if block != nil {
//                block!(control, control, control.selectedSegmentIndex);
//                
//            }
//
//        }
//        else if let control = sender as? UIButton {
//            if block != nil {
//                block!(control, control, control.tag);
//                
//            }
//        }
//    }
//    
// 
//    @objc func handleActionTapGesture(_ recognizer:UITapGestureRecognizer) -> (){
//        let block = objc_getAssociatedObject(self, NSStringFromSelector(#selector(addActionHandler(_:)))) as? SwiftBlock;
//        if block != nil {
//            block!(recognizer, recognizer.view!, (recognizer.view?.tag)!);
//
//        }
//    }
}
