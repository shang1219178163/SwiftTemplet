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

/*
 文字
 文字(富文本)
*/
@objcMembers class UITableHeaderFooterViewTwo: UITableViewHeaderFooterView {
    
    var isOpen: Bool = false

    var isCanOpen: Bool = false
    // MARK: -lifecycle
    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
 
        contentView.addSubview(labelLeft);
        contentView.addSubview(labelLeftSub);
        contentView.addSubview(lineBottom)

        labelLeft.text = "当前余额"
        labelLeft.font = UIFont.systemFont(ofSize: 14)
        labelLeft.textColor = UIColor.textColor6
        labelLeft.numberOfLines = 1;
        labelLeft.textAlignment = .center;

        labelLeftSub.textColor = UIColor.textColor6
        labelLeftSub.numberOfLines = 1;
        labelLeftSub.textAlignment = .center;
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
        if bounds.height <= 10 {
            return
        }
        let h_labSub: CGFloat = 60.0
        
        //左边文字优先展示
        labelLeft.sizeToFit();
        let padding = (contentView.frame.height - labelLeft.frame.height - h_labSub)/3.0
        
        labelLeft.snp.makeConstraints { (make) in
            make.top.equalToSuperview().offset(padding)
            make.centerX.equalToSuperview()
            make.size.equalTo(labelLeft.size.width)
        }
        
        lineBottom.snp.makeConstraints { (make) in
            make.left.equalToSuperview();
            make.right.equalToSuperview();
            make.bottom.equalToSuperview().offset(0);
            make.height.equalTo(0.33);
        }
        
        //富文本无法计算具体size
        labelLeftSub.frame.origin = CGPoint(x: kX_GAP, y: labelLeft.frame.maxY + padding)
        labelLeftSub.frame.size = CGSize(width: contentView.frame.width - kX_GAP*2, height: h_labSub)
     
    }
    // MARK: -lazy
    
    public lazy var labelLeft: UILabel = {
        let view = UILabel(frame: CGRect.zero)
        view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        view.textAlignment = .left
        view.numberOfLines = 0
        view.lineBreakMode = .byCharWrapping
        
        return view
    }()
  
    public lazy var labelLeftSub: UILabel = {
        let view = UILabel(frame: CGRect.zero)
        view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        view.textAlignment = .left
        view.numberOfLines = 0
        view.lineBreakMode = .byCharWrapping
        view.font = UIFont.systemFont(ofSize: UIFont.labelFontSize - 2.0)
        
        return view
    }()
    
}
