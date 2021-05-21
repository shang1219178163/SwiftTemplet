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
    
    lazy var items: [(UIViewController, String, UIImage?, UIImage?)] = {
        return [
            (FirstViewController(), "首页", UIImage(named: "Item_first_N"), UIImage(named: "Item_first_H")),
            (ThirdViewController(), "总览", UIImage(named: "Item_third_N"), UIImage(named: "Item_third_H")),
            (TitleViewController(), "测试", UIImage(named: "Item_center_N"), UIImage(named: "Item_center_H")),

            ]
    }()
    
    lazy var tabBar: UITabBar = {
        let tabBar = UITabBar()
        tabBar.tintColor = UIColor.theme;
        tabBar.barTintColor = UIColor.white;
        tabBar.isTranslucent = false;
        return tabBar
    }()
    
    // MARK: -lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        let list = items.map({ (vc, title, image, imageH) -> (String, UIImage?, UIImage?) in
            return (title, image, imageH)
        })
        tabBar.reloadTabarItems(list)
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
