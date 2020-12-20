//
//  NNTableFooterView.swift
//  SwiftTemplet
//
//  Created by Bin Shang on 2018/12/24.
//  Copyright © 2018 BN. All rights reserved.
//

import UIKit

import SwiftExpand


@objcMembers class NNTableFooterView: UIView {
    /// 图像距离顶端间距
    var topPadding: CGFloat = 20;
    
    var layoutBlock:((NNTableFooterView)->Void)?
    
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubview(btn)
        addSubview(label)
        addSubview(labelTop)

        backgroundColor = .background;
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        if let layoutBlock = layoutBlock {
            layoutBlock(self)
            return
        }
        
        if ![labelTop.isHidden, label.isHidden].contains(false) {
            btn.snp.makeConstraints { (make) in
                make.edges.equalToSuperview()
            }
            return
        }
        
        labelTop.snp.makeConstraints { (make) in
            make.top.equalToSuperview().offset(5)
            make.left.equalToSuperview().offset(10)
            make.right.equalToSuperview().offset(-10)
            make.height.equalTo(topPadding - 10)
        }
        
        btn.snp.makeConstraints { (make) in
            make.top.equalToSuperview().offset(topPadding)
            make.left.equalToSuperview().offset(10)
            make.right.equalToSuperview().offset(-10)
            make.height.equalTo(45)
        }
        
        label.snp.makeConstraints { (make) in
            make.top.equalTo(btn.snp.bottom).offset(15)
            make.left.right.equalTo(btn)
            make.bottom.equalToSuperview()
        }
    }

    lazy var btn: UIButton = {
        let view = UIButton.create(.zero, title: "确定", textColor: .white, backgroundColor: .clear)
        view.setBackgroundImage(UIImage(color: .theme), for: .normal)
        view.setBackgroundImage(UIImage(color: .lightGray), for: .disabled)
        
        view.addActionHandler({ (sender) in
            if let obj = sender as? UIButton {
                DDLog(obj.currentTitle as Any)
                
            }
        }, for: .touchUpInside)
        
        return view;
    }()
    
    lazy var label: UILabel = {
        let view = UILabel()
        view.textColor = UIColor.hex("#999999")
        view.font = UIFont.systemFont(ofSize: 14)
        view.numberOfLines = 0
        view.lineBreakMode = .byWordWrapping
        view.isUserInteractionEnabled = true
        return view
    }()
    
    lazy var labelTop: UILabel = {
        let view = UILabel()
        view.textColor = UIColor.hex("#999999")
        view.font = UIFont.systemFont(ofSize: 14)
        view.numberOfLines = 0
        view.lineBreakMode = .byWordWrapping
        view.isUserInteractionEnabled = true
        return view
    }()
    
}

extension NNTableFooterView{
    
    /// 创建默认的确定按钮
    static func create(_ title: String = "确定", topPadding: CGFloat = 30, height: CGFloat = 180) -> NNTableFooterView {
        let view = NNTableFooterView(frame: CGRectMake(0, 0, UIScreen.sizeWidth, height))
        view.topPadding = topPadding;
        view.labelTop.font = UIFont.systemFont(ofSize: 12)
        view.labelTop.text = ""
        
        view.btn.setTitle(title, for: .normal)
        view.btn.setBackgroundImage(UIImage(color: UIColor.theme), for: .normal);
        view.btn.setTitleColor(UIColor.white, for: .normal)
        view.btn.addActionHandler({ (control) in
            DDLog(control)
            
        }, for: .touchUpInside)
        return view;
    }
}
