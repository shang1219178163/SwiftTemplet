//
//  UITableViewCellFee.swift
//  SwiftTemplet
//
//  Created by Bin Shang on 2019/11/18.
//  Copyright © 2019 BN. All rights reserved.
//

import UIKit

import SnapKit
import SwiftExpand

/// 车场记录费用列表
class UITableViewCellFee: UITableViewCell {
    /// 显示正数
    var isPositive = true;
    
    var inset = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
    // MARK: -life cycle

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier);
  
        contentView.addSubview(labelTop);
        contentView.addSubview(labelRight);
        contentView.addSubview(labelMid);
        contentView.addSubview(labelBom);
        
        labelTop.textColor = .textColor3;
        labelTop.textAlignment = .left;
        labelTop.text = kNilText;
        
        labelRight.textAlignment = .right
        labelRight.text = kNilText;

        labelMid.numberOfLines = 1;
        labelMid.textColor = .textColor6
        labelMid.font = UIFont.systemFont(ofSize: 13)
        labelMid.text = kNilText;

        labelBom.numberOfLines = 1;
        labelBom.textColor = .textColor6
        labelBom.font = UIFont.systemFont(ofSize: 13)
        labelBom.text = kNilText;

        labelRight.addObserver(self, forKeyPath: "text", options: .new, context: nil)
    }
    
    override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
        if keyPath == "text" {
            //标题星号处理
//            labelRight.attributedText = labelRight.text?.toAsterisk()
            if labelRight.text!.contains(":") == false {
                return;
            }
            
            let index = (labelRight.text! as NSString).range(of: ":").location
            let tapText = (labelRight.text! as NSString).substring(from: index + 1)
//            labelRight.attributedText = NSAttributedString.attString(text, textTaps: [tapText])
            
            let tapColor = isPositive == true ? UIColor.theme : UIColor.red.withAlphaComponent(0.5)
            labelRight.attributedText = NSAttributedString.attString(labelRight.text!, textTaps: [tapText], tapColor: tapColor, alignment: labelRight.textAlignment)

        }
        else {
            super.observeValue(forKeyPath: keyPath, of: object, change: change, context: context)
        }
    }
    
    
    deinit {
        labelRight.removeObserver(self, forKeyPath: "text")
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
        
        labelRight.sizeToFit();
        labelRight.snp.makeConstraints { (make) in
            make.top.equalToSuperview().offset(inset.top);
            make.right.equalToSuperview().offset(-inset.right)
        }
        
        labelTop.snp.makeConstraints { (make) in
            make.centerY.equalTo(labelRight)
            make.left.equalToSuperview().offset(inset.left)
            make.right.equalTo(labelRight.snp.left).offset(-kPadding)
            make.height.equalTo(labelRight)
        }
                
        labelMid.snp.makeConstraints { (make) in
            make.top.equalTo(labelTop.snp.bottom).offset(5);
            make.left.equalTo(labelTop);
            make.right.equalTo(labelRight);
            make.height.equalTo(20);
        }
        
        labelBom.snp.makeConstraints { (make) in
            make.top.equalTo(labelMid.snp.bottom).offset(5);
            make.left.equalTo(labelTop);
            make.right.equalTo(labelRight);
            make.height.equalTo(20);
        }
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    // MARK: -funtions

    
    // MARK: -lazy
    lazy var labelTop: UILabel = {
        var view = UILabel(frame: .zero);
        view.text = "top";
        view.textColor = UIColor.black;
        view.font = UIFont.systemFont(ofSize: 15)
        
        return view;
    }();
    
    lazy var labelMid: UILabel = {
        var view = UILabel(frame: .zero);
        view.text = "midem";
        view.textColor = UIColor.hexValue(0x666666)
        view.font = UIFont.systemFont(ofSize: 11)
        
        return view;
    }();
    
    lazy var labelBom: UILabel = {
        var view = UILabel(frame: .zero);
        view.text = "bottom";
        view.textColor = UIColor.hexValue(0x666666)
        view.font = UIFont.systemFont(ofSize: 11)
        
        return view;
    }();
    
    
    private lazy var couponTypeDic: [Int : [String : Any]] = {
        let dic = [0: ["title": "时长券", "color": UIColor.hexValue(0xF78F57),],
                   1: ["title": "金额券", "color": UIColor.theme,],
                   2: ["title": "次数券", "color": UIColor.hexValue(0x39C179),],
                   3: ["title": "时段券", "color": UIColor.hexValue(0xFF6A62),],
                   4: ["title": "折扣券", "color": UIColor.hexValue(0x04BCC9),],
        ]
        return dic;
    }()
}

