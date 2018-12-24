//
//  BNTableFooterView.swift
//  SwiftTemplet
//
//  Created by Bin Shang on 2018/12/24.
//  Copyright © 2018 BN. All rights reserved.
//

import UIKit
import SwiftExpand


public typealias BtnClick = (UIButton) ->()

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
        
        label.sizeToFit()
        label.snp.makeConstraints { (make) in
            make.top.equalTo(btn.snp.bottom).offset(15)
            make.left.right.equalTo(btn)
            make.height.equalTo(label.size.height)
            
        }
    }

    lazy var btn:UIButton = {
        var view:UIButton = UIButton.createBtn(rect: .zero, title: "+ 新建", font: 17 as AnyObject, image: nil, tag: kTAG_BTN, type: 3) { (sender:UIControl) in
            if let obj = sender as? UIButton {
                DDLog(obj.currentTitle as Any)
                
            }
        }
        view.setTitle("关闭车队模式", for: .normal)
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
