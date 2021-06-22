//
//  ProtocolChainController.swift
//  SwiftTemplet
//
//  Created by Bin Shang on 2021/5/31.
//  Copyright © 2021 BN. All rights reserved.
//

import UIKit
import SnapKit
import SwiftExpand
import Then

class ProtocolChainController: UIViewController {
    
    let label = UILabel().then {
        $0.text = "Hello ProtocolChain"
        $0.textColor = .red
        $0.textAlignment = .center
        $0.backgroundColor = UIColor.gray.withAlphaComponent(0.1)
    }
    

    // MARK: -lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        edgesForExtendedLayout = []
        view.addSubview(label)
        
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        label.snp.makeConstraints { (make) in
            make.left.top.equalToSuperview().offset(20)
            make.right.equalToSuperview().offset(-20)
            make.height.equalTo(200)
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        
        let p = CGPoint.zero.with { (p) in
            p.x = 20
            p.y = 30
        }
        DDLog(p)


        let s = CGSize.zero.with { (size) in
            size.width = 100
            size.height = 200
        }
        DDLog(s)

    }
    

    func testLabel() {
        UserDefaults.standard.do {
           $0.set("aa", forKey: "aKey")
           $0.synchronize()
        }
        
        let rect = CGRect(x: 0, y: 0, width: 0, height: 0).with {
            $0.origin.x = 100
            $0.size.width = 100
        }
    }

}
