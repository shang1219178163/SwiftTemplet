//
//  UICTReusableViewOne.swift
//  SwiftTemplet
//
//  Created by Bin Shang on 2018/12/23.
//  Copyright © 2018 BN. All rights reserved.
//

import UIKit

import SnapKit
import SwiftExpand

class UICTReusableViewOne: UICollectionReusableView {
    
//    var type = 0;//0优先显示右边文字,1代表优先显示左边文字
    var type: Int = 0{
        didSet {
            if oldValue == 0 {
                //右边文字优先展示
                textLabelRight.sizeToFit();
                textLabel.textAlignment = .left;
                textLabel.adjustsFontSizeToFitWidth = true
                
            } else {
                //左边文字优先展示
                textLabel.sizeToFit();
                textLabelRight.textAlignment = .right;
                textLabelRight.adjustsFontSizeToFitWidth = true
                
            }
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(imageView)
        addSubview(textLabel)
        addSubview(textLabelRight)
        addSubview(imageViewRight)

//        type = 1;
        
        imageView.image = UIImage(named: kIMG_notice);
        
        textLabel.numberOfLines = 1;
        textLabelRight.numberOfLines = 1;
        
        textLabel.backgroundColor = UIColor.random
        imageView.backgroundColor = UIColor.random
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
//        if type == 0 {
//            //右边文字优先展示
//            textLabelRight.sizeToFit();
//            textLabel.textAlignment = .left;
//            textLabel.adjustsFontSizeToFitWidth = true
//
//        } else {
//            //左边文字优先展示
//            textLabel.sizeToFit();
//            textLabelRight.textAlignment = .right;
//            textLabelRight.adjustsFontSizeToFitWidth = true
//
//        }
        
        //箭头不隐藏
        if imageViewRight.isHidden == false {
            imageViewRight.snp.makeConstraints { (make) in
                make.top.equalToSuperview().offset(frame.midY - kSize_Arrow.height/2.0)
                make.right.equalToSuperview().offset(-kX_GAP)
                make.size.equalTo(kSize_Arrow)
            }
            //头像不为空
            if imageView.image != nil {
                imageView.snp.makeConstraints { (make) in
                    make.top.equalToSuperview().offset(kY_GAP)
                    make.left.equalToSuperview().offset(kX_GAP)
                    make.width.height.equalTo(frame.height - kY_GAP*2)
                }
                
                if type == 0 {
                    //右边文字优先展示
                    textLabelRight.numberOfLines = 1;
                    textLabelRight.sizeToFit();
                    textLabelRight.snp.makeConstraints { (make) in
                        make.top.height.equalTo(imageViewRight);
                        make.right.equalTo(imageViewRight.snp.left).offset(-kPadding)
                        make.width.equalTo(textLabelRight.size.width);
                    }
                    
                    textLabel.snp.makeConstraints { (make) in
                        make.top.height.equalTo(imageViewRight);
                        make.left.equalTo(imageView.snp.right).offset(kPadding)
                        make.right.equalTo(textLabelRight.snp.left).offset(-kPadding)
                    }
                    
                } else {
                    //左边文字优先展示
                    textLabel.numberOfLines = 1;
                    textLabel.sizeToFit();
                    textLabel.snp.makeConstraints { (make) in
                        make.top.height.equalTo(imageViewRight);
                        make.left.equalTo(imageView.snp.right).offset(kPadding)
                        make.width.equalTo(textLabel.size.width);
                    }
                    
                    textLabelRight.snp.makeConstraints { (make) in
                        make.top.height.equalTo(imageViewRight);
                        make.left.equalTo(textLabel.snp.right).offset(kPadding)
                        make.right.greaterThanOrEqualTo(imageViewRight.snp.left).offset(-kPadding)
                    }
                }
                
            } else {
                //头像为空
                imageView.snp.makeConstraints { (make) in
                    make.top.equalToSuperview().offset(kY_GAP)
                    make.left.equalToSuperview().offset(kX_GAP)
                    make.width.height.equalTo(0.0)
                }
                
                if type == 0 {
                    textLabelRight.numberOfLines = 1;
                    textLabelRight.sizeToFit();
                    textLabelRight.snp.makeConstraints { (make) in
                        make.top.height.equalTo(imageViewRight);
                        make.right.equalTo(imageViewRight.snp.left).offset(-kPadding)
                        make.width.equalTo(textLabelRight.size.width);
                    }
                    
                    textLabel.snp.makeConstraints { (make) in
                        make.top.height.equalTo(imageViewRight);
                        make.left.equalToSuperview().offset(kX_GAP)
                        make.right.equalTo(textLabelRight.snp.left).offset(-kPadding)
                    }
                    
                } else {
                    textLabel.numberOfLines = 1;
                    textLabel.sizeToFit();
                    textLabel.snp.makeConstraints { (make) in
                        make.top.height.equalTo(imageViewRight);
                        make.left.equalToSuperview().offset(kX_GAP)
                        make.width.equalTo(textLabel.size.width);
                    }
                    
                    textLabelRight.textAlignment = .right;
                    textLabelRight.snp.makeConstraints { (make) in
                        make.top.height.equalTo(imageViewRight);
                        make.left.equalTo(textLabel.snp.right).offset(kPadding)
                        make.right.equalTo(imageViewRight.snp.left).offset(-kPadding)
                    }
                }
            }
            
        } else {
            
            let labH = kSize_Arrow.height
            let top = frame.midY - labH/2.0
            if type == 0 {
                //右边文字优先展示
                textLabelRight.numberOfLines = 1;
                textLabelRight.sizeToFit();
                textLabelRight.snp.makeConstraints { (make) in
                    make.top.equalToSuperview().offset(top);
                    make.right.equalToSuperview().offset(-kX_GAP);
                    make.width.equalTo(textLabelRight.size.width);
                }
                
                textLabel.snp.makeConstraints { (make) in
                    make.top.height.equalTo(textLabelRight);
                    make.left.equalToSuperview().offset(kX_GAP)
                    make.right.equalTo(textLabelRight.snp.left).offset(-kPadding)
                }
                
            } else {
                //左边文字优先展示
                textLabel.numberOfLines = 1;
                textLabel.sizeToFit();
                textLabel.snp.makeConstraints { (make) in
                    make.top.equalTo(top);
                    make.left.equalToSuperview().offset(kX_GAP)
                    make.width.equalTo(textLabel.size.width);
                }
                
                textLabelRight.textAlignment = .right;
                textLabelRight.snp.makeConstraints { (make) in
                    make.top.height.equalTo(textLabel);
                    make.left.equalTo(textLabel.snp.right).offset(kPadding)
                    make.right.equalToSuperview().offset(-kX_GAP)
                }
            }
        }
    }
    
}
