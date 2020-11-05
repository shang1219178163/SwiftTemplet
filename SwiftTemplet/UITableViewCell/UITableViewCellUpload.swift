//
//  UITableViewCellUpload.swift
//  SwiftTemplet
//
//  Created by Bin Shang on 2020/11/2.
//  Copyright © 2020 BN. All rights reserved.
//

import UIKit
import SwiftExpand

/// 文件图片上传
class UITableViewCellUpload: UITableViewCell {
    var inset = UIEdgeInsets(top: 5, left: 10, bottom: 5, right: 10)
    
    var btnCenterOffsetY: CGFloat = -50

    lazy var btnCenter: UIButton = {
        let view = UIButton(type: .custom);
        view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        view.titleLabel?.adjustsFontSizeToFitWidth = true;
        view.titleLabel?.minimumScaleFactor = 1.0;
        view.isExclusiveTouch = true;
        view.adjustsImageWhenHighlighted = false;
        view.setTitleColor(.black, for: .normal)
        return view
    }()
    // MARK: -life cycle

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier);
        
        contentView.addSubview(btn)
        contentView.addSubview(btnCenter)

        btnCenter.setTitle("查看示例图", for: .normal)
        btnCenter.setTitleColor(.systemBlue, for: .normal)
        btn.setTitleColor(.systemBlue, for: .normal)
        btn.setTitle("上传", for: .normal)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder);
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews();
        
        if bounds.height <= 10 {
            return
        }
            
        let height = bounds.height - inset.top - inset.bottom
        btn.snp.makeConstraints { (make) in
            make.centerY.equalToSuperview()
            make.right.equalToSuperview().offset(-inset.right);
            make.width.height.equalTo(height);
        }
        
        btnCenter.sizeToFit()
        btnCenter.snp.remakeConstraints { (make) in
            make.centerY.equalToSuperview()
            make.right.equalTo(btn.snp.left).offset(btnCenterOffsetY)
        }

    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
    }


}
