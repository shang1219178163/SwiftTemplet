//
//  UICollectionViewCellItem.swift
//  SwiftTemplet
//
//  Created by Bin Shang on 2021/9/3.
//  Copyright © 2021 BN. All rights reserved.
//

import UIKit
import SnapKit
import SwiftExpand


@objcMembers class UICollectionViewCellItem: UICollectionViewCell {
    
    /// 仅在只有图片或者文字时才起作用
    public var inset: UIEdgeInsets = .zero
    
    public var spacing: CGFloat = 8.0

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubview(labelTop)
        addSubview(imageView)
        addSubview(labelBottom)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        var imageViewY = inset.top
        var imageViewEndY = -inset.bottom

        if labelTop.isHidden == false {
            let labelTopSize = labelTop.sizeThatFits(bounds.size)
            labelTop.snp.remakeConstraints { (make) in
                make.top.equalToSuperview().offset(inset.top)
                make.left.equalToSuperview().offset(inset.left)
                make.right.equalToSuperview().offset(-inset.right)
                make.height.equalTo(labelTopSize.height)
            }
            
            imageViewY += labelTopSize.height
        }
        
        if labelBottom.isHidden == false {
            let labelBottomSize = labelBottom.sizeThatFits(bounds.size)
            labelBottom.snp.remakeConstraints { (make) in
                make.bottom.equalToSuperview().offset(inset.bottom)
                make.left.equalToSuperview().offset(inset.left)
                make.right.equalToSuperview().offset(-inset.right)
                make.height.equalTo(labelBottomSize.height)
            }
            
            imageViewEndY -= labelBottomSize.height
        }
        
        imageView.snp.remakeConstraints { (make) in
            make.top.equalToSuperview().offset(imageViewY)
            make.left.equalToSuperview().offset(inset.left)
            make.right.equalToSuperview().offset(-inset.right)
            make.bottom.equalToSuperview().offset(imageViewEndY)
        }
        
    }
    

    
    //MARK: -lazy
//    private(set) lazy var stackView: UIStackView = {
//        let view = UIStackView(frame: self.bounds)
//        view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
//
//        view.axis = .vertical
//        view.distribution = .fillProportionally
//        view.spacing = spacing
//        return view
//    }()
    
    private(set) lazy var imageView: UIImageView = {
        var view = UIImageView(frame: .zero);
        view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        view.image = UIImage(named: "icon_avatar")
        view.contentMode = .scaleAspectFit

        return view;
    }()
    
    private(set) lazy var labelTop: UILabel = {
        let view = UILabel(frame: .zero);
        view.text = "请选择";
        view.textColor = .lightGray;
        view.textAlignment = .center;
        return view
    }()
    
    private(set) lazy var labelBottom: UILabel = {
        let view = UILabel(frame: .zero);
        view.text = "请选择";
        view.textColor = .lightGray;
        view.textAlignment = .center;
        return view
    }()
}
