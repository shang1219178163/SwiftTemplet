//
//  UICTViewCellTwo.swift
//  SwiftTemplet
//
//  Created by Bin Shang on 2019/11/19.
//  Copyright © 2019 BN. All rights reserved.
//

import UIKit
import SnapKit
import SwiftExpand

class UICTViewCellTwo: UICollectionViewCell {
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubview(imgView)
        addSubview(labelTop)
        addSubview(labelBom)

        labelTop.text = kNilText;
        labelTop.textAlignment = .center
        labelBom.text = kNilText;

        imgView.image = UIImage(named: kIMG_defaultFailed_S);
//        label.backgroundColor = UIColor.random
//        imgView.backgroundColor = UIColor.random
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        if labelTop.isHidden == true {
            labelBom.snp.makeConstraints { (make) in
                make.left.right.equalToSuperview()
                make.bottom.equalToSuperview()
                make.height.equalTo(kH_LABEL)
            }
            
            imgView.snp.makeConstraints { (make) in
                make.top.equalToSuperview()
                make.left.right.equalToSuperview();
                make.bottom.equalTo(labelBom.snp.top)
            }
            return;
        }
        
        if labelBom.isHidden == true {
            labelTop.snp.makeConstraints { (make) in
                make.top.equalToSuperview()
                make.left.right.equalToSuperview()
                make.height.equalTo(kH_LABEL)
            }
            
            imgView.snp.makeConstraints { (make) in
                make.top.equalTo(labelTop.snp.bottom)
                make.left.right.equalToSuperview();
                make.bottom.equalToSuperview()
            }
            return;
        }
        
        if imgView.isHidden == true {
            let list = [labelTop, labelBom]
            list.snp.distributeViewsAlong(axisType: .vertical, fixedSpacing: 0, leadSpacing: 0, tailSpacing: 0)
            list.snp.makeConstraints { (make) in
                make.left.right.equalToSuperview()
            }
            return;
        }
        
        labelTop.snp.makeConstraints { (make) in
            make.top.equalToSuperview()
            make.left.right.equalToSuperview()
            make.height.equalTo(kH_LABEL)
        }
        
        labelBom.snp.makeConstraints { (make) in
            make.left.right.equalToSuperview()
            make.bottom.equalToSuperview()
            make.height.equalTo(kH_LABEL)
        }
        
        imgView.snp.makeConstraints { (make) in
            make.top.equalTo(labelTop.snp.bottom)
            make.left.right.equalToSuperview();
            make.bottom.equalTo(labelBom.snp.top)
        }
    }
    // MARK: - lazy
    lazy var labelTop: UILabel = {
        let view = UILabel.create()
        return view;
    }()
    
    lazy var labelBom: UILabel = {
        let view = UILabel.create()
        return view;
    }()
}
