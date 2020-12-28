//
//  AddShadowViewController.swift
//  SwiftTemplet
//
//  Created by Bin Shang on 2020/8/31.
//  Copyright © 2020 BN. All rights reserved.
//

import UIKit
import SwiftExpand

class AddShadowViewController: UIViewController {
    
    lazy var roundView: UIButton = {
        let view = UIButton(type: .custom);
        view.setTitle("  搜索当前位置车场", for: .normal)
        view.setTitleColor(.theme, for: .normal)
        view.adjustsImageWhenHighlighted = false
        view.backgroundColor = .systemGreen
        view.addActionHandler({ (sender) in
            print(sender)

        }, for: .touchUpInside)

        
        return view
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        setupExtendedLayout()
        view.backgroundColor = .white
        
        view.addSubview(roundView)
        
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        roundView.snp.makeConstraints { (make) in
            make.top.equalToSuperview().offset(10);
            make.left.equalToSuperview().offset(10);
            make.width.equalTo(100);
            make.height.equalTo(100);
        }
        addShadow()

    }

    /// 设置阴影
    private func addShadow() {
        roundView.layer.cornerRadius = 12
        
        roundView.layer.borderColor = UIColor.systemBlue.cgColor
        roundView.layer.borderWidth = 1

        roundView.layer.shadowColor = UIColor.red.cgColor
        roundView.layer.shadowRadius = 3.5
        roundView.layer.shadowOpacity = 0.8
        roundView.layer.shadowOffset = CGSize(width: 0, height: 0)
        roundView.layer.shadowRadius = 6.0
    }

}
