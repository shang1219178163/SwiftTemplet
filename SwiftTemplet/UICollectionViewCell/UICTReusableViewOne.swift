//
//  UICTReusableViewOne.swift
//  SwiftTemplet
//
//  Created by Bin Shang on 2018/12/23.
//  Copyright © 2018 BN. All rights reserved.
//

import UIKit

import SnapKit
import SwiftExpand

@objcMembers class UICTReusableViewOne: UICollectionReusableView {
    
    var inset = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
    var btnSize = CGSize(width: 20, height: 20)

//    var type = 0;//0优先显示右边文字,1代表优先显示左边文字
    var type: Int = 0{
        didSet {
            if oldValue == 0 {
                //右边文字优先展示
                labDetail.sizeToFit();
                lab.textAlignment = .left;
                lab.adjustsFontSizeToFitWidth = true
                
            } else {
                //左边文字优先展示
                lab.sizeToFit();
                labDetail.textAlignment = .right;
                labDetail.adjustsFontSizeToFitWidth = true
            }
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(imgView)
        addSubview(lab)
        addSubview(labDetail)
        addSubview(btn)
        
        imgView.image = UIImage(named: "img_notice");
        
        lab.numberOfLines = 1;
        labDetail.numberOfLines = 1;
        
        lab.backgroundColor = UIColor.random
        imgView.backgroundColor = UIColor.random
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        setupConstraint()
    }
    
    func setupConstraint() {
        if bounds.height < 10 {
            return
        }
        
        let height = bounds.height - inset.top - inset.bottom
        
        let labStartX = imgView.isHidden ? inset.left : height + inset.left + kPadding
        let labEndX = btn.isHidden ? inset.right : btnSize.width + inset.right + kPadding
        
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

        if type == 0 {
            let size = labDetail.sizeThatFits(.zero)
            labDetail.snp.remakeConstraints { (make) in
                make.centerY.equalToSuperview()
                make.right.equalToSuperview().offset(-labEndX)
                make.width.equalTo(size.width)
                make.height.equalTo(height)
            }
            
            lab.snp.remakeConstraints { (make) in
                make.centerY.equalToSuperview()
                make.left.equalToSuperview().offset(labStartX)
                make.right.equalTo(labDetail.snp.left).offset(-kPadding)
                make.height.equalTo(height)
            }
            
        } else {
            let size = lab.sizeThatFits(.zero)
            lab.snp.remakeConstraints { (make) in
                make.centerY.equalToSuperview()
                make.left.equalToSuperview().offset(labStartX)
                make.width.equalTo(size.width)
                make.height.equalTo(height)
            }
            
            labDetail.snp.remakeConstraints { (make) in
                make.centerY.equalToSuperview()
                make.left.equalTo(lab.snp.right).offset(kPadding)
                make.right.equalToSuperview().offset(-labEndX)
                make.height.equalTo(height)
            }
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
