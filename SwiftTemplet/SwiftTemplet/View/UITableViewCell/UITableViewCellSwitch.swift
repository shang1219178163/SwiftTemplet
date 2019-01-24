//
//  UITableViewCellSwitch.swift
//  SwiftTemplet
//
//  Created by Bin Shang on 2019/1/10.
//  Copyright © 2019 BN. All rights reserved.
//

import UIKit
import SnapKit
import SwiftExpand

/// 文字+UISwitch
class UITableViewCellSwitch: UITableViewCell,UITextFieldDelegate {
    
    /// switch布局方式
    var layoutType = 0
    /// layoutType 不等于0时的才起作用
    var ctlAlignment = NSTextAlignment.right

    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier);
        
        contentView.addSubview(labelLeft);
        contentView.addSubview(switchCtl);
        
        labelLeft.addObserver(self, forKeyPath: "text", options: .new, context: nil)
    }
    
    override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
        if keyPath == "text" {
            //标题星号处理
            labelLeft.attributedText = labelLeft.text?.toAsterisk()
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder);
        fatalError("init(coder:) has not been implemented")
    }
    
    deinit {
        labelLeft.removeObserver(self, forKeyPath: "text")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews();
        
        setupConstraint()
    }
    
    func setupConstraint() -> Void {
        labelLeft.sizeToFit()
        labelLeft.frame.size = CGSize(width: labelLeft.frame.width, height: 35)
        labelLeft.snp.makeConstraints { (make) in
            make.centerY.equalToSuperview()
            make.left.equalToSuperview().offset(kX_GAP)
            make.size.equalTo(labelLeft.size);
        }
        
        if layoutType == 0 {
            switchCtl.snp.makeConstraints { (make) in
                make.top.equalTo(labelLeft);
                make.right.equalToSuperview().offset(-kX_GAP)
            }
            return;
        }
        
        //segment,slider的相对对齐方式
        let width = contentView.frame.width - labelLeft.frame.maxX - kX_GAP
        let ctlWidth = width*0.7
        
        switch ctlAlignment {
        case .left:
            switchCtl.snp.makeConstraints { (make) in
                make.top.equalTo(labelLeft);
                make.left.equalTo(labelLeft.snp.right).offset((width - ctlWidth)*0.5)
            }
            
        case .right:
            switchCtl.snp.makeConstraints { (make) in
                make.top.equalTo(labelLeft);
                make.right.equalToSuperview().offset(-(width - ctlWidth)*0.5)
            }
            
        default:
            switchCtl.snp.makeConstraints { (make) in
                make.top.equalTo(labelLeft);
                make.left.equalTo(labelLeft.snp.right).offset((width - switchCtl.frame.width)*0.5)
            }
        }
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
    }
    
    //MARK: -lazy
    lazy var switchCtl: UISwitch = {
        var view = UIView.createSwitch( .zero, isOn: true)
        return view
    }()
    
}

