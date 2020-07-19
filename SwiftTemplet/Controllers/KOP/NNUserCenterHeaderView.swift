//
//	NNUserCenterHeaderView.swift
//	MacTemplet
//
//	Created by shang on 2020/07/17 15:27
//	Copyright © 2020 shang. All rights reserved.
//


import UIKit

import SnapKit
import SwiftExpand
        
///
class NNUserCenterHeaderView: UIImageView {
    
    typealias ViewClick = (NNUserCenterHeaderView, Int) -> Void;
    var viewBlock: ViewClick?;
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
//        backgroundColor = .systemBlue
        backgroundColor = .clear
        contentMode = .scaleToFill
        image = UIImage(named: "bg_blue")
        
        addSubview(userInfoView)
        addSubview(imgView)
        addSubview(imgViewArc)
        
        userInfoView.inset = UIEdgeInsetsMake(10, 15, 0, 15)
        imgViewArc.image = UIImage(named: "mask_radian")
        imgView.image = UIImage(named: "ad_user")
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        if bounds.height <= 10.0 {
            return;
        }
        
        userInfoView.snp.makeConstraints { (make) in
            make.top.equalToSuperview().offset(0);
            make.left.equalToSuperview().offset(0);
            make.right.equalToSuperview().offset(0);
            make.height.equalTo(70)
        }
        
        imgViewArc.snp.makeConstraints { (make) in
            make.left.equalToSuperview().offset(0);
            make.right.equalToSuperview().offset(0);
            make.bottom.equalToSuperview().offset(0);
            make.height.equalTo(20);
        }
        
        imgView.snp.makeConstraints { (make) in
            make.top.equalTo(userInfoView.snp.bottom).offset(0);
            make.left.equalTo(userInfoView).offset(userInfoView.inset.left);
            make.right.equalTo(userInfoView).offset(-userInfoView.inset.right);
            make.bottom.equalTo(imgViewArc.snp.top)
        }

    }
    
    // MARK: - funtions
    func block(_ action: @escaping ViewClick) {
        self.viewBlock = action;
    }
    
        
    //MARK: - lazy
    lazy var userInfoView: NNUserInfoView = {
        let view = NNUserInfoView(frame: .zero);
        return view;
    }();
    
    
    lazy var imgView: UIImageView = {
        var view = UIImageView(frame: .zero);
        view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        view.image = UIImage(named: "icon_avatar")
        
        return view;
    }()
    
    lazy var imgViewArc: UIImageView = {
        var view = UIImageView(frame: .zero);
        view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        view.image = UIImage(named: "icon_avatar")
        
        return view;
    }()
        
    lazy var btnSure: UIButton = {
        let view = UIButton(type: .custom);
        
        view.titleLabel?.font = UIFont.systemFont(ofSize: 16);
        view.setTitle(kTitleSure, for: .normal);
        view.setTitleColor(UIColor.theme, for: .normal);
        view.addActionHandler({ (control) in
            if let sender = control as? UIButton {
            }

        }, for: .touchUpInside)
        return view;
    }();
}
