//
//  UITableViewCellCollect.swift
//  SwiftTemplet
//
//  Created by Bin Shang on 2020/9/9.
//  Copyright © 2020 BN. All rights reserved.
//

import UIKit
import SwiftExpand


class UITableViewCellCollect: UITableViewCell {
    var inset = UIEdgeInsets(top: 10, left: 15, bottom: 10, right: 15)
    var imageSize = CGSize(width: 22, height: 22)
        
    // MARK: -life cycle
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier);
  
        contentView.addSubview(imgViewLeft);
        contentView.addSubview(labelLeft);
        contentView.addSubview(labelLeftSub);
        
        labelLeft.adjustsFontSizeToFitWidth = true
        labelLeft.font = UIFont.systemFont(ofSize: 15)
        labelLeft.textColor = .textColor3
        
        labelLeftSub.adjustsFontSizeToFitWidth = true
        labelLeftSub.font = UIFont.systemFont(ofSize: 12)
        labelLeftSub.textColor = .textColor6
        
        imgViewLeft.image = UIImage(color: .systemBlue)
        
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
        if bounds.height <= 10 {
            return;
        }
        
        let height = bounds.height - inset.top - inset.bottom
        let labStartX = imgViewLeft.isHidden ? inset.left : imageSize.width + inset.left + kPadding
        let endX = accessoryType == .none ? inset.right : kPadding

        if imgViewLeft.isHidden == false {
            imgViewLeft.snp.remakeConstraints { (make) in
                make.top.equalToSuperview().offset(inset.top)
                make.left.equalToSuperview().offset(inset.left)
                make.size.equalTo(imageSize)
            }
        }
        
        labelLeft.snp.remakeConstraints { (make) in
            make.top.equalToSuperview().offset(inset.top);
            make.left.equalToSuperview().offset(labStartX);
            make.right.equalToSuperview().offset(-endX);
            make.height.equalTo(height*0.5);
        }
        
        labelLeftSub.snp.makeConstraints { (make) in
            make.top.equalTo(labelLeft.snp.bottom).offset(0);
            make.left.equalToSuperview().offset(inset.left);
            make.right.equalToSuperview().offset(-endX);
            make.height.equalTo(labelLeft).multipliedBy(0.7);
        }
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    // MARK: -funtions
    

    
    
}

