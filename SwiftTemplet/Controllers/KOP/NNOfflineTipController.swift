//
//  NNOfflineTipController.swift
//  SwiftTemplet
//
//  Created by Bin Shang on 2020/7/15.
//  Copyright © 2020 BN. All rights reserved.
//

import UIKit

class NNOfflineTipController: UIViewController {

    lazy var label: UILabel = {
        let view = UILabel(frame: .zero);
        view.text = """
请设置你的网络

1.打开设备的“系统设置”>“无线和网络”>“移动网络”;

2.打开设备的“系统设置”>“WiFi”，启用WiFi后从中选择一个可用的WiFi热点接入;
        

如果你已经连接WiFi网络:
        
请检查您所连接的WiFi热点是否已接入互联网，或该热点是否已允许您的设备访问互联网;
""";
        view.font = UIFont.systemFont(ofSize: 13);
//        view.textAlignment = .center;
        view.textColor = UIColor.hexValue(0x33333);
        view.numberOfLines = 0

        return view;
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        edgesForExtendedLayout = []
        view.backgroundColor = .white
        title = "未能连接到互联网"
        
        view.addSubview(label)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        let size = label.sizeThatFits(CGSize(width: self.view.bounds.width - 40, height: 0))
        label.snp.remakeConstraints { (make) in
            make.top.equalToSuperview().offset(20)
            make.left.equalToSuperview().offset(20);
            make.right.equalToSuperview().offset(-20);
            make.height.equalTo(size.height);
        }
    }
    


}
