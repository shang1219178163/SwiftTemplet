//
//  CollectionHeaderView.swift
//  YYCollectionView
//
//  Created by Domo on 2018/6/27.
//  Copyright © 2018年 知言网络. All rights reserved.
//

import UIKit

import SnapKit
import SwiftExpand

class UICTReusableViewZero: UICollectionReusableView {

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(imageView)
        addSubview(textLabel)
        
        textLabel.backgroundColor = UIColor.random
        imageView.backgroundColor = UIColor.random
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        imageView.snp.makeConstraints { (make) in
            make.top.left.bottom.right.equalToSuperview()
            
        }
        
        textLabel.snp.makeConstraints { (make) in
            make.top.left.equalToSuperview().offset(kX_GAP)
            make.right.equalToSuperview().offset(-kX_GAP)
            make.height.equalTo(frame.height - kX_GAP*2)
            
        }
    }
}
