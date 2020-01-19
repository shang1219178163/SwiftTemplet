//
//  UICollectionViewCellZero.swift
//  YYCollectionView
//
//  Created by Bin Shang on 2018/12/22.
//  Copyright © 2018 知言网络. All rights reserved.
//

import UIKit

import SnapKit
import SwiftExpand

class UICTViewCellZero: UICollectionViewCell {

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        contentView.addSubview(imgView)
        contentView.addSubview(label)
        
        contentView.addSubview(lineBottom)
        contentView.addSubview(lineRight)
        
        label.textAlignment = .center
//        label.backgroundColor = UIColor.random
//        imgView.backgroundColor = UIColor.random

        lineBottom.isHidden = true
        lineRight.isHidden = true
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        imgView.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
        }
        
        label.snp.makeConstraints { (make) in
            make.top.left.equalToSuperview().offset(kPadding)
            make.bottom.right.equalToSuperview().offset(-kPadding)
        }
        
        
        lineBottom.snp.makeConstraints { (make) in
             make.left.right.bottom.equalToSuperview()
             make.height.equalTo(kH_LINE_VIEW)
         }
         
         lineRight.snp.makeConstraints { (make) in
             make.top.right.bottom.equalToSuperview()
             make.width.equalTo(kH_LINE_VIEW)
         }
    }
    
}
