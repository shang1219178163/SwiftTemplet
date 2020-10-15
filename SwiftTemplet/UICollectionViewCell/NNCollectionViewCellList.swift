//
//  NNCollectionViewCellList.swift
//  SwiftTemplet
//
//  Created by Bin Shang on 2020/6/17.
//  Copyright © 2020 BN. All rights reserved.
//

import UIKit
import SnapKit

@available(iOS 13.0, *)
class NNCollectionViewCellList: UICollectionViewCell {
    static let reuseIdentifier = String(describing: self)
    let accessoryImageView = UIImageView()
    let seperatorView = UIView()
    var inset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
    
    lazy var labelTitle: UILabel = {
        let label = UILabel()
        label.adjustsFontSizeToFitWidth = true
        label.adjustsFontForContentSizeCategory = true
        label.font = UIFont.preferredFont(forTextStyle: .body)

        return label
    }()
    
    lazy var labelDetail: UILabel = {
        let label = UILabel()
        label.adjustsFontForContentSizeCategory = true
        label.font = UIFont.preferredFont(forTextStyle: .body)

        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        contentView.addSubview(labelTitle)
        contentView.addSubview(labelDetail)
        contentView.addSubview(accessoryImageView)
        contentView.addSubview(seperatorView)

        seperatorView.backgroundColor = UIColor.lightGray.withAlphaComponent(0.3)
        
        accessoryImageView.image = UIImage(systemName: "chevron.right")
        accessoryImageView.tintColor = UIColor.lightGray.withAlphaComponent(0.7)
        
        labelDetail.isHidden = true
//        labelTitle.backgroundColor = .systemGreen
//        labelDetail.backgroundColor = .systemBlue
//        accessoryImageView.backgroundColor = .systemRed
    }
    
    required init?(coder: NSCoder) {
        fatalError("not implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        if bounds.height <= 10 {
            return
        }
        
        var labelRight: CGFloat = 10
        
        if accessoryImageView.isHidden == false {
            accessoryImageView.snp.makeConstraints { (make) in
                make.centerY.equalToSuperview().offset(inset.top - inset.bottom);
                make.width.equalTo(13)
                make.height.equalTo(20)
                make.right.equalToSuperview().offset(-10);
            }
            labelRight = 10 + 13 + 10
        }
        
        if labelDetail.isHidden == false {
            let heigth: CGFloat = (bounds.height - 25)/2
            labelTitle.snp.remakeConstraints { (make) in
                make.top.equalToSuperview().offset(10);
                make.left.equalToSuperview().offset(10);
                make.right.equalToSuperview().offset(-labelRight);
                make.height.equalTo(heigth)
            }
            
            labelDetail.snp.makeConstraints { (make) in
                make.top.equalTo(labelTitle.snp.bottom).offset(5);
                make.left.right.height.equalTo(labelTitle)
            }
        } else {
            labelTitle.snp.remakeConstraints { (make) in
                make.top.equalToSuperview().offset(10);
                make.left.equalToSuperview().offset(10);
                make.right.equalToSuperview().offset(-labelRight);
                make.bottom.equalToSuperview().offset(-10)
            }
        }
        
        seperatorView.snp.makeConstraints { (make) in
            make.left.equalToSuperview().offset(inset.left);
            make.right.equalToSuperview().offset(-inset.right);
            make.bottom.equalToSuperview().offset(0);
            make.height.equalTo(0.5);
        }
            
    }
}
