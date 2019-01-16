
//
//  UIViewController+Add.swift
//  SwiftTemplet
//
//  Created by hsf on 2018/8/29.
//  Copyright © 2018年 BN. All rights reserved.
//

import UIKit

public extension UIViewController{
    
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
    
    public var dataList: NSMutableArray {
        get {
            var list = objc_getAssociatedObject(self, RuntimeKeyFromSelector(#function)) as? NSMutableArray;
            if list == nil {
                list = [];
                objc_setAssociatedObject(self, RuntimeKeyFromSelector(#function), list, .OBJC_ASSOCIATION_RETAIN_NONATOMIC);
            }
            return list!;
        }
        set {
            objc_setAssociatedObject(self, RuntimeKeyFromSelector(#function), newValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC);
        }
    }
    
    public var tableView: UITableView {
        get {
            var table = objc_getAssociatedObject(self, RuntimeKeyFromSelector(#function)) as? UITableView;
            if table == nil {
                table = UITableView(frame:view.bounds, style:.grouped);
                table!.autoresizingMask = UIViewAutoresizing(rawValue: UIViewAutoresizing.flexibleWidth.rawValue | UIViewAutoresizing.flexibleHeight.rawValue)

                table!.separatorStyle = .singleLine;
                table!.separatorInset = .zero;
                table!.rowHeight = 60;
//                table!.register(UITableViewCell.self, forCellReuseIdentifier: NSStringFromClass(UITableViewCell.self));
                table!.register(UITableViewCell.self, forCellReuseIdentifier: UITableViewCell.identifier);
                table!.keyboardDismissMode = .onDrag
                table!.backgroundColor = UIColor.background;
                if self.conforms(to: UITableViewDataSource.self) {
                    table!.dataSource = self as? UITableViewDataSource;
                }
                
                if self.conforms(to: UITableViewDelegate.self) {
                    table!.delegate = self as? UITableViewDelegate;
                }

                objc_setAssociatedObject(self, RuntimeKeyFromSelector(#function), table, .OBJC_ASSOCIATION_RETAIN_NONATOMIC);
            }
            return table!;
        }
        set {
            objc_setAssociatedObject(self, RuntimeKeyFromSelector(#function), newValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC);
        }
    }
    
    public var collectionView : UICollectionView {
        get {
            var collection = objc_getAssociatedObject(self, RuntimeKeyFromSelector(#function)) as? UICollectionView;
            if collection == nil {
                // 初始化
                collection = UICollectionView(frame: view.bounds, collectionViewLayout: UICollectionView.layoutDefault)
                collection!.autoresizingMask = UIViewAutoresizing(rawValue: UIViewAutoresizing.flexibleWidth.rawValue | UIViewAutoresizing.flexibleHeight.rawValue)
                collection!.register(UICollectionViewCell.self, forCellWithReuseIdentifier: UICollectionViewCell.identifier)
                collection!.backgroundColor = UIColor.background

                if self.conforms(to: UICollectionViewDelegate.self) {
                    collection!.delegate = (self as! UICollectionViewDelegate)
                }
                if self.conforms(to: UICollectionViewDataSource.self) {
                    collection!.dataSource = (self as! UICollectionViewDataSource)
                }
 
                objc_setAssociatedObject(self, RuntimeKeyFromSelector(#function), collection, .OBJC_ASSOCIATION_RETAIN_NONATOMIC);
            }
            return collection!;
        }
        set {
            objc_setAssociatedObject(self, RuntimeKeyFromSelector(#function), newValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC);
        }
    }

}
