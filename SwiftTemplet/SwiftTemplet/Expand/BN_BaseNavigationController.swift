//
//  BN_BaseNavigationController.swift
//  SwiftTemplet
//
//  Created by hsf on 2018/8/27.
//  Copyright © 2018年 BN. All rights reserved.
//

import UIKit

class BN_BaseNavigationController: UINavigationController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
//        self.isNavigationBarHidden = true //上部的导航栏
//        self.isToolbarHidden = true //底部的状态栏
        
    }
    
    override func pushViewController(_ viewController: UIViewController, animated: Bool) {
        if self.viewControllers.count > 0 {
            viewController.hidesBottomBarWhenPushed = true //跳转之后隐藏
        }
        super.pushViewController(viewController, animated: true)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

}
