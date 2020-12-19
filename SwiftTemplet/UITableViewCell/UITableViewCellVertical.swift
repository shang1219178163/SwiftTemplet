//
//  UITableViewCellVertical.swift
//  SwiftTemplet
//
//  Created by Bin Shang on 2020/6/19.
//  Copyright © 2020 BN. All rights reserved.
//

import UIKit
import SwiftExpand


class UITableViewCellVertical: UITableViewCell {
    var inset = UIEdgeInsets(top: 10, left: 15, bottom: 10, right: 15)
    var imageViewSize = CGSize(width: 25, height: 25)

    // MARK: -lazy
    lazy var labelOne: UILabel = {
        let view = UILabel(frame: .zero);
        view.text = "-";
        view.textColor = .black;
        view.textAlignment = .left
        view.font = UIFont.systemFont(ofSize: 15)

        return view;
    }();
    
    lazy var labelTwo: UILabel = {
        let view = UILabel(frame: .zero);
        view.text = "-";
        view.textColor = UIColor.hexValue(0x666666)
        view.textAlignment = .left

        view.font = UIFont.systemFont(ofSize: 11)

        return view;
    }();
    
    lazy var labelThree: UILabel = {
        let view = UILabel(frame: .zero);
        view.text = "-";
        view.textColor = UIColor.hexValue(0x666666)
        view.textAlignment = .left

        view.font = UIFont.systemFont(ofSize: 11)

        return view;
    }();
    
    lazy var labelFour: UILabel = {
        let view = UILabel(frame: .zero);
        view.text = "-";
        view.textColor = UIColor.hexValue(0x666666)
        view.textAlignment = .left
        view.font = UIFont.systemFont(ofSize: 11)
        view.adjustsFontSizeToFitWidth = true

        return view;
    }();
    
    // MARK: -life cycle
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier);
  
        contentView.addSubview(imgViewLeft);
        contentView.addSubview(labelOne);
        contentView.addSubview(labelTwo);
        contentView.addSubview(labelThree);
        contentView.addSubview(labelFour);
        
        imgViewLeft.image = UIImage(color: .systemBlue)
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
        let endX = accessoryType == .none ? inset.right : 0

        if imgViewLeft.isHidden == false {
            imgViewLeft.snp.makeConstraints { (make) in
                make.centerY.equalToSuperview()
                make.left.equalToSuperview().offset(inset.left)
                make.size.equalTo(imageViewSize)
            }
        }
        
        let list = [labelOne, labelTwo, labelThree, labelFour].filter { $0.isHidden == false }
        list.snp.distributeViewsAlong(axisType: .vertical, fixedSpacing: 0, leadSpacing: inset.top, tailSpacing: inset.bottom)
        list.snp.makeConstraints { (make) in
            make.left.equalToSuperview().offset(labStartX)
            make.right.equalToSuperview().offset(-endX)
        }
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    // MARK: -funtions
    

    
    
}

