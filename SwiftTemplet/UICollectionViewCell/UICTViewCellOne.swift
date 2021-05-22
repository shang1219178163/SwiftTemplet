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


@objcMembers
class UICTViewCellOne: UICollectionViewCell {
    
    /// 仅在只有图片或者文字时才起作用
    var inset: UIEdgeInsets = .zero
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        contentView.addSubview(imgView)
        contentView.addSubview(lab)
        
        contentView.addSubview(lineBottom)
        contentView.addSubview(lineRight)
        
        contentView.backgroundColor = UIColor.white
        lab.backgroundColor = .clear

        lab.textAlignment = .center
        imgView.image = UIImage(named: "img_failedDefault_S")
        lineBottom.isHidden = true
        lineRight.isHidden = true
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        if lab.isHidden == true {
            imgView.snp.makeConstraints { (make) in
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
        
        if imgView.isHidden == true {
            lab.snp.makeConstraints { (make) in
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
        
        lab.snp.makeConstraints { (make) in
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
