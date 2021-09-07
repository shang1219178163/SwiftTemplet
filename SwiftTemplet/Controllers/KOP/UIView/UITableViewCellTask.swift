//
//  UITableViewCellTask.swift
//  SwiftTemplet
//
//  Created by Bin Shang on 2020/8/12.
//  Copyright © 2020 BN. All rights reserved.
//

import UIKit
import SwiftExpand


class UITableViewCellTask: UITableViewCell {
    var inset = UIEdgeInsets(top: 10, left: 15, bottom: 10, right: 15)
    var imageViewSize = CGSize(width: 25, height: 25)

    
    // MARK: -life cycle
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier);
  
        contentView.addSubview(imgViewLeft);
        contentView.addSubview(labelLeft);
        contentView.addSubview(labelLeftSub);
        contentView.addSubview(labelRightSub);
        contentView.addSubview(btn);
        
        
        labelLeft.adjustsFontSizeToFitWidth = true
        labelLeft.font = UIFont.systemFont(ofSize: 15)
        labelLeft.textColor = UIColor.textColor3
        
        labelLeftSub.adjustsFontSizeToFitWidth = true
        labelLeftSub.font = UIFont.systemFont(ofSize: 12)
        labelLeftSub.textColor = UIColor.hexValue(0xF7AB49)

        labelRightSub.adjustsFontSizeToFitWidth = true
        labelRightSub.font = UIFont.systemFont(ofSize: 10)
        labelRightSub.textColor = UIColor.hexValue(0xC1C1C1)
        labelRightSub.textAlignment = .center
        
        imgViewLeft.image = UIImage(color: .systemBlue)
        btn.titleLabel?.font = UIFont.systemFont(ofSize: 12)
        btn.layer.cornerRadius = 25*0.5
        btn.layer.masksToBounds = true
        btn.setBackgroundColor(.theme, for: .normal)
        btn.setBackgroundColor(UIColor.theme.withAlphaComponent(0.5), for: .disabled)
        btn.setBackgroundImage(UIImage(named: "bg_gradient_orange"), for: .selected)

        labelLeft.text = "支付停车费"
        labelLeftSub.text = "经验+20  积分+10"
        labelRightSub.text = "已完成3/3"
        
        btn.setTitle("去完成", for: .normal)
        
        getViewLayer()
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
        
//        let height = bounds.height - inset.top - inset.bottom
        let labStartX = imgViewLeft.isHidden ? inset.left : imageViewSize.width + inset.left + kPadding
        let endX = accessoryType == .none ? inset.right : kPadding

        if imgViewLeft.isHidden == false {
            imgViewLeft.snp.makeConstraints { (make) in
                make.left.equalToSuperview().offset(inset.left)
                make.bottom.equalToSuperview().multipliedBy(0.5)
                make.size.equalTo(imageViewSize)
            }
        }
        
        btn.snp.makeConstraints { (make) in
            make.centerY.equalToSuperview().offset(-25*0.5)
            make.right.equalToSuperview().offset(-inset.right);
            make.width.equalTo(65);
            make.height.equalTo(25);
        }
        
        labelRightSub.snp.makeConstraints { (make) in
            make.top.equalTo(btn.snp.bottom).offset(0)
            make.right.size.equalTo(btn)
        }
                
        labelLeft.snp.remakeConstraints { (make) in
            make.top.equalToSuperview().offset(inset.top);
            make.left.equalToSuperview().offset(labStartX);
            make.right.equalTo(btn.snp.left).offset(-kPadding);
            make.bottom.equalToSuperview().multipliedBy(0.5)
        }

        labelLeftSub.snp.makeConstraints { (make) in
            make.top.equalTo(labelLeft.snp.bottom).offset(0);
            make.left.right.equalTo(labelLeft)
            make.height.equalTo(labelLeft);
        }
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    // MARK: -funtions
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
        view.numberOfLines = 0
        view.lineBreakMode = .byCharWrapping
        
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
        view.numberOfLines = 0
        view.lineBreakMode = .byCharWrapping
        
        return view
    }()
    
    
    public lazy var labelRightSub: UILabel = {
        let view = UILabel(frame: CGRect.zero)
        view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        view.font = UIFont.systemFont(ofSize: 15)
        view.textAlignment = .right
        view.numberOfLines = 0
        view.lineBreakMode = .byCharWrapping
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

