//
//  NNCompanyRightsView.swift
//  SwiftTemplet
//
//  Created by Bin Shang on 2020/7/16.
//  Copyright © 2020 BN. All rights reserved.
//

import UIKit

import SnapKit
import SwiftExpand
        
///
class NNCompanyRightsView: UIView {

    var iconSize = CGSize(width: 80, height: 48)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = .background
        addSubview(label)
        addSubview(btn)
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
            make.height.equalTo(25);
        }
        
        btn.snp.makeConstraints { (make) in
            make.centerX.equalToSuperview().offset(0);
            make.bottom.equalTo(label.snp.top).offset(-5);
            make.size.equalTo(iconSize);
        }
        
    }
        
    //MARK: - lazy    
    lazy var label: UILabel = {
        let view = UILabel(frame: .zero);
        view.text = "Powered By * Cloud ©2019 iRain Cloud.All rights reserved.";
        view.textColor = .gray;
        view.textAlignment = .center;
        view.font = UIFont.systemFont(ofSize: 9)
        view.adjustsFontSizeToFitWidth = true
        view.numberOfLines = 1
        return view;
    }();
    
    lazy var btn: UIButton = {
        let view = UIButton(type: .custom);
        view.tag = 1;
        
        view.titleLabel?.font = UIFont.systemFont(ofSize: 16);
        view.setTitle("公司图标", for: .normal);
        view.setTitleColor(UIColor.theme, for: .normal);
        view.addActionHandler({ (control) in
            DDLog(control)
        }, for: .touchUpInside)
        return view;
    }();
}
