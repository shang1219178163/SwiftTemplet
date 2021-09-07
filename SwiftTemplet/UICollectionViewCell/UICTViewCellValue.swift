//
//  UICTViewCellValue.swift
//  SwiftTemplet
//
//  Created by Bin Shang on 2020/7/20.
//  Copyright © 2020 BN. All rights reserved.
//

import UIKit
import SnapKit
import SwiftExpand

@objcMembers class UICTViewCellValue: UICollectionViewCell {
    var inset = UIEdgeInsets(top: 10, left: 15, bottom: 10, right: 15)
    var btnSize = CGSize(width: 20, height: 20)

    // MARK: -lifecycle
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(imgView)
        addSubview(lab)
        addSubview(labDetail)
        addSubview(btn)
        
        lab.textAlignment = .left
        labDetail.textAlignment = .left
        imgView.backgroundColor = .systemBlue
        lab.backgroundColor = .systemRed
        labDetail.backgroundColor = .systemGreen
        btn.backgroundColor = .systemPurple
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()

        if bounds.height < 10 {
            return
        }
        
        let height = bounds.height - inset.top - inset.bottom
        
        let labStartX = imgView.isHidden == false ? height + inset.left + kPadding : inset.left
        let labEndX = btn.isHidden == false ? btnSize.width + inset.right + kPadding : inset.right

        if btn.isHidden == false {
            btn.snp.makeConstraints { (make) in
                make.centerY.equalToSuperview()
                make.right.equalToSuperview().offset(-inset.right);
                make.size.equalTo(btnSize);
            }
        }
        
        if imgView.isHidden == false {
            imgView.snp.makeConstraints { (make) in
                make.top.equalToSuperview().offset(inset.top);
                make.left.equalToSuperview().offset(inset.left);
                make.width.height.equalTo(height);
            }
        }

        let size: CGSize = labDetail.sizeThatFits(.zero)
        labDetail.snp.remakeConstraints { (make) in
            make.centerY.equalToSuperview()
            make.right.equalToSuperview().offset(-labEndX)
            make.width.equalTo(ceil(size.width))
            make.height.equalTo(height);
        }
        
        lab.snp.remakeConstraints { (make) in
            make.centerY.equalToSuperview()
            make.left.equalToSuperview().offset(labStartX)
            make.right.equalTo(labDetail.snp.left).offset(-kPadding)
            make.height.equalTo(height);
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
   
    public var labDetail: UILabel = {
        let view = UILabel(frame: .zero)
        view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        view.numberOfLines = 1
        view.adjustsFontSizeToFitWidth = true
        view.textAlignment = .center
    
        return view
    }()

    public var btn: UIButton = {
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
