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
    
    var imgView = UIImageView()
    var label = UILabel()
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubview(imgView)
        addSubview(label)
        
        imgView.isUserInteractionEnabled = true;
        imgView.contentMode = .scaleAspectFit;
        imgView.backgroundColor = UIColor.random

        label.backgroundColor = UIColor.random
        label.textAlignment = .center;
        label.numberOfLines = 2;
        label.lineBreakMode = .byCharWrapping;
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
    }
    
}
