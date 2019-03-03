

//
//  UICollectionView+Helper.swift
//  SwiftTemplet
//
//  Created by hsf on 2018/8/16.
//  Copyright © 2018年 BN. All rights reserved.
//

import UIKit

public let UICollectionElementKindSectionItem = "UICollectionElementKindSectionItem"

public extension UICollectionView{
    
    public static var layoutDefault: UICollectionViewLayout {
        get {
            var layout = objc_getAssociatedObject(self, RuntimeKeyFromSelector(#function)) as? UICollectionViewFlowLayout;
            if layout == nil {
                // 初始化
                let width = UIScreen.main.bounds.width;
                let spacing: CGFloat = 5.0
                let itemSize = CGSize(width: (width - 5*spacing)/4.0,height: (width - 5*spacing)/4.0);
                let headerSize = CGSize(width: width, height: 40);
                let footerSize = CGSize(width: width, height: 20);
                layout = UICollectionViewFlowLayout.create(itemSize, spacing: spacing, headerSize: headerSize, footerSize: footerSize)

                objc_setAssociatedObject(self, RuntimeKeyFromSelector(#function), layout, .OBJC_ASSOCIATION_RETAIN_NONATOMIC);
                
            }
            return layout!
        }
        set {
            objc_setAssociatedObject(self, RuntimeKeyFromSelector(#function), newValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC);
        }
    }
    
    public var listClass: Array<String> {
        get {
            return objc_getAssociatedObject(self, RuntimeKeyFromSelector(#function)) as! Array<String>;
        }
        set {
            objc_setAssociatedObject(self, RuntimeKeyFromSelector(#function), newValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC);
            registerCell(newValue)
        }
    }
    
    public var dictClass: Dictionary<String, Array<String>> {
        get {
            return objc_getAssociatedObject(self, RuntimeKeyFromSelector(#function)) as! Dictionary<String, Array<String>>;
        }
        set {
            objc_setAssociatedObject(self, RuntimeKeyFromSelector(#function), newValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC);

        }
    }
    
    ///headerView/FooterView注册
    public func registerAll() {
        if dictClass.keys.count == 0 {
            return
        }
        dictClass.forEach { (arg0) in
//            DDLog(arg0)
            let (key, value) = arg0
            if key == UICollectionElementKindSectionItem {
                registerCell(value)
            }else {
                registerReusable(value, kind: key)
            }
            
        }
    }
    
    ///cell注册
    public func registerCell(_ listClass: Array<String>) {
        listClass.forEach { (className: String) in
            let obj:AnyClass = SwiftClassFromString(className)
            self.register(obj, forCellWithReuseIdentifier: className)
        }
        
    }
    
    public func viewIdentifier(_ className: String, kind: String) -> String{
        let extra = kind == UICollectionElementKindSectionHeader ? "Header" : "Footer";
        let identifier = className + extra;
        return identifier;
    }
    
    ///headerView/FooterView注册
    public func registerReusable(_ listClass: Array<String>, kind: String) {
        listClass.forEach { (className: String) in
            let identifier = viewIdentifier(className, kind: kind)
            self.register(SwiftClassFromString(className).self, forSupplementaryViewOfKind: kind, withReuseIdentifier: identifier)
        }
    }
    
    ///  默认布局配置(自上而下,自左而右)
    public func create(_ itemHeight: CGFloat, spacing: CGFloat, headerHeight: CGFloat, footerHeight: CGFloat) -> UICollectionViewFlowLayout {
        let width = self.bounds.width;
        let itemSize = CGSize(width: (width - 5*spacing)/4.0,height: itemHeight);
        let headerSize = CGSize(width: width, height: headerHeight);
        let footerSize = CGSize(width: width, height: footerHeight);
        let layout = UICollectionViewFlowLayout.create(itemSize, spacing: spacing, headerSize: headerSize, footerSize: footerSize);
        return layout;
    }

    
    
    
}


