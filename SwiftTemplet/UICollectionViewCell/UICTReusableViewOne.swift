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
                labRight.sizeToFit();
                lab.textAlignment = .left;
                lab.adjustsFontSizeToFitWidth = true
                
            } else {
                //左边文字优先展示
                lab.sizeToFit();
                labRight.textAlignment = .right;
                labRight.adjustsFontSizeToFitWidth = true
            }
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(imgView)
        addSubview(lab)
        addSubview(labRight)
        addSubview(imgViewRight)
        
        imgView.image = UIImage(named: kIMG_notice);
        
        lab.numberOfLines = 1;
        labRight.numberOfLines = 1;
        
        lab.backgroundColor = UIColor.random
        imgView.backgroundColor = UIColor.random
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        setupConstraint()
    }
    
    func setupConstraint() {
        let height = min(kSizeArrow.height, bounds.height)
        //箭头不隐藏
        if imgViewRight.isHidden == false {
            
            imgViewRight.snp.makeConstraints { (make) in
                make.centerY.equalToSuperview()
                make.right.equalToSuperview().offset(-kX_GAP)
                make.size.equalTo(height)
            }
            //头像不为空
            if imgView.image != nil {
                imgView.snp.makeConstraints { (make) in
                    make.centerY.equalToSuperview()
                    make.left.equalToSuperview().offset(kX_GAP)
                    make.width.height.equalTo(frame.height)
                }
                
                if type == 0 {
                    //右边文字优先展示
                    labRight.sizeToFit();
                    labRight.snp.makeConstraints { (make) in
                        make.centerY.equalToSuperview()
                        make.right.equalTo(imgViewRight.snp.left).offset(-kPadding)
                        make.height.equalTo(height)
                    }
                    
                    lab.snp.makeConstraints { (make) in
                        make.centerY.equalToSuperview()
                        make.left.equalTo(imgView.snp.right).offset(kPadding)
                        make.right.equalTo(labRight.snp.left).offset(-kPadding)
                        make.height.equalTo(height)
                    }
                    
                } else {
                    //左边文字优先展示
                    lab.sizeToFit();
                    lab.snp.makeConstraints { (make) in
                        make.centerY.equalToSuperview()
                        make.left.equalTo(imgView.snp.right).offset(kPadding)
                        make.height.equalTo(height)
                    }
                    
                    labRight.snp.makeConstraints { (make) in
                        make.centerY.equalToSuperview()
                        make.left.equalTo(lab.snp.right).offset(kPadding)
                        make.right.greaterThanOrEqualTo(imgViewRight.snp.left).offset(-kPadding)
                        make.height.equalTo(height)
                    }
                }
                
            } else {
                //头像为空
                imgView.snp.makeConstraints { (make) in
                    make.centerY.equalToSuperview()
                    make.left.equalToSuperview().offset(kX_GAP)
                    make.width.height.equalTo(0.0)
                }
                
                if type == 0 {
                    labRight.sizeToFit();
                    labRight.snp.makeConstraints { (make) in
                        make.centerY.equalToSuperview()
                        make.right.equalTo(imgViewRight.snp.left).offset(-kPadding)
                        make.height.equalTo(height)
                    }
                    
                    lab.snp.makeConstraints { (make) in
                        make.centerY.equalToSuperview()
                        make.left.equalToSuperview().offset(kX_GAP)
                        make.right.equalTo(labRight.snp.left).offset(-kPadding)
                        make.height.equalTo(height)
                    }
                    
                } else {
                    lab.sizeToFit();
                    lab.snp.makeConstraints { (make) in
                        make.centerY.equalToSuperview()
                        make.left.equalToSuperview().offset(kX_GAP)
                        make.height.equalTo(height)
                    }
                    
                    labRight.snp.makeConstraints { (make) in
                        make.centerY.equalToSuperview()
                        make.left.equalTo(lab.snp.right).offset(kPadding)
                        make.right.equalTo(imgViewRight.snp.left).offset(-kPadding)
                        make.height.equalTo(height)
                    }
                }
            }
            
        } else {
            //头像不为空
            if imgView.image != nil {
                imgView.snp.makeConstraints { (make) in
                    make.centerY.equalToSuperview()
                    make.left.equalToSuperview().offset(kX_GAP)
                    make.width.height.equalTo(frame.height - kY_GAP*2)
                }
                
                if type == 0 {
                    //右边文字优先展示
                    labRight.sizeToFit();
                    labRight.snp.makeConstraints { (make) in
                        make.centerY.equalToSuperview()
                        make.right.equalToSuperview().offset(-kX_GAP);
                        make.height.equalTo(height)
                    }
                    
                    lab.snp.makeConstraints { (make) in
                        make.centerY.equalToSuperview()
                        make.left.equalTo(imgView.snp.right).offset(kPadding)
                        make.right.equalTo(labRight.snp.left).offset(-kPadding)
                        make.height.equalTo(height)
                    }
                    
                } else {
                    //左边文字优先展示
                    lab.sizeToFit();
                    lab.snp.makeConstraints { (make) in
                        make.centerY.equalToSuperview()
                        make.left.equalTo(imgView.snp.right).offset(kPadding)
                        make.height.equalTo(height)
                    }
                    
                    labRight.snp.makeConstraints { (make) in
                        make.centerY.equalToSuperview()
                        make.left.equalTo(lab.snp.right).offset(kPadding)
                        make.right.equalToSuperview().offset(-kX_GAP)
                        make.height.equalTo(height)
                    }
                }
                
            } else {
                imgView.snp.makeConstraints { (make) in
                    make.centerY.equalToSuperview()
                    make.left.equalToSuperview().offset(kX_GAP)
                    make.width.height.equalTo(0.0)
                }
                if type == 0 {
                    //右边文字优先展示
                    labRight.sizeToFit();
                    labRight.snp.makeConstraints { (make) in
                        make.centerY.equalToSuperview()
                        make.right.equalToSuperview().offset(-kX_GAP);
                        make.height.equalTo(height)
                    }
                    
                    lab.snp.makeConstraints { (make) in
                        make.centerY.equalToSuperview()
                        make.left.equalToSuperview().offset(kX_GAP)
                        make.right.equalTo(labRight.snp.left).offset(-kPadding)
                        make.height.equalTo(height)
                    }
                } else {
                    //左边文字优先展示
                    lab.sizeToFit();
                    lab.snp.makeConstraints { (make) in
                        make.centerY.equalToSuperview()
                        make.left.equalToSuperview().offset(kX_GAP)
                        make.height.equalTo(height)
                    }
                    
                    labRight.snp.makeConstraints { (make) in
                        make.centerY.equalToSuperview()
                        make.left.equalTo(lab.snp.right).offset(kPadding)
                        make.right.equalToSuperview().offset(-kX_GAP)
                        make.height.equalTo(height)
                    }
                }
            }
        }
    }
    
