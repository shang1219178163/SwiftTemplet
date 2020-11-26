//
//  AttrStringViewController.swift
//  SwiftTemplet
//
//  Created by Bin Shang on 2020/11/26.
//  Copyright © 2020 BN. All rights reserved.
//

import UIKit
import SwiftExpand
import SnapKit
        

///优雅的富文本
@objcMembers class AttrStringViewController: UIViewController{
    
    lazy var rightBtn: UIButton = {
        let button = UIButton.create(.zero, title: "保存", textColor: .theme, backgroundColor: .clear)
        button.isHidden = true;
        button.sizeToFit()
        button.addActionHandler({ (control) in
            
        }, for: .touchUpInside)
        return button
    }()
            
    // MARK: - lazy
    lazy var label: UILabel = {
        let view = UILabel()
        view.backgroundColor = .systemGreen
        view.numberOfLines = 0
        return view
    }()
    
    lazy var imgView: UIImageView = {
        let view = UIImageView()
        view.contentMode = .scaleAspectFit

        view.isUserInteractionEnabled = true
        view.addGestureTap { (reco) in
            view.showImageEnlarge()
        }
        return view
    }()
    
    lazy var btn: UIButton = {
        let view = UIButton(type: .custom)
        view.setTitle("自定义标题", for: .normal)
        view.setCustomType(.titleRedAndOutline)
        view.adjustsImageWhenHighlighted = false
        
        view.addActionHandler { (control) in
            guard let sender = control as? UIButton else { return }
            DDLog(sender.currentTitle ?? "-")
        }
        return view
    }()
    
    // MARK: - lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupExtendedLayout()
        view.backgroundColor = .white
        title = "SimpleListController"

        navigationItem.rightBarButtonItem = UIBarButtonItem(customView: rightBtn)
                
        view.addSubview(label);
        view.addSubview(imgView);
        view.addSubview(btn);

//        label.isHidden = true
//        view.getViewLayer()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        label.snp.makeConstraints { (make) in
            make.top.equalToSuperview().offset(15);
            make.left.equalToSuperview().offset(15);
            make.right.equalToSuperview().offset(-15);
            make.height.equalTo(225);
        }
        
        imgView.snp.makeConstraints { (make) in
            make.top.equalTo(label.snp.bottom).offset(15);
            make.left.equalToSuperview().offset(15);
            make.right.equalToSuperview().offset(-15);
            make.height.equalTo(125);
        }
        
        btn.snp.makeConstraints { (make) in
            make.top.equalTo(imgView.snp.bottom).offset(15);
            make.left.equalToSuperview().offset(15);
            make.right.equalToSuperview().offset(-15);
            make.height.equalTo(50);
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated);
        
        label.attributedText = AttrString.test()
        imgView.image = UIImage(named: "WechatIMG375.png")
    }
        
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
