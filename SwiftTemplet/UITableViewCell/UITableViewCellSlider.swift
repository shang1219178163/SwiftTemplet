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
        
    var Xgap: CGFloat = 15;
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

        labelLeft.addObserver(self, forKeyPath: "text", options: .new, context: nil)
        sliderCtl.addObserver(self, forKeyPath: "value", options: .new, context: nil)
    }
    
    override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
        if keyPath == "text" {
            //标题星号处理
            if hasAsterisk == true {
                labelLeft.attributedText = labelLeft.text?.toAsterisk(labelLeft.textColor, font: labelLeft.font.pointSize)
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
        if bounds.height <= 10.0 {
            return
        }
        labelLeft.sizeToFit()
        labelLeft.frame.size = CGSize(width: labelLeft.frame.width, height: 35)
        labelLeft.snp.makeConstraints { (make) in
            make.centerY.equalToSuperview()
            make.left.equalToSuperview().offset(Xgap)
            make.size.equalTo(labelLeft.size);
        }
        
        let width = contentView.frame.width - labelLeft.frame.maxX - Xgap
        let ctlWidth = width*0.7
        
        labelRight.snp.makeConstraints { (make) in
            make.centerY.equalToSuperview()
            make.right.equalToSuperview().offset(-Xgap)
            make.width.equalTo(45)
            make.height.equalTo(labelLeft);
        }
        
        sliderCtl.snp.makeConstraints { (make) in
            make.centerY.equalToSuperview()
            make.right.equalTo(labelRight.snp.left).offset(-kPadding)
            make.width.greaterThanOrEqualTo(ctlWidth)
            make.height.equalTo(labelLeft);
        }
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
    }
    
    //MARK: -lazy
    lazy var sliderCtl: UISlider = {
        var view = UISlider.create( .zero, value: 0, minValue: 0, maxValue: 100)
        return view
    }()
    
}

