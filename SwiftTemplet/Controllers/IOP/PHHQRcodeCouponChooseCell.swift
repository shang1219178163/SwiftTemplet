//
//  PHHQRcodeCouponChooseCell.swift
//  SwiftTemplet
//
//  Created by Bin Shang on 2021/3/3.
//  Copyright © 2021 BN. All rights reserved.
//

import UIKit
import SwiftExpand


@objcMembers public class PHHQRcodeCouponChooseCell: UITableViewCell {
    
    lazy var labMid: UILabel = {
        let view = UILabel()
        view.font = UIFont.systemFont(ofSize: 13)
        view.textColor = .textColor6
        view.text = "--"
        return view
    }()

    lazy var btnLeft: UIButton = {
        let btn = UIButton(type: .custom)
        btn.titleLabel?.font = UIFont.systemFont(ofSize: 11)
        btn.setImage(UIImage(named: "icon_selected_no_blue"), for: .normal)
        btn.setImage(UIImage(named: "icon_selected_yes_blue"), for: .selected)

        btn.setTitle("8小时", for: .normal)
        btn.setTitleColor(.textColor3, for: .normal)
        return btn
    }()
    
    lazy var btnRight: UIButton = {
        let btn = UIButton(type: .custom)
        btn.titleLabel?.font = UIFont.systemFont(ofSize: 11)
        btn.setImage(UIImage(named: "icon_bookmark_custom"), for: .normal)
        btn.setImage(UIImage(named: "icon_bookmark_predefine"), for: .selected)
        
        btn.setTitle("  自定义", for: .normal)
        btn.setTitleColor(.textColor6, for: .normal)
        return btn
    }()
    
    // MARK: -lifcycle
    public override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        contentView.addSubview(btnLeft)
        contentView.addSubview(labMid)
        contentView.addSubview(btnRight)
        
        btnLeft.contentHorizontalAlignment = .left
        labMid.text = "9999张（剩余9998张）"
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public override func layoutSubviews() {
        super.layoutSubviews()
        
        btnRight.snp.makeConstraints { (make) in
            make.top.equalToSuperview().offset(10)
            make.bottom.equalToSuperview().offset(-10)
            make.right.equalToSuperview().offset(-15)
            make.width.equalTo(70);
        }

        let labMidSize = labMid.sizeThatFits(.zero)
        labMid.snp.makeConstraints { (make) in
            make.centerY.equalToSuperview().offset(0);
            make.right.equalTo(btnRight.snp.left).offset(-10);
            make.width.equalTo(labMidSize.width)
            make.height.equalTo(20);
        }
        
        btnLeft.snp.makeConstraints { (make) in
            make.centerY.equalToSuperview()
            make.left.equalToSuperview().offset(15);
            make.right.equalTo(labMid.snp.left).offset(-10);
            make.height.equalTo(40);
        }
    }
}
