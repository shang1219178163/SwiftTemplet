//
//  IOPOrderPayView.swift
//  SwiftTemplet
//
//  Created by Bin Shang on 2020/1/22.
//  Copyright © 2020 BN. All rights reserved.
//

import UIKit


@objc protocol IOPOrderPayViewDelegate{
    func orderPayView(_ sender: UIButton)
}

/// 一行按钮视图
class IOPOrderPayView: UIView {
    
    weak var delegate: IOPOrderPayViewDelegate?
    
    
    var label: UILabel = {
        let label = UILabel()
        return label;
    }()

    lazy var btn: UIButton = {
        let btn = UIButton.create(.zero, title: "确认支付", imgName: nil, type: 5)
        btn.titleLabel?.font = UIFont.systemFont(ofSize: 12)
        btn.addTarget(self, action: #selector(handleAction(_:)), for: .touchUpInside)
        return btn
    }()

    
    @objc func handleAction(_ sender: UIButton) {
        delegate?.orderPayView(sender)
        
        print(sender.currentTitle!)
    }
    
    // MARK: - lifecycle
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubview(btn)
        addSubview(label)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        setupConstraint()
    }
    
    func setupConstraint() {
        btn.snp.makeConstraints { (make) in
            make.top.equalToSuperview().offset(8);
            make.right.equalToSuperview().offset(-10);
            make.width.equalTo(120);
            make.bottom.equalToSuperview().offset(-8);
        }
        
        label.snp.makeConstraints { (make) in
            make.top.equalToSuperview().offset(8);
            make.left.equalToSuperview().offset(10);
            make.right.equalTo(btn.snp.left).offset(-10);
            make.bottom.equalToSuperview().offset(-8);
        }
     
    }
    
    
}
