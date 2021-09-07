//
//  UITableViewCellTags.swift
//  SwiftTemplet
//
//  Created by Bin Shang on 2020/6/2.
//  Copyright © 2020 BN. All rights reserved.
//

import UIKit

import SnapKit
import SwiftExpand

/// 星期多选
@objcMembers class UITableViewCellTags: UITableViewCell {
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
         super.init(style: style, reuseIdentifier: reuseIdentifier);
        
        tagView.frame = CGRect(x: 10, y: 10, width: kScreenWidth - 20, height: self.contentView.bounds.height)
        contentView.addSubview(tagView);
        
        tagView.tags = ["默认标签", "默认标签1", "默认标签2", ]
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder);
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
//        tagView.snp.makeConstraints { (make) in
//            make.top.equalToSuperview().offset(10);
//            make.left.equalToSuperview().offset(15);
//            make.right.equalToSuperview().offset(-15);
//            make.bottom.equalToSuperview().offset(-10);
//        }
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    // MARK: -lazy

    lazy var tagView: NNTagView = {
        let view = NNTagView(frame: self.contentView.bounds)
        view.fontSize = 9;
        view.textColorNormal = .orange;
        view.tag = 2010115;
        return view;
    }()

}
