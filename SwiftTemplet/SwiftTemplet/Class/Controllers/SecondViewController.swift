
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


typealias closuer = (AnyObject,Int,Bool) -> Void;

class SecondViewController: UIViewController {

    let url = "https://httpbin.org/get";
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        view.backgroundColor = .cyan;


    }
    
}
