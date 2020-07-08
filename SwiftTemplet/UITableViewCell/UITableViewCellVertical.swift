//
//  UITableViewCellVertical.swift
//  SwiftTemplet
//
//  Created by Bin Shang on 2020/6/19.
//  Copyright © 2020 BN. All rights reserved.
//

import UIKit


class UITableViewCellVertical: UITableViewCell {
    
    var Xgap: CGFloat = 15;

    var imageSize: CGSize = .zero

    // MARK: -lazy
    lazy var labelOne: UILabel = {
        var view = UILabel(frame: .zero);
        view.text = "-";
        view.textColor = .black;
        view.textAlignment = .left
        view.font = UIFont.systemFont(ofSize: 15)

        return view;
    }();
    
    lazy var labelTwo: UILabel = {
        var view = UILabel(frame: .zero);
        view.text = "-";
        view.textColor = UIColor.hexValue(0x666666)
        view.textAlignment = .left

        view.font = UIFont.systemFont(ofSize: 11)

        return view;
    }();
    
    lazy var labelThree: UILabel = {
        var view = UILabel(frame: .zero);
        view.text = "-";
        view.textColor = UIColor.hexValue(0x666666)
        view.textAlignment = .left

        view.font = UIFont.systemFont(ofSize: 11)

        return view;
    }();
    
    lazy var labelFour: UILabel = {
        var view = UILabel(frame: .zero);
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
        
        imgViewLeft.backgroundColor = .systemGreen
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
        if bounds.height <= 10.0 {
            return;
        }
        
        let height: CGFloat = bounds.height - 20
        var left: CGFloat = Xgap

        if imgViewLeft.isHidden == false {
            let size = imageSize == .zero ? CGSize(width: height, height: height) : imageSize
            imgViewLeft.snp.makeConstraints { (make) in
                make.centerY.equalToSuperview()
                make.left.equalToSuperview().offset(Xgap);
                make.size.equalTo(size)
            }
            left = Xgap + size.width + 8
        }
        
        let right: CGFloat = accessoryType == .none ? -10.0 : 0.0
        let list = [labelOne, labelTwo, labelThree, labelFour].filter { $0.isHidden == false }
        list.snp.distributeViewsAlong(axisType: .vertical, fixedSpacing: 0, leadSpacing: 10, tailSpacing: 10)
        list.snp.makeConstraints { (make) in
            make.left.equalToSuperview().offset(left);
            make.right.equalToSuperview().offset(right);
        }
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    // MARK: -funtions
    

    
    
}

