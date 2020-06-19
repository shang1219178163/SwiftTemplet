//
//  UITableViewCellLog.swift
//  SwiftTemplet
//
//  Created by Bin Shang on 2020/6/19.
//  Copyright © 2020 BN. All rights reserved.
//

import UIKit


class UITableViewCellLog: UITableViewCell {
    
    var Xgap: CGFloat = 15;

    // MARK: -lazy
    lazy var labelOne: UILabel = {
        var view = UILabel(frame: .zero);
        view.text = "Label";
        view.textColor = UIColor.black;
        view.font = UIFont.systemFont(ofSize: 15)
        
        return view;
    }()
    
    lazy var labelTwo: UILabel = {
        var view = UILabel(frame: .zero);
        view.text = "Label";
        view.textColor = UIColor.hexValue(0x666666)
        view.font = UIFont.systemFont(ofSize: 11)
        
        return view;
    }()
    
    lazy var labelThree: UILabel = {
        var view = UILabel(frame: .zero);
        view.text = "Label";
        view.textColor = UIColor.hexValue(0x666666)
        view.font = UIFont.systemFont(ofSize: 11)
        
        return view;
    }()
    
    lazy var labelOneRight: UILabel = {
        var view = UILabel(frame: .zero);
        view.text = "Label";
        view.textColor = UIColor.black;
        view.textColor = UIColor.hexValue(0x666666)
        view.font = UIFont.systemFont(ofSize: 11)
        view.textAlignment = .right
        view.adjustsFontSizeToFitWidth = true
        
        return view;
    }()
    
    lazy var labelTwoRight: UILabel = {
        var view = UILabel(frame: .zero);
        view.text = "Label";
        view.textColor = UIColor.hexValue(0x666666)
        view.font = UIFont.systemFont(ofSize: 11)
        view.textAlignment = .right
        view.adjustsFontSizeToFitWidth = true

        return view;
    }()
    
    lazy var labelThreeRight: UILabel = {
        var view = UILabel(frame: .zero);
        view.text = "Label";
        view.textColor = UIColor.hexValue(0x666666)
        view.font = UIFont.systemFont(ofSize: 11)
        view.textAlignment = .right
        view.adjustsFontSizeToFitWidth = true

        return view;
    }()
        
    lazy var labelFour: UILabel = {
        var view = UILabel(frame: .zero);
        view.text = "Label";
        view.textColor = UIColor.hexValue(0x666666)
        view.font = UIFont.systemFont(ofSize: 11)
        view.textAlignment = .left
        view.adjustsFontSizeToFitWidth = true

        return view;
    }()
    
    // MARK: -life cycle
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier);
  
        contentView.addSubview(imgViewLeft);

        contentView.addSubview(labelOne);
        contentView.addSubview(labelTwo);
        contentView.addSubview(labelThree);
        contentView.addSubview(labelOneRight);
        contentView.addSubview(labelTwoRight);
        contentView.addSubview(labelThreeRight);
        contentView.addSubview(labelFour);
        
        labelOne.font = UIFont.systemFont(ofSize: 14)
        labelOne.numberOfLines = 1;
        
        labelTwo.font = UIFont.systemFont(ofSize: 12)
        labelTwo.numberOfLines = 1;
        
        labelThree.font = UIFont.systemFont(ofSize: 12)
        labelThree.numberOfLines = 1;
        
        labelOneRight.font = UIFont.systemFont(ofSize: 14)
        labelOneRight.numberOfLines = 1;
        
        labelTwoRight.font = UIFont.systemFont(ofSize: 12)
        labelTwoRight.numberOfLines = 1;
        
        labelThreeRight.font = UIFont.systemFont(ofSize: 12)
        labelThreeRight.numberOfLines = 1;
              
        labelFour.font = UIFont.systemFont(ofSize: 12)
        labelFour.numberOfLines = 2;
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
        
        let height: CGFloat = bounds.height - 20
        let right: CGFloat = accessoryType == .none ? -10.0 : 0.0

        if imgViewLeft.isHidden == true {
            labelOneRight.snp.makeConstraints { (make) in
                make.top.equalToSuperview().offset(10);
                make.right.equalToSuperview().offset(right)
                make.height.equalTo(height/4);
                make.width.equalTo(120)
            }
            
            labelOne.snp.makeConstraints { (make) in
                make.top.equalToSuperview().offset(10);
                make.left.equalToSuperview().offset(Xgap)
                make.right.equalTo(labelOneRight.snp.left).offset(-8)
                make.height.equalTo(height/4);
            }

        } else {
            imgViewLeft.snp.makeConstraints { (make) in
                make.top.equalToSuperview().offset(10);
                make.left.equalToSuperview().offset(Xgap);
                make.bottom.equalToSuperview().offset(-10);
                make.width.equalTo(height)
            }
            
            labelOneRight.snp.makeConstraints { (make) in
                make.top.equalToSuperview().offset(10);
                make.right.equalToSuperview().offset(right)
                make.height.equalTo(height/4);
                make.width.equalTo(120)
            }
            
            labelOne.snp.makeConstraints { (make) in
                make.top.equalToSuperview().offset(10);
                make.left.equalTo(imgViewLeft.snp.right).offset(8)
                make.right.equalTo(labelOneRight.snp.left).offset(-8)
                make.height.equalTo(height/4);
            }
        }
        
        labelTwoRight.snp.makeConstraints { (make) in
            make.top.equalTo(labelOne.snp.bottom).offset(0);
            make.left.right.height.equalTo(labelOneRight);
        }
        
        labelTwo.snp.makeConstraints { (make) in
            make.top.equalTo(labelOne.snp.bottom).offset(0);
            make.left.right.height.equalTo(labelOne);
        }
        
        labelThreeRight.snp.makeConstraints { (make) in
            make.top.equalTo(labelTwo.snp.bottom).offset(0);
            make.left.right.height.equalTo(labelOneRight);
        }
        
        labelThree.snp.makeConstraints { (make) in
            make.top.equalTo(labelTwo.snp.bottom).offset(0);
            make.left.right.height.equalTo(labelOne);
        }
        
        labelFour.snp.makeConstraints { (make) in
            make.top.equalTo(labelThree.snp.bottom).offset(0);
            make.left.equalTo(labelOne)
            make.right.equalTo(labelOneRight)
            make.bottom.equalToSuperview()
        }
                
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    // MARK: -funtions
    

    
    
}

