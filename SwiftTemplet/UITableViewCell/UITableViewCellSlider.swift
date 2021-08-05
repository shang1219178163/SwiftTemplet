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
class UITableViewCellSlider: UITableViewCell {
        
    var inset = UIEdgeInsets(top: 10, left: 15, bottom: 10, right: 15)
    
    var spacing: CGFloat = 20
    
    /// 是否有星标
    var hasAsterisk = false;
    // MARK: -life cycle
    deinit {
        labelLeft.removeObserver(self, forKeyPath: "text")
        sliderCtl.removeObserver(self, forKeyPath: "value")
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier);
        
        contentView.addSubview(labelLeft);
        contentView.addSubview(labelRight);
        contentView.addSubview(sliderCtl);
        
        labelRight.numberOfLines = 1;
        labelRight.adjustsFontSizeToFitWidth = true;
        labelRight.font = UIFont.systemFont(ofSize: 13)
        
        labelLeft.addObserver(self, forKeyPath: "text", options: .new, context: nil)
        sliderCtl.addObserver(self, forKeyPath: "value", options: .new, context: nil)
    }
    
    override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
        if keyPath == "text" {
            //标题星号处理
            if hasAsterisk == true {
                labelLeft.attributedText = labelLeft.text?.matt.appendPrefix(font: labelLeft.font)
            }
        } else if keyPath == "value" {
            if let slider = object as? UISlider {
                labelRight.text = String(format: "%.2f", slider.value)
            }
        }
        else {
            super.observeValue(forKeyPath: keyPath, of: object, change: change, context: context)
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder);
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews();
        
        setupConstraint()
    }
    
    func setupConstraint() {
        if bounds.height <= 10 {
            return
        }
        let height = bounds.height - inset.top - inset.bottom
//        let endX = accessoryType == .none ? inset.right : kPadding

        let labelLeftSize = labelLeft.sizeThatFits(.zero)
        labelLeft.snp.remakeConstraints { (make) in
            make.centerY.equalToSuperview()
            make.left.equalToSuperview().offset(inset.left)
            make.width.equalTo(labelLeftSize.width)
            make.height.equalTo(height)
        }
        
        labelRight.snp.remakeConstraints { (make) in
            make.centerY.equalToSuperview()
            make.right.equalToSuperview().offset(-inset.right)
            make.width.equalTo(45)
            make.height.equalTo(labelLeft);
        }
        
        sliderCtl.snp.remakeConstraints { (make) in
            make.centerY.equalToSuperview()
            make.left.equalTo(labelLeft.snp.right).offset(spacing)
            make.right.equalTo(labelRight.snp.left).offset(-kPadding)
            make.height.equalTo(labelLeft);
        }
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
    }
    
    //MARK: -lazy
    lazy var sliderCtl: UISlider = {
        let view = UISlider(rect: .zero, minValue: 0, maxValue: 100)
        return view
    }()
    
}

