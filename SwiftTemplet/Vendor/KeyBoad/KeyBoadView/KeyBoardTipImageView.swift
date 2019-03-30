//
//  KeyBoardTipImageView.swift
//  SwiftProject
//
//  Created by 牛新怀 on 2018/7/6.
//  Copyright © 2018年 牛新怀. All rights reserved.
//

import UIKit

class KeyBoardTipImageView: UIImageView {
    
    var model: ZMKeyBoadModel! {
        didSet{
            if !model.isCapital! {
                tipButton.setTitle(model.keyBoadString?.lowercased(), for: .normal)
            } else {
                tipButton.setTitle(model.keyBoadString, for: .normal)
            }
        }
    }

    init() {
        let image = UIImage.init(named: "keyboard_magnifier")
        super.init(image: image)
        layer.anchorPoint = CGPoint.init(x: 0.5, y: 1)
        addSubview(tipButton)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configUI() {
        
    }
    
    lazy var tipButton : UIButton = {
        let object = UIButton()
        //设置按钮的锚点
        object.layer.anchorPoint =  CGPoint(x: 0.5, y: 0);
        object.frame = CGRect(x: 0, y: 8, width: 36, height: 36)
        object.center.x = self.bounds.width * 0.5
        
        //设置字体和属性
        object.titleLabel?.font = UIFont.systemFont(ofSize: 32)
        object.setTitleColor(UIColor.darkGray, for: .normal)
        return object
    }()

    
    
}
