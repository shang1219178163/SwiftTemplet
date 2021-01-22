//
//  ValidateProtocolController.swift
//  SwiftTemplet
//
//  Created by Bin Shang on 2020/12/4.
//  Copyright © 2020 BN. All rights reserved.
//

import UIKit
import SwiftExpand

class ValidateProtocolController: UIViewController, ValidateProtocol {

    ///重写
    func isValidPhone(_ value: String) -> Bool {
        return false
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        let a = isValidPhone("11111111111")
        DDLog("\(a)")
        
    }

}


//extension UIViewController: ValidateProtocol{ }
