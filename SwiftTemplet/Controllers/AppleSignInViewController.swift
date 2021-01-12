//
//  AppleSignInViewController.swift
//  SwiftTemplet
//
//  Created by Bin Shang on 2020/7/23.
//  Copyright © 2020 BN. All rights reserved.
//

import UIKit
import SwiftExpand

@available(iOS 13.0, *)
class AppleSignInViewController: UIViewController {


    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        createBarItem("done") { (item) in
            if #available(iOS 13.0, *) {
                NNAppleSignInManager.shared.loginInWithApple { (flag, message) in
                    if flag {
                        NNProgressHUD.showSuccess(message)
                        return
                    }
                    NNProgressHUD.showSuccess(message)
                }
            } else {
                NNProgressHUD.showText("不支持 iOS 13.0 以下版本")
            }
        }
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
