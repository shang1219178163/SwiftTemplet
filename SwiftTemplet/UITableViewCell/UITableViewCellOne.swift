
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

    var Xgap: CGFloat = 15;

    ///0优先显示右边文字,1代表优先显示左边文字
    var type: Int = 0{
        didSet {
            if oldValue == 0 {
                //右边文字优先展示
                labelLeft.textAlignment = .left;
                labelLeft.adjustsFontSizeToFitWidth = true
                
            } else {
                //左边文字优先展示
                labelRight.textAlignment = .right;
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
        
        labelRight.numberOfLines = 1;
        labelLeft.numberOfLines = 1;
        
        labelLeft.addObserver(self, forKeyPath: "text", options: .new, context: nil)
    }
    
    override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
        if keyPath == "text" {
            //标题星号处理
            if hasAsterisk == true {
                labelLeft.attributedText = labelLeft.text?.toAsterisk(labelLeft.textColor, font: labelLeft.font.pointSize)
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
        let height: CGFloat = bounds.height - kPadding*2
        var labelLeftX: CGFloat = Xgap
        
        //头像不为空
        if imgViewLeft.isHidden == false {
            imgViewLeft.snp.makeConstraints { (make) in
                make.centerY.equalToSuperview()
                make.left.equalToSuperview().offset(Xgap)
                make.width.height.equalTo(height)
            }
            labelLeftX = Xgap + height + kPadding
        }
        
        if type == 0 {
            //右边文字优先展示
            let size: CGSize = labelRight.sizeThatFits(.zero)
            labelRight.snp.makeConstraints { (make) in
                make.top.equalToSuperview().offset(kPadding)
                make.right.equalToSuperview().offset(-Xgap)
                make.width.equalTo(ceil(size.width))
                make.bottom.equalToSuperview().offset(-kPadding)
            }
            
            labelLeft.snp.makeConstraints { (make) in
                make.top.bottom.equalTo(labelRight)
                make.left.equalToSuperview().offset(labelLeftX)
                make.right.equalTo(labelRight.snp.left).offset(-kPadding)
            }
            
        } else {
            //左边文字优先展示
            let size: CGSize = labelLeft.sizeThatFits(.zero)
            labelLeft.snp.makeConstraints { (make) in
                make.top.equalToSuperview().offset(kPadding)
                make.left.equalToSuperview().offset(labelLeftX)
                make.width.equalTo(ceil(size.width))
                make.bottom.equalToSuperview().offset(-kPadding)
            }
            
            labelRight.snp.makeConstraints { (make) in
                make.top.bottom.equalTo(labelLeft)
                make.left.equalTo(labelLeft.snp.right).offset(kPadding)
                make.right.equalToSuperview().offset(-Xgap)
            }
        }
    
    }
//    func setupConstraint() {
//        if bounds.height <= 10.0 {
//            return
//        }
//        let height: CGFloat = bounds.height - kPadding*2
//        var labelLeftX: CGFloat = 0.0
//
//        //头像不为空
//        if imgViewLeft.isHidden == false {
//            imgViewLeft.snp.makeConstraints { (make) in
//                make.centerY.equalToSuperview()
//                make.left.equalToSuperview().offset(Xgap)
//                make.width.height.equalTo(height)
//            }
//
//            if type == 0 {
//                //右边文字优先展示
//                let size: CGSize = labelRight.sizeThatFits(.zero)
//                labelRight.snp.makeConstraints { (make) in
//                    make.top.equalToSuperview().offset(kPadding)
//                    make.right.equalToSuperview().offset(-Xgap)
//                    make.width.equalTo(ceil(size.width))
//                    make.bottom.equalToSuperview().offset(-kPadding)
//                }
//
//                labelLeft.snp.makeConstraints { (make) in
//                    make.top.bottom.equalTo(labelRight)
//                    make.left.equalTo(imgViewLeft.snp.right).offset(kPadding)
//                    make.right.equalTo(labelRight.snp.left).offset(-kPadding)
//                }
//
//            } else {
//                //左边文字优先展示
//                let size: CGSize = labelLeft.sizeThatFits(.zero)
//                labelLeft.snp.makeConstraints { (make) in
//                    make.top.equalToSuperview().offset(kPadding)
//                    make.left.equalTo(imgViewLeft.snp.right).offset(kPadding)
//                    make.width.equalTo(ceil(size.width))
//                    make.bottom.equalToSuperview().offset(-kPadding)
//                }
//
//                labelRight.snp.makeConstraints { (make) in
//                    make.top.bottom.equalTo(labelLeft)
//                    make.left.equalTo(labelLeft.snp.right).offset(kPadding)
//                    make.right.equalToSuperview().offset(-Xgap)
//                }
//            }
//          return
//        }
//
//        //头像为空
//        if type == 0 {
//            //右边文字优先展示
//            let size: CGSize = labelRight.sizeThatFits(.zero)
//            labelRight.snp.makeConstraints { (make) in
//                make.top.equalToSuperview().offset(kPadding)
//                make.right.equalToSuperview().offset(-Xgap)
//                make.width.equalTo(ceil(size.width))
//                make.bottom.equalToSuperview().offset(-kPadding)
//            }
//
//            labelLeft.snp.makeConstraints { (make) in
//                make.top.bottom.equalTo(labelRight)
//                make.left.equalToSuperview().offset(Xgap)
//                make.right.equalTo(labelRight.snp.left).offset(-kPadding)
//            }
//
//        } else {
//            //左边文字优先展示
//            let size: CGSize = labelLeft.sizeThatFits(.zero)
//            labelLeft.snp.makeConstraints { (make) in
//                make.top.equalToSuperview().offset(kPadding)
//                make.left.equalToSuperview().offset(Xgap)
//                make.width.equalTo(ceil(size.width))
//                make.bottom.equalToSuperview().offset(-kPadding)
//            }
//
//            labelRight.snp.makeConstraints { (make) in
//                make.top.bottom.equalTo(labelLeft)
//                make.left.equalTo(labelLeft.snp.right).offset(kPadding)
//                make.right.equalToSuperview().offset(-Xgap)
//            }
//        }
//    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
