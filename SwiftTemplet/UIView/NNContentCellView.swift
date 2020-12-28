//
//  BNTableViewCellView.swift
//  SwiftTemplet
//
//  Created by Bin Shang on 2019/1/17.
//  Copyright © 2019 BN. All rights reserved.
//

import UIKit
import SnapKit

import SwiftExpand


/// 图片+文字+文字+图片
class NNContentCellView: UIImageView {
    var cellStyle: UITableViewCell.CellStyle = .default

    var inset = UIEdgeInsets(top: 10, left: 15, bottom: 10, right: 15)

    var imageSize: CGSize = CGSize(width: 40, height: 40)

    var btnSize = CGSize(width: 8, height: 13)
    
    var lineSpacing: CGFloat = 5
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = .clear
        addSubview(imageView);
        addSubview(textLabel);
        addSubview(detailTextLabel);
        addSubview(btn)

        textLabel.textColor = .textColor3
        detailTextLabel.textColor = .textColor3

        detailTextLabel.numberOfLines = 1;
        textLabel.numberOfLines = 1;
        btn.setTitle(">", for: .normal)
        btn.setTitleColor(.gray, for: .normal)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        setupConstraint()
    }
    
    func setupConstraint() {
        if bounds.height < 10 {
            return
        }
        
        let height = bounds.height - inset.top - inset.bottom
        let labStartX = imageView.isHidden ? inset.left : height + inset.left + kPadding
        let labEndX = btn.isHidden == false ? btnSize.width + inset.right + kPadding : inset.right

        if btn.isHidden == false {
            btn.snp.makeConstraints { (make) in
                make.centerY.equalToSuperview()
                make.right.equalToSuperview().offset(-inset.right);
                make.size.equalTo(btnSize);
            }
        }
        
        if imageView.isHidden == false {
            imageView.snp.makeConstraints { (make) in
                make.top.equalToSuperview().offset(inset.top);
                make.left.equalToSuperview().offset(inset.left);
                make.width.height.equalTo(height);
            }
        }

        switch cellStyle {
        case .subtitle:
            detailTextLabel.textAlignment = .left;

            textLabel.snp.remakeConstraints { (make) in
                make.top.equalToSuperview().offset(inset.top)
                make.left.equalToSuperview().offset(labStartX)
                make.right.equalToSuperview().offset(-labEndX)
                make.height.equalTo((height - lineSpacing)/2.0)
            }

            detailTextLabel.snp.remakeConstraints { (make) in
                make.top.equalTo(textLabel.snp.bottom).offset(lineSpacing)
                make.left.equalToSuperview().offset(labStartX)
                make.right.equalToSuperview().offset(-labEndX)
                make.height.equalTo(textLabel)
            }

        case .value1:
            let size = detailTextLabel.sizeThatFits(.zero)
            detailTextLabel.snp.remakeConstraints { (make) in
                make.centerY.equalToSuperview()
                make.right.equalToSuperview().offset(-labEndX)
                make.width.lessThanOrEqualTo(size.width)
                make.height.equalTo(height)
            }
            
            textLabel.snp.remakeConstraints { (make) in
                make.centerY.equalToSuperview()
                make.left.equalToSuperview().offset(labStartX)
                make.right.equalTo(detailTextLabel.snp.left).offset(-kPadding)
                make.height.equalTo(height)
            }
            
        default:
            textLabel.snp.remakeConstraints { (make) in
                make.centerY.equalToSuperview()
                make.left.equalToSuperview().offset(labStartX)
                make.right.equalToSuperview().offset(-labEndX)
                make.height.equalTo(height)
            }
            
            detailTextLabel.snp.remakeConstraints { (make) in
                make.centerY.equalToSuperview()
                make.right.equalToSuperview().offset(-labEndX)
                make.width.height.equalTo(0)
            }
        }
    }
  
    
    //MARK: -lazy
    
    lazy var imageView: UIImageView = {
        var view = UIImageView(frame: .zero);
        view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        view.isUserInteractionEnabled = true;
        view.contentMode = .scaleAspectFit;
        
        return view;
    }()
    
    lazy var btn: UIButton = {
        let view = UIButton(type: .custom);
        view.tag = 1;
        
        view.titleLabel?.font = UIFont.systemFont(ofSize: 16);
//        view.setTitle(kTitleSure, for: .normal);
//        view.setTitleColor(.systemBlue, for: .normal);
        view.addActionHandler({ (sender) in
            DDLog(sender)

        }, for: .touchUpInside)
        return view;
    }();
    
    lazy var textLabel: UILabel = {
        let view = UILabel(frame: .zero);
        view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        view.font = UIFont.systemFont(ofSize: 14);

        view.textAlignment = .left;
        view.numberOfLines = 0;
        view.lineBreakMode = .byTruncatingTail;
        view.isUserInteractionEnabled = true;
  
        return view;
    }()
    
    lazy var detailTextLabel: UILabel = {
        let view = UILabel(frame: .zero);
        view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        view.font = UIFont.systemFont(ofSize: 12);

        view.textAlignment = .right;
        view.numberOfLines = 0;
        view.lineBreakMode = .byTruncatingTail;
        view.isUserInteractionEnabled = true;
    
        return view;
    }()
    
}
