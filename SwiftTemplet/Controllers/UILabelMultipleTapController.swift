//
//  UILabelMultipleTapController.swift
//  SwiftTemplet
//
//  Created by Bin Shang on 2020/4/16.
//  Copyright © 2020 BN. All rights reserved.
//

import UIKit
import SnapKit
import SwiftExpand

class UILabelMultipleTapController: UIViewController {
    
    lazy var label: UILabel = {
        let label = UILabel()
        label.numberOfLines = 1
        label.adjustsFontSizeToFitWidth = true
//        label.lineBreakMode = .byCharWrapping
        return label
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        view.addSubview(label)
        
        
        label.frame = CGRect(x: 20, y: 20, width: view.frame.width - 40, height: 50)
        
        let tapTexts = ["智慧停车场平台协议", "用户隐私协议"]
        label.text = "已阅读并接受《\(tapTexts[0])》和《\(tapTexts[1])》"
        label.attributedText = NSAttributedString.create(label.text!, textTaps: tapTexts)
                
        label.addGestureTap { (reco) in
            reco.didTapAttributedTextIn(tapTexts) { (text, idx) in
                DDLog(text, idx)
            }
        }
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
    }

}

