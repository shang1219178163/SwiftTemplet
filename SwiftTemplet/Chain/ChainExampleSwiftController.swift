//
//  ChainExampleSwiftController.swift
//  SwiftTemplet
//
//  Created by Bin Shang on 2021/4/19.
//  Copyright © 2021 BN. All rights reserved.
//

import UIKit

class ChainExampleSwiftController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        let formatter = PersonNameComponentsFormatter()
        formatter.style = .long
        
        var p = PersonNameComponents()
        p.givenName = "三胖"
        p.familyName = "金"
        p.nameSuffix = "先生"
        p.namePrefix = "朝鲜领导人"
        p.nickname = "三胖子"
        p.middleName = " - "
        var outputString1: String = formatter.string(from: p)
        // 金三胖
        formatter.style = .long
        var outputString2: String = formatter.string(from: p)
        //朝鲜领导人金三胖 # 先生
        print("_\(outputString1)_")
        print("\(outputString2)")

    }

}
