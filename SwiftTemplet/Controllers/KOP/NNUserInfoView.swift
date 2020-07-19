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
        addSubview(padView)
        addSubview(btnStar)
        addSubview(verLineView)
        addSubview(btnCoupon)

        
        btnName.setTitle("姓名", for: .normal)
        btnName.setTitleColor(.white, for: .normal)
        btnName.setImage(UIImage(named: "icon_male"), for: .normal)

        btnStar.setImage(UIImage(named: "icon_star"), for: .normal)

        btnLevel.titleLabel?.font = UIFont.systemFont(ofSize: 13)
        btnLevel.setBackgroundImage(UIImage(color: UIColor.hexValue(0x292B2F)), for: .normal)
//        btnLevel.setTitle("Lv.30", for: .normal)
        
        btnCoupon.titleLabel?.font = UIFont.systemFont(ofSize: 13)
        btnCoupon.setImage(UIImage(named: "icon_coupon"), for: .normal)
//        btnCoupon.setTitle("卡券(12)", for: .normal)
        btnCoupon.setTitleColor(.white, for: .normal)
        btnCoupon.imageView!.transform = btnCoupon.imageView!.transform.scaledBy(x: 0.6, y: 0.6)
        
        name = "王小兰"
        level = "30"
        couponNumber = "12"
//        padView.isHidden = true
        getViewLayer()
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
        btnName.snp.makeConstraints { (make) in
            make.top.equalTo(imgView).offset(0);
            make.left.equalTo(imgView.snp.right).offset(10);
            make.height.equalTo(imgView.snp.height).multipliedBy(0.4);
            make.width.equalTo(nameSize.width);
        }
        
        btnStar.snp.makeConstraints { (make) in
            make.top.equalTo(btnName.snp.bottom).offset(5);
            make.left.equalTo(btnName).offset(0);
            make.width.height.equalTo(30);
        }
          
        let levelSize = btnLevel.sizeThatFits(.zero)
        btnLevel.snp.makeConstraints { (make) in
            make.centerY.equalTo(btnStar).offset(0);
            make.left.equalTo(btnStar.snp.right).offset(0);
            make.width.equalTo(levelSize.width)
            make.height.equalTo(btnName)
        }
        
        padView.snp.makeConstraints { (make) in
            make.centerY.equalTo(btnStar)
            make.left.equalTo(btnName).offset(15);
            make.width.equalTo(btnStar);
            make.height.equalTo(btnLevel);
        }
        
        verLineView.snp.makeConstraints { (make) in
            make.top.equalTo(btnLevel).offset(0);
            make.left.equalTo(btnLevel.snp.right).offset(10);
            make.width.equalTo(1)
            make.height.equalTo(btnLevel)
        }
        
        let couponnSize = btnCoupon.sizeThatFits(.zero)
        btnCoupon.snp.makeConstraints { (make) in
            make.top.equalTo(btnLevel).offset(0);
            make.left.equalTo(verLineView.snp.right).offset(10);
            make.width.equalTo(couponnSize.width)
            make.height.equalTo(btnLevel)
        }
        
        btnLevel.layer.cornerRadius = btnLevel.frame.height*0.5
        btnLevel.layer.masksToBounds = true
        
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
        view.layer.cornerRadius = view.frame.height*0.5
        view.layer.masksToBounds = true
        return view;
    }()
    
    lazy var verLineView: UIImageView = {
        var view = UIImageView(frame: .zero);
        view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        view.backgroundColor = .white
        return view;
    }()
    
    lazy var padView: UIImageView = {
        var view = UIImageView(frame: .zero);
        view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        view.backgroundColor = UIColor.hexValue(0x292B2F)
        return view;
    }()
    
//    lazy var label: UILabel = {
//        let view = UILabel(frame: .zero);
//        view.text = "请选择";
//        view.textColor = UIColor.gray;
//        view.textAlignment = .center;
//        return view;
//    }();
    
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
    
    lazy var btnStar: UIButton = {
        let view = UIButton(type: .custom);
        view.titleLabel?.font = UIFont.systemFont(ofSize: 16);
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
