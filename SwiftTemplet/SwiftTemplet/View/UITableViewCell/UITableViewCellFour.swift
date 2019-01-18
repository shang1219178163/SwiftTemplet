//
//  UITableViewCellFour.swift
//  BuildUI
//
//  Created by Bin Shang on 2018/12/19.
//  Copyright © 2018 Bin Shang. All rights reserved.
//

import UIKit
import SwiftExpand

/// 勾选按钮+文字
class UITableViewCellFour: UITableViewCell {

    var type: Int = 0{
        didSet {
            setNeedsLayout()
        }
    }
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier);
        contentView.addSubview(btn);
        contentView.addSubview(labelLeft);
//        setupConstraint();
        
        btn.setBackgroundImage(UIImage(named: kIMG_selected_NO), for: .normal)
        btn.setBackgroundImage(UIImage(named: kIMG_selected_YES), for: .selected)
        btn.imageView?.contentMode = .scaleAspectFit;
//        btn.addObserver(self, forKeyPath: "selected", options: .new, context: nil)
    }
    
    deinit {
        btn.removeObserver(self, forKeyPath: "selected", context: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder);
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews();
        
        setupConstraint();
    }
    
    func setupConstraint() -> Void {
        if type == 0 {
            btn.snp.makeConstraints { (make) in
                make.centerY.equalToSuperview()
                make.left.equalToSuperview().offset(kX_GAP)
                make.width.height.equalTo(kSize_Arrow.height)
            }
            
            labelLeft.snp.makeConstraints { (make) in
                make.centerY.equalToSuperview()
                make.left.equalTo(btn.snp.right).offset(kPadding)
                make.right.equalToSuperview().offset(-kX_GAP)
                make.height.equalTo(btn)
            }
            
        } else {
            btn.snp.makeConstraints { (make) in
                make.centerY.equalToSuperview()
                make.right.equalToSuperview().offset(-kX_GAP)
                make.width.height.equalTo(kSize_Arrow.height)
            }
            
            labelLeft.snp.makeConstraints { (make) in
                make.centerY.equalToSuperview()
                make.left.equalToSuperview().offset(kX_GAP)
                make.right.equalTo(btn.snp.left).offset(-kPadding)
                make.height.equalTo(btn)
            }
        }
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }

    override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
//        DDLog(keyPath,change);
        if keyPath == "selected" {
            
        }
    }
    
}
