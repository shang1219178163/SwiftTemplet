//
//  PKTabBarViewController.swift
//  SwiftTemplet
//
//  Created by Bin Shang on 2020/11/20.
//  Copyright © 2020 BN. All rights reserved.
//

import UIKit
import SwiftExpand

class PKTabBarViewController: UIViewController {

    lazy var itemList: [[String]] = {
        return [
            ["FirstViewController", "首页", "Item_first_N", "Item_first_H"],
            ["SecondViewController", "圈子", "Item_second_N", "Item_second_H"],

            ]
    }()
    
    lazy var tabBar: UITabBar = {
        let tabBar = UITabBar()
        tabBar.tintColor = UIColor.theme;
        tabBar.barTintColor = UIColor.white;
        tabBar.isTranslucent = false;
        return tabBar
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        tabBar.items = UITabBar.barItems(itemList)
        
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        tabBar.snp.makeConstraints { (make) in
            make.left.equalToSuperview().offset(0);
            make.right.equalToSuperview().offset(0);
            make.bottom.equalToSuperview().offset(0);
            make.height.equalTo(49);
        }
    }
    
}
