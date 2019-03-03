//
//  UICollectionViewLayout+Helper.swift
//  SwiftTemplet
//
//  Created by Bin Shang on 2019/1/16.
//  Copyright © 2019 BN. All rights reserved.
//

import UIKit

public extension UICollectionViewLayout{
    
    public var minimumLineSpacing: CGFloat {
        get {
            if let aValue = objc_getAssociatedObject(self, RuntimeKeyFromSelector(#function)) as? CGFloat {
                return aValue
            } else {
                return 5.0
            }
        }
        set {
            objc_setAssociatedObject(self, RuntimeKeyFromSelector(#function), newValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC);
        }
    }
    
    public var minimumInteritemSpacing: CGFloat {
        get {
            if let aValue = objc_getAssociatedObject(self, RuntimeKeyFromSelector(#function)) as? CGFloat {
                return aValue
            } else {
                return 5.0
            }
        }
        set {
            objc_setAssociatedObject(self, RuntimeKeyFromSelector(#function), newValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC);
        }
    }
 
    
    public var itemSize: CGSize {
        get {
            if let aValue = objc_getAssociatedObject(self, RuntimeKeyFromSelector(#function)) as? CGSize {
                return aValue
            } else {
                return CGSize.zero
            }
        }
        set {
            objc_setAssociatedObject(self, RuntimeKeyFromSelector(#function), newValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC);
        }
    }
    
    public var headerReferenceSize: CGSize {
        get {
            if let aValue = objc_getAssociatedObject(self, RuntimeKeyFromSelector(#function)) as? CGSize {
                return aValue
            } else {
                return CGSize.zero
            }
        }
        set {
            objc_setAssociatedObject(self, RuntimeKeyFromSelector(#function), newValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC);
        }
    }
    
    public var footerReferenceSize: CGSize {
        get {
            if let aValue = objc_getAssociatedObject(self, RuntimeKeyFromSelector(#function)) as? CGSize {
                return aValue
            } else {
                return CGSize.zero
            }
        }
        set {
            objc_setAssociatedObject(self, RuntimeKeyFromSelector(#function), newValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC);
        }
    }
    
    public var sectionInset: UIEdgeInsets {
        get {
            if let aValue = objc_getAssociatedObject(self, RuntimeKeyFromSelector(#function)) as? UIEdgeInsets {
                return aValue
            } else {
                return UIEdgeInsets.zero
            }
        }
        set {
            objc_setAssociatedObject(self, RuntimeKeyFromSelector(#function), newValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC);
        }
    }
   
    /// 默认布局配置(自上而下,自左而右)
    public static func create(_ itemSize: CGSize, spacing: CGFloat, headerSize: CGSize, footerSize: CGSize) -> UICollectionViewFlowLayout {
        let layout = UICollectionViewFlowLayout();
        //item水平间距
        layout.minimumLineSpacing = spacing;
        //item垂直间距
        layout.minimumInteritemSpacing = spacing;
        //item的尺寸
        layout.itemSize = itemSize;
        //item的UIEdgeInsets
        layout.sectionInset = UIEdgeInsetsMake(spacing, spacing, spacing, spacing);
        //滑动方向,默认垂直
        //sectionView 尺寸
        layout.headerReferenceSize = headerSize;
        layout.footerReferenceSize = footerSize;
        return layout;
    }
}
