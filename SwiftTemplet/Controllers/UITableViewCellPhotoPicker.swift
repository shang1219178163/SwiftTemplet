//
//  UITableViewCellPhotoPicker.swift
//  SwiftTemplet
//
//  Created by Bin Shang on 2019/3/3.
//  Copyright © 2019 BN. All rights reserved.
//

import UIKit

// 图片封装视图
class UITableViewCellPhotoPicker: UITableViewCell {

    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier);
        
        contentView.addSubview(defaultView);
        defaultView.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
        }
//        defaultView.snp.makeConstraints { (make) in
//            make.top.left.right.equalToSuperview()
//        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder);
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews();
        
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    lazy var defaultView: BNPhotosView = {
        var view = BNPhotosView(frame: .zero)
        view.autoresizingMask = UIViewAutoresizing(rawValue: UIViewAutoresizing.flexibleWidth.rawValue | UIViewAutoresizing.flexibleHeight.rawValue)
        
        return view
    }()
    
}
