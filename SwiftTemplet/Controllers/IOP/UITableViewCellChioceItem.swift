//
//  UITableViewCellChioceItem.swift
//  SwiftTemplet
//
//  Created by Bin Shang on 2020/12/16.
//  Copyright © 2020 BN. All rights reserved.
//

import UIKit

import SnapKit
import SwiftExpand

class UITableViewCellChioceItem: UITableViewCell {
    
    var inset: UIEdgeInsets = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        
    var btnSize: CGSize = CGSize(width: 16, height: 16)

    var btnOffset: CGPoint = CGPoint(x: 0, y: 0)
    
    lazy var label: UILabel = {
        let view = UILabel(frame: .zero);
        view.text = "UILabel"
        view.textColor = .black
        view.textAlignment = .left
        view.numberOfLines = 0

        return view;
    }()
    
    lazy var labelDetail: UILabel = {
        let view = UILabel(frame: .zero);
        view.text = "UILabel"
        view.textColor = .black
        view.textAlignment = .left
        view.numberOfLines = 0

        return view;
    }()
    // MARK: -life cycle

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier);
        
        contentView.addSubview(btn);
        contentView.addSubview(label);
        contentView.addSubview(labelDetail);
//        btn.setTitle("确定", for: .normal)
//        btn.setTitleColor( .white, for: .normal)
//        btn.setBackgroundImage(UIImage(color: .theme), for: .normal)
//        btn.layer.cornerRadius = 3
        
        let normlImage = UIImage(named: "icon_selected_NO_gray")!
        let seletedImage = UIImage(named: "icon_selected_YES_circle")!
        btn.setImage(normlImage, for: .normal)
        btn.setImage(seletedImage, for: .selected)
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
                
        btn.snp.makeConstraints { (make) in
            make.centerY.equalToSuperview().offset(btnOffset.y)
            make.left.equalToSuperview().offset(inset.left + btnOffset.x)
            make.size.equalTo(btnSize)
        }
        
        label.snp.makeConstraints { (make) in
            make.top.equalToSuperview().offset(inset.top);
            make.left.equalTo(btn.snp.right).offset(inset.left + btnOffset.x);
            make.right.equalToSuperview().offset(-inset.right);
            make.bottom.equalToSuperview().offset(-inset.bottom);
        }        
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
    }
    
}



