//
//  UITableViewCellRightBtn.swift
//  BuildUI
//
//  Created by Bin Shang on 2018/12/19.
//  Copyright © 2018 Bin Shang. All rights reserved.
//
/**
 按钮+文字
 文字+按钮
 按钮
 */

import UIKit
import SwiftExpand

/// 勾选按钮+文字
class UITableViewCellRightBtn: UITableViewCell {

    var inset = UIEdgeInsets(top: 10, left: 15, bottom: 10, right: 15)
    var btnSize = CGSize(width: 25, height: 25)
    
    var isShowLeft = false{
        didSet {
            setNeedsLayout()
        }
    }
    // MARK: -life cycle

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier);
        contentView.addSubview(btn);
        contentView.addSubview(labelLeft);
        
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
    
    func setupConstraint() {
        if bounds.height <= 10.0 {
            return
        }
        let height = bounds.height - inset.top - inset.bottom
        let endX = accessoryType == .none ? inset.right : 0
        
        if labelLeft.isHidden == true {
            btn.snp.makeConstraints { (make) in
                make.edges.equalTo(inset)
            }
            return
        }

        if isShowLeft == false {
            btn.snp.makeConstraints { (make) in
                make.centerY.equalToSuperview()
                make.right.equalToSuperview().offset(-endX)
                make.size.equalTo(btnSize)
            }
            
            labelLeft.snp.makeConstraints { (make) in
                make.centerY.equalToSuperview()
                make.left.equalToSuperview().offset(inset.left)
                make.right.equalTo(btn.snp.left).offset(-kPadding)
                make.height.equalTo(height)
            }
            return
        }
        
        btn.snp.makeConstraints { (make) in
            make.centerY.equalToSuperview()
            make.left.equalToSuperview().offset(inset.left)
            make.size.equalTo(btnSize)
        }
        
        labelLeft.snp.makeConstraints { (make) in
            make.centerY.equalToSuperview()
            make.left.equalTo(btn.snp.right).offset(kPadding)
            make.right.equalTo(btn.snp.left).offset(-endX)
            make.height.equalTo(height)
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
        else {
            super.observeValue(forKeyPath: keyPath, of: object, change: change, context: context)
        }
    }
    
}
