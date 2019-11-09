//
//  NNTableFooterView.swift
//  SwiftTemplet
//
//  Created by Bin Shang on 2018/12/24.
//  Copyright © 2018 BN. All rights reserved.
//

import UIKit

import SwiftExpand

class NNTableFooterView: UIView {
    
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

    @objc lazy var btn:UIButton = {
        var view: UIButton = UIButton.create( .zero, title: "+ 新建", imgName: nil, type: 3);
            view.addActionHandler({ (sender) in
                if let obj = sender as? UIButton {
                    DDLog(obj.currentTitle as Any)
                    
                }
            }, for: .touchUpInside)
        
        return view;
    }();
    
    @objc lazy var label: UILabel = {
        let view = UILabel()
        view.textColor = UIColor.hex("#999999")
        view.font = UIFont.systemFont(ofSize: 14)
        view.numberOfLines = 0
        view.lineBreakMode = .byWordWrapping
        view.isUserInteractionEnabled = true
        return view
    }()
}
