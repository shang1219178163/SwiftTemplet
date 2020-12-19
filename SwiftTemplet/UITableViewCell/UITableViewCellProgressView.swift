//
//  UITableViewCellProgressView.swift
//  SwiftTemplet
//
//  Created by Bin Shang on 2020/6/10.
//  Copyright © 2020 BN. All rights reserved.
//

import UIKit
import SnapKit
import SwiftExpand

/// 一行多选/单选
class UITableViewCellProgressView: UITableViewCell {
     
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
        contentView.addSubview(labelLeftSub);
        contentView.addSubview(progressView);
        
        labelLeft.text = "文件名称"
        labelLeft.textColor = .gray
        labelLeft.font = UIFont.systemFont(ofSize: 12)
        
        labelLeft.numberOfLines = 1
        labelLeft.addObserver(self, forKeyPath: "text", options: .new, context: nil)
        
        labelLeftSub.textColor = .gray
        labelLeftSub.font = UIFont.systemFont(ofSize: 12)
        labelLeftSub.numberOfLines = 1
        labelLeftSub.text = "这是一个简短的文件描述"
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder);
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        if bounds.height < 10 {
            return
        }
        let height = bounds.height - inset.top - inset.bottom

        let right: CGFloat = accessoryType == .none ? inset.right : 0.0
        let left: CGFloat = inset.left
        
        progressView.snp.makeConstraints { (make) in
            make.centerY.equalToSuperview()
            make.right.equalToSuperview().offset(-right);
            make.width.height.equalTo(height);
        }

        let list = [labelLeft, labelLeftSub]
        list.snp.distributeViewsAlong(axisType: .vertical, fixedSpacing: 10, leadSpacing: inset.top, tailSpacing: inset.bottom)
        list.snp.makeConstraints { (make) in
            make.left.equalToSuperview().offset(left);
            make.right.equalTo(progressView.snp.left).offset(-kPadding);
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
                labelLeft.attributedText = labelLeft.text?.toAsterisk(labelLeft.textColor, font: labelLeft.font.pointSize)
            }
        }
        else {
            super.observeValue(forKeyPath: keyPath, of: object, change: change, context: context)
        }
    }
    
    //MARK: -lazy
    lazy var progressView: NNCircleProgressView = {
        let view = NNCircleProgressView(frame: .zero)
//        view.strokeWidth = 5;
        
        return view;
    }()

}
