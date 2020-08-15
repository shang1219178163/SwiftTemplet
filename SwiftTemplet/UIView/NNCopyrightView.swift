//
//  NNCopyrightView.swift
//  SwiftTemplet
//
//  Created by Bin Shang on 2020/7/16.
//  Copyright © 2020 BN. All rights reserved.
//

import UIKit

import SnapKit

        
///
class NNCopyrightView: UIView {

    var logoSize = CGSize(width: 44, height: 18)

    //MARK: - lazy
    lazy var imgView: UIImageView = {
        var view = UIImageView(frame: .zero);
        view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        view.image = UIImage(named: "irain_logo_lightgray")
        view.contentMode = .scaleAspectFit
        return view;
    }()
    
    lazy var labelPhone: UILabel = {
        let view = UILabel(frame: .zero);
        view.text = "请选择";
        view.textColor = UIColor.hexValue(0x999999)
        view.font = UIFont.systemFont(ofSize: 9)
        return view;
    }()
    
    lazy var label: UILabel = {
        let view = UILabel(frame: .zero);
        view.text = "Powered By * Cloud ©2019 iRain Cloud.All rights reserved.";
        view.textColor = .gray;
        view.textAlignment = .center;
        view.font = UIFont.systemFont(ofSize: 9)
        view.adjustsFontSizeToFitWidth = true
        view.numberOfLines = 1
        return view;
    }()
    // MARK: -lifecycle
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = .background
        addSubview(label)
        addSubview(imgView)
        addSubview(labelPhone)
        
        label.text = "Powered By iRain Cloud ©2020 iRain Cloud.All rights reserved."
        imgView.image = UIImage(named: "irain_logo_lightgray")
        labelPhone.text = "客服电话：400-966-8001"
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        if bounds.height <= 1.0 {
            return;
        }
        
        label.snp.makeConstraints { (make) in
            make.left.equalToSuperview().offset(10);
            make.right.equalToSuperview().offset(-10);
            make.bottom.equalToSuperview().offset(-15);
            make.height.equalTo(12);
        }
        
        if imgView.isHidden {
            labelPhone.snp.makeConstraints { (make) in
                make.centerX.equalToSuperview().offset(0);
                make.bottom.equalTo(label.snp.top).offset(-5);
                make.size.equalTo(logoSize);
            }
            return
        }
        
        if labelPhone.isHidden {
            imgView.snp.makeConstraints { (make) in
                make.centerX.equalToSuperview().offset(0);
                make.bottom.equalTo(label.snp.top).offset(-5);
                make.size.equalTo(logoSize);
            }
            return
        }
        
        imgView.snp.makeConstraints { (make) in
            make.centerX.equalToSuperview().offset(-logoSize.width - 8*2)
            make.bottom.equalTo(label.snp.top).offset(-8);
            make.size.equalTo(logoSize);
        }
        
        labelPhone.snp.makeConstraints { (make) in
            make.centerY.equalTo(imgView).offset(0)
            make.left.equalTo(imgView.snp.right).offset(8);
            make.right.equalToSuperview().offset(-10);
            make.height.equalTo(imgView);
        }
    }
        


}
