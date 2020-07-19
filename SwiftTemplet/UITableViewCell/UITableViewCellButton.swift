//
//  UITableViewCellButton.swift
//  IntelligentOfParking
//
//  Created by Bin Shang on 2020/1/16.
//  Copyright © 2020 Xi'an iRain IoT. Technology Service CO., Ltd. . All rights reserved.
//

import UIKit

/// 确认按钮
class UITableViewCellButton: UITableViewCell {
    
    var inset: UIEdgeInsets = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
    
    // MARK: -life cycle

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier);
        
        contentView.addSubview(btn);
        
        btn.setTitle("确定", for: .normal)
        btn.setTitleColor( .white, for: .normal)
        btn.setBackgroundImage(UIImage(color: .theme), for: .normal)
        btn.layer.cornerRadius = 3
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder);
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews();
        
        if bounds.height <= 10.0 {
            return
        }
        
        btn.snp.makeConstraints { (make) in
            make.edges.equalTo(inset)
        }
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
    }
    
    // observeValue
    override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
        if keyPath == "text" {
            guard let imageView = btn.imageView, let titleLabel = btn.titleLabel else { return }
            btn.sizeToFit()
            btn.center = self.contentView.center
            btn.titleEdgeInsets = UIEdgeInsets(top: 0, left: -imageView.bounds.width, bottom: 0, right: imageView.bounds.width)
            if btn.imageView?.image != nil {
                btn.imageEdgeInsets = UIEdgeInsets(top: 0, left: titleLabel.bounds.width+3.0, bottom: 0, right: -titleLabel.bounds.width-3.0)
            }
        }
        else {
            super.observeValue(forKeyPath: keyPath, of: object, change: change, context: context)
        }
    }

}



