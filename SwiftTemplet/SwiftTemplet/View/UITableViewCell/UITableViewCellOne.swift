
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
       
        //图片+文字+文字+图片
        contentView.addSubview(imgViewLeft);
        contentView.addSubview(imgViewRight);
        
        contentView.addSubview(labelLeft);
        contentView.addSubview(labelRight);
        
        labelRight.numberOfLines = 1;
        labelLeft.numberOfLines = 1;
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder);
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews();
        
//        if type == 0 {
//            //右边文字优先展示
//            labelRight.sizeToFit();
//            labelLeft.textAlignment = .left;
//
//        } else {
//            //左边文字优先展示
//            labelLeft.sizeToFit();
//            labelRight.textAlignment = .right;
//
//        }
        
        //箭头不隐藏
        if imgViewRight.isHidden == false {
            imgViewRight.snp.makeConstraints { (make) in
                make.top.equalToSuperview().offset(contentView.frame.midY - kSize_Arrow.height/2.0)
                make.right.equalToSuperview().offset(-kX_GAP)
                make.size.equalTo(kSize_Arrow)
            }
            //头像不为空
            if imgViewLeft.image != nil {
                imgViewLeft.snp.makeConstraints { (make) in
                    make.top.equalToSuperview().offset(kY_GAP)
                    make.left.equalToSuperview().offset(kX_GAP)
                    make.width.height.equalTo(contentView.frame.height - kY_GAP*2)
                }
                
                if type == 0 {
                    //右边文字优先展示
                    labelRight.sizeToFit();
                    labelRight.snp.makeConstraints { (make) in
                        make.top.height.equalTo(imgViewRight);
                        make.right.equalTo(imgViewRight.snp.left).offset(-kPadding)
                        make.width.equalTo(labelRight.size.width);
                    }
                    
                    labelLeft.snp.makeConstraints { (make) in
                        make.top.height.equalTo(imgViewRight);
                        make.left.equalTo(imgViewLeft.snp.right).offset(kPadding)
                        make.right.equalTo(labelRight.snp.left).offset(-kPadding)
                    }
                    
                } else {
                    //左边文字优先展示
                    labelLeft.sizeToFit();
                    labelLeft.snp.makeConstraints { (make) in
                        make.top.height.equalTo(imgViewRight);
                        make.left.equalTo(imgViewLeft.snp.right).offset(kPadding)
                        make.width.equalTo(labelLeft.size.width);
                    }
                    
                    labelRight.snp.makeConstraints { (make) in
                        make.top.height.equalTo(imgViewRight);
                        make.left.equalTo(labelLeft.snp.right).offset(kPadding)
                        make.right.greaterThanOrEqualTo(imgViewRight.snp.left).offset(-kPadding)
                    }
                }
                
            } else {
                //头像为空
                imgViewLeft.snp.makeConstraints { (make) in
                    make.top.equalToSuperview().offset(kY_GAP)
                    make.left.equalToSuperview().offset(kX_GAP)
                    make.width.height.equalTo(0.0)
                }
                
                if type == 0 {
                    labelRight.sizeToFit();
                    labelRight.snp.makeConstraints { (make) in
                        make.top.height.equalTo(imgViewRight);
                        make.right.equalTo(imgViewRight.snp.left).offset(-kPadding)
                        make.width.equalTo(labelRight.size.width);
                    }
                    
                    labelLeft.snp.makeConstraints { (make) in
                        make.top.height.equalTo(imgViewRight);
                        make.left.equalToSuperview().offset(kX_GAP)
                        make.right.equalTo(labelRight.snp.left).offset(-kPadding)
                    }
                    
                } else {
                    labelLeft.sizeToFit();
                    labelLeft.snp.makeConstraints { (make) in
                        make.top.height.equalTo(imgViewRight);
                        make.left.equalToSuperview().offset(kX_GAP)
                        make.width.equalTo(labelLeft.size.width);
                    }
                    
                    labelRight.snp.makeConstraints { (make) in
                        make.top.height.equalTo(imgViewRight);
                        make.left.equalTo(labelLeft.snp.right).offset(kPadding)
                        make.right.equalTo(imgViewRight.snp.left).offset(-kPadding)
                    }
                }
            }
            
        } else {
            
            let labH = kSize_Arrow.height
            let top = contentView.frame.midY - labH/2.0
            if type == 0 {
                //右边文字优先展示
                labelRight.sizeToFit();
                labelRight.snp.makeConstraints { (make) in
                    make.top.equalToSuperview().offset(top);
                    make.right.equalToSuperview().offset(-kX_GAP);
                    make.width.equalTo(labelRight.size.width);
                }
                
                labelLeft.snp.makeConstraints { (make) in
                    make.top.height.equalTo(labelRight);
                    make.left.equalToSuperview().offset(kX_GAP)
                    make.right.equalTo(labelRight.snp.left).offset(-kPadding)
                }
                
            } else {
                //左边文字优先展示
                labelLeft.sizeToFit();
                labelLeft.snp.makeConstraints { (make) in
                    make.top.equalTo(top);
                    make.left.equalToSuperview().offset(kX_GAP)
                    make.width.equalTo(labelLeft.size.width);
                }
                
                labelRight.snp.makeConstraints { (make) in
                    make.top.height.equalTo(labelLeft);
                    make.left.equalTo(labelLeft.snp.right).offset(kPadding)
                    make.right.equalToSuperview().offset(-kX_GAP)
                }
            }
        }
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}