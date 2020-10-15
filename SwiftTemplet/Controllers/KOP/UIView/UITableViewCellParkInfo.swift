//
//  UITableViewCellParkInfo.swift
//  SwiftTemplet
//
//  Created by Bin Shang on 2020/7/24.
//  Copyright © 2020 BN. All rights reserved.
//

import UIKit
import SwiftExpand

class UITableViewCellParkInfo: UITableViewCell {

    var inset = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
    var spacing: CGFloat = 15
    
    // MARK: -lazy
    
    lazy var labelInfo: UILabel = {
        var view = UILabel(frame: .zero);
        view.text = "距您430米";
        view.textColor = UIColor.textColor3
        view.textAlignment = .left
        view.font = UIFont.systemFont(ofSize: 11)
        view.numberOfLines = 1;

        return view
    }()
        
    lazy var btnOne: UIButton = {
        let view = UIButton(type: .custom);
        view.titleLabel?.font = UIFont.systemFont(ofSize: 16);
        view.setTitle("电子支付", for: .normal);
        view.setTitleColor(UIColor.textColor6, for: .normal);
        view.addActionHandler({ (control) in
            guard let sender = control as? UIButton else { return }
            DDLog(sender.currentTitle ?? "无标题")

        }, for: .touchUpInside)
        
        view.titleLabel?.adjustsFontSizeToFitWidth = true
        view.contentVerticalAlignment = .center

        view.layer.borderWidth = 0.5
        view.layer.borderColor = UIColor.textColor6.cgColor
        return view
    }()
    
    lazy var btnTwo: UIButton = {
        let view = UIButton(type: .custom);
        view.titleLabel?.font = UIFont.systemFont(ofSize: 16);
        view.setTitle("现金支付", for: .normal);
        view.setTitleColor(.textColor6, for: .normal);
        view.addActionHandler({ (control) in
            guard let sender = control as? UIButton else { return }
            DDLog(sender.currentTitle ?? "无标题")

        }, for: .touchUpInside)
        view.titleLabel?.adjustsFontSizeToFitWidth = true
        view.contentVerticalAlignment = .center
        
        view.layer.borderWidth = 0.5
        view.layer.borderColor = UIColor.textColor6.cgColor
        return view;
    }()
    
    lazy var lineView: UIImageView = {
        var view = UIImageView(frame: .zero);
        view.backgroundColor = .line
        return view
    }()
    
    // MARK: -life cycle
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier);
  
        contentView.addSubview(btnOne)
        contentView.addSubview(btnTwo)
        contentView.addSubview(lineView)
        contentView.addSubview(labelInfo)
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
        let tailSpacing: CGFloat = accessoryType == .none ? inset.right : 0.0
        
        let list = [btnOne, btnTwo,].filter { $0.isHidden == false }
        let itemWidth: CGFloat = 50
        let itemHeight: CGFloat = height
        let padding: CGFloat = 10

        for e in list.enumerated() {
            let x = CGFloat(e.offset) * (itemWidth + padding) + inset.left
            let y = inset.top
            let rect = CGRect(x: x, y: y, width: itemWidth, height: itemHeight)
            
            e.element.frame = rect
            e.element.contentVerticalAlignment = .center
        }
        
        lineView.snp.makeConstraints { (make) in
            make.centerY.equalToSuperview()
            make.left.equalTo(list.last!.snp.right).offset(padding);
            make.width.equalTo(1);
            make.height.equalTo(list.last!);
        }
        
        let labelInfoSize = labelInfo.sizeThatFits(.zero)
        labelInfo.snp.remakeConstraints { (make) in
            make.centerY.equalToSuperview()
            make.left.equalTo(lineView.snp.right).offset(padding);
            make.width.equalTo(labelInfoSize.width + 5);
            make.height.equalTo(height);
        }
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    // MARK: -funtions
    

    
    
}

