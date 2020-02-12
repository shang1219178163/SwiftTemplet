//
//  UICTViewCellOne.swift
//  SwiftTemplet
//
//  Created by Bin Shang on 2018/12/23.
//  Copyright © 2018 BN. All rights reserved.
//

import UIKit

import SnapKit
import SwiftExpand

class UICTViewCellOne: UICollectionViewCell {
    
    /// 仅在只有图片或者文字时才起作用
    @objc var inset: UIEdgeInsets = .zero
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        contentView.addSubview(imgView)
        contentView.addSubview(label)
        
        contentView.addSubview(lineBottom)
        contentView.addSubview(lineRight)
        
        contentView.backgroundColor = UIColor.white
        label.textAlignment = .center
        imgView.image = UIImage(named: kIMG_defaultFailed_S)
        lineBottom.isHidden = true
        lineRight.isHidden = true
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        if label.isHidden == true {
            imgView.snp.makeConstraints { (make) in
//                make.edges.equalToSuperview()
                make.edges.equalTo(inset)
            }
            return;
        }
        
        if imgView.isHidden == true {
            label.snp.makeConstraints { (make) in
//                make.edges.equalToSuperview()
                make.edges.equalTo(inset)
            }
            
            lineBottom.snp.makeConstraints { (make) in
                 make.left.right.bottom.equalToSuperview()
                 make.height.equalTo(kH_LINE_VIEW)
             }
             
             lineRight.snp.makeConstraints { (make) in
                 make.top.right.bottom.equalToSuperview()
                 make.width.equalTo(kH_LINE_VIEW)
             }
            
            return;
        }
        
        imgView.snp.makeConstraints { (make) in
            make.top.equalToSuperview().offset(0)
            make.left.right.equalToSuperview();
            make.bottom.equalToSuperview().offset(-kH_LABEL)
        }
        
        label.snp.makeConstraints { (make) in
            make.top.equalTo(imgView.snp.bottom).offset(0)
            make.left.right.equalTo(imgView)
            make.height.equalTo(kH_LABEL)
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
