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
     
    var Xgap: CGFloat = 15;
    /// 是否有星标
    var hasAsterisk = false;
    // MARK: -life cycle
    deinit {
        labelLeft.removeObserver(self, forKeyPath: "text")
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
         super.init(style: style, reuseIdentifier: reuseIdentifier);
        
        contentView.addSubview(labelLeft);
        contentView.addSubview(progressView);
        
        labelLeft.text = "圆形进度条:"
        labelLeft.textColor = .gray
        labelLeft.font = UIFont.systemFont(ofSize: 12)
        
        labelLeft.numberOfLines = 1
        labelLeft.addObserver(self, forKeyPath: "text", options: .new, context: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder);
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        progressView.snp.makeConstraints { (make) in
            make.top.equalToSuperview().offset(10);
            make.right.equalToSuperview().offset(-15);
            make.bottom.equalToSuperview().offset(-10);
            make.width.equalTo(bounds.height - 16);
        }
        
        labelLeft.snp.makeConstraints { (make) in
            make.top.equalToSuperview().offset(10);
            make.left.equalToSuperview().offset(Xgap);
            make.right.equalTo(progressView.snp.left).offset(-10);
            make.bottom.equalToSuperview().offset(-10);
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
    }
    
    //MARK: -lazy
    lazy var progressView: NNCircleProgressView = {
        var view = NNCircleProgressView(frame: .zero)
//        view.strokeWidth = 5;
        
        return view;
    }()

}
