//
//  UITableViewCellBanner.swift
//  SwiftTemplet
//
//  Created by Bin Shang on 2020/9/20.
//  Copyright © 2020 BN. All rights reserved.
//

import UIKit
import SwiftExpand

/// 广告轮播图
@objcMembers class UITableViewCellBanner: UITableViewCell {
    var inset = UIEdgeInsets(top: 5, left: 10, bottom: 5, right: 10)

    lazy var cycleScrollView: NNCycleScrollView = {
        let view = NNCycleScrollView(frame: .zero)
        view.direction = .horizontal
        view.list =  ["我们对权限控制做了升级，现在可以精准控制app端的权限了","由管理员在网页端设置。如果您发现您原来“运营”菜单中有的功能不见了，请联系集团管理员添加，给您带来不便敬请谅解。", "1qqqqqqqqqqqqqqqq"]
        view.list = ["http://upload-images.jianshu.io/upload_images/1714291-6c664d526b380115.jpg",                        "http://img.parkingwang.com/6100000074/629906_1.jpg",                            "http://upload-images.jianshu.io/upload_images/3580598-482508548410c111.jpg?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240"];

//        view.pageControl.isHidden = true
        view.timeInterval = 5
        view.didSelectedBlock = { idx in
            DDLog(idx)
        }
        
        return view
    }()
    
    
    // MARK: -life cycle

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier);
        
        contentView.addSubview(cycleScrollView);
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
        cycleScrollView.snp.makeConstraints { (make) in
            make.top.equalToSuperview().offset(inset.top)
            make.left.equalToSuperview().offset(inset.left)
            make.right.equalToSuperview().offset(-inset.right)
            make.bottom.equalTo(-inset.bottom)
        }
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
    }


}



