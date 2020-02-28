//
//  UITableViewCellFive.swift
//  BuildUI
//
//  Created by Bin Shang on 2018/12/19.
//  Copyright © 2018 Bin Shang. All rights reserved.
//

import UIKit
/*
 图像
 主标题
 副标题
 */
class UITableViewCellFive: UITableViewCell {

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier);
        
        contentView.addSubview(imgViewLeft);
        contentView.addSubview(labelLeft);
        contentView.addSubview(labelLeftSub);
                
        labelLeft.textColor = UIColor.black;
        labelLeft.font = UIFont.systemFont(ofSize: 15)
//        labelLeft.textAlignment = .left;
        labelLeft.adjustsFontSizeToFitWidth = true
        
        labelLeftSub.font = UIFont.systemFont(ofSize: 15)
        labelLeftSub.textColor = UIColor.textColor6;
                
        labelLeft.text = "-"
        labelLeftSub.text = "-"
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
//        if CGRect.zero.equalTo(bounds) == true {
//            return;
//        }
        if bounds.height <= 0.0 {
            return
        }
                
        imgViewLeft.snp.makeConstraints { (make) in
            make.top.equalToSuperview().offset(10)
            make.centerX.equalToSuperview()
            make.width.equalTo(70)
            make.height.equalTo(70)
        }
        
        labelLeft.snp.makeConstraints { (make) in
            make.top.equalTo(imgViewLeft.snp.bottom).offset(5);
            make.left.equalToSuperview().offset(10);
            make.right.equalToSuperview().offset(-10);
            make.height.equalTo(20);
        }
        
        labelLeftSub.snp.makeConstraints { (make) in
            make.top.equalTo(labelLeft.snp.bottom).offset(5);
            make.left.equalToSuperview().offset(10);
            make.right.equalToSuperview().offset(-10);
            make.height.equalTo(labelLeft);
        }
        
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }

}

