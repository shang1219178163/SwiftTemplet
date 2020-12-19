//
//  UITableViewCellSixLable.swift
//  SwiftTemplet
//
//  Created by Bin Shang on 2020/4/21.
//  Copyright © 2020 BN. All rights reserved.
//

import UIKit
import SwiftExpand

/// 上中下6 label
class UITableViewCellSixLable: UITableViewCell {
    
    var inset = UIEdgeInsets(top: 10, left: 15, bottom: 10, right: 15)

    // MARK: -lazy
    lazy var labelTop: UILabel = {
        let view = UILabel(frame: .zero);
        view.text = "top";
        view.textColor = UIColor.black;
        view.font = UIFont.systemFont(ofSize: 15)
        
        return view;
    }();
    
    lazy var labelMid: UILabel = {
        let view = UILabel(frame: .zero);
        view.text = "midem";
        view.textColor = UIColor.hexValue(0x666666)
        view.font = UIFont.systemFont(ofSize: 11)
        
        return view;
    }();
    
    lazy var labelBom: UILabel = {
        let view = UILabel(frame: .zero);
        view.text = "bottom";
        view.textColor = UIColor.hexValue(0x666666)
        view.font = UIFont.systemFont(ofSize: 11)
        
        return view;
    }();
    
    lazy var labelTopRight: UILabel = {
        let view = UILabel(frame: .zero);
        view.text = "topRight";
        view.textColor = UIColor.black;
        view.textColor = UIColor.hexValue(0x666666)
        view.font = UIFont.systemFont(ofSize: 11)
        view.textAlignment = .right
        view.adjustsFontSizeToFitWidth = true
        
        return view;
    }();
    
    lazy var labelMidRight: UILabel = {
        let view = UILabel(frame: .zero);
        view.text = "midemRight";
        view.textColor = UIColor.hexValue(0x666666)
        view.font = UIFont.systemFont(ofSize: 11)
        view.textAlignment = .right
        view.adjustsFontSizeToFitWidth = true

        return view;
    }();
    
    lazy var labelBomRight: UILabel = {
        let view = UILabel(frame: .zero);
        view.text = "bottomRight";
        view.textColor = UIColor.hexValue(0x666666)
        view.font = UIFont.systemFont(ofSize: 11)
        view.textAlignment = .right
        view.adjustsFontSizeToFitWidth = true

        return view;
    }();
    
    // MARK: -life cycle
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier);
  
        contentView.addSubview(imgViewLeft);

        contentView.addSubview(labelTop);
        contentView.addSubview(labelMid);
        contentView.addSubview(labelBom);
        contentView.addSubview(labelTopRight);
        contentView.addSubview(labelMidRight);
        contentView.addSubview(labelBomRight);

        labelTop.font = UIFont.systemFont(ofSize: 14)
        labelTop.numberOfLines = 1;
        
        labelMid.font = UIFont.systemFont(ofSize: 12)
        labelMid.numberOfLines = 1;
        
        labelBom.font = UIFont.systemFont(ofSize: 12)
        labelBom.numberOfLines = 1;
        
        labelTopRight.font = UIFont.systemFont(ofSize: 14)
        labelTopRight.numberOfLines = 1;
        
        labelMidRight.font = UIFont.systemFont(ofSize: 12)
        labelMidRight.numberOfLines = 1;
        
        labelBomRight.font = UIFont.systemFont(ofSize: 12)
        labelBomRight.numberOfLines = 1;
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
        
        let height: CGFloat = bounds.height - 20
        
        let labStartX = imgViewLeft.isHidden ? inset.left : height + inset.left + kPadding
        let endX = accessoryType == .none ? inset.right : 0

        if imgViewLeft.isHidden == false {
            imgViewLeft.snp.makeConstraints { (make) in
                make.centerY.equalToSuperview().offset(inset.top - inset.bottom)
                make.left.equalToSuperview().offset(inset.left);
                make.width.height.equalTo(height);
            }
        }
        
        let listRight = [labelTopRight, labelMidRight, labelBomRight,].filter { $0.isHidden == false }
        listRight.snp.distributeViewsAlong(axisType: .vertical, fixedSpacing: 0, leadSpacing: inset.top, tailSpacing: inset.bottom)
        listRight.snp.makeConstraints { (make) in
            make.right.equalToSuperview().offset(endX)
            make.width.equalTo(120)
        }
        
        let list = [labelTop, labelMid, labelBom,].filter { $0.isHidden == false }
        list.snp.distributeViewsAlong(axisType: .vertical, fixedSpacing: 0, leadSpacing: inset.top, tailSpacing: inset.bottom)
        list.snp.makeConstraints { (make) in
            make.left.equalToSuperview().offset(labStartX)
            make.right.equalTo(labelTopRight.snp.left).offset(-kPadding)
        }
        
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    // MARK: -funtions
    

    
    
}

