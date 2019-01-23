
//
//  UITableViewCellOne.swift
//  SwiftTemplet
//
//  Created by hsf on 2018/8/29.
//  Copyright © 2018年 BN. All rights reserved.
//

import UIKit
import SnapKit
import SwiftExpand

/// 图片+文字+文字+图片
class UITableViewCellOne: UITableViewCell {

//    var type = 0;//0优先显示右边文字,1代表优先显示左边文字
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
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier);
        contentView.addSubview(imgViewLeft);
        contentView.addSubview(imgViewRight);
        contentView.addSubview(labelLeft);
        contentView.addSubview(labelRight);
        
        labelRight.numberOfLines = 1;
        labelLeft.numberOfLines = 1;
        
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
        //箭头不隐藏
        if imgViewRight.isHidden == false {
            imgViewRight.snp.makeConstraints { (make) in
                make.centerY.equalToSuperview()
                make.right.equalToSuperview().offset(-kX_GAP)
                make.size.equalTo(kSizeArrow)
            }
            //头像不为空
            if imgViewLeft.image != nil {
                imgViewLeft.snp.makeConstraints { (make) in
                    make.centerY.equalToSuperview()
                    make.left.equalToSuperview().offset(kX_GAP)
                    make.width.height.equalTo(contentView.frame.height - kY_GAP*2)
                }
                
                if type == 0 {
                    //右边文字优先展示
                    labelRight.sizeToFit();
                    labelRight.snp.makeConstraints { (make) in
                        make.centerY.equalToSuperview()
                        make.right.equalTo(imgViewRight.snp.left).offset(-kPadding)
                        make.height.equalTo(kSizeArrow.height)
                    }
                    
                    labelLeft.snp.makeConstraints { (make) in
                        make.centerY.equalToSuperview()
                        make.left.equalTo(imgViewLeft.snp.right).offset(kPadding)
                        make.right.equalTo(labelRight.snp.left).offset(-kPadding)
                        make.height.equalTo(kSizeArrow.height)
                    }
                    
                } else {
                    //左边文字优先展示
                    labelLeft.sizeToFit();
                    labelLeft.snp.makeConstraints { (make) in
                        make.centerY.equalToSuperview()
                        make.left.equalTo(imgViewLeft.snp.right).offset(kPadding)
                        make.height.equalTo(kSizeArrow.height)
                    }
                    
                    labelRight.snp.makeConstraints { (make) in
                        make.centerY.equalToSuperview()
                        make.left.equalTo(labelLeft.snp.right).offset(kPadding)
                        make.right.greaterThanOrEqualTo(imgViewRight.snp.left).offset(-kPadding)
                        make.height.equalTo(kSizeArrow.height)
                    }
                }
                
            } else {
                //头像为空
                imgViewLeft.snp.makeConstraints { (make) in
                    make.centerY.equalToSuperview()
                    make.left.equalToSuperview().offset(kX_GAP)
                    make.width.height.equalTo(0.0)
                }
                
                if type == 0 {
                    labelRight.sizeToFit();
                    labelRight.snp.makeConstraints { (make) in
                        make.centerY.equalToSuperview()
                        make.right.equalTo(imgViewRight.snp.left).offset(-kPadding)
                        make.height.equalTo(kSizeArrow.height)
                    }
                    
                    labelLeft.snp.makeConstraints { (make) in
                        make.centerY.equalToSuperview()
                        make.left.equalToSuperview().offset(kX_GAP)
                        make.right.equalTo(labelRight.snp.left).offset(-kPadding)
                        make.height.equalTo(kSizeArrow.height)
                    }
                    
                } else {
                    labelLeft.sizeToFit();
                    labelLeft.snp.makeConstraints { (make) in
                        make.centerY.equalToSuperview()
                        make.left.equalToSuperview().offset(kX_GAP)
                        make.height.equalTo(kSizeArrow.height)
                    }
                    
                    labelRight.snp.makeConstraints { (make) in
                        make.centerY.equalToSuperview()
                        make.left.equalTo(labelLeft.snp.right).offset(kPadding)
                        make.right.equalTo(imgViewRight.snp.left).offset(-kPadding)
                        make.height.equalTo(kSizeArrow.height)
                    }
                }
            }
            
        } else {
            //头像不为空
            if imgViewLeft.image != nil {
                imgViewLeft.snp.makeConstraints { (make) in
                    make.centerY.equalToSuperview()
                    make.left.equalToSuperview().offset(kX_GAP)
                    make.width.height.equalTo(contentView.frame.height - kY_GAP*2)
                }
                
                if type == 0 {
                    //右边文字优先展示
                    labelRight.sizeToFit();
                    labelRight.snp.makeConstraints { (make) in
                        make.centerY.equalToSuperview()
                        make.right.equalToSuperview().offset(-kX_GAP);
                        make.height.equalTo(kSizeArrow.height)
                    }
                    
                    labelLeft.snp.makeConstraints { (make) in
                        make.centerY.equalToSuperview()
                        make.left.equalTo(imgViewLeft.snp.right).offset(kPadding)
                        make.right.equalTo(labelRight.snp.left).offset(-kPadding)
                        make.height.equalTo(kSizeArrow.height)
                    }
                    
                } else {
                    //左边文字优先展示
                    labelLeft.sizeToFit();
                    labelLeft.snp.makeConstraints { (make) in
                        make.centerY.equalToSuperview()
                        make.left.equalTo(imgViewLeft.snp.right).offset(kPadding)
                        make.height.equalTo(kSizeArrow.height)
                    }
                    
                    labelRight.snp.makeConstraints { (make) in
                        make.centerY.equalToSuperview()
                        make.left.equalTo(labelLeft.snp.right).offset(kPadding)
                        make.right.equalToSuperview().offset(-kX_GAP)
                        make.height.equalTo(kSizeArrow.height)
                    }
                }
                
            } else {
                imgViewLeft.snp.makeConstraints { (make) in
                    make.centerY.equalToSuperview()
                    make.left.equalToSuperview().offset(kX_GAP)
                    make.width.height.equalTo(0.0)
                }
                if type == 0 {
                    //右边文字优先展示
                    labelRight.sizeToFit();
                    labelRight.snp.makeConstraints { (make) in
                        make.centerY.equalToSuperview()
                        make.right.equalToSuperview().offset(-kX_GAP);
                        make.height.equalTo(kSizeArrow.height)
                    }
                    
                    labelLeft.snp.makeConstraints { (make) in
                        make.centerY.equalToSuperview()
                        make.left.equalToSuperview().offset(kX_GAP)
                        make.right.equalTo(labelRight.snp.left).offset(-kPadding)
                        make.height.equalTo(kSizeArrow.height)
                    }
                } else {
                    //左边文字优先展示
                    labelLeft.sizeToFit();
                    labelLeft.snp.makeConstraints { (make) in
                        make.centerY.equalToSuperview()
                        make.left.equalToSuperview().offset(kX_GAP)
                        make.height.equalTo(kSizeArrow.height)
                    }
                    
                    labelRight.snp.makeConstraints { (make) in
                        make.centerY.equalToSuperview()
                        make.left.equalTo(labelLeft.snp.right).offset(kPadding)
                        make.right.equalToSuperview().offset(-kX_GAP)
                        make.height.equalTo(kSizeArrow.height)
                    }
                }
            }
        }
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
