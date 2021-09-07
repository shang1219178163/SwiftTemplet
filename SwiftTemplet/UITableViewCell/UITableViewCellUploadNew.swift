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
@objcMembers class UITableViewCellUploadNew: UITableViewCell {
    
    var btnTipSize = CGSize(width: 17, height: 17)
    var btnCenterRightSpacing: CGFloat = -50

    lazy var btnTip: UIButton = {
        let view = UIButton(type: .custom);
        view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        view.titleLabel?.adjustsFontSizeToFitWidth = true;
        view.titleLabel?.minimumScaleFactor = 1.0;
        view.isExclusiveTouch = true;
        view.adjustsImageWhenHighlighted = false;
        return view
    }()

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
        super.init(style: .value1, reuseIdentifier: reuseIdentifier);
        
        contentView.addSubview(btnTip)
        contentView.addSubview(btnCenter)

        textLabel?.text = "文件"
        detailTextLabel?.text = "上传"
        detailTextLabel?.textColor = .systemBlue

        btnTip.setBackgroundImage(UIImage(named: "icon_card_tips"), for: .normal)

        btnCenter.setTitle("查看示例图", for: .normal)
        btnCenter.setTitleColor(.systemBlue, for: .normal)
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
            
//        let height = bounds.height - inset.top - inset.bottom
        guard let textLabel = textLabel,
              let detailTextLabel = detailTextLabel else { return }
        if btnCenter.isHidden == false {
            btnCenter.sizeToFit()
            btnCenter.snp.remakeConstraints { (make) in
                make.centerY.equalToSuperview()
                make.right.equalTo(detailTextLabel.snp.left).offset(btnCenterRightSpacing)
            }
        }
        
        if btnTip.isHidden == false {
            btnTip.snp.remakeConstraints { (make) in
                make.centerY.equalToSuperview().offset(0);
                make.left.equalTo(textLabel.snp.right).offset(5);
                make.size.equalTo(btnTipSize);
            }
        }
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
    }


}
