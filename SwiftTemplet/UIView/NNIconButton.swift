//
//  NNIconButton.swift
//  SwiftTemplet
//
//  Created by Bin Shang on 2020/6/5.
//  Copyright © 2020 BN. All rights reserved.
//

import UIKit

class NNIconButton: UIButton {
        
    lazy var iconImageView: UIImageView = {
        let view = UIImageView(frame: CGRect.zero);
        view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        view.isUserInteractionEnabled = true;
        view.contentMode = .scaleAspectFit;
        
//        view.image = UIImage(named: "icon_discount_orange");
        return view
    }()
    
    var iconSize: CGSize = CGSize(width: 35, height: 14)
    
    var iconLocation: UIView.Location = .rightTop

    // MARK: -life cycle
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubview(iconImageView)
        
        clipsToBounds = false
        titleLabel!.textAlignment = .center
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
//    override func imageRect(forContentRect contentRect: CGRect) -> CGRect {
//        return
//    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
                
        if bounds.height <= 10.0 {
            return
        }
        
        iconImageView.isHidden = (iconLocation == .none)
        switch iconLocation {
        case .leftTop:
            iconImageView.snp.makeConstraints { (make) in
                make.top.equalToSuperview().offset(-2.0)
                make.left.equalToSuperview().offset(-2.0)
                make.size.equalTo(iconSize)
            }
            
        case .leftBottom:
            iconImageView.snp.makeConstraints { (make) in
                make.bottom.equalToSuperview().offset(2.0)
                make.left.equalToSuperview().offset(-2.0)
                make.size.equalTo(iconSize)
            }
        case .rightTop:
            iconImageView.snp.makeConstraints { (make) in
                make.top.equalToSuperview().offset(-2.0)
                make.right.equalToSuperview().offset(2.0)
                make.size.equalTo(iconSize)
            }
            
        case .rightBottom:
            iconImageView.snp.makeConstraints { (make) in
                make.bottom.equalToSuperview().offset(2.0)
                make.right.equalToSuperview().offset(2.0)
                make.size.equalTo(iconSize)
            }
            
        default:
            break;
        }
    }

}
