//
//  UITableViewCellArticle.swift
//  SwiftTemplet
//
//  Created by Bin Shang on 2020/9/25.
//  Copyright © 2020 BN. All rights reserved.
//

import UIKit
import SwiftExpand

class UITableViewCellArticle: UITableViewCell {
    var inset = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
    var imageSize = CGSize(width: 85, height: 65)
    var iconSize = CGSize(width: 36, height: 36)

    lazy var fromImgView: UIImageView = {
        let view = UIImageView()
        return view
    }()
    
    lazy var fromLabel: UILabel = {
        let view = UILabel()
        return view
    }()
    
    // MARK: -life cycle
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier);
  
        contentView.addSubview(labelLeft)
        contentView.addSubview(labelLeftSub)
        contentView.addSubview(imgViewRight)
        contentView.addSubview(fromImgView)
        contentView.addSubview(fromLabel)

        labelLeft.adjustsFontSizeToFitWidth = true
        labelLeft.font = UIFont.systemFont(ofSize: 15 ,weight: .medium)
        labelLeft.textColor = .textColor3
        labelLeft.numberOfLines = 2
        
        labelLeftSub.adjustsFontSizeToFitWidth = true
        labelLeftSub.font = UIFont.systemFont(ofSize: 12)
        labelLeftSub.textColor = .textColor6
        labelLeftSub.numberOfLines = 2

        fromLabel.textColor = .textColor6
        fromLabel.font = UIFont.systemFont(ofSize: 12)

        imgViewRight.contentMode = .left
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
        
        let width = bounds.width - inset.left - inset.right
        let height = bounds.height - inset.top - inset.bottom

        let labStartX = imgViewLeft.isHidden ? inset.left : imageSize.width + inset.left + kPadding
        let labSubEndX = imgViewRight.isHidden ? inset.right : imageSize.width + inset.right + kPadding
        
        let labelLeftSize = labelLeft.sizeThatFits(CGSize(width: width, height: CGFloat.greatestFiniteMagnitude))
        labelLeft.snp.remakeConstraints { (make) in
            make.top.equalToSuperview().offset(inset.top);
            make.left.equalToSuperview().offset(inset.left);
            make.right.equalToSuperview().offset(-inset.right);
            make.height.equalTo(labelLeftSize.height);
        }
        
        if imgViewRight.isHidden == false {
            imgViewRight.snp.remakeConstraints { (make) in
                make.top.equalTo(labelLeft.snp.bottom).offset(kPadding)
                make.right.equalToSuperview().offset(-inset.right);
                make.bottom.equalToSuperview().offset(-inset.bottom);
                make.width.equalTo(imageSize.width)
            }
        }
        
        let labelLefSubSize = labelLeftSub.sizeThatFits(CGSize(width: labSubEndX - inset.left, height: CGFloat.greatestFiniteMagnitude))
        labelLeftSub.snp.remakeConstraints { (make) in
            make.top.equalTo(labelLeft.snp.bottom).offset(kPadding)
            make.left.equalToSuperview().offset(inset.left);
            make.right.equalToSuperview().offset(-labSubEndX);
            make.height.equalTo(labelLefSubSize.height);
        }
        
        fromImgView.snp.makeConstraints { (make) in
            make.left.equalToSuperview().offset(inset.left)
            make.bottom.equalToSuperview().offset(-inset.bottom)
            make.size.equalTo(iconSize)
        }
        
        fromLabel.snp.makeConstraints { (make) in
            make.centerY.equalTo(fromImgView)
            make.left.equalTo(fromImgView.snp.right).offset(kPadding)
            make.right.equalToSuperview().offset(-labSubEndX);
        }
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    // MARK: -funtions
    

    
    
}

