//
//	NNUserInfoView.swift
//	MacTemplet
//
//	Created by shang on 2020/07/17 15:27
//	Copyright © 2020 shang. All rights reserved.
//


import UIKit

import SnapKit
import SwiftExpand
        
///
class NNUserInfoView: UIView {

    var inset = UIEdgeInsets(top: 10, left: 15, bottom: 10, right: 15)
    
    var name = "-" {
        willSet{
            btnName.setTitle(newValue + kBlankOne, for: .normal)
            setNeedsLayout()
        }
    }
    
    var isMale = true {
        willSet{
            let imageName = newValue ? "icon_male" : "icon_female"
            btnName.setImage(UIImage(named: imageName), for: .normal)
        }
    }
    
    var level = "0"{
        willSet{
            btnLevel.setTitle(kBlankOne + "Lv.\(newValue)" + kBlankOne, for: .normal)
            setNeedsLayout()
        }
    }
    
    var points = "0"{
        willSet{
            if newValue == "" {
                btnPoints.setTitle("-- 积分", for: .normal)
                return
            }
            
            let result = newValue.cgFloatValue > 1000 ? "\(newValue.cgFloatValue/1000)K" : newValue
            btnPoints.setTitle("\(result)积分", for: .normal)
            setNeedsLayout()
        }
    }
    
    var couponNumber = "0"{
        willSet{
            btnCoupon.setTitle("卡券(\(newValue))", for: .normal)
            setNeedsLayout()
        }
    }
    
    typealias ViewClick = (NNUserInfoView) -> Void;
    var viewBlock: ViewClick?;
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
//        backgroundColor = .systemBlue
        backgroundColor = .clear
        
        addSubview(imgView)
        addSubview(btnName)
        addSubview(btnLevel)
        addSubview(btnPoints)
        addSubview(verLineView)
        addSubview(btnCoupon)
        
        btnName.setTitle("姓名", for: .normal)
        btnName.setTitleColor(.white, for: .normal)
        btnName.setImage(UIImage(named: "icon_male"), for: .normal)

        btnLevel.titleLabel?.font = UIFont.systemFont(ofSize: 11)
        btnLevel.adjustsImageWhenHighlighted = true
        btnLevel.setBackgroundImage(UIImage(named: "bg_level"), for: .normal)
        btnLevel.setTitleColor(UIColor.hexValue(0xFAC993), for: .normal);
        btnLevel.titleEdgeInsets = UIEdgeInsetsMake(0, 15, 0, 0)
            
        btnPoints.titleLabel?.font = UIFont.systemFont(ofSize: 11)
        btnPoints.adjustsImageWhenHighlighted = true
        btnPoints.setBackgroundImage(UIImage(named: "bg_gradient_orange_1"), for: .normal)
        btnPoints.setTitleColor(UIColor.hexValue(0x814F0B), for: .normal);
        
