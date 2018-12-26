//
//  UIControl+Helper.swift
//  BuildUI
//
//  Created by Bin Shang on 2018/12/20.
//  Copyright © 2018 Bin Shang. All rights reserved.
//

import UIKit

extension UIControl {
    
    public func addActionHandler(_ action:@escaping (ControlBlock), for controlEvents: UIControl.Event) -> Void {
        addTarget(self, action:#selector(handleActionSender(_:)), for:controlEvents);
        objc_setAssociatedObject(self, RuntimeKey.control, action, .OBJC_ASSOCIATION_RETAIN_NONATOMIC);
        
    }
    
    /// 点击回调
    @objc private func handleActionSender(_ sender:UIControl) -> Void {
        let block = objc_getAssociatedObject(self, RuntimeKey.control) as? ControlBlock;
        if block != nil {
            block!(sender);
        }
        
    }
}
