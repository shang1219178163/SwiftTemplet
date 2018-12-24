
//
//  SecondViewController.swift
//  SwiftTemplet
//
//  Created by hsf on 2018/8/10.
//  Copyright © 2018年 BN. All rights reserved.
//

import UIKit

import Alamofire
import ObjectMapper
import SwiftExpand


typealias closuer = (AnyObject,Int,Bool) -> Void;

class SecondViewController: UIViewController {

    let url = "https://httpbin.org/get";
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        view.backgroundColor = .cyan;

        //                self.dataList.forEach({ (obj:Any) in
        //                    let model:BNFoldSectionModel = obj as! BNFoldSectionModel
        //                    DDLog(model.isOpen)
        //                })
        

        var controller = UICtrFromString("FleetDetailController")
        controller = UICtrFromString("FleetDetailControllerNew")

        self.addChildViewController(controller)
        self.view.addSubview(controller.view)
    }
    
}
