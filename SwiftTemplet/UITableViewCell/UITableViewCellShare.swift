//
//  UITableViewCellShare.swift
//  SwiftTemplet
//
//  Created by Bin Shang on 2020/9/2.
//  Copyright © 2020 BN. All rights reserved.
//

import UIKit


@objcMembers class UITableViewCellShare: UITableViewCell {

    var inset = UIEdgeInsets(top: 10, left: 15, bottom: 10, right: 15)
    var imagSize = CGSize(width: 43, height: 32)
    
    lazy var imgView: UIImageView = {
        let view = UIImageView(frame: .zero);
        view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        view.backgroundColor = .clear
        view.contentMode = .scaleAspectFit
        view.isUserInteractionEnabled = true
        
        return view;
    }()
    
    lazy var label: UILabel = {
        let view = UILabel(frame: .zero);
        view.font = UIFont.systemFont(ofSize: 13)
        view.text = "--";
        view.textColor = .lightGray;
        view.textAlignment = .left;
        return view;
    }()
    
    lazy var labelDetail: UILabel = {
        let view = UILabel(frame: .zero);
        view.font = UIFont.systemFont(ofSize: 13)
        view.text = "--";
        view.textColor = .lightGray;
        view.textAlignment = .left;
        return view;
    }()
    // MARK: -life cycle

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier);
                
        contentView.addSubview(imgView)
        contentView.addSubview(label)
        contentView.addSubview(labelDetail)

        label.text = "-"
        labelDetail.text = "-"
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder);
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        if bounds.height <= 10 {
            return
        }
        let labelStartX: CGFloat = imgView.isHidden == false ? inset.left + imagSize.width + 10 : inset.left
        let labelEndX: CGFloat = -10 - inset.right
        let labelHeight: CGFloat = (self.bounds.height - inset.top - inset.bottom - 5)*0.5
        
        if imgView.isHidden == false {
            imgView.snp.makeConstraints { (make) in
                make.centerY.equalToSuperview().offset(inset.top - inset.bottom);
                make.left.equalToSuperview().offset(inset.left);
                make.size.equalTo(imagSize);
            }
        }
                
        if labelDetail.isHidden == false {
            label.snp.remakeConstraints { (make) in
                make.top.equalToSuperview().offset(inset.top);
                make.left.equalToSuperview().offset(labelStartX);
                make.right.equalToSuperview().offset(labelEndX);
                make.height.equalTo(labelHeight)
            }
            
            labelDetail.snp.makeConstraints { (make) in
                make.top.equalTo(label.snp.bottom).offset(5)
                make.left.right.equalTo(label)
                make.height.equalTo(labelHeight)
            }
        } else {
            label.snp.remakeConstraints { (make) in
                make.top.equalToSuperview().offset(inset.top);
                make.left.equalToSuperview().offset(labelStartX);
                make.right.equalToSuperview().offset(labelEndX);
                make.bottom.equalToSuperview().offset(-inset.bottom);
            }
        }
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    // MARK: -funtions

}




