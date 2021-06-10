//
//  PropertyWrapperController.swift
//  SwiftTemplet
//
//  Created by Bin Shang on 2021/5/31.
//  Copyright © 2021 BN. All rights reserved.
//

import UIKit
import SwiftExpand
import SnapKit

class PropertyWrapperController: UIViewController {
    
    lazy var label: UILabel = {
        $0.text = "text"
        $0.textColor = .systemRed
        $0.backgroundColor = UIColor.gray.alpha(0.1)
        return $0
    }(UILabel())

    // MARK: -lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        view.backgroundColor = .white
        edgesForExtendedLayout = []
        
        view.addSubview(label)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        label.snp.makeConstraints { (make) in
            make.top.left.equalToSuperview().offset(20)
            make.right.equalToSuperview().offset(-20)
            make.height.equalTo(200)
        }
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        DDLog(UserDefaults.dateTime ?? "-")
        UserDefaults.dateTime = "\(Date())"
        DDLog(UserDefaults.dateTime ?? "-")
        UserDefaults.dateTime = nil
    }

}
