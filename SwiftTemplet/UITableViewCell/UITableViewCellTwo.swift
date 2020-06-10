//
//  UITableViewCellTwo.swift
//  BuildUI
//
//  Created by Bin Shang on 2018/12/19.
//  Copyright © 2018 Bin Shang. All rights reserved.
//

import UIKit

import SnapKit
import SwiftExpand

/// 右侧单选框
class UITableViewCellTwo: UITableViewCell {

    var Xgap: CGFloat = 15;
    // MARK: -life cycle

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier);
        
        /*
         --------------------
         图片+文字          按钮
             文字
         --------------------
         */
        contentView.addSubview(imgViewLeft);
        contentView.addSubview(labelLeft);
        contentView.addSubview(labelLeftSub);
        contentView.addSubview(btn);
        
        labelLeftSub.textColor = UIColor.gray

        btn.titleLabel?.font = UIFont.systemFont(ofSize: 16)
        btn.setTitleColor(UIColor.black, for: .normal)
        btn.setTitleColor(UIColor.theme, for: .selected)
//        btn.setTitle("进行中", for: .normal);
//        btn.setTitle("已关闭", for: .selected);
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
            return
        }
        btn.sizeToFit();
        btn.snp.makeConstraints { (make) in
            make.top.equalToSuperview().offset(contentView.frame.midY - 35/2.0)
            make.right.equalToSuperview().offset(-10)
            make.width.equalTo(btn.size.width)
            make.height.equalTo(35)
        }
        
        let labH = (bounds.height - kPadding*3)/2.0;
        if imgViewLeft.isHidden == true {
            imgViewLeft.snp.makeConstraints { (make) in
                make.top.equalToSuperview().offset(kY_GAP)
                make.left.equalToSuperview().offset(Xgap)
                make.width.height.equalTo(0.0)
            }
            
            labelLeft.snp.makeConstraints { (make) in
                make.top.equalTo(imgViewLeft);
                make.left.equalTo(imgViewLeft.snp.right)
                make.right.equalTo(btn.snp.left).offset(-kPadding)
                make.height.equalTo(labH);
            }
            
            labelLeftSub.snp.makeConstraints { (make) in
                make.top.equalTo(labelLeft.snp.bottom).offset(kPadding)
                make.left.equalTo(labelLeft.snp.left)
                make.width.height.equalTo(labelLeft)
            }
            return
        }
        
        imgViewLeft.snp.makeConstraints { (make) in
            make.top.equalToSuperview().offset(kY_GAP)
            make.left.equalToSuperview().offset(Xgap)
            make.width.height.equalTo(bounds.height - kY_GAP*2)
        }
        
        labelLeft.snp.makeConstraints { (make) in
            make.top.equalTo(imgViewLeft);
            make.left.equalTo(imgViewLeft.snp.right).offset(kPadding)
            make.right.equalTo(btn.snp.left).offset(-kPadding)
            make.height.equalTo(labH);
        }
        
        labelLeftSub.snp.makeConstraints { (make) in
            make.top.equalTo(labelLeft.snp.bottom).offset(kPadding)
            make.left.equalTo(labelLeft.snp.left)
            make.width.height.equalTo(labelLeft)
        }
    }
    
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    
    
    
}
