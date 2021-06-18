//
//  IOPGoodsToolView.swift
//  SwiftTemplet
//
//  Created by Bin Shang on 2020/1/20.
//  Copyright © 2020 BN. All rights reserved.
//

import UIKit


@objc protocol IOPGoodsToolViewDelegate{
    func goodsToolView(_ sender: UIButton)
}

/// 一行按钮视图
class IOPGoodsToolView: UIView {
    
    weak var delegate: IOPGoodsToolViewDelegate?
    
    var cornerRadius: CGFloat = 5.0
    var numberOfRow: Int = 5
    var padding: CGFloat = 5.0
    var lineColor: UIColor = UIColor.line
    var titleColor: UIColor = UIColor.gray;
    
    var btnWidth: CGFloat {
        return (UIScreen.sizeWidth - (numberOfRow + 2).toCGFloat*10.0)/numberOfRow.toCGFloat;
    }
    
    var btnHeight: CGFloat {
        return self.sizeWidth - 5*2;
    }

    var titles:[String]? {
        willSet{
            subviews.forEach { (subview) in
                subview.removeFromSuperview()
            }
            
            newValue!.forEach { (title) in
                let btn = UIButton(type: .custom)
                btn.setTitle(title, for: .normal)

                btn.setTitleColor( .theme, for: .normal);
                btn.layer.borderColor = UIColor.theme.cgColor;
                btn.layer.borderWidth = 1;
                
                btn.titleLabel?.font = UIFont.systemFont(ofSize: 12)
                btn.frame = CGRect(x: 0, y: 0, width: btnWidth, height: btnHeight)
                btn.addTarget(self, action: #selector(handleAction(_:)), for: .touchUpInside)
                addSubview(btn)
            }
        }
    }
    
    @objc func handleAction(_ sender: UIButton) {
        delegate?.goodsToolView(sender)
        
        print(sender.currentTitle ?? "无标题")
    }
    
    // MARK: - lifecycle
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.frame = CGRect(x: 0, y: 0, width: UIScreen.sizeWidth, height: 45)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        setupConstraint()
    }
    
    func setupConstraint() {
    
        var btn: UIView?
        for (idx, item) in subviews.reversed().enumerated() {
            if idx == 0 {
                item.snp.makeConstraints { (make) in
                    make.top.equalToSuperview().offset(8);
                    make.right.equalToSuperview().offset(-10);
                    make.width.equalTo(btnWidth);
                    make.bottom.equalToSuperview().offset(-8);
                }
            } else {
                item.snp.makeConstraints { (make) in
                    make.top.equalToSuperview().offset(8);
                    make.right.equalTo(btn!.snp.left).offset(-10);
                    make.width.equalTo(btnWidth);
                    make.bottom.equalToSuperview().offset(-8);
                }
            }
            btn = item;
        }
     
    }
    
    
}
