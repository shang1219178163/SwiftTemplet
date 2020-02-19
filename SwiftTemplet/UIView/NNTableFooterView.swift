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
    /// 图像距离顶端间距
    var topPadding: CGFloat = 20;
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubview(btn)
        addSubview(label)
        addSubview(labelTop)

        backgroundColor = UIColor.background;

//        label.backgroundColor = UIColor.random
        
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        labelTop.snp.makeConstraints { (make) in
            make.top.equalToSuperview().offset(5)
            make.left.equalToSuperview().offset(15)
            make.right.equalToSuperview().offset(-15)
            make.height.equalTo(topPadding - 10)
        }
        
        btn.snp.makeConstraints { (make) in
            make.top.equalToSuperview().offset(topPadding)
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
        var view: UIButton = UIButton.create( .zero, title: "+ 新建", imgName: nil, type: 1);
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
    
    @objc lazy var labelTop: UILabel = {
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
        view.btn.setBackgroundImage(UIImageColor(UIColor.theme), for: .normal);
        view.btn.setTitleColor(UIColor.white, for: .normal)
        view.btn.addActionHandler({ (control) in
            DDLog(control)
            
        }, for: .touchUpInside)
        return view;
    }
}
