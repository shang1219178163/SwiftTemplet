
//
//  UIViewController+Add.swift
//  SwiftTemplet
//
//  Created by hsf on 2018/8/29.
//  Copyright © 2018年 BN. All rights reserved.
//

import UIKit

extension UIViewController{
    
    var dataList: NSMutableArray {
        get {
            var list = objc_getAssociatedObject(self, RuntimeKey.dataList!) as? NSMutableArray;
            if list == nil {
                list = [];
                objc_setAssociatedObject(self, RuntimeKey.dataList!, list, .OBJC_ASSOCIATION_RETAIN_NONATOMIC);

            }
            return list!;
        }
        set {
            objc_setAssociatedObject(self, RuntimeKey.dataList!, newValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC);
        }
    }
    
    
    var tableView: UITableView {
        get {
            var table = objc_getAssociatedObject(self, RuntimeKey.tableView!) as? UITableView;
            if table == nil {
                table = UITableView(frame:self.view.bounds, style:UITableViewStyle.grouped);
                table!.dataSource = self as! UITableViewDataSource;
                table!.delegate = self as! UITableViewDelegate;
                
                objc_setAssociatedObject(self, RuntimeKey.tableView!, table, .OBJC_ASSOCIATION_RETAIN_NONATOMIC);
            }
            return table!;
        }
        set {
            objc_setAssociatedObject(self, RuntimeKey.tableView!, newValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC);
        }
    }
    
}
