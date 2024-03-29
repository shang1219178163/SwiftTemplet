//
//  UITableViewCellSubtitle.swift
//  SwiftTemplet
//
//  Created by Bin Shang on 2020/1/7.
//  Copyright © 2020 BN. All rights reserved.
//

import UIKit

import SnapKit
import SwiftExpand

/*
 图像 文字+文字
      文字+文字
 */
@objcMembers class UITableViewCellSubtitle: UITableViewCell {

    var inset = UIEdgeInsets(top: 10, left: 15, bottom: 10, right: 15)
    var btnSize = CGSize(width: 25, height: 25)
    // MARK: -life cycle

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier);
        
        contentView.addSubview(btn)
        contentView.addSubview(labelRight)
        contentView.addSubview(labelRightSub)
        contentView.addSubview(labelLeft)
        contentView.addSubview(labelLeftSub)
                
        labelLeft.textColor = UIColor.black;
        labelLeft.font = UIFont.systemFont(ofSize: 15)
//        labelLeft.textAlignment = .left;
        labelLeft.adjustsFontSizeToFitWidth = true
        
        labelLeftSub.textColor = UIColor.textColor6;
        labelRightSub.textColor = UIColor.textColor6;
        
        labelRight.textColor = UIColor.black;
        labelRight.font = UIFont.systemFont(ofSize: 15)
        labelRightSub.adjustsFontSizeToFitWidth = true
        
        labelLeft.text = "车牌号码"
        labelLeftSub.text = "支付方式"
        labelRight.text = "$0.00"
        labelRightSub.text = DateFormatter.stringFromDate(Date());
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder);
        fatalError("init(coder:) has not been implemented")
    }

    override func layoutSubviews() {
        super.layoutSubviews();
        
        setupConstraint()
    }
    
    func setupConstraint() {
        if bounds.height <= 10 {
            return;
        }
        
        let height = bounds.height - inset.top - inset.bottom
        let labStartX = btn.isHidden ? inset.left : btnSize.width + inset.left + kPadding
        let endX = accessoryType == .none ? inset.right : kPadding

        DDLog(btn.isHidden, labStartX)
        if btn.isHidden == false {
            btn.snp.remakeConstraints { (make) in
                make.centerY.equalToSuperview()
                make.left.equalToSuperview().offset(inset.left)
                make.size.equalTo(btnSize)
            }
        }
        
        let labelRightSize = labelRight.sizeThatFits(.zero)
        labelRight.snp.remakeConstraints { (make) in
            make.top.equalToSuperview().offset(inset.top)
            make.right.equalToSuperview().offset(-endX)
            make.width.equalTo(labelRightSize.width)
            make.height.equalTo(height*0.5)
        }
        
        let labelRightSubSize = labelRightSub.sizeThatFits(.zero)
        labelRightSub.snp.remakeConstraints { (make) in
            make.top.equalTo(labelRight.snp.bottom).offset(0)
            make.right.equalToSuperview().offset(-endX)
            make.width.equalTo(labelRightSubSize.width)
            make.height.equalTo(height*0.5)
        }

        labelLeft.snp.remakeConstraints { (make) in
            make.centerY.equalTo(labelRight);
            make.left.equalToSuperview().offset(labStartX);
            make.right.equalTo(labelRight.snp.left).offset(-8);
            make.height.equalTo(labelRight)
        }
        
        labelLeftSub.snp.remakeConstraints { (make) in
            make.centerY.equalTo(labelRightSub)
            make.left.equalTo(labelLeft)
            make.right.equalTo(labelRightSub.snp.left).offset(-8)
            make.height.equalTo(labelRightSub)
        }

    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    // MARK: -lazy
    public lazy var imgViewLeft: UIImageView = {
        let view = UIImageView(frame: .zero)
        view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        view.isUserInteractionEnabled = true
        view.contentMode = .scaleAspectFit
        view.backgroundColor = .clear

        return view
    }()
    
    public lazy var labelLeft: UILabel = {
        let view = UILabel(frame: CGRect.zero)
        view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        view.textAlignment = .left
//        view.numberOfLines = 0
//        view.lineBreakMode = .byCharWrapping
        
        return view
    }()
  
    public lazy var labelLeftSub: UILabel = {
        let view = UILabel(frame: CGRect.zero)
        view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        view.textAlignment = .left
        view.numberOfLines = 0
        view.lineBreakMode = .byCharWrapping
        view.font = UIFont.systemFont(ofSize: UIFont.labelFontSize - 2.0)
        
        return view
    }()
    
    public lazy var labelRight: UILabel = {
        let view = UILabel(frame: CGRect.zero)
        view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        view.textAlignment = .left
//        view.numberOfLines = 0
//        view.lineBreakMode = .byCharWrapping
        
        return view
    }()
    
    public lazy var labelRightSub: UILabel = {
        let view = UILabel(frame: CGRect.zero)
        view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        view.font = UIFont.systemFont(ofSize: 15)
        view.textAlignment = .right
//        view.numberOfLines = 0
//        view.lineBreakMode = .byCharWrapping
        view.font = UIFont.systemFont(ofSize: UIFont.labelFontSize - 2.0)
        view.isUserInteractionEnabled = true
        return view
    }()
    
    
    public lazy var btn: UIButton = {
        let view = UIButton(type: .custom)
        view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        view.titleLabel?.adjustsFontSizeToFitWidth = true
        view.titleLabel?.minimumScaleFactor = 1.0
        view.isExclusiveTouch = true
        view.adjustsImageWhenHighlighted = false
        view.setTitleColor(.black, for: .normal)
        
        return view
    }()
}

