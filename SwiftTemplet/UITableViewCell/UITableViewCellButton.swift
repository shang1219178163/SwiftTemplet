//
//  UITableViewCellButton.swift
//  IntelligentOfParking
//
//  Created by Bin Shang on 2020/1/16.
//  Copyright © 2020 Xi'an iRain IoT. Technology Service CO., Ltd. . All rights reserved.
//

import UIKit

/// 确认按钮
class UITableViewCellButton: UITableViewCell {
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier);
        
        contentView.addSubview(btn);
        
        btn.setTitle("确定", for: .normal)
        btn.setTitleColor( .white, for: .normal)
        btn.backgroundColor = .theme
        btn.layer.cornerRadius = 3
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder);
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews();
        
        if self.bounds.height <= 0.0 {
            return
        }
        
        btn.snp.makeConstraints { (make) in
            make.top.equalToSuperview().offset(8)
            make.left.equalToSuperview().offset(10)
            make.bottom.equalToSuperview().offset(-8)
            make.right.equalToSuperview().offset(-10)
        }
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
    }

}



