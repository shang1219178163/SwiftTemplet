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
        let label = UILabel(frame: self.view.bounds)
        label.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        label.numberOfLines = 0
//        label.adjustsFontSizeToFitWidth = true
//        label.lineBreakMode = .byCharWrapping
        return label
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        edgesForExtendedLayout = []
        view.addSubview(label)
        
        title = "用户协议和隐私政策"

        let linkDic = ["《用户协议》": "http://api.irainone.com/app/iop/register.html",
                       "《隐私政策》": "http://api.irainone.com/app/iop/register.html",]
        let string = "\t用户协议和隐私政策请您务必审值阅读、充分理解 “用户协议” 和 ”隐私政策” 各项条款，包括但不限于：为了向您提供即时通讯、内容分享等服务，我们需要收集您的设备信息、操作日志等个人信息。\n\t您可阅读《用户协议》和《隐私政策》了解详细信息。如果您同意，请点击 “同意” 开始接受我们的服务;"
        
        label.attributedText = NSAttributedString.create(string, textTaps: Array(linkDic.keys))
        label.addGestureTap { (reco) in
            reco.didTapLabelAttributedText(linkDic) { key, value in
                DDLog(key, value)
            }
        }
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        
    }

}

