//
//  UITableViewCellLocation.swift
//  SwiftTemplet
//
//  Created by Bin Shang on 2020/9/2.
//  Copyright © 2020 BN. All rights reserved.
//

import UIKit
import SwiftExpand


class UITableViewCellLocation: UITableViewCell {

    var inset = UIEdgeInsets(top: 10, left: 15, bottom: 10, right: 15)
    var imagSize = CGSize(width: 11, height: 15)
    // MARK: -life cycle

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier);
                
        textLabel?.text = "-"
        detailTextLabel?.text = "-"
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder);
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        let labelStartX: CGFloat = self.imageView != nil ? inset.left + imagSize.width + 10 : inset.left
        let labelEndX: CGFloat = -inset.right
        let labelHeight: CGFloat = (self.bounds.height - inset.top - inset.bottom - 5)*0.5
        
        if let imageView = self.imageView {
            imageView.snp.makeConstraints { (make) in
                make.centerY.equalToSuperview()
                make.left.equalToSuperview().offset(inset.left);
                make.size.equalTo(imagSize);
            }
        }
                
        if detailTextLabel != nil {
            textLabel!.snp.makeConstraints { (make) in
                make.top.equalToSuperview().offset(inset.top);
                make.left.equalToSuperview().offset(labelStartX);
                make.right.equalToSuperview().offset(labelEndX);
                make.height.equalTo(labelHeight)
            }
            
            detailTextLabel!.snp.makeConstraints { (make) in
                make.top.equalTo(textLabel!.snp.bottom).offset(5)
                make.left.right.equalTo(textLabel!)
                make.height.equalTo(labelHeight)
            }
        } else {
            textLabel!.snp.makeConstraints { (make) in
                make.top.equalToSuperview().offset(inset.top);
                make.left.equalToSuperview().offset(labelStartX);
                make.right.equalToSuperview().offset(labelEndX);
                make.bottom.equalToSuperview().offset(-inset.bottom);
            }
        }
    }
        
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    // MARK: -funtions

}
