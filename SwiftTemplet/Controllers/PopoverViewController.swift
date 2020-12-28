//
//  PopoverViewController.swift
//  SwiftTemplet
//
//  Created by Bin Shang on 2020/4/22.
//  Copyright © 2020 BN. All rights reserved.
//

import UIKit
import SwiftExpand
import SnapKit

class PopoverViewController: UIViewController {

    lazy var button: UIButton = {
        let sender = UIButton(type: .custom)
        sender.setTitle("UIButton", for: .normal)
        sender.setTitleColor(UIColor.yellow, for: .normal)
        sender.addActionHandler({ (sender) in
            
            DDLog(sender.currentTitle)
            
        }, for: .touchUpInside)
        
        return sender
    }()
    
    // MARK: -lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = UIColor.lightGreen
        
        view.addSubview(button)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        button.snp.makeConstraints { (make) in
            make.centerX.equalToSuperview().offset(0)
            make.top.equalToSuperview().offset(130);
            make.width.equalTo(100);
            make.height.equalTo(25);
        }
    }
}

//extension PopoverViewController: UIAdaptivePresentationControllerDelegate{
//    func adaptivePresentationStyle(for controller: UIPresentationController) -> UIModalPresentationStyle {
//        // Tells iOS that we do NOT want to adapt the presentation style for iPhone
//        return .none
//    }
//}
