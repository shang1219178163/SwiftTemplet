//
//    NNUserCenterHeaderView.swift
//    MacTemplet
//
//    Created by shang on 2020/07/17 15:27
//    Copyright © 2020 shang. All rights reserved.
//


import UIKit

import SnapKit

        
///
class NNUserCenterHeaderView: UIImageView {
    
    typealias ViewClick = (NNUserCenterHeaderView, Int) -> Void;
    var viewBlock: ViewClick?;
    
    var inset = UIEdgeInsets(top: UIScreen.navBarHeight, left: 15, bottom: 0, right: 15)

    override init(frame: CGRect) {
        super.init(frame: frame)
        
//        backgroundColor = .systemBlue
        isUserInteractionEnabled = true
        backgroundColor = .clear
        contentMode = .scaleToFill
        image = UIImage(named: "bg_blue")
        
        addSubview(userInfoView)
        addSubview(imgView)
        addSubview(imgViewArc)
        
//        userInfoView.inset = UIEdgeInsets(10, 15, 0, 15)
        imgViewArc.image = UIImage(named: "mask_radian")
        imgView.image = UIImage(named: "ad_user")
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        if bounds.height <= 10 {
            return;
        }
        
        userInfoView.snp.makeConstraints { (make) in
            make.top.equalToSuperview().offset(inset.top);
            make.left.equalToSuperview().offset(inset.left);
            make.right.equalToSuperview().offset(-inset.right);
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
            make.left.equalTo(userInfoView).offset(0);
            make.right.equalTo(userInfoView).offset(0);
            make.bottom.equalTo(imgViewArc)
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
        let view = UIImageView(frame: .zero);
        view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        view.image = UIImage(named: "icon_avatar")
        
        return view;
    }()
    
    lazy var imgViewArc: UIImageView = {
        let view = UIImageView(frame: .zero);
        view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        view.image = UIImage(named: "icon_avatar")
        
        return view;
    }()
        
}
