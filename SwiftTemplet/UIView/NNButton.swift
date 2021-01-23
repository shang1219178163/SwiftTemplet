//
//  NNButton.swift
//  SwiftTemplet
//
//  Created by Bin Shang on 2020/3/18.
//  Copyright © 2020 BN. All rights reserved.
//

import UIKit

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
    
    ///标签位置偏移
    var iconOffset: UIOffset = UIOffset.zero
    ///扩大响应区域 x 增加
    var eventInsetDX: CGFloat = 0
    ///扩大响应区域 y 增加
    var eventInsetDY: CGFloat = 0

    var iconSize: CGSize = CGSize(width: 60, height: 18)
    var labelHeight: CGFloat = 25

    var spacing: CGFloat = 3
    
    ///addObserver(self, forKeyPath: "selected", options: .new, context: nil)
    var observerBlock:((String?, NNButton?, [NSKeyValueChangeKey: Any]?)->Void)?
        
    private(set) lazy var iconBtn: UIButton = {
        let view = UIButton(type: .custom);
        view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        view.titleLabel?.adjustsFontSizeToFitWidth = true
        view.titleLabel?.font = UIFont.systemFont(ofSize: 12);
        return view
    }()
                
    private var borderColorDic = [UIControl.State.RawValue: UIColor]()
    private var borderWidthDic = [UIControl.State.RawValue: CGFloat]()
    private var cornerRadiusDic = [UIControl.State.RawValue: CGFloat]()
    

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
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
        
    override func layoutSubviews() {
        super.layoutSubviews()
        
        iconBtn.tag = tag
        if bounds.height <= 10 {
            return
        }
        
        switch direction {
        case .top:
            imageView!.frame = CGRect(x: 0,
                                      y: 0,
                                      width: bounds.width,
                                      height: bounds.height - labelHeight - spacing*0.5)
            titleLabel!.frame = CGRect(x: 0,
                                       y: imageView!.frame.maxY + spacing,
                                       width: bounds.width,
                                       height: labelHeight - spacing*0.5)
            
//        case .left:
//            imageView!.frame = CGRect(x: 0, y: 0, width: bounds.height, height: bounds.height)
//            titleLabel!.frame = CGRect(x: imageView!.frame.maxX, y: 0, width: bounds.width - imageView!.frame.width, height: bounds.height)
                
        case .bottom:
            titleLabel!.frame = CGRect(x: 0,
                                       y: 0,
                                       width: bounds.width,
                                       height: labelHeight - spacing*0.5)
            imageView!.frame = CGRect(x: 0,
                                      y: titleLabel!.frame.maxY + spacing,
                                      width: bounds.width,
                                      height: bounds.height - labelHeight - spacing*0.5)
                    
        case .right:
            imageView!.frame = CGRect(x: bounds.width - bounds.height,
                                      y: 0,
                                      width: bounds.height,
                                      height: bounds.height)
            titleLabel!.frame = CGRect(x: spacing,
                                       y: (bounds.height - labelHeight)*0.5,
                                       width: bounds.width - bounds.height - spacing*2,
                                       height: labelHeight)
            
        default:
            imageView!.frame = CGRect(x: 0,
                                      y: 0,
                                      width: bounds.height,
                                      height: bounds.height)
            titleLabel!.frame = CGRect(x: imageView!.frame.maxY + spacing,
                                       y: (bounds.height - labelHeight)*0.5,
                                       width: bounds.width - imageView!.frame.width - spacing*2,
                                       height: labelHeight)
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
        
        var inconRect = iconBtn.frame
        inconRect.origin.x += iconOffset.horizontal
        inconRect.origin.y += iconOffset.vertical
        iconBtn.frame = inconRect
        //
        if currentImage == nil || imageView!.isHidden{
            titleLabel!.frame = bounds
        } else if currentTitle == nil || titleLabel!.isHidden {
            imageView!.frame = bounds
        }
        
        let invalid = iconBtn.currentImage == nil && iconBtn.currentTitle == nil && iconBtn.backgroundImage(for: .normal) == nil
        if iconBtn.isHidden == false &&  invalid {
            iconBtn.isHidden = true
        }
    }
    
    override func point(inside point: CGPoint, with event: UIEvent?) -> Bool {
        let eventBounds = bounds.insetBy(dx: -eventInsetDX, dy: -eventInsetDY)
        return eventBounds.contains(point)
    }
}
