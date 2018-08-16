


//
//  UIView+Helper.swift
//  SwiftTemplet
//
//  Created by hsf on 2018/8/14.
//  Copyright © 2018年 BN. All rights reserved.
//

import Foundation
import UIKit

extension UIView{
    
    @objc func addActionHandler(_ block:SwiftBlock) -> Void {
        if let sender = self as? UIButton {
            sender.addTarget(self, action:#selector(handleActionSender(_:)), for: .touchUpInside);
            
        }
        else if let sender = self as? UISegmentedControl {
            sender.addTarget(self, action: #selector(handleActionSender(_:)), for: .valueChanged);
            
        }
        else {
            var tap = objc_getAssociatedObject(self, NSStringFromSelector(#function));
            if tap == nil {
                tap = UITapGestureRecognizer(target: self, action: #selector(handleActionTapGesture(_:)));
                self.isUserInteractionEnabled = true;
                
                self.addGestureRecognizer(tap as! UIGestureRecognizer);
            }
        }
        objc_setAssociatedObject(self, NSStringFromSelector(#function), block, objc_AssociationPolicy.OBJC_ASSOCIATION_RETAIN_NONATOMIC);
        
    }
    
    
    @objc func handleActionSender(_ sender:AnyObject) -> (){
        let block = objc_getAssociatedObject(self, NSStringFromSelector(#selector(addActionHandler(_:)))) as? SwiftBlock;
        if let control = sender as? UISegmentedControl {
            block!(control, control, control.selectedSegmentIndex);
            
        }
        else if let control = sender as? UIButton {
            block!(control, control, control.tag);
            
        }
    }
    
 
    @objc func handleActionTapGesture(_ recognizer:UITapGestureRecognizer) -> (){
        let block = objc_getAssociatedObject(self, NSStringFromSelector(#selector(addActionHandler(_:)))) as? SwiftBlock;
        block!(recognizer, recognizer.view!, (recognizer.view?.tag)!);
       
    }
    
}
