//
//  UITabBarController+Helper.swift
//  SwiftExpand
//
//  Created by Bin Shang on 2019/2/13.
//

import UIKit
import Foundation

extension UITabBarController{
    /// 获取私有类视图
    @objc public func getSubviewsForName(_ name: String) -> [UIView] {
        var marr: [UIView] = []
        tabBar.subviews.forEach { (view) in
            if view.isKind(of: SwiftClassFromString(name)) {
                marr.append(view)
            }
        }
        return marr;
    }
    
    /// 用特定数据源刷新tabBar
    /// - Parameter list: 参照HomeViewController数据源
    @objc public func reloadTabarItems(_ list: [[Any]]) -> Void {
        
        for e in viewControllers!.enumerated(){
            let itemList = list[e.offset]
            let title = itemList[itemList.count - 4] as! String
            let img = UIImage(named: itemList[itemList.count - 3] as! String)
            let imgH = UIImage(named: itemList[itemList.count - 2] as! String)
            e.element.tabBarItem = UITabBarItem(title: title, image: img, selectedImage: imgH)
        }
    }
    
}
