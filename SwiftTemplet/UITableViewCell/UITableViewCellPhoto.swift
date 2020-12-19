//
//  UITableViewCellPhoto.swift
//  IntelligentOfParking
//
//  Created by Bin Shang on 2020/2/14.
//  Copyright © 2020 Xi'an iRain IoT. Technology Service CO., Ltd. . All rights reserved.
//

import UIKit

import SnapKit

class UITableViewCellPhoto: UITableViewCell {
    
    var inset = UIEdgeInsets(top: 10, left: 15, bottom: 10, right: 15)
    // MARK: -life cycle

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
      super.init(style: style, reuseIdentifier: reuseIdentifier);

        contentView.addSubview(imgViewLeft)
        imgViewLeft.isUserInteractionEnabled = true
        imgViewLeft.contentMode = .scaleAspectFill
        imgViewLeft.image = UIImage(named: "img_upload_IDCard")
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder);
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews();
              
        setupConstraint()
    }
    
    func setupConstraint() {
        if bounds.height <= 10 {
            return;
        }
        
        imgViewLeft.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
        }
        
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
