

//
//  NNTableHeaderView.swift
//  CloudCustomerService
//
//  Created by Bin Shang on 2019/9/11.
//  Copyright © 2019 Xi'an iRain IoT. Technology Service CO., Ltd. . All rights reserved.
//

import UIKit
import SwiftExpand


class NNTableHeaderView: UIView {
    /// 图像距离顶端间距
    var topPadding: CGFloat = 8;
    /// 图像切圆形
    var hasCornerRadius = false;

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    deinit {
        btn.titleLabel!.removeObserver(self, forKeyPath: "text", context: nil)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = UIColor.background;

        addSubview(imgView)
        addSubview(btn)
        addSubview(labelOne)
        
        btn.titleLabel!.textColor = UIColor.textColor3
        labelOne.textColor = UIColor.textColor6
        
        btn.titleLabel!.addObserver(self, forKeyPath: "text", options: .new, context: nil)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        imgView.snp.makeConstraints { (make) in
            make.top.equalToSuperview().offset(topPadding);
            make.centerX.equalToSuperview();
            make.width.height.equalTo(70);
        }
        
        btn.snp.makeConstraints { (make) in
            make.top.equalTo(imgView.snp.bottom).offset(15)
            make.left.right.equalToSuperview();
            make.height.equalTo(25);
        }
        labelOne.snp.makeConstraints { (make) in
            make.top.equalTo(btn.snp.bottom).offset(5)
            make.left.right.equalToSuperview();
            make.height.equalTo(25);
        }
        
        if hasCornerRadius {
            imgView.layer.borderColor = UIColor.white.cgColor;
            imgView.layer.borderWidth = 1.5;
            imgView.layer.cornerRadius = 35;
            imgView.layer.masksToBounds = true;
        }
    }
    
    
    // MARK: -observeValue
    override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
        if keyPath == "text" {
            btn.sizeToFit()
//            btn.titleEdgeInsets = UIEdgeInsetsMake(0, -btn.imageView!.bounds.width, 0, btn.imageView!.bounds.width)
//            btn.imageEdgeInsets = UIEdgeInsetsMake(0, btn.titleLabel!.bounds.width+3.0, 0, -btn.titleLabel!.bounds.width-3.0)
//            btn.size = CGSize(width: btn.frame.width + 10, height: self.sizeHeight)
            btn.layoutButton(style: 3, imageTitleSpace: 3)

        } else {
            super.observeValue(forKeyPath: keyPath, of: object, change: change, context: context)
        }
        
    }
    // MARK: -lazy
    
    @objc lazy var imgView: UIImageView = {
        var view = UIImageView(frame: .zero);
        view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        view.image = UIImage(named: "icon_avatar")
   
        return view;
    }();
    
    
    @objc lazy var btn: UIButton = {
        var view: UIButton = UIButton.create( .zero, title: "标题", imgName: nil, type: 3);
        view.addActionHandler({ (sender) in
            if let obj = sender as? UIButton {
                DDLog(obj.currentTitle as Any)
                
            }
        }, for: .touchUpInside)
        
        return view;
    }();
    
    @objc lazy var labelOne: UILabel = {
        let view = UILabel()
        view.textColor = UIColor.white
        view.textAlignment = .center
        view.font = UIFont.systemFont(ofSize: 14)
        view.numberOfLines = 1
        view.lineBreakMode = .byWordWrapping
        view.isUserInteractionEnabled = true
        return view
    }()
}


extension NNTableHeaderView{
    
    static func create(_ image: UIImage = UIImage(named: "icon_avatar")!, title: String = "操作成功", topPadding: CGFloat = 25, height: CGFloat = 180) -> NNTableHeaderView {
        let view = NNTableHeaderView(frame: CGRectMake(0, 0, UIScreen.sizeWidth, height))
        view.topPadding = topPadding
        view.hasCornerRadius = true;
        view.backgroundColor = UIColor.white
        
        view.imgView.image = image
        view.btn.titleLabel!.font = UIFont.systemFont(ofSize: 16)
        view.btn.setTitle(title, for: .normal)
        view.btn.setTitleColor(UIColor.textColor3, for: .normal)
//        view.btn.sizeToFit()
        view.btn.layoutButton(style: 3, imageTitleSpace: 3)
//        view.labelOne.text = "恭喜您,支付成功!";

//        view.getViewLayer()
        return view
    }
}
