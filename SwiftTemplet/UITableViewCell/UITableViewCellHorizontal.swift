//
//  UITableViewCellHorizontal.swift
//  SwiftTemplet
//
//  Created by Bin Shang on 2020/6/19.
//  Copyright © 2020 BN. All rights reserved.
//

import UIKit


class UITableViewCellHorizontal: UITableViewCell {
    
    var Xgap: CGFloat = 15;

    // MARK: -lazy
    lazy var labelOne: UILabel = {
        var view = UILabel(frame: .zero);
        view.text = "-";
        view.textColor = .black;
        view.textAlignment = .left
        view.font = UIFont.systemFont(ofSize: 15)
        view.numberOfLines = 1;

        return view;
    }();
    
    lazy var labelTwo: UILabel = {
        var view = UILabel(frame: .zero);
        view.text = "-";
        view.textColor = UIColor.hexValue(0x666666)
        view.textAlignment = .right

        view.font = UIFont.systemFont(ofSize: 11)
        view.numberOfLines = 1;

        return view;
    }();
    
    lazy var labelThree: UILabel = {
        var view = UILabel(frame: .zero);
        view.text = "-";
        view.textColor = UIColor.hexValue(0x666666)
        view.textAlignment = .left

        view.font = UIFont.systemFont(ofSize: 11)
        view.numberOfLines = 1;

        return view;
    }();
    
    lazy var labelFour: UILabel = {
        var view = UILabel(frame: .zero);
        view.text = "-";
        view.textColor = UIColor.hexValue(0x666666)
        view.textAlignment = .right
        view.font = UIFont.systemFont(ofSize: 11)
        view.adjustsFontSizeToFitWidth = true
        view.numberOfLines = 1;

        return view;
    }();
    
    // MARK: -life cycle
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier);
  
        contentView.addSubview(labelOne);
        contentView.addSubview(labelTwo);
        contentView.addSubview(labelThree);
        contentView.addSubview(labelFour);
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
        if bounds.height <= 0.0 {
            return;
        }
        let tailSpacing: CGFloat = accessoryType == .none ? 10.0 : 0.0
        
        let list = [labelOne, labelTwo, labelThree, labelFour].filter { $0.isHidden == false }
        list.snp.distributeViewsAlong(axisType: .horizontal, fixedSpacing: 20, leadSpacing: Xgap, tailSpacing: tailSpacing)
        list.snp.makeConstraints { (make) in
            make.top.equalToSuperview().offset(10);
            make.bottom.equalToSuperview().offset(-10)
        }
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    // MARK: -funtions
    

    
    
}

