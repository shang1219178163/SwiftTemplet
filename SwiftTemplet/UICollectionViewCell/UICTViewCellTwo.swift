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


@objcMembers class UICTViewCellTwo: UICollectionViewCell {
    
    public var topLabelHeight: CGFloat = 25
    public var bomLabelHeight: CGFloat = 25
    
    // MARK: -lifecycle
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        contentView.addSubview(imgView)
        contentView.addSubview(labelTop)
        contentView.addSubview(labelBom)

        labelTop.text = kNilText;
        labelTop.textAlignment = .center
        labelBom.text = kNilText;

        imgView.image = UIImage(named: "img_failedDefault_S");
//        label.backgroundColor = UIColor.random
//        imgView.backgroundColor = UIColor.random
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        let topY = labelTop.isHidden == false ? topLabelHeight : 0
        let bomY = labelBom.isHidden == false ? bomLabelHeight : 0

        labelTop.snp.makeConstraints { (make) in
            make.top.equalToSuperview()
            make.left.right.equalToSuperview()
            make.height.equalTo(topY)
        }
        
        labelBom.snp.makeConstraints { (make) in
            make.left.right.equalToSuperview()
            make.bottom.equalToSuperview()
            make.height.equalTo(bomY)
        }
        
        if imgView.isHidden == true {
            let list = [labelTop, labelBom]
            list.snp.distributeViewsAlong(axisType: .vertical, fixedSpacing: 0, leadSpacing: 0, tailSpacing: 0)
            list.snp.makeConstraints { (make) in
                make.left.right.equalToSuperview()
            }
            return;
        }
        
        imgView.snp.makeConstraints { (make) in
            make.top.equalToSuperview().offset(topY)
            make.left.right.equalToSuperview();
            make.bottom.equalToSuperview().offset(bomY)
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
    
    public lazy var labelTop: UILabel = {
        let view = UILabel.create()
        return view;
    }()
    
    public lazy var labelBom: UILabel = {
        let view = UILabel.create()
        return view;
    }()
    
}
