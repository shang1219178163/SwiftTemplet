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

    lazy var items: [(UIViewController, String, UIImage?, UIImage?)] = {
        return [
            (FirstViewController(), "首页", UIImage(named: "Item_first_N"), UIImage(named: "Item_first_H")),
            (ThirdViewController(), "总览", UIImage(named: "Item_third_N"), UIImage(named: "Item_third_H")),
            (TitleViewController(), "测试", UIImage(named: "Item_center_N"), UIImage(named: "Item_center_H")),

            ]
    }()
    // MARK: -lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        controllers = items.map({ (vc, title, image, imageH) -> UIViewController in
            let ctrl = vc
            ctrl.reloadTabarItem((title, image, imageH))
            return ctrl
        })
    }
    
}
