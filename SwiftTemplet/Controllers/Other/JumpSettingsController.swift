//
//  JumpSettingsController.swift
//  SwiftTemplet
//
//  Created by shangbinbin on 2021/10/25.
//  Copyright © 2021 BN. All rights reserved.
//

import UIKit
import SwiftExpand

class JumpSettingsController: UIViewController {

    let list = [UIButton].init(count: 16) {
        let sender = UIButton(type: .custom)
        sender.setTitle("\($0)", for: .normal)
        sender.addTarget(self, action: #selector(handleAction(_:)), for: .touchUpInside)
        sender.tag = $0
        sender.layer.borderWidth = 1
        sender.layer.borderColor = UIColor.gray.cgColor
        return sender
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        edgesForExtendedLayout = []
        view.backgroundColor = .white
        
        navigationItem.rightBarButtonItems = ["hide", "dismiss"].map({
            UIBarButtonItem(obj: $0) { item in
//                if item.title == "hide" {
//                    ZZProgressHUD.hideHud(delay: 0)
//                } else {
//                    self.view.hideHud(delay: 0)
//                }
            }
        })
        
        list.forEach {
            self.view.addSubview($0)
        }
        
    }
    
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        
        list.updateItemsConstraint(CGRect(10, 10, kScreenWidth - 20, 260), sectionInset: EdgeInsets(all: 10))
    }

    
    @objc func handleAction(_ sender: UIButton) {
        let keyWindow: UIWindow = UIApplication.shared.keyWindow ?? UIApplication.shared.windows.first!

//        guard let url = URL(string: UIApplication.openSettingsURLString) else {
//            return
//        }
//        UIApplication.shared.open(url, options: [:], completionHandler: nil)

        UIApplication.shared.openSettings()
        
//        switch sender.tag {
//        case 0:
//
//        case 1:
//
//        case 2:
//
//        case 3:
//
//
//        default:
//            DDLog(sender.tag)
//            break
//        }
        
    }

}
