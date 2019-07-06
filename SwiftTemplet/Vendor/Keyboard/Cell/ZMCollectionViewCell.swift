//
//  ZMCollectionViewCell.swift
//  SwiftProject
//
//  Created by 牛新怀 on 2018/7/6.
//  Copyright © 2018年 牛新怀. All rights reserved.
//

import UIKit

//键盘CELL的代理
protocol KeyBoardCellDelegate: NSObjectProtocol {
    //CELL点击的代理
    func KeyBoardCellBtnClick(model: ZMKeyBoadModel)
}

class ZMCollectionViewCell: UICollectionViewCell {
    
    weak var delegate: KeyBoardCellDelegate?
    var cellModel: ZMKeyBoadModel! {
        didSet{
            if cellModel.isCapital! {
                keyBoardButton.setTitle(cellModel.keyBoadString, for: .normal)
            } else {
                keyBoardButton.setTitle(cellModel.keyBoadString?.lowercased(), for: .normal)
            }
            tipImageView.model = cellModel
        }
    }
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configUI() {
        contentView.addSubview(keyBoardButton)
    }
    
    lazy var keyBoardButton : UIButton = {
        let object = UIButton()
        //设置相关属性
        object.setTitleColor(UIColor.darkGray, for: .normal)
        object.titleLabel?.font = UIFont.init(name: "PingFangSC-Regular", size: 23)
        object.backgroundColor = UIColor.white
        
        //设置圆角
        object.layer.cornerRadius = 5
        object.layer.shadowOffset = CGSize.init(width: 0, height: 2)
        object.layer.shadowOpacity = 0.4
        object.layer.shadowRadius = 3
        object.layer.shadowColor = UIColor.hex("#888b8d").cgColor//#dfe1e6
        object.frame = self.contentView.bounds
        
        //设置事件
        object.addTarget(self, action: #selector(KeyboardBtnClick(button:)), for: .touchUpInside)
        object.addTarget(self, action: #selector(KeyboardBtnTouchDown(button:)), for: .touchDown)
        object.addTarget(self, action: #selector(KeyboardBtnTouchUpOutside(button:)), for: .touchUpOutside)
        return object
    }()

    lazy var tipImageView : KeyBoardTipImageView = {
        let object = KeyBoardTipImageView()
        return object
    }()
    
    override func willMove(toWindow newWindow: UIWindow?) {
        guard let window = newWindow else {
            return
        }
        window.addSubview(tipImageView)
        tipImageView.isHidden = true
    }

    
    
}

extension ZMCollectionViewCell {
    
    /// 按钮点击后手指松开
    ///
    /// - Parameter button: 按钮
    @objc private func KeyboardBtnClick(button:UIButton){
        //执行按钮点击事件
        delegate?.KeyBoardCellBtnClick(model: cellModel)
        
        //延时取消提示视图
        DispatchQueue.global().asyncAfter(deadline: DispatchTime.now() + 0.1) {
            DispatchQueue.main.sync {
                self.tipImageView.isHidden = true
            }
        }
    }
    
    /// 按钮按下时的事件，按下时显示提示视图
    ///
    /// - Parameter button: 按钮
    @objc private func KeyboardBtnTouchDown(button:UIButton){
        tipImageView.isHidden = false
        var btnCenter = button.center
        btnCenter.y = self.bounds.height
        let center = self.convert(btnCenter, to: self.window)
        
        tipImageView.center = center
    }
    
    /// 按钮按下后在按钮外松开事件，松开后隐藏提示视图
    ///
    /// - Parameter button: 按钮
    @objc private func KeyboardBtnTouchUpOutside(button:UIButton){
        tipImageView.isHidden = true
    }
    
    
}
