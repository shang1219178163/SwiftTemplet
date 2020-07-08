//
//  UITableViewCellChoose.swift
//  IntelligentOfParking
//
//  Created by Bin Shang on 2020/3/3.
//  Copyright © 2020 Xi'an iRain IoT. Technology Service CO., Ltd. . All rights reserved.
//

import UIKit
import SnapKit

/*
 勾选框   文字+文字
         文字+文字
 */
class UITableViewCellChoose: UITableViewCell {

    var Xgap: CGFloat = 15;

    // MARK: -life cycle
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier);
        
        contentView.addSubview(btn);

        contentView.addSubview(labelRight);
        contentView.addSubview(labelRightSub);
        contentView.addSubview(labelLeft);
        contentView.addSubview(labelLeftSub);
        
        btn.backgroundColor = UIColor.white
        btn.setBackgroundImage(UIImage(named: "btn_selected_NO"), for: .normal)
        btn.setBackgroundImage(UIImage(named: "btn_selected_YES"), for: .selected)

        labelLeft.textColor = UIColor.black;
        labelLeft.font = UIFont.systemFont(ofSize: 15)
        labelLeft.adjustsFontSizeToFitWidth = true
        
        labelLeftSub.textColor = UIColor.textColor6;
        labelRightSub.textColor = UIColor.textColor6;

        labelRight.textColor = UIColor.black;
        labelRight.textAlignment = .right;
        labelRight.font = UIFont.systemFont(ofSize: 13)

        labelRightSub.adjustsFontSizeToFitWidth = true
        labelRightSub.textAlignment = .right;
        labelRightSub.font = UIFont.systemFont(ofSize: 13)

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
        if bounds.height <= 10.0 {
            return;
        }
        
        let height: CGFloat = bounds.height - 20
                
        btn.snp.makeConstraints { (make) in
            make.centerY.equalToSuperview();
            make.left.equalToSuperview().offset(Xgap);
            make.width.height.equalTo(20);
        }
        
        labelRight.sizeToFit();
        labelRight.snp.makeConstraints { (make) in
            make.top.equalToSuperview().offset(10);
            make.right.equalToSuperview().offset(-10);
            make.height.equalTo(height*0.5);
        }
        
        labelRightSub.sizeToFit();
        labelRightSub.snp.makeConstraints { (make) in
            make.right.equalTo(labelRight);
            make.bottom.equalToSuperview().offset(-10);
            make.height.equalTo(labelRight);
        }

        if btn.isHidden {
            labelLeft.snp.makeConstraints { (make) in
                make.centerY.equalTo(labelRight);
                make.left.equalToSuperview().offset(Xgap);
                make.right.equalTo(labelRight.snp.left).offset(-8);
                make.height.equalTo(labelRight);
            }
            
            labelLeftSub.snp.makeConstraints { (make) in
                make.centerY.equalTo(labelRightSub);
                make.left.equalTo(labelLeft);
                make.right.equalTo(labelRightSub.snp.left).offset(-8);
                make.height.equalTo(labelRightSub);
            }

        } else {
            labelLeft.snp.makeConstraints { (make) in
                make.centerY.equalTo(labelRight);
                make.left.equalTo(btn.snp.right).offset(Xgap);
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
        
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }

}

