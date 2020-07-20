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
    var inset = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 10)

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(imgView)
        addSubview(lab)
        
        lab.backgroundColor = UIColor.random
        imgView.backgroundColor = UIColor.random
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        imgView.snp.makeConstraints { (make) in
            make.edges.equalTo(inset)
        }
        
        lab.snp.makeConstraints { (make) in
            make.top.equalToSuperview().offset(5)
            make.left.equalToSuperview().offset(kX_GAP)
            make.right.equalToSuperview().offset(-kX_GAP)
            make.bottom.equalToSuperview().offset(-5)
        }
    }
}
