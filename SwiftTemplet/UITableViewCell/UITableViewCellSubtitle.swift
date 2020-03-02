//
//  UITableViewCellSubtitle.swift
//  SwiftTemplet
//
//  Created by Bin Shang on 2020/1/7.
//  Copyright © 2020 BN. All rights reserved.
//

import UIKit

import SnapKit
import SwiftExpand

/*
 文字+文字
 文字+文字
 */
class UITableViewCellSubtitle: UITableViewCell {

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier);
        
        contentView.addSubview(imgViewLeft);

        contentView.addSubview(labelRight);
        contentView.addSubview(labelRightSub);
        contentView.addSubview(labelLeft);
        contentView.addSubview(labelLeftSub);
        
        imgViewLeft.isHidden = false;
        
        labelLeft.textColor = UIColor.black;
        labelLeft.font = UIFont.systemFont(ofSize: 15)
//        labelLeft.textAlignment = .left;
        labelLeft.adjustsFontSizeToFitWidth = true
        
        labelLeftSub.textColor = UIColor.textColor6;
        labelRightSub.textColor = UIColor.textColor6;
        
        labelRight.textColor = UIColor.black;
        labelRight.font = UIFont.systemFont(ofSize: 15)
        labelRightSub.adjustsFontSizeToFitWidth = true
        
        labelLeft.text = "车牌号码"
        labelLeftSub.text = "支付方式"
        labelRight.text = "$0.00"
        labelRightSub.text = DateFormatter.stringFromDate(Date());
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
        if bounds.height <= 0.0 {
            return;
        }
                
        imgViewLeft.snp.makeConstraints { (make) in
            make.centerY.equalToSuperview();
            make.left.equalToSuperview().offset(10);
            make.width.equalTo(36);
            make.bottom.equalToSuperview().offset(-10);
        }
        
        labelRight.sizeToFit();
        labelRight.snp.makeConstraints { (make) in
            make.top.equalToSuperview().offset(10);
            make.right.equalToSuperview().offset(-10);
            make.height.equalTo(20);
        }
        
        labelRightSub.sizeToFit();
        labelRightSub.snp.makeConstraints { (make) in
            make.right.equalTo(labelRight);
            make.bottom.equalToSuperview().offset(-10);
            make.width.equalTo(150)
            make.height.equalTo(labelRight);
        }

        if imgViewLeft.isHidden {
            labelLeft.snp.makeConstraints { (make) in
                make.centerY.equalTo(labelRight);
                make.left.equalToSuperview().offset(10);
                make.right.equalTo(labelRight.snp.left).offset(-8);
                make.height.equalTo(labelRight);
            }
            
            labelLeftSub.snp.makeConstraints { (make) in
                make.centerY.equalTo(labelRightSub);
                make.left.equalTo(labelLeft);
                make.right.equalTo(labelRightSub.snp.left).offset(-8);
                make.height.equalTo(labelRightSub);
            }
            return;
        }
        
        labelLeft.snp.makeConstraints { (make) in
            make.centerY.equalTo(labelRight);
            make.left.equalTo(imgViewLeft.snp.right).offset(8);
            make.right.equalTo(labelRight.snp.left).offset(-8);
            make.height.equalTo(labelRight);
        }
        
        labelLeftSub.snp.makeConstraints { (make) in
            make.centerY.equalTo(labelRightSub);
            make.left.equalTo(labelLeft);
            make.right.equalTo(labelRightSub.snp.left).offset(-8);
            make.height.equalTo(labelRightSub);
        }
        
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }

}

