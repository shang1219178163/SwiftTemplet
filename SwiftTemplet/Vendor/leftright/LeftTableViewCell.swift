//
//  LeftTableViewCell.swift
//  SwiftTemplet
//
//  Created by Bin Shang on 2020/8/1.
//  Copyright © 2020 BN. All rights reserved.
//

import UIKit


@objcMembers class LeftTableViewCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
        if(selected) {
//            selectionIndicator.image = UIImage(named: "button_on")
            
        } else {
//            selectionIndicator.image = UIImage(named: "button_off")
        }

    }

}
