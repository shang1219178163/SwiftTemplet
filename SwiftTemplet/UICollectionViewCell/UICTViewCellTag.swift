//
//  UICTViewCellTag.swift
//  IntelligentOfParking
//
//  Created by Bin Shang on 2020/1/8.
//  Copyright © 2020 Xi'an iRain IoT. Technology Service CO., Ltd. . All rights reserved.
//

import UIKit
import SnapKit
import SwiftExpand

class UICTViewCellTag: UICollectionViewCell {
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        contentView.addSubview(imgView)
        contentView.addSubview(label)
        contentView.addSubview(btn)

        label.addSubview(lineBottom)
        label.addSubview(lineRight)

        label.textAlignment = .center
        label.numberOfLines = 1;
        
        imgView.image = UIImage(named: kIMG_defaultFailed_S)
        
        lineBottom.isHidden = true
        lineRight.isHidden = true
        
        btn.setBackgroundImage(UIImage(named: "btn_delete_gray"), for: .normal)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        btn.snp.makeConstraints { (make) in
            make.top.equalToSuperview().offset(8)
            make.right.equalToSuperview().offset(-8)
            make.width.height.equalTo(20)
        }
        
        if label.isHidden == true {
            imgView.snp.makeConstraints { (make) in
                make.edges.equalToSuperview()
            }
            return;
        }
        
        if imgView.isHidden == true {
            label.snp.makeConstraints { (make) in
                make.edges.equalToSuperview()
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
