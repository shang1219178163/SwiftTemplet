//
//  UICallPhoneView.swift
//  SwiftTemplet
//
//  Created by Bin Shang on 2019/9/19.
//  Copyright © 2019 BN. All rights reserved.
//

import UIKit
import SwiftExpand
import SnapKitExtend

class UICallPhoneView: UIView {
    
    typealias ViewClick = (UICallPhoneView, Int) -> Void;
    var viewBlock: ViewClick?;
    
    var startDate: Date = Date();
    
    var talkStatus: Int = 0{
        willSet{
            viewChange(type: newValue)
           
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.frame = UIScreen.main.bounds;
        
        self.backgroundColor = UIColorHexValue(0x5D5B5E);
        
        self.addSubview(btnSoundSmall)
        self.addSubview(labOne)
        self.addSubview(labTwo)
        self.addSubview(btnSoundSwitch)
        self.addSubview(btnCancel)
        self.addSubview(btnSure)
        
        setupConstraints()
        getViewLayer()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
    }
    
    func setupConstraints() {

        btnSoundSmall.snp.makeConstraints { (make) in
            make.top.equalToSuperview().offset(50);
            make.left.equalToSuperview().offset(20);
            make.width.height.equalTo(21);
        }
        
        labOne.sizeToFit()
        DDLog(labOne.frame)
        labOne.snp.makeConstraints { (make) in
            make.top.equalToSuperview().offset(182);
            make.centerX.equalToSuperview();
            make.height.equalTo(labOne.frame.size.height);
        }
        
        labTwo.snp.makeConstraints { (make) in
            make.top.equalTo(labOne.snp_bottom).offset(30);
            make.left.equalToSuperview().offset(10);
            make.right.equalToSuperview().offset(-10);
            make.height.equalTo(20);
        }

        btnSoundSwitch.snp.makeConstraints { (make) in
            make.top.equalTo(labTwo.snp_bottom).offset(50);
            make.centerX.equalToSuperview();
            make.width.height.equalTo(50);
        }
        
        viewChange(type: 0)
    }
    
    func viewChange(type: Int) -> Void {
        switch type {
        case 1://通话中
            
            self.startDate = Date();
            timer.fireDate = Date();

            btnSure.isHidden = true;
            self.btnCancel.snp.remakeConstraints { (make) in
                make.left.equalToSuperview().offset((self.sizeWidth-self.btnCancel.sizeWidth)*0.5);
                make.bottom.equalToSuperview().offset(-135);
            }
            // 更新动画
            UIView.animate(withDuration: 0.35, animations: {
                self.layoutIfNeeded()
            })
            
        default:
            timer.fireDate = Date.distantFuture;
            
            labTwo.text = "对方邀请你语音聊天"
            btnSure.isHidden = false;
            
            let list = [btnCancel, btnSure]
            list.snp.distributeViewsAlong(axisType: .horizontal, fixedItemLength: 60, leadSpacing: 80, tailSpacing: 80);
            list.snp.makeConstraints { (make) in
                make.bottom.equalToSuperview().offset(-135);
                make.height.equalTo(60);
            }
        }
    }
    
    
    override func didMoveToSuperview() {
        super.didMoveToSuperview()
        talkStatus = 0;

    }
    
    override func removeFromSuperview() {
        super.removeFromSuperview()
        talkStatus = 0;

    }
    
    //MRAK: - funtion
    
    func show() -> Void {
        let keyWindow = UIApplication.shared.keyWindow;
        if keyWindow?.subviews.contains(self) == false {
            keyWindow?.addSubview(self);
        } else {
            self.isHidden = false;
        }
        
        transform = transform.scaledBy(x: 0.01, y: 0.01)
        UIView.animate(withDuration: 0.15, animations: {
//            self.backgroundColor = UIColor.black.withAlphaComponent(0.5);
            self.transform = CGAffineTransform.identity;
            
        }, completion: nil);
    }
    
    func dismiss(_ needRemove: Bool = true) -> Void {
        UIView.animate(withDuration: 0.15, animations: {
//            self.backgroundColor = UIColor.black.withAlphaComponent(0);
            self.transform = self.transform.scaledBy(x: 0.01, y: 0.01)
            
        }) { (isFinished) in
            if needRemove == true {
                self.removeFromSuperview();
            } else {
                self.isHidden = true;
            }
        }
    }
    
    @objc func handleActionControl(_ sender: UIButton) {
        if self.viewBlock != nil {
            self.viewBlock!(self, sender.tag)
        }
        
        switch sender.tag {
        case 0:
            DDLog("取消")
            self.dismiss();

        case 1:
            DDLog("接听")
            talkStatus = 1;

        case 2:
            sender.isSelected = !sender.isSelected;
            let image = sender.isSelected == true ? UIImage(named: "icon_phone_soundoff") : UIImage(named: "icon_phone_soundon")
            sender.setImage(image, for: .normal)
            
            if sender.isSelected == true {
                DDLog("静音")

            } else {
                DDLog("不静音")

            }
            
        case 3:
            DDLog("缩小")
            self.dismiss(false);

        default:
            break;
        }
    }
    
    
    func block(_ action:@escaping ViewClick) -> Void {
        self.viewBlock = action;
    }
    
    // MARK: -lazy
    lazy var labOne: UILabel = {
        let lab = UILabel()
        lab.text = "对方位置信息"
        lab.text = "凯德东区停车场\n崇业路出口"
        lab.numberOfLines = 2;
        lab.textColor = UIColor.white
        lab.textAlignment = .center
        lab.font = UIFont.systemFont(ofSize: 27, weight: .bold)
        return lab;
    }()
    
    lazy var labTwo: UILabel = {
        let lab = UILabel()
        lab.text = "对方邀请你语音聊天"
        lab.textColor = UIColorHexValue(0xD4D6D9)
        lab.textAlignment = .center
        lab.font = UIFont.systemFont(ofSize: 16)
        
        return lab;
    }()
    
//    lazy var labThree: UILabel = {
//        let lab = UILabel()
//        lab.text = "对方邀请你语音聊天"
//        lab.textAlignment = .center
//        lab.font = UIFont.systemFont(ofSize: 16)
//
//        return lab;
//    }()
    
    lazy var btnCancel: UIButton = {
        let btn = UIView.createBtn(.zero, title: nil, imgName: "icon_phone_refuse", type: 4)
        btn.tag = 0;
        btn.addTarget(self, action: #selector(handleActionControl(_:)), for: .touchUpInside)

        return btn;
    }();
    
    lazy var btnSure: UIButton = {
        let btn = UIView.createBtn(.zero, title: nil, imgName: "icon_phone_answer", type: 4)
        btn.tag = 1;
        btn.addTarget(self, action: #selector(handleActionControl(_:)), for: .touchUpInside)

        return btn;
    }();
    
    lazy var btnSoundSwitch: UIButton = {
        let btn = UIView.createBtn(.zero, title: nil, imgName: "icon_phone_soundon", type: 4)
        btn.tag = 2;
        btn.addTarget(self, action: #selector(handleActionControl(_:)), for: .touchUpInside)

        return btn;
    }();
    
    lazy var btnSoundSmall: UIButton = {
        let btn = UIView.createBtn(.zero, title: nil, imgName: "icon_toSmall", type: 4)
        btn.tag = 3;
        btn.addTarget(self, action: #selector(handleActionControl(_:)), for: .touchUpInside)
        return btn;
    }();
    
    lazy var timer: Timer = {
        let timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(handActionTimer(_:)), userInfo: nil, repeats: true)
        RunLoop.main.add(timer, forMode: .common)
        return timer;
    }()
    
    @objc func handActionTimer(_ timer: Timer) -> Void {
        labTwo.text = "\((startDate as NSDate).agoInfo(1, length: 5))"

    }
}

extension UIView{
    /// 计时显示
    
}
