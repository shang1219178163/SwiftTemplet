//
//  UITableViewCellSelecet.swift
//  SwiftTemplet
//
//  Created by Bin Shang on 2021/8/18.
//  Copyright © 2021 BN. All rights reserved.
//

import UIKit
import SwiftExpand

/// 一行多选/单选
@objcMembers class UITableViewCellRightLabel: UITableViewCell {
     
    var inset = UIEdgeInsets(top: 10, left: 15, bottom: 10, right: 15)
     /// 是否有星标
    var hasAsterisk = false;
    // MARK: -life cycle
    deinit {
        labelLeft.removeObserver(self, forKeyPath: "text")
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
         super.init(style: style, reuseIdentifier: reuseIdentifier);
        
        contentView.addSubview(labelLeft);
        contentView.addSubview(labelRight);
        
        labelLeft.text = "标题"
        labelLeft.font = UIFont.systemFont(ofSize: 15)
        
        labelRight.text = "请选择"
        labelRight.textColor = .theme
        labelRight.font = UIFont.systemFont(ofSize: 15)
        
        labelLeft.numberOfLines = 1
        labelLeft.addObserver(self, forKeyPath: "text", options: .new, context: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder);
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        let endX = accessoryType == .none ? inset.right : kPadding
        if labelRight.isHidden {
            labelLeft.snp.makeConstraints { (make) in
                make.top.equalToSuperview().offset(inset.top);
                make.left.equalToSuperview().offset(inset.left);
                make.right.equalToSuperview().offset(-inset.right);
                make.bottom.equalToSuperview().offset(-inset.bottom)
            }
            return
        }
        
        let labelRightSize = labelRight.sizeThatFits(.zero)
        labelRight.snp.remakeConstraints { (make) in
            make.top.equalToSuperview().offset(inset.top)
            make.right.equalToSuperview().offset(-endX)
            make.width.equalTo(labelRightSize.width)
            make.bottom.equalToSuperview().offset(-inset.bottom)
        }
        
        labelLeft.snp.makeConstraints { (make) in
            make.top.equalToSuperview().offset(inset.top);
            make.left.equalToSuperview().offset(inset.left);
            make.right.equalTo(labelRight.snp.left).offset(-5);
            make.bottom.equalToSuperview().offset(-inset.bottom)
        }
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    //MARK: -observe
    override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
        if keyPath == "text" {
            //标题星号处理
            if hasAsterisk == true {
                labelLeft.attributedText = labelLeft.text?.matt.appendPrefix(font: labelLeft.font)
            }
        }
        else {
            super.observeValue(forKeyPath: keyPath, of: object, change: change, context: context)
        }
    }
    
    //MARK: -lazy
    public lazy var labelLeft: UILabel = {
        let view = UILabel(frame: CGRect.zero)
        view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        view.textAlignment = .left
        view.numberOfLines = 0
        view.lineBreakMode = .byCharWrapping
        
        return view
    }()
    
    public lazy var labelRight: UILabel = {
        let view = UILabel(frame: CGRect.zero)
        view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        view.textAlignment = .left
        view.numberOfLines = 0
        view.lineBreakMode = .byCharWrapping
        
        return view
    }()
}
