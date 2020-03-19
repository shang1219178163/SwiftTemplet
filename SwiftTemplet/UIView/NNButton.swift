//
//  NNButton.swift
//  SwiftTemplet
//
//  Created by Bin Shang on 2020/3/18.
//  Copyright © 2020 BN. All rights reserved.
//

import UIKit
import SwiftExpand

/// 自定义图像方向按钮
@objcMembers class NNButton: UIButton {
    ///图像位置上左下右
    var direction: UIView.Direction = .left
    var iconLocation: UIView.Location = .rightTop

    var iconSize: CGSize = CGSize(width: 25, height: 14)
    var labelHeight: CGFloat = 25

    lazy var iconImageView: UIImageView = {
        let view = UIImageView(frame: CGRect.zero);
        view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        view.isUserInteractionEnabled = true;
        view.contentMode = .scaleAspectFit;
//        view.image = UIImage(named: "icon_discount_orange");
        return view
    }()
            
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubview(iconImageView)
                
        let normlTextColor: UIColor = UIColor.black.withAlphaComponent(0.3)
        let seletedTextColor: UIColor = UIColor.theme
        setTitleColor(normlTextColor, for: .normal)
        setTitleColor(seletedTextColor, for: .selected)
        
        titleLabel?.textAlignment = .center
        titleLabel?.adjustsFontSizeToFitWidth = true

        imageView?.tintColor = UIColor.theme
        imageView?.contentMode = .scaleAspectFit
        adjustsImageWhenHighlighted = false
//        titleLabel?.isUserInteractionEnabled = true
//        imageView?.isUserInteractionEnabled = true
        getViewLayer()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
        
    override func layoutSubviews() {
        super.layoutSubviews()
        
        if bounds.height <= 0 {
            return
        }
        
        switch direction {
        case .top:
            imageView!.frame = CGRect(x: 0, y: 0, width: bounds.width, height: bounds.height - labelHeight)
            titleLabel!.frame = CGRect(x: 0, y: imageView!.frame.maxY, width: bounds.width, height: labelHeight)
            
//        case .left:
//            imageView!.frame = CGRect(x: 0, y: 0, width: bounds.height, height: bounds.height)
//            titleLabel!.frame = CGRect(x: imageView!.frame.maxX, y: 0, width: bounds.width - imageView!.frame.width, height: bounds.height)
                
        case .bottom:
            titleLabel!.frame = CGRect(x: 0, y: 0, width: bounds.width, height: labelHeight)
            imageView!.frame = CGRect(x: 0, y: titleLabel!.frame.maxY, width: bounds.width, height: bounds.height - labelHeight)
                    
        case .right:
            imageView!.frame = CGRect(x: bounds.width - bounds.height, y: 0, width: bounds.height, height: bounds.height)
            titleLabel!.frame = CGRect(x: 0, y: 0, width: bounds.width - bounds.height, height: bounds.height)
            
        default:
            imageView!.frame = CGRect(x: 0, y: 0, width: bounds.height, height: bounds.height)
            titleLabel!.frame = CGRect(x: imageView!.frame.maxX, y: 0, width: bounds.width - imageView!.frame.width, height: bounds.height)
            break
        }
        
        switch iconLocation {
        case .leftTop:
            iconImageView.frame = CGRect(x: 0, y: 0, width: iconSize.width, height: iconSize.height)

        case .leftBottom:
            iconImageView.frame = CGRect(x: 0, y: bounds.height - iconSize.height, width: iconSize.width, height: iconSize.height)

//        case .rightTop:
//            iconImageView.frame = CGRect(x: bounds.width - iconSize.width, y: 0, width: iconSize.width, height: iconSize.height)

        case .rightBottom:
            iconImageView.frame = CGRect(x: bounds.width - iconSize.width, y: bounds.height - iconSize.height, width: iconSize.width, height: iconSize.height)
        default:
            iconImageView.frame = CGRect(x: bounds.width - iconSize.width, y: 0, width: iconSize.width, height: iconSize.height)
            break
        }
        
        //
        if currentImage == nil {
            titleLabel!.frame = bounds
        } else if currentTitle == nil {
            imageView!.frame = bounds
        }
        
        if iconImageView.image == nil {
            iconImageView.isHidden = true
        }
    }
}
