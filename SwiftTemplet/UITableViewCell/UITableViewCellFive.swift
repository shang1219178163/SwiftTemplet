//
//  UITableViewCellFive.swift
//  BuildUI
//
//  Created by Bin Shang on 2018/12/19.
//  Copyright © 2018 Bin Shang. All rights reserved.
//

import UIKit
/*
 图像
 主标题
 副标题
 */
@objcMembers class UITableViewCellFive: UITableViewCell {

    var inset = UIEdgeInsets(top: 10, left: 15, bottom: 10, right: 15)
    // MARK: -life cycle

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier);
        
        contentView.addSubview(imgViewLeft);
        contentView.addSubview(labelLeft);
        contentView.addSubview(labelLeftSub);
                
        labelLeft.textColor = UIColor.black;
        labelLeft.font = UIFont.systemFont(ofSize: 15)
//        labelLeft.textAlignment = .left;
        labelLeft.adjustsFontSizeToFitWidth = true
        
        labelLeftSub.font = UIFont.systemFont(ofSize: 15)
        labelLeftSub.textColor = UIColor.textColor6;
                
        labelLeft.text = "-"
        labelLeftSub.text = "-"
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
            return
        }
        let labHeight: CGFloat = 20

        let endBottom = labelLeftSub.isHidden ? inset.bottom : inset.bottom + labHeight
    
        if labelLeftSub.isHidden == false {
            labelLeftSub.snp.makeConstraints { (make) in
                make.left.equalToSuperview().offset(inset.left);
                make.right.equalToSuperview().offset(-inset.right);
                make.bottom.equalToSuperview().offset(inset.bottom);
                make.height.equalTo(labHeight);
            }
        }
        
        labelLeft.snp.remakeConstraints { (make) in
            make.left.equalToSuperview().offset(inset.left);
            make.right.equalToSuperview().offset(-inset.right);
            make.bottom.equalTo(endBottom).offset(0);
            make.height.equalTo(labHeight);
        }
        
        imgViewLeft.snp.makeConstraints { (make) in
            make.top.equalToSuperview().offset(inset.top)
            make.left.equalToSuperview().offset(inset.left);
            make.right.equalToSuperview().offset(-inset.right);
            make.bottom.equalTo(labelLeft.snp.top).offset(0);
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
}

