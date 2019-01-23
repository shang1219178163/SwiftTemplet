//
//  UITableViewCellSlider.swift
//  SwiftTemplet
//
//  Created by Bin Shang on 2019/1/12.
//  Copyright © 2019 BN. All rights reserved.
//

import UIKit
import SnapKit
import SwiftExpand

/// 文字+UISlider
class UITableViewCellSlider: UITableViewCell,UITextFieldDelegate {
    
    var ctlAlignment = NSTextAlignment.center
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier);
        
        contentView.addSubview(labelLeft);
        contentView.addSubview(sliderCtl);
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
            make.top.equalToSuperview().offset(contentView.frame.midY - labelLeft.frame.height/2.0)
            make.left.equalToSuperview().offset(kX_GAP)
            make.size.equalTo(labelLeft.size);
        }
        
        let width = contentView.frame.width - labelLeft.frame.maxX - kX_GAP
        let ctlWidth = width*0.7
        
        switch ctlAlignment {
        case .left:
            sliderCtl.snp.makeConstraints { (make) in
                make.top.equalTo(labelLeft);
                make.left.equalTo(labelLeft.snp.right).offset(kPadding)
                make.width.equalTo(ctlWidth)
                make.height.equalTo(labelLeft);
            }
            
        case .right:
            sliderCtl.snp.makeConstraints { (make) in
                make.top.equalTo(labelLeft);
                make.right.equalToSuperview().offset(-kX_GAP)
                make.width.equalTo(ctlWidth)
                make.height.equalTo(labelLeft);
            }
            
        case .justified:
            sliderCtl.snp.makeConstraints { (make) in
                make.top.equalTo(labelLeft);
                make.left.equalTo(labelLeft.snp.right).offset(kPadding)
                make.right.equalToSuperview().offset(-kX_GAP)
                make.height.equalTo(labelLeft);
            }
            
        default:
            sliderCtl.snp.makeConstraints { (make) in
                make.top.equalTo(labelLeft);
                make.left.equalTo(labelLeft.snp.right).offset((width - ctlWidth)*0.5)
                make.width.equalTo(ctlWidth)
                make.height.equalTo(labelLeft);
            }
        }
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
    }
    
    //MARK: -lazy
    lazy var sliderCtl: UISlider = {
        var view = UIView.createSliderRect( .zero, value: 0, minValue: 0, maxValue: 100)
        return view
    }()
    
}

