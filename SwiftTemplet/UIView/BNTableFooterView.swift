//
//  BNTableFooterView.swift
//  SwiftTemplet
//
//  Created by Bin Shang on 2018/12/24.
//  Copyright © 2018 BN. All rights reserved.
//

import UIKit

import SwiftExpand

class BNTableFooterView: UIView {
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubview(btn)
        addSubview(label)
        
//        label.backgroundColor = UIColor.random
        
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        btn.snp.makeConstraints { (make) in
            make.top.equalToSuperview().offset(15)
            make.left.equalToSuperview().offset(10)
            make.right.equalToSuperview().offset(-10)
            make.height.equalTo(45)
            
        }
        
//        label.sizeToFit()
        label.snp.makeConstraints { (make) in
            make.top.equalTo(btn.snp.bottom).offset(15)
            make.left.right.equalTo(btn)
            make.height.equalTo(70)
            
        }
    }

    lazy var btn:UIButton = {
        var view: UIButton = UIView.createBtn( .zero, title: "+ 新建", font: 16, imgName: nil, tag: kTAG_BTN, type: 3);
            view.addActionHandler({ (sender) in
                if let obj = sender as? UIButton {
                    DDLog(obj.currentTitle as Any)
                    
                }
            }, for: .touchUpInside)
        
        return view;
    }();
    
    lazy var label: UILabel = {
        let view = UILabel()
        view.textColor = UIColor.hex("#999999")
        view.font = UIFont.systemFont(ofSize: 14)
        view.numberOfLines = 0
        view.lineBreakMode = .byWordWrapping
        view.isUserInteractionEnabled = true
        return view
    }()
}
