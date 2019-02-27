//
//  BNCellSubtitleView.swift
//  SwiftTemplet
//
//  Created by Bin Shang on 2019/2/26.
//  Copyright © 2019 BN. All rights reserved.
//

import UIKit

import SnapKit
import SwiftExpand

/*
 图片+文字+图片
    +文字
 */
class BNCellSubtitleView: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubview(imgViewLeft);
        addSubview(imgViewRight);
        addSubview(labelLeft);
        addSubview(labelSub);
        
        labelSub.numberOfLines = 1;
        labelLeft.numberOfLines = 1;
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        setupConstraint()
    }
    
    func setupConstraint() -> Void {
        
        let imgViewH: CGFloat = frame.height - kY_GAP*2
        let labelH: CGFloat = imgViewH/2.0
        //箭头不隐藏
        if imgViewRight.isHidden == false {
            imgViewRight.snp.makeConstraints { (make) in
                make.centerY.equalToSuperview()
                make.right.equalToSuperview().offset(-kX_GAP)
                make.size.equalTo(kSizeArrow)
            }
            //头像不为空
            if imgViewLeft.image != nil {
                imgViewLeft.snp.makeConstraints { (make) in
                    make.centerY.equalToSuperview()
                    make.left.equalToSuperview().offset(kX_GAP)
                    make.width.height.lessThanOrEqualTo(imgViewH)
                }
                
            } else {
                //头像为空
                imgViewLeft.snp.makeConstraints { (make) in
                    make.centerY.equalToSuperview()
                    make.left.equalToSuperview().offset(kX_GAP)
                    make.width.height.equalTo(0.0)
                }
                
            }
            
            labelLeft.snp.makeConstraints { (make) in
                make.top.equalTo(imgViewRight.snp.centerY).offset(-labelH)
                make.left.equalTo(imgViewLeft.snp.right).offset(kPadding)
                make.right.equalTo(imgViewRight.snp.left).offset(-kPadding)
                make.height.equalTo(labelH)
            }
            
            labelSub.snp.makeConstraints { (make) in
                make.top.equalTo(imgViewRight.snp.centerY)
                make.left.right.height.equalTo(labelLeft)
            }
        } else {
            //头像不为空
            if imgViewLeft.image != nil {
                let imgViewH = frame.height - kY_GAP*2
                
                imgViewLeft.snp.makeConstraints { (make) in
                    make.centerY.equalToSuperview()
                    make.left.equalToSuperview().offset(kX_GAP)
                    make.width.height.equalTo(imgViewH)
                }
                
                //                labelLeft.sizeToFit();
                labelLeft.snp.makeConstraints { (make) in
                    make.top.equalTo(imgViewLeft)
                    make.left.equalTo(imgViewLeft.snp.right).offset(kPadding)
                    make.right.equalToSuperview().offset(-kPadding)
                    make.height.equalTo(imgViewH*0.5)
                }
                
                labelSub.snp.makeConstraints { (make) in
                    make.top.equalTo(labelLeft.snp.bottom)
                    make.left.right.height.equalTo(labelLeft)
                }
                
            } else {
                //头像为空
                imgViewLeft.snp.makeConstraints { (make) in
                    make.centerY.equalToSuperview()
                    make.left.equalToSuperview().offset(kX_GAP)
                    make.width.height.equalTo(0.0)
                }
                
                let labH = (frame.height - kY_GAP*2)*0.5
                labelLeft.snp.makeConstraints { (make) in
                    make.top.equalToSuperview().offset(kY_GAP)
                    make.left.equalToSuperview().offset(kX_GAP)
                    make.height.equalTo(labH)
                }
                
                labelSub.snp.makeConstraints { (make) in
                    make.top.equalTo(labelLeft.snp.bottom)
                    make.left.right.height.equalTo(labelLeft)
                }
            }
        }
    }
    
    //MARK: -funtions
    
    
    //MARK: -lazy
    
    lazy var imgViewLeft: UIImageView = {
        var view = UIImageView(frame: .zero);
        view.autoresizingMask = UIViewAutoresizing(rawValue: UIViewAutoresizing.flexibleWidth.rawValue | UIViewAutoresizing.flexibleHeight.rawValue)
        view.isUserInteractionEnabled = true;
        view.contentMode = .scaleAspectFit;
        
        return view;
    }()
    
    lazy var imgViewRight: UIImageView = {
        var view = UIImageView(frame: .zero);
        view.autoresizingMask = UIViewAutoresizing(rawValue: UIViewAutoresizing.flexibleWidth.rawValue | UIViewAutoresizing.flexibleHeight.rawValue)
        view.isUserInteractionEnabled = true;
        view.contentMode = .scaleAspectFit;
        view.image = UIImage(named: kIMG_arrowRight);
        return view;
    }()
    
    lazy var labelLeft: UILabel = {
        var view = UILabel(frame: .zero);
        view.autoresizingMask = UIViewAutoresizing(rawValue: UIViewAutoresizing.flexibleWidth.rawValue | UIViewAutoresizing.flexibleHeight.rawValue)
        view.textAlignment = .left;
        view.numberOfLines = 0;
        view.lineBreakMode = .byCharWrapping;
        view.isUserInteractionEnabled = true;
        
        return view;
    }()
    
    lazy var labelSub: UILabel = {
        var view = UILabel(frame: .zero);
        view.autoresizingMask = UIViewAutoresizing(rawValue: UIViewAutoresizing.flexibleWidth.rawValue | UIViewAutoresizing.flexibleHeight.rawValue)
        view.textAlignment = .left;
        view.numberOfLines = 0;
        view.lineBreakMode = .byCharWrapping;
        view.isUserInteractionEnabled = true;
        
        return view;
    }()

}
