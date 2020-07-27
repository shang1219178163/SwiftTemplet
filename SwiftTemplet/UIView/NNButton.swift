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
    var direction: UIView.Direction = .left{
        willSet{
            setNeedsLayout()
        }
    }
    var iconLocation: UIView.Location = .rightTop{
        willSet{
            setNeedsLayout()
        }
    }
    
    var iconSize: CGSize = CGSize(width: 60, height: 18)
    var labelHeight: CGFloat = 25

    lazy var iconBtn: UIButton = {
        let view = UIButton(type: .custom);
        view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        view.titleLabel?.adjustsFontSizeToFitWidth = true
        view.titleLabel?.font = UIFont.systemFont(ofSize: 12);
        return view
    }()
        
    // MARK: -lifecycle
            
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubview(iconBtn)
                
        let normlTextColor: UIColor = UIColor.black.withAlphaComponent(0.3)
        let seletedTextColor: UIColor = UIColor.systemBlue
        setTitleColor(normlTextColor, for: .normal)
        setTitleColor(seletedTextColor, for: .selected)
        
        titleLabel?.textAlignment = .center
        titleLabel?.adjustsFontSizeToFitWidth = true

        imageView?.tintColor = UIColor.theme
        imageView?.contentMode = .scaleAspectFit
        adjustsImageWhenHighlighted = false
//        titleLabel?.isUserInteractionEnabled = true
//        imageView?.isUserInteractionEnabled = true
        
        iconBtn.tag = tag
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
            
        case .left:
            imageView!.frame = CGRect(x: 0, y: 0, width: bounds.height, height: bounds.height)
            titleLabel!.frame = CGRect(x: imageView!.frame.maxX, y: 0, width: bounds.width - imageView!.frame.width, height: bounds.height)
                
        case .bottom:
            titleLabel!.frame = CGRect(x: 0, y: 0, width: bounds.width, height: labelHeight)
            imageView!.frame = CGRect(x: 0, y: titleLabel!.frame.maxY, width: bounds.width, height: bounds.height - labelHeight)
                    
        case .right:
            imageView!.frame = CGRect(x: bounds.width - bounds.height, y: 0, width: bounds.height, height: bounds.height)
            titleLabel!.frame = CGRect(x: 0, y: 0, width: bounds.width - bounds.height, height: bounds.height)
            
        default:
            break
        }
        
        switch iconLocation {
        case .leftTop:
            iconBtn.frame = CGRect(x: 0, y: 0, width: iconSize.width, height: iconSize.height)

        case .leftBottom:
            iconBtn.frame = CGRect(x: 0, y: bounds.height - iconSize.height, width: iconSize.width, height: iconSize.height)

        case .rightTop:
            iconBtn.frame = CGRect(x: bounds.width - iconSize.width, y: 0, width: iconSize.width, height: iconSize.height)

        case .rightBottom:
            iconBtn.frame = CGRect(x: bounds.width - iconSize.width, y: bounds.height - iconSize.height, width: iconSize.width, height: iconSize.height)
        default:
            iconBtn.isHidden = true
            break
        }
        
        //
        if currentImage == nil {
            titleLabel!.frame = bounds
        } else if currentTitle == nil {
            imageView!.frame = bounds
        }
        
        let invalid = iconBtn.currentImage == nil && iconBtn.currentTitle == nil && iconBtn.backgroundImage(for: .normal) == nil
        if iconBtn.isHidden == false &&  invalid {
            iconBtn.isHidden = true
        }
    }
}
