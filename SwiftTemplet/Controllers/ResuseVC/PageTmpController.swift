//
//  PageTmpController.swift
//  SwiftTemplet
//
//  Created by Bin Shang on 2020/6/16.
//  Copyright © 2020 BN. All rights reserved.
//

import UIKit
import SwiftExpand

///有限的控制器视图
class PageTmpController: NNPageController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        let list: [[String]] = [
            ["FirstViewController", "首页", "Item_first_N", "Item_first_H"],
            ["ThirdViewController", "总览", "Item_third_N", "Item_third_H"],
            ["TitleViewController", "测试",  "Item_center_N",  "Item_center_H"],

            ];
        controllers = UICtlrListFromList(list, isNavController: false)
    }
    
}
