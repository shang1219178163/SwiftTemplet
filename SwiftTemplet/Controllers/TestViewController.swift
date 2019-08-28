//
//  TestViewController.swift
//  SwiftTemplet
//
//  Created by Bin Shang on 2019/8/20.
//  Copyright © 2019 BN. All rights reserved.
//

import UIKit
import SwiftExpand

class TestViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        DDLog(NSArray.range(0, 10, 1));
        DDLog(NSArray.range(1, 11, 1));
        DDLog(NSArray.range(0, 30, 5));
        DDLog(NSArray.range(-10, 0, 1));

    }

}

public extension NSArray{
 
    
    
}

public extension NSDictionary{
    
    
}
