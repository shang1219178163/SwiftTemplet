//
//  UITableViewCellGoodsDuration.swift
//  SwiftTemplet
//
//  Created by Bin Shang on 2020/3/2.
//  Copyright © 2020 BN. All rights reserved.
//

import UIKit
import SnapKit
import SwiftExpand

/// 商品购买时长
class UITableViewCellGoodsDuration: UITableViewCell {
     
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
         super.init(style: style, reuseIdentifier: reuseIdentifier);
        
        contentView.addSubview(labelLeft);
        contentView.addSubview(groupView);
        
        labelLeft.text = "购买时长"
        labelLeft.textColor = .gray
        labelLeft.font = UIFont.systemFont(ofSize: 12)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder);
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        if labelLeft.isHidden {
            groupView.snp.makeConstraints { (make) in
                make.top.equalTo(labelLeft.snp.bottom).offset(10);
                make.left.equalToSuperview().offset(15);
                make.right.equalToSuperview().offset(-15);
                make.bottom.equalToSuperview().offset(-10);
            }
            return
        }
        
        labelLeft.snp.makeConstraints { (make) in
            make.top.equalToSuperview().offset(5);
            make.left.equalToSuperview().offset(15);
            make.right.equalToSuperview().offset(-10);
            make.height.lessThanOrEqualTo(25);
        }
        
        groupView.snp.makeConstraints { (make) in
            make.top.equalTo(labelLeft.snp.bottom).offset(5);
            make.left.equalToSuperview().offset(15);
            make.right.equalToSuperview().offset(-15);
            make.bottom.equalToSuperview().offset(-10);
        }
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    
    lazy var groupView: NNButtonGroupView = {
        let view = NNButtonGroupView(frame: .zero)
        view.padding = 10;
        view.numberOfRow = 3;
        
        view.cornerRadius = 3.0
        view.fontSize = 12
        view.isMutiChoose = false;
        view.hasLessOne = true
        view.block({ (groupView, sender) in
            print(sender.currentTitle ?? "", groupView.selectedIdxList)
        })
        return view;
    }()

}
