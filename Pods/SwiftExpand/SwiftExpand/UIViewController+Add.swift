
//
//  UIViewController+Add.swift
//  SwiftTemplet
//
//  Created by Bin Shang on 2018/8/29.
//  Copyright © 2018年 BN. All rights reserved.
//

import UIKit

extension UIViewController{
    
    @objc public var obj: AnyObject? {
        get {
            return objc_getAssociatedObject(self, RuntimeKeyFromSelector(#function)) as AnyObject;
        }
        set {
            objc_setAssociatedObject(self, RuntimeKeyFromSelector(#function), newValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC);
        }
    }
    
    @objc public var objOne: AnyObject? {
        get {
            return objc_getAssociatedObject(self, RuntimeKeyFromSelector(#function)) as AnyObject;
        }
        set {
            objc_setAssociatedObject(self, RuntimeKeyFromSelector(#function), newValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC);
        }
    }
    
    @objc public var dataList: NSMutableArray {
        get {
            var obj = objc_getAssociatedObject(self, RuntimeKeyFromSelector(#function)) as? NSMutableArray;
            if obj == nil {
                obj = [];
                objc_setAssociatedObject(self, RuntimeKeyFromSelector(#function), obj, .OBJC_ASSOCIATION_RETAIN_NONATOMIC);
            }
            return obj!;
        }
        set {
            objc_setAssociatedObject(self, RuntimeKeyFromSelector(#function), newValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC);
        }
    }
    
    @objc public var tableView: UITableView {
        get {
            var obj = objc_getAssociatedObject(self, RuntimeKeyFromSelector(#function)) as? UITableView;
            if obj == nil {
                obj = UIView.createTableView(view.bounds, style: .grouped, rowHeight: 60);
//                obj?.frame = view.bounds
//                obj = UITableView(frame:view.bounds, style:.grouped);
//                obj!.autoresizingMask = UIViewAutoresizing(rawValue: UIViewAutoresizing.flexibleWidth.rawValue | UIViewAutoresizing.flexibleHeight.rawValue)
//
//                obj!.separatorStyle = .singleLine;
//                obj!.separatorInset = .zero;
//                obj!.rowHeight = 60;
//                obj!.register(UITableViewCell.self, forCellReuseIdentifier: NSStringFromClass(UITableViewCell.self));
//                obj!.register(UITableViewCell.self, forCellReuseIdentifier: UITableViewCell.identifier);
//                obj!.keyboardDismissMode = .onDrag
//                obj!.backgroundColor = UIColor.background;
                if self.conforms(to: UITableViewDataSource.self) {
                    obj!.dataSource = self as? UITableViewDataSource;
                }
                if self.conforms(to: UITableViewDelegate.self) {
                    obj!.delegate = self as? UITableViewDelegate;
                }

                objc_setAssociatedObject(self, RuntimeKeyFromSelector(#function), obj, .OBJC_ASSOCIATION_RETAIN_NONATOMIC);
            }
            return obj!;
        }
        set {
            objc_setAssociatedObject(self, RuntimeKeyFromSelector(#function), newValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC);
        }
    }
    
    @objc public var collectionView : UICollectionView {
        get {
            var obj = objc_getAssociatedObject(self, RuntimeKeyFromSelector(#function)) as? UICollectionView;
            if obj == nil {
                // 初始化
                obj = UICollectionView(frame: view.bounds, collectionViewLayout: UICollectionView.layoutDefault)
                obj!.autoresizingMask = UIViewAutoresizing(rawValue: UIViewAutoresizing.flexibleWidth.rawValue | UIViewAutoresizing.flexibleHeight.rawValue)
                obj!.register(UICollectionViewCell.self, forCellWithReuseIdentifier: UICollectionViewCell.identifier)
                obj!.backgroundColor = UIColor.background

                if self.conforms(to: UICollectionViewDelegate.self) {
                    obj!.delegate = (self as! UICollectionViewDelegate)
                }
                if self.conforms(to: UICollectionViewDataSource.self) {
                    obj!.dataSource = (self as! UICollectionViewDataSource)
                }
 
                objc_setAssociatedObject(self, RuntimeKeyFromSelector(#function), obj, .OBJC_ASSOCIATION_RETAIN_NONATOMIC);
            }
            return obj!;
        }
        set {
            objc_setAssociatedObject(self, RuntimeKeyFromSelector(#function), newValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC);
        }
    }

}
