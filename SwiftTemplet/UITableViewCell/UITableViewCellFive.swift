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

    var inset = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
    // MARK: -life cycle

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
        if bounds.height <= 10.0 {
            return
        }
        let labHeight: CGFloat = 20

        let endBottom = labelLeftSub.isHidden ? inset.bottom : inset.bottom + labHeight
    
        if labelLeftSub.isHidden == false {
            labelLeftSub.snp.makeConstraints { (make) in
                make.left.equalToSuperview().offset(inset.left);
                make.right.equalToSuperview().offset(-inset.right);
                make.bottom.equalToSuperview().offset(inset.bottom);
                make.height.equalTo(labHeight);
            }
        }
        
        labelLeft.snp.makeConstraints { (make) in
            make.left.equalToSuperview().offset(inset.left);
            make.right.equalToSuperview().offset(-inset.right);
            make.bottom.equalTo(endBottom).offset(0);
            make.height.equalTo(labHeight);
        }
        
        imgViewLeft.snp.makeConstraints { (make) in
            make.top.equalToSuperview().offset(inset.top)
            make.left.equalToSuperview().offset(inset.left);
            make.right.equalToSuperview().offset(-inset.right);
            make.bottom.equalTo(labelLeft.snp.top).offset(0);
        }
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }

}

