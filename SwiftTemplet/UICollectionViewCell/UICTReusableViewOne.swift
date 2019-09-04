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
        
        imageView.image = UIImage(named: kIMG_notice);
        
        textLabel.numberOfLines = 1;
        textLabelRight.numberOfLines = 1;
        
        textLabel.backgroundColor = UIColor.random
        imageView.backgroundColor = UIColor.random
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        setupConstraint()
    }
    
    func setupConstraint() -> Void {
        let height = min(kSizeArrow.height, bounds.height)
        //箭头不隐藏
        if imageViewRight.isHidden == false {
            
            imageViewRight.snp.makeConstraints { (make) in
                make.centerY.equalToSuperview()
                make.right.equalToSuperview().offset(-kX_GAP)
                make.size.equalTo(height)
            }
            //头像不为空
            if imageView.image != nil {
                imageView.snp.makeConstraints { (make) in
                    make.centerY.equalToSuperview()
                    make.left.equalToSuperview().offset(kX_GAP)
                    make.width.height.equalTo(frame.height)
                }
                
                if type == 0 {
                    //右边文字优先展示
                    textLabelRight.sizeToFit();
                    textLabelRight.snp.makeConstraints { (make) in
                        make.centerY.equalToSuperview()
                        make.right.equalTo(imageViewRight.snp.left).offset(-kPadding)
                        make.height.equalTo(height)
                    }
                    
                    textLabel.snp.makeConstraints { (make) in
                        make.centerY.equalToSuperview()
                        make.left.equalTo(imageView.snp.right).offset(kPadding)
                        make.right.equalTo(textLabelRight.snp.left).offset(-kPadding)
                        make.height.equalTo(height)
                    }
                    
                } else {
                    //左边文字优先展示
                    textLabel.sizeToFit();
                    textLabel.snp.makeConstraints { (make) in
                        make.centerY.equalToSuperview()
                        make.left.equalTo(imageView.snp.right).offset(kPadding)
                        make.height.equalTo(height)
                    }
                    
                    textLabelRight.snp.makeConstraints { (make) in
                        make.centerY.equalToSuperview()
                        make.left.equalTo(textLabel.snp.right).offset(kPadding)
                        make.right.greaterThanOrEqualTo(imageViewRight.snp.left).offset(-kPadding)
                        make.height.equalTo(height)
                    }
                }
                
            } else {
                //头像为空
                imageView.snp.makeConstraints { (make) in
                    make.centerY.equalToSuperview()
                    make.left.equalToSuperview().offset(kX_GAP)
                    make.width.height.equalTo(0.0)
                }
                
                if type == 0 {
                    textLabelRight.sizeToFit();
                    textLabelRight.snp.makeConstraints { (make) in
                        make.centerY.equalToSuperview()
                        make.right.equalTo(imageViewRight.snp.left).offset(-kPadding)
                        make.height.equalTo(height)
                    }
                    
                    textLabel.snp.makeConstraints { (make) in
                        make.centerY.equalToSuperview()
                        make.left.equalToSuperview().offset(kX_GAP)
                        make.right.equalTo(textLabelRight.snp.left).offset(-kPadding)
                        make.height.equalTo(height)
                    }
                    
                } else {
                    textLabel.sizeToFit();
                    textLabel.snp.makeConstraints { (make) in
                        make.centerY.equalToSuperview()
                        make.left.equalToSuperview().offset(kX_GAP)
                        make.height.equalTo(height)
                    }
                    
                    textLabelRight.snp.makeConstraints { (make) in
                        make.centerY.equalToSuperview()
                        make.left.equalTo(textLabel.snp.right).offset(kPadding)
                        make.right.equalTo(imageViewRight.snp.left).offset(-kPadding)
                        make.height.equalTo(height)
                    }
                }
            }
            
        } else {
            //头像不为空
            if imageView.image != nil {
                imageView.snp.makeConstraints { (make) in
                    make.centerY.equalToSuperview()
                    make.left.equalToSuperview().offset(kX_GAP)
                    make.width.height.equalTo(frame.height - kY_GAP*2)
                }
                
                if type == 0 {
                    //右边文字优先展示
                    textLabelRight.sizeToFit();
                    textLabelRight.snp.makeConstraints { (make) in
                        make.centerY.equalToSuperview()
                        make.right.equalToSuperview().offset(-kX_GAP);
                        make.height.equalTo(height)
                    }
                    
                    textLabel.snp.makeConstraints { (make) in
                        make.centerY.equalToSuperview()
                        make.left.equalTo(imageView.snp.right).offset(kPadding)
                        make.right.equalTo(textLabelRight.snp.left).offset(-kPadding)
                        make.height.equalTo(height)
                    }
                    
                } else {
                    //左边文字优先展示
                    textLabel.sizeToFit();
                    textLabel.snp.makeConstraints { (make) in
                        make.centerY.equalToSuperview()
                        make.left.equalTo(imageView.snp.right).offset(kPadding)
                        make.height.equalTo(height)
                    }
                    
                    textLabelRight.snp.makeConstraints { (make) in
                        make.centerY.equalToSuperview()
                        make.left.equalTo(textLabel.snp.right).offset(kPadding)
                        make.right.equalToSuperview().offset(-kX_GAP)
                        make.height.equalTo(height)
                    }
                }
                
            } else {
                imageView.snp.makeConstraints { (make) in
                    make.centerY.equalToSuperview()
                    make.left.equalToSuperview().offset(kX_GAP)
                    make.width.height.equalTo(0.0)
                }
                if type == 0 {
                    //右边文字优先展示
                    textLabelRight.sizeToFit();
                    textLabelRight.snp.makeConstraints { (make) in
                        make.centerY.equalToSuperview()
                        make.right.equalToSuperview().offset(-kX_GAP);
                        make.height.equalTo(height)
                    }
                    
                    textLabel.snp.makeConstraints { (make) in
                        make.centerY.equalToSuperview()
                        make.left.equalToSuperview().offset(kX_GAP)
                        make.right.equalTo(textLabelRight.snp.left).offset(-kPadding)
                        make.height.equalTo(height)
                    }
                } else {
                    //左边文字优先展示
                    textLabel.sizeToFit();
                    textLabel.snp.makeConstraints { (make) in
                        make.centerY.equalToSuperview()
                        make.left.equalToSuperview().offset(kX_GAP)
                        make.height.equalTo(height)
                    }
                    
                    textLabelRight.snp.makeConstraints { (make) in
                        make.centerY.equalToSuperview()
                        make.left.equalTo(textLabel.snp.right).offset(kPadding)
                        make.right.equalToSuperview().offset(-kX_GAP)
                        make.height.equalTo(height)
                    }
                }
            }
        }
    }
    
