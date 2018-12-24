
//
//  UIViewController+Add.swift
//  SwiftTemplet
//
//  Created by hsf on 2018/8/29.
//  Copyright © 2018年 BN. All rights reserved.
//

import UIKit

public extension UIViewController{
    
    public var dataList: NSMutableArray {
        get {
            var list = objc_getAssociatedObject(self, AssociationKeyFromSelector(#function)) as? NSMutableArray;
            if list == nil {
                list = [];
                objc_setAssociatedObject(self, AssociationKeyFromSelector(#function), list, .OBJC_ASSOCIATION_RETAIN_NONATOMIC);
            }
            return list!;
        }
        set {
            objc_setAssociatedObject(self, AssociationKeyFromSelector(#function), newValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC);
        }
    }
    
    public var tableView: UITableView {
        get {
            var table = objc_getAssociatedObject(self, AssociationKeyFromSelector(#function)) as? UITableView;
            if table == nil {
                table = UITableView(frame:view.bounds, style:.grouped);
                table!.separatorStyle = .singleLine;
                table!.separatorInset = .zero;
                table!.rowHeight = 60;
//                table!.register(UITableViewCell.self, forCellReuseIdentifier: NSStringFromClass(UITableViewCell.self));
                table!.register(UITableViewCell.self, forCellReuseIdentifier: UITableViewCell.identifier);

                table!.backgroundColor = UIColor.background;
                if self.conforms(to: UITableViewDataSource.self) {
                    table!.dataSource = self as? UITableViewDataSource;
                }
                
                if self.conforms(to: UITableViewDelegate.self) {
                    table!.delegate = self as? UITableViewDelegate;
                }
               
//                 table!.dataSource = self as! UITableViewDataSource;
//                table!.delegate = self as! UITableViewDelegate;

                objc_setAssociatedObject(self, AssociationKeyFromSelector(#function), table, .OBJC_ASSOCIATION_RETAIN_NONATOMIC);
            }
            return table!;
        }
        set {
            objc_setAssociatedObject(self, AssociationKeyFromSelector(#function), newValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC);
        }
    }
    
    public var collectionView : UICollectionView {
        get {
            var view = objc_getAssociatedObject(self, AssociationKeyFromSelector(#function)) as? UICollectionView;
            if view == nil {
                // 初始化
                let layout = UICollectionViewFlowLayout()
                let itemW = (kScreenWidth - 5*5.0)/4.0
                layout.itemSize = CGSize(width: itemW, height: itemW)
                layout.minimumLineSpacing = 5
                layout.minimumInteritemSpacing = 5
                //        layout.scrollDirection = .vertical
                layout.sectionInset = UIEdgeInsets(top: 5, left: 5, bottom: 5, right: 5)
                // 设置分区头视图和尾视图宽高
                layout.headerReferenceSize = CGSize(width: kScreenWidth, height: 60)
                layout.footerReferenceSize = CGSize(width: kScreenWidth, height: 60)
                
                view = UICollectionView(frame: CGRect(x:0, y:64, width:kScreenWidth, height:400), collectionViewLayout: layout)
                view!.backgroundColor = UIColor.background
                
                if self.conforms(to: UICollectionViewDelegate.self) {
                    view!.delegate = (self as! UICollectionViewDelegate)
                }
                if self.conforms(to: UICollectionViewDataSource.self) {
                    view!.dataSource = (self as! UICollectionViewDataSource)
                }
             
                view!.register(UICollectionViewCell.self, forCellWithReuseIdentifier: UICollectionViewCell.identifier)
              
                view!.backgroundColor = UIColor.background;
           
                objc_setAssociatedObject(self, AssociationKeyFromSelector(#function), view, .OBJC_ASSOCIATION_RETAIN_NONATOMIC);
            }
            return view!;
        }
        set {
            objc_setAssociatedObject(self, AssociationKeyFromSelector(#function), newValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC);
        }
    }

}
