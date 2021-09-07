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

@objcMembers class UICTViewCellTag: UICollectionViewCell {
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        contentView.addSubview(imgView)
        contentView.addSubview(lab)
        contentView.addSubview(btn)

        lab.addSubview(lineBottom)
        lab.addSubview(lineRight)

        lab.textAlignment = .center
        lab.numberOfLines = 1;
        
        imgView.image = UIImage(named: "img_failedDefault_S")
        
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
        
        if lab.isHidden == true {
            imgView.snp.makeConstraints { (make) in
                make.edges.equalToSuperview()
            }
            return;
        }
        
        if imgView.isHidden == true {
            lab.snp.makeConstraints { (make) in
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
    
    public lazy var btn: UIButton = {
        let view = UIButton(type: .custom)
        view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        view.titleLabel?.font = UIFont.systemFont(ofSize: 15)
        view.titleLabel?.adjustsFontSizeToFitWidth = true
        view.titleLabel?.minimumScaleFactor = 1.0
        view.isExclusiveTouch = true
        view.setTitleColor(.textColor3, for: .normal)
        view.setTitleColor(.theme, for: .selected)
       return view
   }()
}
