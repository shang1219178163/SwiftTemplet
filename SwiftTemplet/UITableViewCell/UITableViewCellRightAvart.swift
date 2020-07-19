//
//  UITableViewCellRightAvart.swift
//  SwiftTemplet
//
//  Created by Bin Shang on 2020/7/18.
//  Copyright © 2020 BN. All rights reserved.
//

import UIKit
import SwiftExpand

/// 右边头像
class UITableViewCellRightAvart: UITableViewCell {
        
    // MARK: -life cycle

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier);
        
        contentView.addSubview(btn);
        
        btn.setBackgroundImage(UIImage(color: .theme), for: .normal)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder);
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews();
        
        if bounds.height <= 10.0 {
            return
        }
            
        let height = bounds.height - 10
        btn.snp.makeConstraints { (make) in
            make.top.equalToSuperview().offset(5);
            make.right.equalToSuperview().offset(-10);
            make.width.height.equalTo(height);
        }
        DDLog(bounds, btn.bounds)
        btn.layer.cornerRadius = height*0.5
        btn.layer.masksToBounds = true
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
    }


}



