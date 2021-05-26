
//
//  UITableViewCellOne.swift
//  SwiftTemplet
//
//  Created by Bin Shang on 2018/8/29.
//  Copyright © 2018年 BN. All rights reserved.
//

import UIKit
import SnapKit
import SwiftExpand

/// 图片+文字+文字+图片
class UITableViewCellOne: UITableViewCell {

    var inset = UIEdgeInsets(top: 10, left: 15, bottom: 10, right: 15)

    ///0优先显示右边文字,1代表优先显示左边文字
    var type: Int = 0{
        didSet {
            if oldValue == 0 {
                //右边文字优先展示
                labelLeft.textAlignment = .left
                labelLeft.adjustsFontSizeToFitWidth = true
                
            } else {
                //左边文字优先展示
                labelRight.textAlignment = .right
                labelRight.adjustsFontSizeToFitWidth = true
            }
        }
    }
    /// 是否有星标
    var hasAsterisk = false;
    // MARK: -life cycle
    deinit {
        labelLeft.removeObserver(self, forKeyPath: "text")
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier);
        contentView.addSubview(imgViewLeft);
        contentView.addSubview(labelLeft);
        contentView.addSubview(labelRight);
        
        labelLeft.textColor = .textColor3
        labelLeft.font = UIFont.systemFont(ofSize: 15)
        labelLeft.numberOfLines = 1;
        labelRight.numberOfLines = 1;

        labelLeft.addObserver(self, forKeyPath: "text", options: .new, context: nil)
    }
    
    override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
        if keyPath == "text" {
            //标题星号处理
            if hasAsterisk == true {
                labelLeft.attributedText = labelLeft.text?.insertPrefix(labelLeft.textColor, font: labelLeft.font)
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
        
        let labStartX = imgViewLeft.isHidden ? inset.left : height + inset.left + kPadding
        let endX = accessoryType == .none ? inset.right : kPadding
        
        //头像不为空
        if imgViewLeft.isHidden == false {
            imgViewLeft.snp.makeConstraints { (make) in
                make.centerY.equalToSuperview()
                make.left.equalToSuperview().offset(inset.left)
                make.width.height.equalTo(height)
            }
        }
        
        if type == 0 {
            //右边文字优先展示
            let size: CGSize = labelRight.sizeThatFits(.zero)
            labelRight.snp.remakeConstraints { (make) in
                make.top.equalToSuperview().offset(inset.top)
                make.right.equalToSuperview().offset(-endX)
                make.width.equalTo(ceil(size.width))
                make.bottom.equalToSuperview().offset(-inset.bottom)
            }
            
            labelLeft.snp.remakeConstraints { (make) in
                make.top.bottom.equalTo(labelRight)
                make.left.equalToSuperview().offset(labStartX)
                make.right.equalTo(labelRight.snp.left).offset(-kPadding)
            }
            
        } else {
            //左边文字优先展示
            let size: CGSize = labelLeft.sizeThatFits(.zero)
            labelLeft.snp.remakeConstraints { (make) in
                make.top.equalToSuperview().offset(inset.top)
                make.left.equalToSuperview().offset(labStartX)
                make.width.equalTo(ceil(size.width))
                make.bottom.equalToSuperview().offset(-inset.bottom)
            }
            
            labelRight.snp.remakeConstraints { (make) in
                make.top.bottom.equalTo(labelLeft)
                make.left.equalTo(labelLeft.snp.right).offset(kPadding)
                make.right.equalToSuperview().offset(-endX)
            }
        }
    
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
