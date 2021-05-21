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


    
    // MARK: -lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        animateType = .fade
        segmentCtl.items = ["过去1", "现在1", "将来1"]
        
        
        let items: [(UIViewController, String, UIImage?, UIImage?)] = {
            return [
                (FirstViewController(), "首页", UIImage(named: "Item_first_N"), UIImage(named: "Item_first_H")),
                (ThirdViewController(), "总览", UIImage(named: "Item_third_N"), UIImage(named: "Item_third_H")),
                (TitleViewController(), "测试", UIImage(named: "Item_center_N"), UIImage(named: "Item_center_H")),

                ]
        }()
        
        viewControllers = items.map({ (vc, title, image, imageH) -> UIViewController in
            let ctrl = vc
            ctrl.reloadTabarItem((title, image, imageH))
            return ctrl
        })
        
        delegate = self
    }

}

extension NNParentOneController: UUSementedControllerDelegate{
    
    @objc func sementedVC(_ controller: UUSementedController, didSelect viewController: UIViewController){
        DDLog(controller.segmentCtl.selectedSegmentIndex)
    }
}
