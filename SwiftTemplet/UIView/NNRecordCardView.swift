//
//  NNRecordCardView.swift
//  SwiftTemplet
//
//  Created by Bin Shang on 2019/3/1.
//  Copyright © 2019 BN. All rights reserved.
//

import UIKit

import SnapKit
import SwiftExpand

class NNRecordCardView: UIView {
    
    var type: Int = 0 {
        willSet {
            switch newValue {
            case 1:
                layer.borderWidth = kH_LINE_VIEW
                layer.cornerRadius = kPadding
                
                gradientLayer.borderWidth = kH_LINE_VIEW
                gradientLayer.cornerRadius = kPadding
                
            default:
                break;
            }
            
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubview(labelLeft);
        addSubview(labelLeftSub);
        addSubview(lineView);
        addSubview(labelRight);
        addSubview(labelRightSub);

        layer.insertSublayer(gradientLayer, at: 0)
        
        labelLeft.textColor = UIColor.white
        labelLeft.font = UIFont.systemFont(ofSize: 14)
        labelLeftSub.font = UIFont.boldSystemFont(ofSize: 32)
        labelRight.font = UIFont.systemFont(ofSize: 14)
        labelRightSub.font = UIFont.boldSystemFont(ofSize: 32)

        labelLeft.numberOfLines = 1;
        labelLeftSub.textColor = UIColor.white
        labelLeftSub.numberOfLines = 1;
        labelRight.textColor = UIColor.white
        labelRight.numberOfLines = 1;
        labelRightSub.textColor = UIColor.white
        labelRightSub.numberOfLines = 1;
        
//        gradientLayer.colors = CAGradientLayer.defaultColors;
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
        let labelW: CGFloat = (bounds.width - kX_GAP*2 - kPadding*2 - 0.5)*0.5;
        let labelH: CGFloat = 30
        let labelY: CGFloat = (bounds.height - labelH*2 - kPadding)/2.0

        labelLeft.snp.makeConstraints { (make) in
            make.top.equalToSuperview().offset(labelY)
            make.left.equalToSuperview().offset(kX_GAP)
            make.width.equalTo(labelW)
            make.height.equalTo(labelH)
        }
    
        labelLeftSub.snp.makeConstraints { (make) in
            make.top.equalTo(labelLeft.snp.bottom).offset(kPadding)
            make.left.right.equalTo(labelLeft)
            make.height.equalTo(labelH)
        }
        
        lineView.snp.makeConstraints { (make) in
            make.top.equalTo(labelLeft.snp.centerY)
            make.left.equalTo(labelLeft.snp.right).offset(kPadding)
            make.width.equalTo(0.5)
            make.bottom.equalTo(labelLeftSub.snp.centerY)
        }
       
        labelRight.snp.makeConstraints { (make) in
            make.top.equalTo(labelLeft)
            make.right.equalToSuperview().offset(-kX_GAP)
            make.width.height.equalTo(labelLeft)
        }
            
        labelRightSub.snp.makeConstraints { (make) in
            make.top.equalTo(labelLeftSub)
            make.right.equalToSuperview().offset(-kX_GAP)
            make.width.height.equalTo(labelLeft)
        }
        
//        layer.borderWidth = kH_LINE_VIEW
//        layer.cornerRadius = kPadding
//
//        gradientLayer.borderWidth = kH_LINE_VIEW
//        gradientLayer.cornerRadius = kPadding
    }
    
    //MARK: -funtions
    
    
    //MARK: -lazy
    
    lazy var labelLeft: UILabel = {
        let view = UILabel(frame: .zero);
        view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        view.textAlignment = .center;
        view.numberOfLines = 0;
        view.lineBreakMode = .byCharWrapping;
        view.isUserInteractionEnabled = true;
        
        return view;
    }()
    
    lazy var labelLeftSub: UILabel = {
        let view = UILabel(frame: .zero);
        view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        view.textAlignment = .center;
        view.numberOfLines = 0;
        view.lineBreakMode = .byCharWrapping;
        view.isUserInteractionEnabled = true;
        
        return view;
    }()
    
    lazy var labelRight: UILabel = {
        let view = UILabel(frame: .zero);
        view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        view.textAlignment = .center;
        view.numberOfLines = 0;
        view.lineBreakMode = .byCharWrapping;
        view.isUserInteractionEnabled = true;
        
        return view;
    }()
    
    lazy var labelRightSub: UILabel = {
        let view = UILabel(frame: .zero);
        view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        view.textAlignment = .center;
        view.numberOfLines = 0;
        view.lineBreakMode = .byCharWrapping;
        view.isUserInteractionEnabled = true;
        
        return view;
    }()
    
    lazy var lineView: UIView = {
        let view = UIView(frame: .zero)
        view.backgroundColor = UIColor.hex("#e5e5e5")
        return view
    }()
    
}