//    func setupConstraint() -> Void {
//        //箭头不隐藏
//        if imageViewRight.isHidden == false {
//            imageViewRight.snp.makeConstraints { (make) in
//                make.centerY.equalToSuperview()
//                make.right.equalToSuperview().offset(-kX_GAP)
//                make.size.equalTo(kSizeArrow)
//            }
//            //头像不为空
//            if imageView.image != nil {
//                imageView.snp.makeConstraints { (make) in
//                    make.centerY.equalToSuperview()
//                    make.left.equalToSuperview().offset(kX_GAP)
//                    make.width.height.equalTo(frame.height - 5*2)
//                }
//
//                if type == 0 {
//                    //右边文字优先展示
//                    textLabelRight.sizeToFit();
//                    textLabelRight.snp.makeConstraints { (make) in
//                        make.centerY.equalToSuperview()
//                        make.right.equalTo(imageViewRight.snp.left).offset(-kPadding)
//                        make.height.equalTo(kSizeArrow.height)
//                    }
//
//                    textLabel.snp.makeConstraints { (make) in
//                        make.centerY.equalToSuperview()
//                        make.left.equalTo(imageView.snp.right).offset(kPadding)
//                        make.right.equalTo(textLabelRight.snp.left).offset(-kPadding)
//                        make.height.equalTo(kSizeArrow.height)
//                    }
//
//                } else {
//                    //左边文字优先展示
//                    textLabel.sizeToFit();
//                    textLabel.snp.makeConstraints { (make) in
//                        make.centerY.equalToSuperview()
//                        make.left.equalTo(imageView.snp.right).offset(kPadding)
//                        make.height.equalTo(kSizeArrow.height)
//                    }
//
//                    textLabelRight.snp.makeConstraints { (make) in
//                        make.centerY.equalToSuperview()
//                        make.left.equalTo(textLabel.snp.right).offset(kPadding)
//                        make.right.greaterThanOrEqualTo(imageViewRight.snp.left).offset(-kPadding)
//                        make.height.equalTo(kSizeArrow.height)
//                    }
//                }
//
//            } else {
//                //头像为空
//                imageView.snp.makeConstraints { (make) in
//                    make.centerY.equalToSuperview()
//                    make.left.equalToSuperview().offset(kX_GAP)
//                    make.width.height.equalTo(0.0)
//                }
//
//                if type == 0 {
//                    textLabelRight.sizeToFit();
//                    textLabelRight.snp.makeConstraints { (make) in
//                        make.centerY.equalToSuperview()
//                        make.right.equalTo(imageViewRight.snp.left).offset(-kPadding)
//                        make.height.equalTo(kSizeArrow.height)
//                    }
//
//                    textLabel.snp.makeConstraints { (make) in
//                        make.centerY.equalToSuperview()
//                        make.left.equalToSuperview().offset(kX_GAP)
//                        make.right.equalTo(textLabelRight.snp.left).offset(-kPadding)
//                        make.height.equalTo(kSizeArrow.height)
//                    }
//
//                } else {
//                    textLabel.sizeToFit();
//                    textLabel.snp.makeConstraints { (make) in
//                        make.centerY.equalToSuperview()
//                        make.left.equalToSuperview().offset(kX_GAP)
//                        make.height.equalTo(kSizeArrow.height)
//                    }
//
//                    textLabelRight.snp.makeConstraints { (make) in
//                        make.centerY.equalToSuperview()
//                        make.left.equalTo(textLabel.snp.right).offset(kPadding)
//                        make.right.equalTo(imageViewRight.snp.left).offset(-kPadding)
//                        make.height.equalTo(kSizeArrow.height)
//                    }
//                }
//            }
//
//        } else {
//            //头像不为空
//            if imageView.image != nil {
//                imageView.snp.makeConstraints { (make) in
//                    make.centerY.equalToSuperview()
//                    make.left.equalToSuperview().offset(kX_GAP)
//                    make.width.height.equalTo(frame.height - kY_GAP*2)
//                }
//
//                if type == 0 {
//                    //右边文字优先展示
//                    textLabelRight.sizeToFit();
//                    textLabelRight.snp.makeConstraints { (make) in
//                        make.centerY.equalToSuperview()
//                        make.right.equalToSuperview().offset(-kX_GAP);
//                        make.height.equalTo(kSizeArrow.height)
//                    }
//
//                    textLabel.snp.makeConstraints { (make) in
//                        make.centerY.equalToSuperview()
//                        make.left.equalTo(imageView.snp.right).offset(kPadding)
//                        make.right.equalTo(textLabelRight.snp.left).offset(-kPadding)
//                        make.height.equalTo(kSizeArrow.height)
//                    }
//
//                } else {
//                    //左边文字优先展示
//                    textLabel.sizeToFit();
//                    textLabel.snp.makeConstraints { (make) in
//                        make.centerY.equalToSuperview()
//                        make.left.equalTo(imageView.snp.right).offset(kPadding)
//                        make.height.equalTo(kSizeArrow.height)
//                    }
//
//                    textLabelRight.snp.makeConstraints { (make) in
//                        make.centerY.equalToSuperview()
//                        make.left.equalTo(textLabel.snp.right).offset(kPadding)
//                        make.right.equalToSuperview().offset(-kX_GAP)
//                        make.height.equalTo(kSizeArrow.height)
//                    }
//                }
//
//            } else {
//                imageView.snp.makeConstraints { (make) in
//                    make.centerY.equalToSuperview()
//                    make.left.equalToSuperview().offset(kX_GAP)
//                    make.width.height.equalTo(0.0)
//                }
//                if type == 0 {
//                    //右边文字优先展示
//                    textLabelRight.sizeToFit();
//                    textLabelRight.snp.makeConstraints { (make) in
//                        make.centerY.equalToSuperview()
//                        make.right.equalToSuperview().offset(-kX_GAP);
//                        make.height.equalTo(kSizeArrow.height)
//                    }
//
//                    textLabel.snp.makeConstraints { (make) in
//                        make.centerY.equalToSuperview()
//                        make.left.equalToSuperview().offset(kX_GAP)
//                        make.right.equalTo(textLabelRight.snp.left).offset(-kPadding)
//                        make.height.equalTo(kSizeArrow.height)
//                    }
//                } else {
//                    //左边文字优先展示
//                    textLabel.sizeToFit();
//                    textLabel.snp.makeConstraints { (make) in
//                        make.centerY.equalToSuperview()
//                        make.left.equalToSuperview().offset(kX_GAP)
//                        make.height.equalTo(kSizeArrow.height)
//                    }
//
//                    textLabelRight.snp.makeConstraints { (make) in
//                        make.centerY.equalToSuperview()
//                        make.left.equalTo(textLabel.snp.right).offset(kPadding)
//                        make.right.equalToSuperview().offset(-kX_GAP)
//                        make.height.equalTo(kSizeArrow.height)
//                    }
//                }
//            }
//        }
//    }
}
