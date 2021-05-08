//
//  NNUpdateVersionView.swift
//  SwiftTemplet
//
//  Created by Bin Shang on 2019/3/1.
//  Copyright © 2019 BN. All rights reserved.
//

import UIKit

import SnapKit
import SwiftExpand

///升级弹窗
@objcMembers class NNUpdateVersionView: UIView {
    
    let containX: CGFloat = 40
    let containY: CGFloat = 140
    let btnH: CGFloat = 50
    
    var isForceUpdate: Bool = false{
        willSet{
            btnCancell.isHidden = newValue
        }
    }
    var appStoreID = ""

    typealias ViewClick = (NNUpdateVersionView, Int) -> Void
    var viewBlock: ViewClick?
    
    
    // MARK: -lifecycle
        override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.frame = UIScreen.main.bounds
        addSubview(contentView);
        addSubview(btnCancell);
        
        contentView.layer.borderWidth = kH_LINE_VIEW
        contentView.layer.cornerRadius = kPadding
        
        label.font = UIFont.boldSystemFont(ofSize: 30)
        label.textColor = UIColor.white
        labelOne.textColor = UIColor.white
        
        btn.layer.cornerRadius = 5
        
        imgView.image = UIImage(named: "img_verionUpdate")
        label.text = "发现新版本"
        labelOne.text = "V1.0.0"
        labelTwo.text = "更新内容:"
        labelThree.text = "1.界面改版,新增消息通知\n2.新增充值功能\n3.部分界面优化"

//        getViewLayer()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        setupConstraint()
    }
    
    func setupConstraint() {
        if bounds.height <= 10 {
            return
        }
        
        let imgViewH: CGFloat = (bounds.width - containX*2)/(570/228)
        let labelX: CGFloat = kX_GAP*1.5
        let labelY: CGFloat = (imgViewH - kH_LABEL*2 - kPadding)/2.0

        contentView.snp.makeConstraints { (make) in
            make.top.equalToSuperview().offset(containY)
            make.left.equalToSuperview().offset(containX)
            make.right.equalToSuperview().offset(-containX)
        }
        
        imgView.snp.makeConstraints { (make) in
            make.top.left.right.equalToSuperview()
            make.height.equalTo(imgViewH)
        }
            
        label.snp.makeConstraints { (make) in
            make.top.equalToSuperview().offset(labelY)
            make.left.equalToSuperview().offset(labelX)
            make.right.equalToSuperview().offset(-labelX)
            make.height.equalTo(kH_LABEL)
        }
        
        labelOne.snp.makeConstraints { (make) in
            make.top.equalTo(label.snp.bottom).offset(kPadding)
            make.left.right.equalTo(label)
            make.height.equalTo(label)
        }
        
        labelTwo.snp.makeConstraints { (make) in
            make.top.equalTo(imgView.snp.bottom).offset(kY_GAP)
            make.left.right.equalTo(label)
            make.height.equalTo(label)
        }
        
        btn.snp.makeConstraints { (make) in
            make.left.right.equalTo(label)
            make.bottom.equalToSuperview().offset(-20)
            make.height.equalTo(btnH)
        }
    
        labelThree.snp.makeConstraints { (make) in
            make.top.equalTo(labelTwo.snp.bottom).offset(5)
            make.left.right.equalTo(label)
            make.bottom.equalTo(btn.snp.top).offset(-kY_GAP)
        }
      
        btnCancell.snp.makeConstraints { (make) in
            make.top.equalTo(contentView.snp.bottom).offset(kY_GAP)
            make.centerX.equalTo(contentView)
            make.width.height.equalTo(btnH)
        }
        
    }
    
    //MARK: -funtions
    func show() {
        UIApplication.shared.keyWindow?.endEditing(true)
        UIApplication.shared.keyWindow?.addSubview(self);
        
//        self.transform = self.transform.scaledBy(x: 2.5, y: 2.5)
        UIView.animate(withDuration: 0.15, animations: {
            self.backgroundColor = UIColor.black.withAlphaComponent(0.6);
            self.transform = CGAffineTransform.identity
            
        }, completion: nil);
    }
    
    func dismiss() {
        UIView.animate(withDuration: 0.15, animations: {
            self.backgroundColor = UIColor.black.withAlphaComponent(0);
//            self.transform = self.transform.scaledBy(x: 0.5, y: 0.5)

        }) { (isFinished) in
            self.removeFromSuperview();
        }
    }
    
    func block(_ action:@escaping ViewClick) {
        self.viewBlock = action;
    }
    
    //MARK: -lazy
    
    lazy var imgView: UIImageView = {
        let view = UIImageView(frame: .zero);
        view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        view.isUserInteractionEnabled = true;
//        view.contentMode = .scaleAspectFit;
        return view;
    }()
    
    lazy var label: UILabel = {
        let view = UILabel(frame: .zero);
        view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        view.textAlignment = .left;
        view.numberOfLines = 0;
        view.lineBreakMode = .byCharWrapping;
        view.isUserInteractionEnabled = true;
        
        return view;
    }()
    
    lazy var labelOne: UILabel = {
        let view = UILabel(frame: .zero);
        view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        view.textAlignment = .left;
        view.numberOfLines = 0;
        view.lineBreakMode = .byCharWrapping;
        view.isUserInteractionEnabled = true;
        
        return view;
    }()
    
    lazy var labelTwo: UILabel = {
        let view = UILabel(frame: .zero);
        view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        view.textAlignment = .left;
        view.numberOfLines = 0;
        view.lineBreakMode = .byCharWrapping;
        view.isUserInteractionEnabled = true;
        
        view.font = UIFont.systemFont(ofSize: 15)
        view.textColor = .gray
        return view;
    }()

    lazy var labelThree: UILabel = {
        let view = UILabel(frame: .zero);
        view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        view.textAlignment = .left;
        view.numberOfLines = 0;
        view.lineBreakMode = .byCharWrapping;
        view.isUserInteractionEnabled = true;
        
        view.font = UIFont.systemFont(ofSize: 15)
        view.textColor = .gray
        return view;
    }()

