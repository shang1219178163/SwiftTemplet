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
    
    lazy var roundView: UIView = {
        let view = UIView()
        view.backgroundColor = .systemGreen
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
//        let rect = roundView.bounds
//        let rect = CGRectMake(10, 10, 100, 100)
//        roundView.addShadow(.red)
//        DDLog(rect)
        roundView.layer.shadowColor = UIColor.red.cgColor
        roundView.layer.shadowRadius = 3.5
        roundView.layer.shadowOpacity = 0.8
        roundView.layer.shadowOffset = CGSize(width: 1, height: 1)

//        let path = UIBezierPath(rect: rect.offsetBy(dx: 1, dy: 1))
//        roundView.layer.shadowPath = path.cgPath
    }

}
