//
//  IOPTableViewCellExaminePostmark.swift
//  SwiftTemplet
//
//  Created by Bin Shang on 2021/8/11.
//  Copyright © 2021 BN. All rights reserved.
//


import UIKit
import SwiftExpand


class IOPTableViewCellExaminePostmark: UITableViewCell {
    var inset = UIEdgeInsets(top: 10, left: 15, bottom: 10, right: 15)
    var imageViewSize = CGSize(width: 65, height: 50)

    var imageViewOffSet = UIOffset(horizontal: 0, vertical: 0)
    // MARK: -lazy
    lazy var labelOne: UILabel = {
        let view = UILabel(frame: .zero)
        view.text = "-";
        view.textColor = UIColor.hexValue(0x666666)
        view.textAlignment = .left
        view.font = UIFont.systemFont(ofSize: 13)

        return view;
    }()
    
    lazy var labelTwo: UILabel = {
        let view = UILabel(frame: .zero)
        view.text = "-";
        view.textColor = UIColor.hexValue(0x666666)
        view.textAlignment = .left

        view.font = UIFont.systemFont(ofSize: 13)

        return view;
    }()
    
    lazy var labelOneRight: UILabel = {
        let view = UILabel(frame: .zero)
        view.text = "-";
        view.textColor = UIColor.hexValue(0x666666)
        view.textAlignment = .left

        view.font = UIFont.systemFont(ofSize: 13)

        return view;
    }()
    
    lazy var labelTwoRight: UILabel = {
        let view = UILabel(frame: .zero)
        view.text = "-";
        view.textColor = UIColor.hexValue(0x666666)
        view.textAlignment = .left
        view.font = UIFont.systemFont(ofSize: 13)
        view.adjustsFontSizeToFitWidth = true

        return view;
    }()
    
    // MARK: -life cycle
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier);
  
        contentView.addSubview(labelOne)
        contentView.addSubview(labelTwo)
        contentView.addSubview(labelOneRight)
        contentView.addSubview(labelTwoRight)
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
        
//        assert(imageView != nil, "imageView.image 不能为空")
//        let height = bounds.height - inset.top - inset.bottom
        let labStartX = imgViewLeft.isHidden ? inset.left : imageViewSize.width + inset.left + kPadding
        let endX = accessoryType == .none ? inset.right : kPadding
        
        let labelOneRightSize = labelOneRight.sizeThatFits(CGSize(width: CGFloat.greatestFiniteMagnitude, height: 25))
        let labelTwoRightSize = labelTwoRight.sizeThatFits(CGSize(width: CGFloat.greatestFiniteMagnitude, height: 25))

        labelOneRight.snp.makeConstraints { (make) in
            make.top.equalToSuperview().offset(inset.top)
            make.right.equalToSuperview().offset(-inset.right)
//            make.width.equalTo(100)
//            make.height.equalTo(25)
            make.size.equalTo(labelOneRightSize)
        }
        
        labelTwoRight.snp.makeConstraints { (make) in
            make.bottom.equalToSuperview().offset(-inset.bottom);
            make.right.equalToSuperview().offset(-inset.right);
            make.size.equalTo(labelTwoRightSize);
        }
        
        labelOne.snp.makeConstraints { (make) in
            make.top.equalTo(labelOneRight)
            make.left.equalToSuperview().offset(inset.right)
            make.right.equalTo(labelOneRight.snp.left).offset(-10)
            make.height.equalTo(labelOneRight)
        }
        
        labelTwo.snp.makeConstraints { (make) in
            make.bottom.equalTo(labelTwoRight)
            make.left.equalTo(labelOne)
            make.right.equalTo(labelTwoRight.snp.left).offset(-10)
            make.height.equalTo(labelTwoRight)
        }
        
        guard let imageView = imageView,
              imageView.isHidden == false else { return }
        imageView.snp.makeConstraints { (make) in
            make.centerX.equalToSuperview().offset(imageViewOffSet.horizontal)
            make.bottom.equalToSuperview()
            make.size.equalTo(imageViewSize);
        }
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    // MARK: -funtions
    

    
    
}

