//
//  UITableViewCellThree.swift
//  BuildUI
//
//  Created by Bin Shang on 2018/12/19.
//  Copyright © 2018 Bin Shang. All rights reserved.
//

import UIKit
import SwiftExpand

class UITableViewCellThree: UITableViewCell {

    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier);
        
        //文字+副标题(默认对齐方式)
        contentView.addSubview(labelLeft);
        contentView.addSubview(labelRight);
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder);
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews();
        
        labelLeft.sizeToFit();
        labelLeft.snp.makeConstraints { (make) in
            make.top.equalToSuperview().offset(contentView.frame.midY - kH_LABEL/2.0)
            make.left.equalToSuperview().offset(kX_GAP)
            make.width.equalTo(labelLeft.size.width);
        }
        
        labelRight.snp.makeConstraints { (make) in
            make.top.height.equalTo(labelLeft);
            make.left.equalTo(labelLeft.snp.right).offset(kPadding)
            make.right.equalToSuperview().offset(-kX_GAP)
        }
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
