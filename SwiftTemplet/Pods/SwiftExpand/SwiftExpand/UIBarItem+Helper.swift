//
//  UIBarItem+Helper.swift
//  BuildUI
//
//  Created by Bin Shang on 2018/12/20.
//  Copyright © 2018 Bin Shang. All rights reserved.
//

import UIKit

extension UIBarItem{
    
    public var tag: Int {
        get {
            return objc_getAssociatedObject(self, AssociationKeyFromSelector(#function)) as! Int;
        }
        set {
            objc_setAssociatedObject(self, AssociationKeyFromSelector(#function), newValue, .OBJC_ASSOCIATION_ASSIGN);
        }
    }
   
}
