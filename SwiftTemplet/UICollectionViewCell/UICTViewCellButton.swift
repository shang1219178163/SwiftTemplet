//
//  UICTViewCellButton.swift
//  IntelligentOfParking
//
//  Created by Bin Shang on 2019/11/14.
//  Copyright © 2019 Xi'an iRain IoT. Technology Service CO., Ltd. . All rights reserved.
//

import UIKit
import SwiftExpand


@objcMembers class UICTViewCellButton: UICollectionViewCell {
       
    var inset = UIEdgeInsets(top: 10, left: 15, bottom: 10, right: 15)
    
    deinit {
        btn.titleLabel!.removeObserver(self, forKeyPath: "text")
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        contentView.addSubview(btn)
        
        btn.titleLabel?.font = UIFont.systemFont(ofSize: 14)
//        btn.setImage(UIImage(named: "icon_arrow_down_blank_black_small"), for: .normal)
//        btn.setImage(UIImage(named: "icon_arrow_up_blank_small"), for: .selected)

        btn.titleLabel!.addObserver(self, forKeyPath: "text", options: .new, context: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        btn.snp.makeConstraints { (make) in
            make.edges.equalTo(inset)
        }
    }
    
    
    // observeValue
    override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
        if keyPath == "text" {
            guard let imageView = btn.imageView, let titleLabel = btn.titleLabel else { return }
            btn.sizeToFit()
            btn.center = self.contentView.center
            btn.titleEdgeInsets = UIEdgeInsets(0, -imageView.bounds.width, 0, imageView.bounds.width)
            if btn.imageView?.image != nil {
                btn.imageEdgeInsets = UIEdgeInsets(0, titleLabel.bounds.width+3.0, 0, -titleLabel.bounds.width-3.0)
            }
        }
        else {
            super.observeValue(forKeyPath: keyPath, of: object, change: change, context: context)
        }
    }
    
    // MARK: -lazy

    public var btn: UIButton = {
        let view = UIButton(type: .custom)
        view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        view.titleLabel?.font = UIFont.systemFont(ofSize: 15)
        view.titleLabel?.adjustsFontSizeToFitWidth = true
        view.titleLabel?.minimumScaleFactor = 1.0
        view.isExclusiveTouch = true
        view.setTitleColor(.textColor3, for: .normal)
        view.setTitleColor(.theme, for: .selected)
       return view
   }()
}
