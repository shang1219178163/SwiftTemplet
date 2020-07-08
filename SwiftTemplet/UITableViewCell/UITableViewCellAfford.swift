//
//  UITableViewCellAfford.swift
//  CloudCustomerService
//
//  Created by Bin Shang on 2019/10/8.
//  Copyright © 2019 Xi'an iRain IoT. Technology Service CO., Ltd. . All rights reserved.
//

import UIKit

import SnapKit
import SwiftExpand

class UITableViewCellAfford: UITableViewCell {
    
    /// 优惠券状态(0正常, 1已使用, 2已过期)
    var affordStatus: Int = 0{
        willSet{
            switch newValue {
            case 1:
                labelMark.textColor = UIColor.lightGray;
                labelMark.layer.borderColor = UIColor.lightGray.cgColor;
                
            default:
                labelMark.textColor = UIColor.red;
                labelMark.layer.borderColor = UIColor.red.cgColor;
            }
        }
    }
    
    // MARK: -life cycle

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier);
        
        contentView.addSubview(imgViewLeft);

        contentView.addSubview(labelLeft);
        contentView.addSubview(labelMark);
        contentView.addSubview(labelLeftSub);
        contentView.addSubview(labelRight);
        contentView.addSubview(labelRightSub);
        
        imgViewLeft.isHidden = false;
        
        labelLeft.textColor = UIColor.black;
        labelLeft.font = UIFont.systemFont(ofSize: 15)
        
        labelLeftSub.textColor = UIColor.textColor6;
        labelRight.textColor = UIColor.theme;
        labelRightSub.textColor = UIColor.textColor6;
        
        
        labelLeft.text = "车牌号码"
        labelMark.text = " 未下发 "
        labelLeftSub.text = "支付方式"
        labelRight.text = "$0.00"
        labelRightSub.text = DateFormatter.stringFromDate(Date());
        
//        DDLog(DateFormatter.stringFromDate(Date()));
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
            return;
        }
        
        imgViewLeft.snp.makeConstraints { (make) in
            make.centerY.equalToSuperview();
            make.left.equalToSuperview().offset(12);
            make.width.equalTo(36);
            make.height.equalTo(36);
        }
        
        labelRight.sizeToFit();
        labelRight.snp.makeConstraints { (make) in
            make.top.equalToSuperview().offset(12);
            make.right.equalToSuperview().offset(-12);
            make.width.equalTo(labelRight.frame.width);
            make.height.equalTo(23);
        }
        
        labelRightSub.sizeToFit();
        labelRightSub.snp.makeConstraints { (make) in
            make.top.equalTo(labelRight.snp.bottom).offset(0);
            make.right.equalTo(labelRight);
            make.width.equalTo(150);
            make.height.equalTo(labelRight);
        }
        
        labelLeft.sizeToFit();
        labelLeft.snp.makeConstraints { (make) in
            make.centerY.equalTo(labelRight);
            make.left.equalTo(imgViewLeft.snp.right).offset(10);
            make.width.equalTo(labelLeft.frame.width);
            make.height.equalTo(labelRight);
        }
        
        labelLeftSub.sizeToFit();
        labelLeftSub.snp.makeConstraints { (make) in
            make.centerY.equalTo(labelRightSub);
            make.left.equalTo(labelLeft);
            make.width.equalTo(labelLeftSub.frame.width);
            make.height.equalTo(labelLeft);
        }
        
        labelMark.sizeToFit();
        labelMark.snp.makeConstraints { (make) in
            make.centerY.equalTo(labelRight);
            make.left.equalTo(labelLeft.snp.right).offset(10);
            make.width.equalTo(labelMark.frame.width);
            make.height.equalTo(20);
        }
        
        labelMark.layer.borderColor = labelMark.textColor.cgColor;
        labelMark.layer.borderWidth = 1;
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    // MARK: -lazy
    
    lazy var labelMark: UILabel = {
        var view = UILabel(frame: .zero);
        view.text = "未下发";
        view.textColor = UIColor.red;
        view.font = UIFont.systemFont(ofSize: 11)
        view.sizeToFit()
        view.layer.borderColor = view.textColor.cgColor;
        view.layer.borderWidth = 0.5;
        
        return view;
    }();
    

}