//    lazy var labelFour: UILabel = {
//        let view = UILabel(frame: .zero);
//        view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
//        view.textAlignment = .left;
//        view.numberOfLines = 0;
//        view.lineBreakMode = .byCharWrapping;
//        view.isUserInteractionEnabled = true;
//
//        view.font = UIFont.systemFont(ofSize: 15)
//        view.textColor = .gray
//        return view;
//    }()

 
    lazy var btn: UIButton = {
        let view = UIButton(type: .custom)
        view.setTitle("立即升级", for: .normal);
        view.setTitleColor(.white, for: .normal);
        view.adjustsImageWhenHighlighted = false
        
        view.backgroundColor = UIColor.hexValue(0x41cc88)
//        let image = UIImage(color: .systemGreen)
//        view.setBackgroundImage(image, for: .normal)
        
        view.addActionHandler({ (sender) in
            self.dismiss()
            self.viewBlock?(self,  1)
            
            let appStoreUrl = "itms-apps://itunes.apple.com/app/id\(self.appStoreID)?mt=8"
            guard let url = URL(string: appStoreUrl) else {
                print("\(#function):\(appStoreUrl) 出错")
                return
            }
            if #available(iOS 10.0, *) {
                UIApplication.shared.open(url, options: [:], completionHandler: nil)
            } else {
                UIApplication.shared.openURL(url);
            }
            
        }, for: .touchUpInside)
        return view
    }()
    
    lazy var btnCancell: UIButton = {
        let view = UIButton(type: .custom)
//        view.setTitle("取消", for: .normal);
        view.setTitleColor(.white, for: .normal);
        view.setImage(UIImage(named: "icon_close"), for: .normal)
        //        view.setBackgroundImage(UIImage(color: .clear), for: .normal)
        view.adjustsImageWhenHighlighted = false
        view.addActionHandler({ (sender) in
            self.dismiss()
            self.viewBlock?(self,  0)
        }, for: .touchUpInside)
        return view
    }()
    
    lazy var contentView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.white
        view.addSubview(imgView)
        view.addSubview(label)
        view.addSubview(labelOne)
        view.addSubview(labelTwo)
        view.addSubview(labelThree)
        view.addSubview(btn)

        return view
    }()
}
