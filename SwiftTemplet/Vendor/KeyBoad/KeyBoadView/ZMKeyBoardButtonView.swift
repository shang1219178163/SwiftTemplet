//
//  ZMKeyBoardButtonView.swift
//  SwiftProject
//
//  Created by 牛新怀 on 2018/7/6.
//  Copyright © 2018年 牛新怀. All rights reserved.
//

import UIKit

enum KeyBoardButtonStyle {
    case keyBoardCapitalButtonStyle // 大小写
    case keyBoardDeleteButtonStyle // 删除按钮
    case keyBoardChangedButtonStyle // 123切换
    case keyBoardKongButtonStyle // 空格
    case keyBoardConfirmButtonStyle // 完成按钮
}

protocol ZMKeyBoardButtonViewDelegate: NSObjectProtocol {
    func didSelectButtonClick(view: ZMKeyBoardButtonView, buttonStyle: KeyBoardButtonStyle, sender: UIButton)
}

class ZMKeyBoardButtonView: UIView {
    
    var style: KeyBoardButtonStyle!
    weak var delegate: ZMKeyBoardButtonViewDelegate?

    override init(frame: CGRect) {
        super.init(frame: frame)
        configUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    open func setTitle(_ title: String, state: UIControlState) {
        button.setTitle(title, for: state)
    }
    
    func setTitleColor(colorName: String, state: UIControlState) {
        button.setTitleColor(UIColor.hex(colorName), for: state)
    }
    
    open func setImage(imageNamed: String, state: UIControlState) {
        guard !imageNamed.isEmpty else {
            button.setImage(nil, for: state)
            return
        }
        button.setImage(UIImage.init(named: imageNamed), for: state)
    }
    
    open func setBackgroundImage(image: UIImage, state: UIControlState) {
        button.setBackgroundImage(image, for: state)
    }
    
    open func setBackgroundColor(color: UIColor) {
        button.backgroundColor = color
    }
    
    open func setTag(_ tag: Int) {
        button.tag = tag
    }
    
    func configUI() {
        addSubview(self.button)
    }
    
    lazy var button : UIButton = {
        let object = UIButton.init(type: .custom)
        object.frame = self.bounds
        //设置圆角
        object.layer.cornerRadius = 5
        object.layer.shadowOffset = CGSize.init(width: 0, height: 2)
        object.layer.shadowOpacity = 0.4
        object.layer.shadowRadius = 3
        object.layer.shadowColor = UIColor.hex("#888b8d").cgColor//#dfe1e6
        object.titleLabel?.font = UIFont.systemFont(ofSize: 14)
        object.addTarget(self, action: #selector(selectButton(sender:)), for: .touchUpInside)
        return object
    }()

    @objc func selectButton(sender: UIButton) {
        sender.isUserInteractionEnabled = false
        delegate?.didSelectButtonClick(view: self, buttonStyle: style, sender: sender)
        sender.isUserInteractionEnabled = true
    }
    
    
}
