//
//  UITableViewCellThreeLable.swift
//  SwiftTemplet
//
//  Created by Bin Shang on 2020/3/2.
//  Copyright © 2020 BN. All rights reserved.
//

import UIKit
import SwiftExpand

/// 上中下三label
class UITableViewCellThreeLable: UITableViewCell {
    // MARK: -lazy
    lazy var labelTop: UILabel = {
        var view = UILabel(frame: .zero);
        view.text = "top";
        view.textColor = UIColor.black;
        view.font = UIFont.systemFont(ofSize: 15)
        
        return view;
    }();
    
    lazy var labelMid: UILabel = {
        var view = UILabel(frame: .zero);
        view.text = "midem";
        view.textColor = UIColor.hex("#666666")
        view.font = UIFont.systemFont(ofSize: 11)
        
        return view;
    }();
    
    lazy var labelBom: UILabel = {
        var view = UILabel(frame: .zero);
        view.text = "bottom";
        view.textColor = UIColor.hex("#666666")
        view.font = UIFont.systemFont(ofSize: 11)
        
        return view;
    }();
    
    // MARK: -life cycle
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier);
  
        contentView.addSubview(imgViewLeft);

        contentView.addSubview(labelTop);
        contentView.addSubview(labelMid);
        contentView.addSubview(labelBom);

        labelTop.font = UIFont.systemFont(ofSize: 14)
        labelTop.numberOfLines = 1;
        
        labelMid.font = UIFont.systemFont(ofSize: 12)
        labelMid.numberOfLines = 1;
        
        labelBom.font = UIFont.systemFont(ofSize: 12)
        labelBom.numberOfLines = 1;
        
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
        if bounds.height <= 0.0 {
            return;
        }
        
        let height: CGFloat = bounds.height - 20
        let right: CGFloat = accessoryType == .none ? -10.0 : 0.0
        
        if imgViewLeft.isHidden == true {
            labelTop.snp.makeConstraints { (make) in
                make.top.equalToSuperview().offset(10);
                make.left.equalToSuperview().offset(10)
                make.right.equalToSuperview().offset(right)
                make.height.equalTo(height/3);
            }

        } else {
            imgViewLeft.snp.makeConstraints { (make) in
                make.top.equalToSuperview().offset(10);
                make.left.equalToSuperview().offset(10);
                make.bottom.equalToSuperview().offset(-10);
                make.width.equalTo(height)
            }
            
            labelTop.snp.makeConstraints { (make) in
                make.top.equalToSuperview().offset(10);
                make.left.equalTo(imgViewLeft.snp.right).offset(10)
                make.right.equalToSuperview().offset(right)
                make.height.equalTo(height/3);
            }
        }
        
        labelMid.snp.makeConstraints { (make) in
            make.top.equalTo(labelTop.snp.bottom).offset(0);
            make.left.right.height.equalTo(labelTop);
        }
        
        labelBom.snp.makeConstraints { (make) in
            make.top.equalTo(labelMid.snp.bottom).offset(0);
            make.left.right.height.equalTo(labelTop);
        }
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    // MARK: -funtions
    

    
    
}

