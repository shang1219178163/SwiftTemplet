//
//  UICTViewCellExcel.swift
//  SwiftTemplet
//
//  Created by Bin Shang on 2020/5/22.
//  Copyright © 2020 BN. All rights reserved.
//

import UIKit
import SnapKit
import SwiftExpand

@objcMembers class UICTViewCellExcel: UICollectionViewCell {
    
    var indexP = IndexPath(row: 0, section: 0)
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        contentView.backgroundColor = .white
        contentView.addSubview(lab)
        
        lab.addSubview(lineTop)
        lab.addSubview(lineBottom)
        lab.addSubview(lineRight)

        lab.adjustsFontSizeToFitWidth = true
        lab.font = UIFont.systemFont(ofSize: 15)
        lab.textAlignment = .center
        lab.numberOfLines = 1
        lab.textColor = .gray
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        lineTop.isHidden = (indexP.section != 0)
        
        lab.snp.makeConstraints { (make) in
            make.top.left.equalToSuperview().offset(0)
            make.right.bottom.equalToSuperview().offset(0)
        }
        
        lineTop.snp.makeConstraints { (make) in
            make.top.left.right.equalToSuperview()
            make.height.equalTo(0.5)
        }
        
        lineBottom.snp.makeConstraints { (make) in
            make.bottom.left.right.equalToSuperview()
            make.height.equalTo(0.5)
        }
         
        lineRight.snp.makeConstraints { (make) in
            make.top.bottom.equalToSuperview()
            make.right.equalToSuperview().offset(-1)
            make.width.equalTo(0.5)
        }
 
    }
 
    // MARK: -lazy
    public lazy var lab: UILabel = {
       let view = UILabel(frame: .zero)
       view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
       view.font = UIFont.systemFont(ofSize: 15)
       view.numberOfLines = 0
       view.lineBreakMode = .byCharWrapping
       view.textAlignment = .center
//       view.backgroundColor = .random

       return view
    }()
}
