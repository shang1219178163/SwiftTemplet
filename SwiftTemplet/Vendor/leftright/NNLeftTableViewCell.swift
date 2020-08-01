//
//  NNLeftTableViewCell.swift
//  SwiftTemplet
//
//  Created by Bin Shang on 2020/8/1.
//  Copyright © 2020 BN. All rights reserved.
//

import UIKit
import SnapKit

///联动左边 cell
@objcMembers class NNLeftTableViewCell: UITableViewCell {
    
    var labelTextColor = UIColor.black
    var labelSelectedTextColor = UIColor.systemBlue

    var cellBackgroundColor = UIColor.groupTableViewBackground
    var cellSelectedBackgroundColor = UIColor.white

    var labelFont = UIFont.systemFont(ofSize: 15, weight: .light)
    var labelSelectedFont = UIFont.systemFont(ofSize: 15, weight: .bold)
    
    var indicatorSize = CGSize(width: 4, height: 25)
    
    private lazy var indicatorView = UIImageView()

    // MARK: -lifecycle
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        textLabel?.font = labelFont
        textLabel?.textColor = labelTextColor
        backgroundColor = cellBackgroundColor
        
        contentView.addSubview(indicatorView)
        indicatorView.snp.makeConstraints { (make) in
            make.centerY.equalToSuperview().offset(0)
            make.left.equalToSuperview().offset(0)
            make.size.equalTo(indicatorSize)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
        if(selected) {
            indicatorView.backgroundColor = labelSelectedTextColor
            textLabel?.font = labelSelectedFont
            textLabel?.textColor = labelSelectedTextColor
            backgroundColor = cellSelectedBackgroundColor
            
        } else {
            indicatorView.backgroundColor = .clear
            textLabel?.font = labelFont
            textLabel?.textColor = labelTextColor
            backgroundColor = cellBackgroundColor
        }

    }

}