//    func setupConstraint() {
//        //箭头不隐藏
//        if imgViewRight.isHidden == false {
//            imgViewRight.snp.makeConstraints { (make) in
//                make.centerY.equalToSuperview()
//                make.right.equalToSuperview().offset(-kX_GAP)
//                make.size.equalTo(kSizeArrow)
//            }
//            //头像不为空
//            if imgView.image != nil {
//                imgView.snp.makeConstraints { (make) in
//                    make.centerY.equalToSuperview()
//                    make.left.equalToSuperview().offset(kX_GAP)
//                    make.width.height.equalTo(frame.height - 5*2)
//                }
//
//                if type == 0 {
//                    //右边文字优先展示
//                    labelRight.sizeToFit();
//                    labelRight.snp.makeConstraints { (make) in
//                        make.centerY.equalToSuperview()
//                        make.right.equalTo(imgViewRight.snp.left).offset(-kPadding)
//                        make.height.equalTo(kSizeArrow.height)
//                    }
//
//                    label.snp.makeConstraints { (make) in
//                        make.centerY.equalToSuperview()
//                        make.left.equalTo(imgView.snp.right).offset(kPadding)
//                        make.right.equalTo(labelRight.snp.left).offset(-kPadding)
//                        make.height.equalTo(kSizeArrow.height)
//                    }
//
//                } else {
//                    //左边文字优先展示
//                    label.sizeToFit();
//                    label.snp.makeConstraints { (make) in
//                        make.centerY.equalToSuperview()
//                        make.left.equalTo(imgView.snp.right).offset(kPadding)
//                        make.height.equalTo(kSizeArrow.height)
//                    }
//
//                    labelRight.snp.makeConstraints { (make) in
//                        make.centerY.equalToSuperview()
//                        make.left.equalTo(label.snp.right).offset(kPadding)
//                        make.right.greaterThanOrEqualTo(imgViewRight.snp.left).offset(-kPadding)
//                        make.height.equalTo(kSizeArrow.height)
//                    }
//                }
//
//            } else {
//                //头像为空
//                imgView.snp.makeConstraints { (make) in
//                    make.centerY.equalToSuperview()
//                    make.left.equalToSuperview().offset(kX_GAP)
//                    make.width.height.equalTo(0.0)
//                }
//
//                if type == 0 {
//                    labelRight.sizeToFit();
//                    labelRight.snp.makeConstraints { (make) in
//                        make.centerY.equalToSuperview()
//                        make.right.equalTo(imgViewRight.snp.left).offset(-kPadding)
//                        make.height.equalTo(kSizeArrow.height)
//                    }
//
//                    label.snp.makeConstraints { (make) in
//                        make.centerY.equalToSuperview()
//                        make.left.equalToSuperview().offset(kX_GAP)
//                        make.right.equalTo(labelRight.snp.left).offset(-kPadding)
//                        make.height.equalTo(kSizeArrow.height)
//                    }
//
//                } else {
//                    label.sizeToFit();
//                    label.snp.makeConstraints { (make) in
//                        make.centerY.equalToSuperview()
//                        make.left.equalToSuperview().offset(kX_GAP)
//                        make.height.equalTo(kSizeArrow.height)
//                    }
//
//                    labelRight.snp.makeConstraints { (make) in
//                        make.centerY.equalToSuperview()
//                        make.left.equalTo(label.snp.right).offset(kPadding)
//                        make.right.equalTo(imgViewRight.snp.left).offset(-kPadding)
//                        make.height.equalTo(kSizeArrow.height)
//                    }
//                }
//            }
//
//        } else {
//            //头像不为空
//            if imgView.image != nil {
//                imgView.snp.makeConstraints { (make) in
//                    make.centerY.equalToSuperview()
//                    make.left.equalToSuperview().offset(kX_GAP)
//                    make.width.height.equalTo(frame.height - kY_GAP*2)
//                }
//
//                if type == 0 {
//                    //右边文字优先展示
//                    labelRight.sizeToFit();
//                    labelRight.snp.makeConstraints { (make) in
//                        make.centerY.equalToSuperview()
//                        make.right.equalToSuperview().offset(-kX_GAP);
//                        make.height.equalTo(kSizeArrow.height)
//                    }
//
//                    label.snp.makeConstraints { (make) in
//                        make.centerY.equalToSuperview()
//                        make.left.equalTo(imgView.snp.right).offset(kPadding)
//                        make.right.equalTo(labelRight.snp.left).offset(-kPadding)
//                        make.height.equalTo(kSizeArrow.height)
//                    }
//
//                } else {
//                    //左边文字优先展示
//                    label.sizeToFit();
//                    label.snp.makeConstraints { (make) in
//                        make.centerY.equalToSuperview()
//                        make.left.equalTo(imgView.snp.right).offset(kPadding)
//                        make.height.equalTo(kSizeArrow.height)
//                    }
//
//                    labelRight.snp.makeConstraints { (make) in
//                        make.centerY.equalToSuperview()
//                        make.left.equalTo(label.snp.right).offset(kPadding)
//                        make.right.equalToSuperview().offset(-kX_GAP)
//                        make.height.equalTo(kSizeArrow.height)
//                    }
//                }
//
//            } else {
//                imgView.snp.makeConstraints { (make) in
//                    make.centerY.equalToSuperview()
//                    make.left.equalToSuperview().offset(kX_GAP)
//                    make.width.height.equalTo(0.0)
//                }
//                if type == 0 {
//                    //右边文字优先展示
//                    labelRight.sizeToFit();
//                    labelRight.snp.makeConstraints { (make) in
//                        make.centerY.equalToSuperview()
//                        make.right.equalToSuperview().offset(-kX_GAP);
//                        make.height.equalTo(kSizeArrow.height)
//                    }
//
//                    label.snp.makeConstraints { (make) in
//                        make.centerY.equalToSuperview()
//                        make.left.equalToSuperview().offset(kX_GAP)
//                        make.right.equalTo(labelRight.snp.left).offset(-kPadding)
//                        make.height.equalTo(kSizeArrow.height)
//                    }
//                } else {
//                    //左边文字优先展示
//                    label.sizeToFit();
//                    label.snp.makeConstraints { (make) in
//                        make.centerY.equalToSuperview()
//                        make.left.equalToSuperview().offset(kX_GAP)
//                        make.height.equalTo(kSizeArrow.height)
//                    }
//
//                    labelRight.snp.makeConstraints { (make) in
//                        make.centerY.equalToSuperview()
//                        make.left.equalTo(label.snp.right).offset(kPadding)
//                        make.right.equalToSuperview().offset(-kX_GAP)
//                        make.height.equalTo(kSizeArrow.height)
//                    }
//                }
//            }
//        }
//    }
}
