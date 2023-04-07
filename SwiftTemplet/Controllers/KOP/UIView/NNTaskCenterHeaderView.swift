//
//  NNTaskCenterHeaderView.swift
//  SwiftTemplet
//
//  Created by Bin Shang on 2020/8/12.
//  Copyright © 2020 BN. All rights reserved.
//

import UIKit
import SnapKit
import SwiftExpand

@objc protocol NNTaskCenterHeaderViewDelegate{
    @objc func taskCenterHeaderView(_ view: NNTaskCenterHeaderView, sender: UIButton)
    
}
///
class NNTaskCenterHeaderView: UIImageView {
        
    weak var delegate: NNTaskCenterHeaderViewDelegate?

    var inset = UIEdgeInsets(top: 15, left: 12, bottom: 15, right: 12)

    var level = "0"{
        willSet{
            if newValue == "" {
                btnLevel.setTitle("Lv. --", for: .normal)
                return
            }
            btnLevel.setTitle("Lv.\(newValue)", for: .normal)
        }
    }
    
    var points = "0"{
        willSet{
            if newValue == "" {
                btnPoints.setTitle("积分: --", for: .normal)
                return
            }
            let result = newValue.intValue > 1000 ? "\(newValue.intValue/1000)K" : "\(newValue.intValue/1000)"
            btnPoints.setTitle("积分: \(result)", for: .normal)
        }
    }
    
    // MARK: -lifecycle
    override init(frame: CGRect) {
        super.init(frame: frame)
        
//        backgroundColor = .systemBlue
        isUserInteractionEnabled = true
        backgroundColor = .clear
        contentMode = .scaleToFill
        image = UIImage(named: "bg_gradient_blue")
        
        addSubview(imgView)
        addSubview(btn)
        addSubview(btnLevel)
        addSubview(btnPoints)
        
        btnLevel.titleLabel?.font = UIFont.systemFont(ofSize: 11)
        btnLevel.adjustsImageWhenHighlighted = true
        btnLevel.setBackgroundImage(UIImage(named: "bg_level"), for: .normal)
//        btnLevel.contentHorizontalAlignment = .right
        btnLevel.setTitleColor(UIColor.hexValue(0xFAC993), for: .normal);
        btnLevel.titleEdgeInsets = UIEdgeInsets(0, 15, 0, 0)

        btnPoints.titleLabel?.font = UIFont.systemFont(ofSize: 11)
        btnPoints.adjustsImageWhenHighlighted = true
        btnPoints.setBackgroundImage(UIImage(named: "bg_gradient_orange_1"), for: .normal)
        btnPoints.setTitleColor(UIColor.hexValue(0x814F0B), for: .normal);

        btn.setBackgroundImage(UIImage(named: "bg_point_exchange"), for: .normal)

        btnLevel.setTitle("Lv.10", for: .normal)
        btnPoints.setTitle("积分: 3.3K", for: .normal)
        
//        getViewLayer()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        if bounds.height <= 10 {
            return;
        }
        
        let height: CGFloat = bounds.height - inset.top - inset.bottom
        let btnHeight: CGFloat = 21

        imgView.snp.makeConstraints { (make) in
            make.top.equalToSuperview().offset(inset.top);
            make.left.equalToSuperview().offset(inset.left);
            make.bottom.equalToSuperview().offset(-inset.bottom);
            make.width.equalTo(height)
        }
        
        btnLevel.snp.makeConstraints { (make) in
            make.centerY.equalToSuperview().offset(-btnHeight*0.5)
            make.left.equalTo(imgView.snp.right).offset(10);
            make.width.equalTo(65);
            make.height.equalTo(btnHeight);
        }
        
        btnPoints.snp.makeConstraints { (make) in
            make.top.equalTo(btnLevel.snp.bottom).offset(5)
            make.left.equalTo(imgView.snp.right).offset(10);
            make.width.equalTo(65);
            make.height.equalTo(17);
        }
        
        btn.snp.makeConstraints { (make) in
            make.centerY.equalToSuperview().offset(inset.top - inset.bottom);
            make.right.equalToSuperview().offset(-inset.right);
            make.width.equalTo(90);
            make.height.equalTo(27);
        }
        
        imgView.layer.cornerRadius = imgView.bounds.height*0.5
        imgView.layer.masksToBounds = true

    }
    
    // MARK: - funtions
        
    //MARK: - lazy
    lazy var imgView: UIImageView = {
        var view = UIImageView(frame: .zero);
        view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        view.image = UIImage(named: "icon_avatar")
        
        view.layer.borderWidth = 2
        view.layer.borderColor = UIColor.white.cgColor
        return view;
    }()
    
    lazy var btnLevel: UIButton = {
        let view = UIButton(type: .custom);
        view.tag = 1;
        
        view.titleLabel?.font = UIFont.systemFont(ofSize: 16);
        view.setTitle(kTitleSure, for: .normal);
        view.setTitleColor(.systemBlue, for: .normal);
        view.addActionHandler({ (sender) in
            
//              self.delegate?.taskCenterHeaderView(self, sender: sender)

        }, for: .touchUpInside)
        return view;
    }();
    
    lazy var btnPoints: UIButton = {
        let view = UIButton(type: .custom);
        view.tag = 1;
        
        view.titleLabel?.font = UIFont.systemFont(ofSize: 16);
        view.setTitle(kTitleSure, for: .normal);
        view.setTitleColor(.systemBlue, for: .normal);
        view.addActionHandler({ (sender) in
            
//            self.delegate?.taskCenterHeaderView(self, sender: sender)

        }, for: .touchUpInside)
        return view;
    }();
    
    lazy var btn: UIButton = {
        let view = UIButton(type: .custom);
        view.tag = 1;
        
        view.titleLabel?.font = UIFont.systemFont(ofSize: 16);
//        view.setTitle(kTitleSure, for: .normal);
//        view.setTitleColor(.systemBlue, for: .normal);
        view.addActionHandler({ (sender) in                
            self.delegate?.taskCenterHeaderView(self, sender: sender)
        }, for: .touchUpInside)
        return view;
    }();
        
}
