//
//  NNParentOneController.swift
//  SwiftTemplet
//
//  Created by Bin Shang on 2020/4/29.
//  Copyright © 2020 BN. All rights reserved.
//

import UIKit
import SwiftExpand

class NNParentOneController: UUSementedController {

    //MARK:属性
    lazy var list: [[String]] = {
        let list: [[String]] = [
            ["FirstViewController", "首页", "Item_first_N", "Item_first_H"],
            ["ThirdViewController", "总览", "Item_third_N", "Item_third_H"],
            ["TitleViewController", "测试",  "Item_center_N",  "Item_center_H"],
            
            ];
        return list;
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        animateType = .slide
        segmentCtl.itemList = ["过去1", "现在1", "将来1"]
        viewControllers = UICtlrListFromList(list, isNavController: false)
    }
    

}
