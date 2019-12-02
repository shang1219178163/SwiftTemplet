//
//  NNExpandView.swift
//  SwiftTemplet
//
//  Created by Bin Shang on 2019/2/25.
//  Copyright © 2019 BN. All rights reserved.
//

import UIKit

import SwiftExpand

class NNExpandView: UIView {

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.clipsToBounds = true
        backgroundColor = UIColor.orange.withAlphaComponent(0.3);
        label.backgroundColor = .clear
        label.textColor = .orange
        
        backgroundColor = UIColor.hex("#fff6d3").withAlphaComponent(0.8)
        label.textColor = UIColor.hex("#67722")

//        addSubview(btn)
        addSubview(containView)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func didMoveToSuperview() {
        super.didMoveToSuperview()
        
        self.superview?.addSubview(btn)
        
//        let idx = (self.superview?.subviews as! NSArray).index(of: btn)
//        let idx1 = (self.superview?.subviews as! NSArray).index(of: self)
//        self.superview?.exchangeSubview(at: idx, withSubviewAt: idx1)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        let btnH = bounds.height+5*2
        btn.snp.makeConstraints { (make) in
            make.left.equalTo(frame.minX)
            make.centerY.equalTo(frame.midY)
            make.width.height.equalTo(btnH)
        }
        
        containView.snp.makeConstraints { (make) in
            make.centerY.equalToSuperview()
            make.left.equalTo(frame.minX + btnH - frame.midY)
            make.right.equalToSuperview().offset(-kX_GAP)
            make.height.equalTo(bounds.height - kY_GAP*2)
        }
        
        btnDelete.size = CGSize(width: bounds.height*0.5, height: bounds.height*0.5)
        btnDelete.snp.makeConstraints { (make) in
            make.centerY.equalToSuperview().offset(0)
            make.right.equalToSuperview().offset(-kPadding)
            make.width.height.equalTo(btnDelete.size.width)
        }
        
        label.snp.makeConstraints { (make) in
            make.centerY.equalToSuperview().offset(0)
            make.left.equalToSuperview().offset(0)
            make.right.equalTo(btnDelete.snp.left).offset(-kPadding)
            make.height.equalToSuperview()
        }
        
        btn.layer.cornerRadius = btnH*0.5
        btn.layer.masksToBounds = true
        
        self.layer.cornerRadius = self.frame.height*0.5
        self.layer.masksToBounds = true
    }
    
    lazy var btnDelete: UIButton = {
        var view = UIButton(type: .custom)
//        view.setBackgroundImage(UIImage(named: "icon_notice"), for: .normal)
        view.setImage(UIImageNamed("icon_delete"), for: .normal)
        view.addActionHandler({ (control) in
            if let sender = control as? UIButton {
                DDLog(sender.tag)
                
                var rect = self.frame
                rect.size.width = 0.0
                UIView.animate(withDuration: 0.35, animations: {
                    self.frame = rect;
                })
            }
            
        }, for: .touchUpInside)
        return view
    }()
    
    lazy var btn: UIButton = {
        var view = UIButton(type: .custom)
        //        view.setTitle("闭包的回调方法", for: .normal);
        //        view.setTitleColor(.white, for: .normal);
        view.setImage(UIImageNamed("icon_notice_black"), for: .normal)
        view.setBackgroundImage(UIImage(color: .white), for: .normal)
        view.adjustsImageWhenHighlighted = false
        view.addActionHandler({ (control) in
            if let sender = control as? UIButton {
                DDLog(sender.tag)
                
            }
            
        }, for: .touchUpInside)
//        view.layer.zPosition = 1;
        
        return view
    }()
    
    lazy var label: UILabel = {
        var view = UILabel(frame: .zero);
        view.font = UIFont.systemFont(ofSize: 15)
        view.text = "                         " + "您于2017年10月11日13:28因违反相关规定";
        view.textColor = UIColor.black;
        view.textAlignment = .center;
        view.tag = 10;
        return view;
    }();

    
    lazy var containView: UIView = {
        var view = UIView(frame: bounds)

        view.addSubview(label)
        view.addSubview(btnDelete)
        return view
    }()
}