        btnCoupon.titleLabel?.font = UIFont.systemFont(ofSize: 11)
        btnCoupon.setImage(UIImage(named: "icon_coupon"), for: .normal)
//        btnCoupon.setTitle("卡券(12)", for: .normal)
        btnCoupon.setTitleColor(.white, for: .normal)
        btnCoupon.imageEdgeInsets = UIEdgeInsetsMake(3, -3, 3, 0)

//        name = "王小兰"
//        level = "30"
//        points = "12"
//        couponNumber = "12"
//        getViewLayer()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        if bounds.height <= 10.0 {
            return;
        }
        
        imgView.snp.makeConstraints { (make) in
            make.top.equalToSuperview().offset(inset.top);
            make.left.equalToSuperview().offset(inset.left);
            make.bottom.equalToSuperview().offset(-inset.bottom);
            make.width.equalTo(self.bounds.height - inset.top - inset.bottom)
        }
        
        let nameSize = btnName.sizeThatFits(.zero)
        btnName.snp.remakeConstraints { (make) in
            make.top.equalTo(imgView).offset(0);
            make.left.equalTo(imgView.snp.right).offset(10);
            make.height.equalTo(imgView.snp.height).multipliedBy(0.4);
            make.width.equalTo(nameSize.width);
        }
                
        btnLevel.snp.makeConstraints { (make) in
            make.top.equalTo(btnName.snp.bottom).offset(5);
            make.left.equalTo(imgView.snp.right).offset(10);
            make.width.equalTo(65);
            make.height.equalTo(21);
        }
        
        let btnPointsSize = btnPoints.sizeThatFits(.zero)
        btnPoints.snp.remakeConstraints { (make) in
            make.centerY.equalTo(btnLevel).offset(0);
            make.left.equalTo(btnLevel.snp.right).offset(8);
            make.width.equalTo(ceil(btnPointsSize.width));
            make.height.equalTo(17);
        }
                
        verLineView.snp.makeConstraints { (make) in
            make.top.equalTo(btnLevel).offset(0);
            make.left.equalTo(btnPoints.snp.right).offset(8);
            make.width.equalTo(1)
            make.height.equalTo(btnLevel)
        }
        
        let couponnSize = btnCoupon.sizeThatFits(.zero)
        btnCoupon.snp.remakeConstraints { (make) in
            make.top.equalTo(btnLevel).offset(0);
            make.left.equalTo(verLineView.snp.right).offset(8);
            make.width.equalTo(couponnSize.width)
            make.height.equalTo(btnLevel)
        }
        
        btnLevel.layer.cornerRadius = btnLevel.frame.height*0.5
        btnLevel.layer.masksToBounds = true
        
        imgView.layer.cornerRadius = imgView.bounds.height*0.5
        imgView.layer.masksToBounds = true
    }
    
    // MARK: - funtions
    func block(_ action: @escaping ViewClick) {
        self.viewBlock = action;
    }
    
        
    //MARK: - lazy
    
    lazy var imgView: UIImageView = {
        var view = UIImageView(frame: .zero);
        view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        view.image = UIImage(named: "icon_avatar")
        
        view.layer.borderWidth = 2
        view.layer.borderColor = UIColor.white.cgColor
        return view;
    }()
    
    lazy var verLineView: UIImageView = {
        var view = UIImageView(frame: .zero);
        view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        view.backgroundColor = .white
        return view;
    }()
    
    lazy var btnName: NNButton = {
        let view = NNButton(type: .custom);
        view.direction = .right
        view.titleLabel?.font = UIFont.systemFont(ofSize: 16);
        view.titleLabel?.adjustsFontSizeToFitWidth = true
        view.imageView?.contentMode = .center

        view.setTitle(kTitleSure, for: .normal);
        view.setTitleColor(UIColor.theme, for: .normal);
        view.addActionHandler({ (control) in
            DDLog(control)
            if let sender = control as? UIButton {

            }

        }, for: .touchUpInside)
        return view;
    }()
        
    lazy var btnLevel: UIButton = {
        let view = UIButton(type: .custom);
        view.titleLabel?.font = UIFont.systemFont(ofSize: 16);
        view.titleLabel?.adjustsFontSizeToFitWidth = true
        view.setTitle(kTitleSure, for: .normal);
        view.setTitleColor(UIColor.theme, for: .normal);
        view.addActionHandler({ (control) in
            DDLog(control)
            if let sender = control as? UIButton {

            }

        }, for: .touchUpInside)
        return view;
    }()
    
    lazy var btnPoints: UIButton = {
        let view = UIButton(type: .custom);
        view.titleLabel?.font = UIFont.systemFont(ofSize: 16);
        view.setTitle(kTitleSure, for: .normal);
        view.setTitleColor(.systemBlue, for: .normal);
        view.addActionHandler({ (control) in
            if let sender = control as? UIButton {
//                self.delegate?.taskCenterHeaderView(self, sender: sender)

            }

        }, for: .touchUpInside)
        return view;
    }()
    
    lazy var btnCoupon: UIButton = {
        let view = UIButton(type: .custom);
        view.titleLabel?.font = UIFont.systemFont(ofSize: 16);
        view.imageView?.contentMode = .scaleAspectFit

        view.setTitle(kTitleSure, for: .normal);
        view.setTitleColor(UIColor.theme, for: .normal);
        view.addActionHandler({ (control) in
            DDLog(control)
            if let sender = control as? UIButton {

            }

        }, for: .touchUpInside)
        return view;
    }()
}
