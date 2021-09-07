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

@objcMembers class UICTViewCellZero: UICollectionViewCell {
    var inset = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 10)

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        contentView.addSubview(imgView)
        contentView.addSubview(lab)
        
        contentView.addSubview(lineBottom)
        contentView.addSubview(lineRight)
        
        lab.textAlignment = .center
//        lab.backgroundColor = UIColor.random
//        imgView.backgroundColor = UIColor.random

        lineBottom.isHidden = true
        lineRight.isHidden = true
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        imgView.snp.makeConstraints { (make) in
            make.edges.equalTo(inset)
        }
        
        lab.snp.makeConstraints { (make) in
            make.top.left.equalToSuperview().offset(inset.top)
            make.bottom.right.equalToSuperview().offset(-inset.bottom)
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
    // MARK: -lazy
    public lazy var imgView: UIImageView = {
        let view = UIImageView(frame: CGRect.zero)
        view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        view.isUserInteractionEnabled = true
        view.contentMode = .scaleAspectFit
        view.backgroundColor = .clear

        return view
    }()
    
                   
    public lazy var lab: UILabel = {
       let view = UILabel(frame: .zero)
       view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
       view.font = UIFont.systemFont(ofSize: 15)
       view.numberOfLines = 0
       view.lineBreakMode = .byCharWrapping
       view.textAlignment = .center
//       view.backgroundColor = UIColor.random

       return view
    }()
}
