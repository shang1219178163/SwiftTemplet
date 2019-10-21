//
//  UITableHeaderFooterViewOne.swift
//  BuildUI
//
//  Created by Bin Shang on 2018/12/20.
//  Copyright © 2018 Bin Shang. All rights reserved.
//

import UIKit
import SwiftExpand

class UITableHeaderFooterViewFour: UITableViewHeaderFooterView {

    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        /*
         --------------------
         勾选按钮+文字
         --------------------
         */
        contentView.addSubview(btn);
        contentView.addSubview(labelLeft);
        contentView.addSubview(lineBottom)

        btn.setBackgroundImage(UIImage(named: kIMG_selected_NO), for: .normal)
        btn.setBackgroundImage(UIImage(named: kIMG_selected_YES), for: .selected)        
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
        btn.snp.makeConstraints { (make) in
            make.top.left.equalToSuperview().offset(contentView.frame.midY - kSizeSelected.height/2.0)
            make.size.equalTo(kSizeSelected)
        }
        
        labelLeft.snp.makeConstraints { (make) in
            make.top.height.equalTo(btn);
            make.left.equalTo(btn.snp.right).offset(kPadding)
            make.right.equalToSuperview().offset(-kX_GAP)
        }
        
        lineBottom.snp.makeConstraints { (make) in
            make.left.equalToSuperview();
            make.right.equalToSuperview();
            make.bottom.equalToSuperview().offset(0);
            make.height.equalTo(0.33);
        }
    }
    
}
