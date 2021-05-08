//
//  UITableViewCellStatistics.swift
//  IntelligentOfParking
//
//  Created by Bin Shang on 2019/8/9.
//  Copyright © 2019 Xi'an iRain IoT. Technology Service CO., Ltd. . All rights reserved.
//

import SnapKit
import SwiftExpand

///

@objcMembers class UITableViewCellStatistics: UITableViewCell {
        
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier);
        
        contentView.addSubview(labelLeft);
        contentView.addSubview(labelRight);
        contentView.addSubview(lineTop);

        contentView.addSubview(labelLeftSub);
        contentView.addSubview(labelRightSub);
        contentView.addSubview(labelMidSub);
        
        contentView.addSubview(labelLeftSubValue);
        contentView.addSubview(labelRightSubValue);
        contentView.addSubview(labelMidSubValue);
        
        labelLeft.text = kNilText;
        labelRight.text = kNilText;
        labelLeftSub.text = kNilText;
        labelMidSub.text = kNilText;
        labelRightSub.text = kNilText;

        labelLeft.font = UIFont.systemFont(ofSize: 13)
        labelRight.font = UIFont.systemFont(ofSize: 13)
        
        labelLeftSub.font = UIFont.systemFont(ofSize: 12)
        labelRightSub.font = UIFont.systemFont(ofSize: 12)
        labelLeftSub.textAlignment = .center
        labelRightSub.textAlignment = .center

        labelLeft.textColor = UIColor.textColor3
        labelRight.textColor = UIColor.textColor3
        
        lineTop.backgroundColor = UIColor.hexValue(0xe5e5e5);

        labelLeftSub.textColor = UIColor.textColor3
        labelRightSub.textColor = UIColor.textColor3
        
        labelLeftSub.textColor = UIColor.textColor9
        labelRightSub.textColor = UIColor.textColor9
        labelMidSub.textColor = UIColor.textColor9

        labelLeftSubValue.textColor = UIColor.textColor3
        labelMidSubValue.textColor = UIColor.textColor3

        labelRightSubValue.textColor = UIColor.theme;
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
        
        labelRight.sizeToFit()
        labelRight.snp.makeConstraints { (make) in
            make.top.equalToSuperview().offset(kPadding);
            make.right.equalToSuperview().offset(-kX_GAP);
            make.size.equalTo(CGSize(width: labelRight.frame.width, height: 20));
        }
        
        labelLeft.snp.makeConstraints { (make) in
            make.top.equalTo(labelRight);
            make.left.equalToSuperview().offset(kX_GAP);
            make.right.equalTo(labelRight.snp.left).offset(-kPadding);
            make.height.equalTo(labelRight);
        }
        
        lineTop.snp.makeConstraints { (make) in
            make.top.equalTo(labelLeft.snp.bottom).offset(kPadding);
            make.left.equalTo(labelLeft);
            make.right.equalTo(labelRight);
            make.height.equalTo(1);
        }
        
        let labSubList = [labelLeftSub, labelMidSub, labelRightSub]
        labSubList.snp.distributeViewsAlong(axisType: .horizontal, fixedSpacing: kPadding, leadSpacing: kX_GAP, tailSpacing: kX_GAP)
        labSubList.snp.makeConstraints { (make) in
            make.top.equalTo(lineTop.snp.bottom).offset(kPadding);
            make.height.equalTo(20);
        }
        
        let labSubValueList = [labelLeftSubValue, labelMidSubValue, labelRightSubValue]
        labSubValueList.snp.distributeViewsAlong(axisType: .horizontal, fixedSpacing: kPadding, leadSpacing: kX_GAP, tailSpacing: kX_GAP)
        labSubValueList.snp.makeConstraints { (make) in
            make.top.equalTo(labelLeftSub.snp.bottom).offset(5);
            make.height.equalTo(20);
        }
        
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
    }
    
    lazy var labelMidSub: UILabel = {
        let view = UILabel.create(.zero, type: .oneLine)
        view.font = UIFont.systemFont(ofSize: 12)
        view.text = kNilText;
        view.textAlignment = .center
        
        return view
    }()
    
    lazy var labelMidSubValue: UILabel = {
        let view = UILabel.create(.zero, type: .oneLine)
        view.font = UIFont(name: UIFont.kPingFangSemibold, size: 14)
        view.text = kNilText;
        view.textAlignment = .center

        return view
    }()
    
    lazy var labelLeftSubValue: UILabel = {
        let view = UILabel.create(.zero, type: .oneLine)
        view.font = UIFont(name: UIFont.kPingFangSemibold, size: 14)
        view.text = kNilText;
        view.textAlignment = .center

        return view
    }()
    
    lazy var labelRightSubValue: UILabel = {
        let view = UILabel.create(.zero, type: .oneLine)
        view.font = UIFont(name: UIFont.kPingFangSemibold, size: 14)
        view.text = kNilText;
        view.textAlignment = .center

        return view
    }()
    
}




