//
//  UITableHeaderFooterViewTwo.swift
//  IntelligentOfParking
//
//  Created by Bin Shang on 2019/1/10.
//  Copyright © 2019 Xi'an iRain IoT. Technology Service CO., Ltd. . All rights reserved.
//

import UIKit

import SnapKit
import SwiftExpand

class UITableHeaderFooterViewTwo: UITableViewHeaderFooterView {

    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        
        /*
                文字
                文字(富文本)
         */
        contentView.addSubview(labelLeft);
        contentView.addSubview(labelLeftSub);
        
        labelLeft.text = "当前余额"
        labelLeft.font = UIFont.systemFont(ofSize: 14)
        labelLeft.textColor = UIColor.textColorSub
        labelLeft.numberOfLines = 1;
        labelLeft.textAlignment = .center;

        labelLeftSub.textColor = UIColor.textColorTitle
        labelLeftSub.numberOfLines = 1;
        labelLeftSub.textAlignment = .center;
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder);
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews();
        
        let h_labSub: CGFloat = 60.0
        
        //左边文字优先展示
        labelLeft.sizeToFit();
        let padding = (contentView.frame.height - labelLeft.frame.height - h_labSub)/3.0
        
        labelLeft.snp.makeConstraints { (make) in
            make.top.equalToSuperview().offset(padding)
            make.centerX.equalToSuperview()
            make.size.equalTo(labelLeft.size.width)
        }
        
        //富文本无法计算具体size
        labelLeftSub.frame.origin = CGPoint(x: kX_GAP, y: labelLeft.frame.maxY + padding)
        labelLeftSub.frame.size = CGSize(width: contentView.frame.width - kX_GAP*2, height: h_labSub)
     
    }
    
}
