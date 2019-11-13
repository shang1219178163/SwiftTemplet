//
//  NNVehicleInfoCardView.swift
//  SwiftTemplet
//
//  Created by Bin Shang on 2019/3/1.
//  Copyright © 2019 BN. All rights reserved.
//

import UIKit

import SnapKit
import SwiftExpand

class NNVehicleInfoCardView: UIView {

    var type: Int = 0 {
        willSet {
            switch newValue {
            case 1:
                layer.cornerRadius = kPadding
                layer.borderWidth = kH_LINE_VIEW
                layer.borderColor = UIColor.white.cgColor

                gradientLayer.borderWidth = kH_LINE_VIEW
                gradientLayer.cornerRadius = kPadding
                
            default:
                break;
            }
            
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubview(imgView);
        addSubview(imgViewRight);
        addSubview(labelLeft);
        addSubview(labelSub);
        addSubview(labelSubOne);
        addSubview(iconLabSub);
        addSubview(iconLabSubOne);

        layer.insertSublayer(gradientLayer, at: 0)

        labelLeft.textColor = UIColor.white
        labelLeft.font = UIFont.boldSystemFont(ofSize: 36)
        labelSub.font = UIFont.boldSystemFont(ofSize: 15)
        labelSubOne.font = UIFont.boldSystemFont(ofSize: 15)

        labelLeft.numberOfLines = 1;
        labelSub.textColor = UIColor.white
        labelSub.numberOfLines = 1;
        labelSubOne.textColor = UIColor.white
        labelSubOne.numberOfLines = 1;

        iconLabSub.image = UIImageNamed("icon_businessCard")
        iconLabSubOne.image = UIImageNamed("icon_company_white")
        gradientLayer.colors = CAGradientLayer.defaultColors;

    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        gradientLayer.frame = bounds
        
        setupConstraint()
    }
    
    func setupConstraint() {
        
        let imgViewH: CGFloat = 80+10
        let labelH: CGFloat = 25
        
        //头像不为空
        imgView.snp.makeConstraints { (make) in
            make.top.equalToSuperview().offset(-imgViewH*0.4)
            make.right.equalToSuperview().offset(-kX_GAP*2)
            make.width.height.lessThanOrEqualTo(imgViewH)
        }
        
        //箭头不隐藏
        if imgViewRight.isHidden == false {
            imgViewRight.snp.makeConstraints { (make) in
                make.centerY.equalToSuperview()
                make.right.equalToSuperview().offset(-kX_GAP)
                make.size.equalTo(kSizeArrow)
            }
            
            labelLeft.snp.makeConstraints { (make) in
                make.top.equalTo(imgView.snp.bottom)
                make.left.equalToSuperview().offset(kX_GAP)
                make.right.equalTo(imgViewRight.snp.left).offset(-kPadding)
                make.height.equalTo(labelH)
            }
            
            iconLabSub.snp.makeConstraints { (make) in
                make.top.equalTo(labelLeft.snp.bottom).offset(kPadding)
                make.left.equalTo(labelLeft)
                make.width.height.equalTo(labelH)
            }
            
            labelSub.snp.makeConstraints { (make) in
                make.top.equalTo(labelLeft.snp.bottom).offset(kPadding)
                make.left.equalTo(iconLabSub.snp.right).offset(kPadding)
                make.right.height.equalTo(labelLeft)
            }
            
            iconLabSubOne.snp.makeConstraints { (make) in
                make.top.equalTo(labelSub.snp.bottom).offset(kPadding)
                make.left.equalTo(labelLeft)
                make.width.height.equalTo(labelH)
            }
            
            labelSubOne.snp.makeConstraints { (make) in
                make.top.equalTo(labelSub.snp.bottom).offset(kPadding)
                make.left.equalTo(iconLabSubOne.snp.right).offset(kPadding)
                make.right.height.equalTo(labelLeft)
            }
        } else {            
            labelLeft.snp.makeConstraints { (make) in
                make.top.equalTo(imgView.snp.bottom)
                make.left.equalToSuperview().offset(kX_GAP)
                make.right.equalToSuperview().offset(-kX_GAP)
                make.height.equalTo(labelH)
            }
            
            iconLabSub.snp.makeConstraints { (make) in
                make.top.equalTo(labelLeft.snp.bottom).offset(kPadding)
                make.left.equalTo(labelLeft)
                make.width.height.equalTo(labelH)
            }
            
            labelSub.snp.makeConstraints { (make) in
                make.top.equalTo(labelLeft.snp.bottom).offset(kPadding)
                make.left.equalTo(iconLabSub.snp.right).offset(kPadding)
                make.right.height.equalTo(labelLeft)
            }
            
            iconLabSubOne.snp.makeConstraints { (make) in
                make.top.equalTo(labelSub.snp.bottom).offset(kPadding)
                make.left.equalTo(labelLeft)
                make.width.height.equalTo(labelH)
            }
            
            labelSubOne.snp.makeConstraints { (make) in
                make.top.equalTo(labelSub.snp.bottom).offset(kPadding)
                make.left.equalTo(iconLabSubOne.snp.right).offset(kPadding)
                make.right.height.equalTo(labelLeft)
            }
        }
        
        imgView.layer.cornerRadius = imgViewH*0.5
        imgView.layer.borderWidth = 5
        imgView.layer.borderColor = UIColor.white.cgColor
        imgView.clipsToBounds = true
    }
    
    //MARK: -funtions
    
    
    //MARK: -lazy
    
    lazy var imgView: UIImageView = {
        var view = UIImageView(frame: .zero);
        view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        view.isUserInteractionEnabled = true;
        view.contentMode = .scaleAspectFit;
        view.backgroundColor = UIColor.white

        return view;
    }()
    
    lazy var imgViewRight: UIImageView = {
        var view = UIImageView(frame: .zero);
        view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        view.isUserInteractionEnabled = true;
        view.contentMode = .scaleAspectFit;
        view.image = UIImage(named: kIMG_arrowRight);
        return view;
    }()
    
    lazy var labelLeft: UILabel = {
        var view = UILabel(frame: .zero);
        view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        view.textAlignment = .left;
        view.numberOfLines = 0;
        view.lineBreakMode = .byCharWrapping;
        view.isUserInteractionEnabled = true;
        
        return view;
    }()
    
    lazy var labelSub: UILabel = {
        var view = UILabel(frame: .zero);
        view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        view.textAlignment = .left;
        view.numberOfLines = 0;
        view.lineBreakMode = .byCharWrapping;
        view.isUserInteractionEnabled = true;
        
        return view;
    }()
    
    lazy var labelSubOne: UILabel = {
        var view = UILabel(frame: .zero);
        view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        view.textAlignment = .left;
        view.numberOfLines = 0;
        view.lineBreakMode = .byCharWrapping;
        view.isUserInteractionEnabled = true;
        
        return view;
    }()
    
    lazy var iconLabSub: UIImageView = {
        var view = UIImageView(frame: .zero);
        view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        view.isUserInteractionEnabled = true;
        view.contentMode = .scaleAspectFit;
        
        return view;
    }()
    
    lazy var iconLabSubOne: UIImageView = {
        var view = UIImageView(frame: .zero);
        view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        view.isUserInteractionEnabled = true;
        view.contentMode = .scaleAspectFit;
        
        return view;
    }()
}
