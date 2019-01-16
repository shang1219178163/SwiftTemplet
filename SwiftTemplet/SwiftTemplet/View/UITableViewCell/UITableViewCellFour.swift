//
//  UITableViewCellFour.swift
//  BuildUI
//
//  Created by Bin Shang on 2018/12/19.
//  Copyright © 2018 Bin Shang. All rights reserved.
//

import UIKit
import SwiftExpand

class UITableViewCellFour: UITableViewCell {

    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier);
        
        /*
         --------------------
         勾选按钮+文字
         --------------------
         */
        contentView.addSubview(btn);
        contentView.addSubview(labelLeft);
        setupConstraint();
        
        btn.setBackgroundImage(UIImage(named: kIMG_selected_NO), for: .normal)
        btn.setBackgroundImage(UIImage(named: kIMG_selected_YES), for: .selected)
//btn.isSelected
//        btn.addObserver(self, forKeyPath: "selected", options: .new, context: nil)

    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder);
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews();
    }
    
    func setupConstraint() -> Void {
        btn.snp.makeConstraints { (make) in
            make.top.left.equalToSuperview().offset(contentView.frame.midY - kSize_BtnSelected.height/2.0)
            make.size.equalTo(kSize_BtnSelected)
        }
        
        labelLeft.snp.makeConstraints { (make) in
            make.top.height.equalTo(btn);
            make.left.equalTo(btn.snp.right).offset(kPadding)
            make.right.equalToSuperview().offset(-kX_GAP)
        }
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }

//    override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
//        DDLog(keyPath,change);
//        if keyPath == "selected" {
//
//        }
//    }
    
}
