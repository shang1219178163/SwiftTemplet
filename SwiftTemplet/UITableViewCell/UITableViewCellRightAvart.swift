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
    var inset = UIEdgeInsets(top: 5, left: 10, bottom: 5, right: 10)

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
        
        if bounds.height <= 10 {
            return
        }
            
        let height = bounds.height - inset.top - inset.bottom
        btn.snp.makeConstraints { (make) in
            make.centerY.equalToSuperview()
            make.right.equalToSuperview().offset(-inset.right);
            make.width.height.equalTo(height);
        }
        btn.layer.cornerRadius = height*0.5
        btn.layer.masksToBounds = true
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
    }


}



