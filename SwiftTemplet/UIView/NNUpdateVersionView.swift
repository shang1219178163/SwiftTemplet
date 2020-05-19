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

class NNUpdateVersionView: UIView {
    
    let containX: CGFloat = 40
    let containY: CGFloat = 140
    let btnH: CGFloat = 50

    typealias ViewClick = (NNUpdateVersionView, Int) -> Void;
    var viewBlock: ViewClick?;
    
    var type: Int = 0 {
        willSet {
            switch newValue {
            case 1:
                containView.layer.borderWidth = kH_LINE_VIEW
                containView.layer.cornerRadius = kPadding
                
                btn.layer.borderWidth = kH_LINE_VIEW
                btn.layer.cornerRadius = btnH/2.0
                gradientLayer.borderWidth = kH_LINE_VIEW
                gradientLayer.cornerRadius = btnH/2.0
                
            default:
                break;
            }
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.frame = UIScreen.main.bounds
        addSubview(containView);
        addSubview(btnCancell);
        
        label.font = UIFont.boldSystemFont(ofSize: 30)
        label.textColor = UIColor.white
        labelOne.textColor = UIColor.white
        labelThree.textColor = UIColor.hexValue(0x666666)
        
        label.text = "发现新版本"
        labelOne.text = "V1.0.0"
        labelTwo.text = "更新内容:"
        labelThree.text = "1.界面改版,新增消息通知\n2.新增充值功能\n3.部分界面优化"
        
        gradientLayer.colors = CAGradientLayer.defaultColors;

        getViewLayer()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        setupConstraint()
    }
    
    func setupConstraint() {
        let imgViewH: CGFloat = (bounds.width - containX*2)/(570/228)
        let labelX: CGFloat = kX_GAP*1.5
        let labelY: CGFloat = (imgViewH - kH_LABEL*2 - kPadding)/2.0

        containView.snp.makeConstraints { (make) in
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
            make.bottom.equalToSuperview().offset(-kY_GAP)
            make.height.equalTo(btnH)
        }
    
        labelThree.snp.makeConstraints { (make) in
            make.top.equalTo(labelTwo.snp.bottom).offset(kY_GAP)
            make.left.right.equalTo(label)
            make.bottom.equalTo(btn.snp.top).offset(-kY_GAP)
        }
      
        btnCancell.snp.makeConstraints { (make) in
            make.top.equalTo(containView.snp.bottom).offset(kY_GAP*2)
            make.centerX.equalTo(containView)
            make.width.height.equalTo(btnH)
        }
        
        gradientLayer.frame = CGRectMake(0, 0, kScreenWidth - containX*2 - labelX*2, btnH);
    }
    
    //MARK: -funtions
    func show() {
        UIApplication.shared.keyWindow?.endEditing(true)
        UIApplication.shared.keyWindow?.addSubview(self);
        
        self.transform = self.transform.scaledBy(x: 0.5, y: 0.5)
        UIView.animate(withDuration: 0.15, animations: {
            self.backgroundColor = UIColor.black.withAlphaComponent(0.6);
            self.transform = CGAffineTransform.identity
            
        }, completion: nil);
    }
    
    func dismiss() {
        UIView.animate(withDuration: 0.15, animations: {
            self.backgroundColor = UIColor.black.withAlphaComponent(0);
            self.transform = self.transform.scaledBy(x: 0.5, y: 0.5)

        }) { (isFinished) in
            self.removeFromSuperview();
            
        }
    }
    
    func block(_ action:@escaping ViewClick) {
        self.viewBlock = action;
    }
    
    //MARK: -lazy
    
    lazy var imgView: UIImageView = {
        var view = UIImageView(frame: .zero);
        view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        view.isUserInteractionEnabled = true;
//        view.contentMode = .scaleAspectFit;
        view.image = UIImageNamed("img_verionUpdate")
        return view;
    }()
    
    lazy var label: UILabel = {
        var view = UILabel(frame: .zero);
        view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        view.textAlignment = .left;
        view.numberOfLines = 0;
        view.lineBreakMode = .byCharWrapping;
        view.isUserInteractionEnabled = true;
        
        return view;
    }()
    
    lazy var labelOne: UILabel = {
        var view = UILabel(frame: .zero);
        view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        view.textAlignment = .left;
        view.numberOfLines = 0;
        view.lineBreakMode = .byCharWrapping;
        view.isUserInteractionEnabled = true;
        
        return view;
    }()
    
    lazy var labelTwo: UILabel = {
        var view = UILabel(frame: .zero);
        view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        view.textAlignment = .left;
        view.numberOfLines = 0;
        view.lineBreakMode = .byCharWrapping;
        view.isUserInteractionEnabled = true;
        
        return view;
    }()

    lazy var labelThree: UILabel = {
        var view = UILabel(frame: .zero);
        view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        view.textAlignment = .left;
        view.numberOfLines = 0;
        view.lineBreakMode = .byCharWrapping;
        view.isUserInteractionEnabled = true;
        
        return view;
    }()

    lazy var labelFour: UILabel = {
        var view = UILabel(frame: .zero);
        view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        view.textAlignment = .left;
        view.numberOfLines = 0;
        view.lineBreakMode = .byCharWrapping;
        view.isUserInteractionEnabled = true;
        
        return view;
    }()

 
    lazy var btn: UIButton = {
        var view = UIButton(type: .custom)
        view.setTitle("立即升级", for: .normal);
        view.setTitleColor(.white, for: .normal);
//        view.setBackgroundImage(UIImage(color: .clear), for: .normal)
        view.adjustsImageWhenHighlighted = false
//        view.backgroundColor = UIColor.hexValue(0x2dae70)
//        view.backgroundColor = UIColor.hex("#2dae70")
        view.layer.addSublayer(gradientLayer)
        view.addActionHandler({ (control) in
            self.dismiss()
            self.viewBlock?(self,  1)
        }, for: .touchUpInside)
        return view
    }()
    
    lazy var btnCancell: UIButton = {
        var view = UIButton(type: .custom)
//        view.setTitle("取消", for: .normal);
        view.setTitleColor(.white, for: .normal);
        view.setImage(UIImageNamed("icon_close"), for: .normal)
        //        view.setBackgroundImage(UIImage(color: .clear), for: .normal)
        view.adjustsImageWhenHighlighted = false
        view.addActionHandler({ (control) in
            self.dismiss()
            self.viewBlock?(self,  0)
        }, for: .touchUpInside)
        return view
    }()
    
    lazy var containView: UIView = {
        var view = UIView()
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
