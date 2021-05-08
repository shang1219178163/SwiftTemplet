//
//  UITableViewCellCoupon.swift
//  SwiftTemplet
//
//  Created by Bin Shang on 2020/5/14.
//  Copyright © 2020 BN. All rights reserved.
//

import UIKit


import SwiftExpand

/// 优惠券充值记录

@objcMembers class UITableViewCellCouponRecharge: UITableViewCell {
            
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier);
        
        contentView.addSubview(btnName);
        contentView.addSubview(btn);
        contentView.addSubview(lineTop);

        contentView.addSubview(labelMidLeft);
        contentView.addSubview(labelMidRight);
        
        contentView.addSubview(labelBottomLeft);
        contentView.addSubview(labelBottomRight);
                
        btn.setTitle("详情", for: .normal)
        btn.setTitleColor(UIColor.gray, for: .normal)
        
        labelMidLeft.text = kNilText;
        labelMidRight.text = kNilText;
        labelBottomLeft.text = kNilText;
        labelBottomRight.text = kNilText;

        labelMidLeft.font = UIFont.systemFont(ofSize: 13)
        labelMidRight.font = UIFont.systemFont(ofSize: 13)
        labelBottomLeft.font = UIFont.systemFont(ofSize: 13)
        labelBottomRight.font = UIFont.systemFont(ofSize: 13)
        
        labelMidRight.textAlignment = .right
        labelBottomRight.textAlignment = .right

        labelLeft.textColor = UIColor.textColor3
        labelRight.textColor = UIColor.textColor3
        
//        lineTop.backgroundColor = UIColor.hexValue(0xe5e5e5);
        lineTop.backgroundColor = UIColor.line

        labelLeftSub.textColor = UIColor.textColor3
        labelBottomRight.textColor = UIColor.textColor6
        
        btn.isHidden = true
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
        if bounds.height <= 0 {
            return
        }
        
        btnName.sizeToFit()
        btnName.snp.makeConstraints { (make) in
            make.top.equalToSuperview().offset(kPadding);
            make.left.equalToSuperview().offset(10);
            make.size.equalTo(btnName.bounds.size);
        }
        
        btn.sizeToFit()
        btn.snp.makeConstraints { (make) in
            make.top.equalTo(btnName).offset(0);
            make.right.equalToSuperview().offset(-10);
            make.size.equalTo(btnName.bounds.size);
        }

//        let topList = [btnName, btn]
//        topList.snp.distributeViewsAlong(axisType: .horizontal, fixedSpacing: kPadding, leadSpacing: 10, tailSpacing: 10)
//        topList.snp.makeConstraints { (make) in
//            make.top.equalToSuperview().offset(kPadding);
//            make.height.equalTo(20);
//        }
        
        lineTop.snp.makeConstraints { (make) in
            make.top.equalTo(btnName.snp.bottom).offset(kPadding);
            make.left.equalTo(btnName);
            make.right.equalToSuperview().offset(-10)
            make.height.equalTo(1);
        }
        
        let midList = [labelMidLeft, labelMidRight]
        midList.snp.distributeViewsAlong(axisType: .horizontal, fixedSpacing: kPadding, leadSpacing: 10, tailSpacing: 10)
        midList.snp.makeConstraints { (make) in
            make.top.equalTo(lineTop.snp.bottom).offset(kPadding);
            make.height.equalTo(20);
        }
        
        let bottomList = [labelBottomLeft, labelBottomRight]
        bottomList.snp.distributeViewsAlong(axisType: .horizontal, fixedSpacing: kPadding, leadSpacing: 10, tailSpacing: 10)
        bottomList.snp.makeConstraints { (make) in
            make.top.equalTo(labelMidLeft.snp.bottom).offset(5);
            make.height.equalTo(20);
        }
        
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
    }
    
    lazy var btnName: UIButton = {
        let view = UIButton.create(.zero, title: "--", textColor: .systemBlue, backgroundColor: .clear)
        view.titleLabel?.font = UIFont.systemFont(ofSize: 15, weight: .bold)
        
        return view
    }()
    
    lazy var labelMidLeft: UILabel = {
        let view = UILabel.create(.zero, type: .oneLine)
        view.font = UIFont.systemFont(ofSize: 12)
        view.text = kNilText;
        
        return view
    }()
    
    lazy var labelMidRight: UILabel = {
        let view = UILabel.create(.zero, type: .oneLine)
        view.font = UIFont(name: UIFont.kPingFangSemibold, size: 14)
        view.text = kNilText;

        return view
    }()
    
    lazy var labelBottomLeft: UILabel = {
        let view = UILabel.create(.zero, type: .oneLine)
        view.font = UIFont(name: UIFont.kPingFangSemibold, size: 14)
        view.text = kNilText;

        return view
    }()
    
    lazy var labelBottomRight: UILabel = {
        let view = UILabel.create(.zero, type: .oneLine)
        view.font = UIFont(name: UIFont.kPingFangSemibold, size: 14)
        view.text = kNilText;

        return view
    }()
    
}




