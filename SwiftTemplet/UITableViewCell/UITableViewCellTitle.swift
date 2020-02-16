//
//  UITableViewCellTitle.swift
//  IntelligentOfParking
//
//  Created by Bin Shang on 2020/2/14.
//  Copyright © 2020 Xi'an iRain IoT. Technology Service CO., Ltd. . All rights reserved.
//

import UIKit

/// 标题+按钮
class UITableViewCellTitle: UITableViewCell {
    
    /// 按钮位置
    var alignment: NSTextAlignment = .left
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier);
        
        contentView.addSubview(labelLeft);
        contentView.addSubview(btn);

        labelLeft.font = UIFont.systemFont(ofSize: 15, weight: .bold)
        btn.setImage(UIImage(named: "icon_card_tips"), for: .normal)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder);
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews();
        
        if CGRect.zero == self.bounds {
            return
        }
        
        if labelLeft.isHidden == true {
            btn.snp.makeConstraints { (make) in
                make.top.equalToSuperview().offset(8)
                make.left.equalToSuperview().offset(10)
                make.bottom.equalToSuperview().offset(-8)
                make.right.equalToSuperview().offset(-10)
            }
            return;
        }
        
        labelLeft.sizeToFit();
        labelLeft.snp.makeConstraints { (make) in
            make.centerY.equalToSuperview()
            make.left.equalToSuperview().offset(10)
        }
        
        if alignment == .left {
            btn.snp.makeConstraints { (make) in
                make.centerY.equalToSuperview()
                make.left.equalTo(labelLeft.snp.right).offset(5)
                make.width.equalTo(17)
                make.height.equalTo(17)
            }
            
        } else {
            btn.snp.makeConstraints { (make) in
                make.centerY.equalToSuperview()
                make.right.equalToSuperview().offset(-10)
                make.width.equalTo(17)
                make.height.equalTo(17)
            }
            
        }
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
    }

}



