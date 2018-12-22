
//
//  UIView+Add.swift
//  SwiftTemplet
//
//  Created by hsf on 2018/8/27.
//  Copyright © 2018年 BN. All rights reserved.
//

import UIKit


public extension UIView {
    
    public var lineTop: UIView {
        get {
            var view = objc_getAssociatedObject(self, AssociationKeyFromSelector(#function)) as? UIView;
            if view == nil {
                view = UIView(frame: CGRect(x: 0, y: 0, width: frame.width, height: kH_LINE_VIEW));
                view!.backgroundColor = .line

                objc_setAssociatedObject(self, AssociationKeyFromSelector(#function), view, .OBJC_ASSOCIATION_RETAIN_NONATOMIC);
            }
            return view!;
        }
        set {
            objc_setAssociatedObject(self, AssociationKeyFromSelector(#function), newValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC);
        }
    }
    
    public var lineBottom: UIView {
        get {
            var view = objc_getAssociatedObject(self, AssociationKeyFromSelector(#function)) as? UIView;
            if view == nil {
                view = UIView(frame: CGRect(x: 0, y: frame.maxY - kH_LINE_VIEW, width: frame.width, height: frame.height));
                view!.backgroundColor = .line
                
                objc_setAssociatedObject(self, AssociationKeyFromSelector(#function), view, .OBJC_ASSOCIATION_RETAIN_NONATOMIC);
            }
            return view!;
        }
        set {
            objc_setAssociatedObject(self, AssociationKeyFromSelector(#function), newValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC);
        }
    }
    
}
