//
//  UICallPhoneView.swift
//  SwiftTemplet
//
//  Created by Bin Shang on 2019/9/19.
//  Copyright © 2019 BN. All rights reserved.
//

import UIKit
import AVFoundation
import SwiftExpand
import SnapKitExtend

@objc protocol UICallPhoneViewDelegate{
    func callPhoneView(_ view: UICallPhoneView, idx: Int);
    
}

class UICallPhoneView: UIView {
    weak var delegate: UICallPhoneViewDelegate?

    var startDate: Date = Date();
    
    var talkStatus: Int = 0 {
        willSet{
            viewChange(type: newValue)
           
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.frame = UIScreen.main.bounds;
        
        self.backgroundColor = UIColor.hexValue(0x5D5B5E);
        
        self.addSubview(btnSoundSmall)
        self.addSubview(labOne)
        self.addSubview(labTwo)
        self.addSubview(btnSoundSwitch)
        self.addSubview(btnCancel)
        self.addSubview(btnSure)
        
        labTwo.addObserver(self, forKeyPath: "text", options: .new, context: nil)

        setupConstraints()
        getViewLayer()
    }
    
    override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
        if keyPath == "text" {
            let value = change![NSKeyValueChangeKey.newKey] as! String;
            let title = value.count == 5 ? value : "00:00";
            talkbackBtn.setTitle(title, for: .normal)

        }
        else {
            super.observeValue(forKeyPath: keyPath, of: object, change: change, context: context)
        }
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
//        DDLog(labOne.frame)
        labOne.snp.makeConstraints { (make) in
            make.top.equalToSuperview().offset(182);
            make.centerX.equalToSuperview();
        }
        
        labTwo.snp.makeConstraints { (make) in
            make.top.equalTo(labOne.snp.bottom).offset(30);
            make.left.equalToSuperview().offset(10);
            make.right.equalToSuperview().offset(-10);
            make.height.equalTo(20);
        }

        btnSoundSwitch.snp.makeConstraints { (make) in
            make.top.equalTo(labTwo.snp.bottom).offset(50);
            make.centerX.equalToSuperview();
            make.width.height.equalTo(50);
        }
        
        viewChange(type: 0)
    }
    
    func viewChange(type: Int) {
        switch type {
        case 1://通话中
            
            self.startDate = Date();
            timer.fireDate = Date();

            btnSure.isHidden = true;
            self.btnCancel.snp.remakeConstraints { (make) in
                make.centerX.equalToSuperview();
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
            list.snp.removeConstraints()
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
    
    //MRAK: - funtion
    
    func show() {
        guard let app = UIApplication.shared.delegate as? AppDelegate, let keyWindow = app.window else { return }
        if keyWindow.subviews.contains(self) == false {
            keyWindow.addSubview(self);
        } else {
          self.isHidden = false;
        }
        
//        transform = transform.scaledBy(x: 0.01, y: 0.01)
        UIView.animate(withDuration: 0.15, animations: {
//            self.backgroundColor = UIColor.black.withAlphaComponent(0.3);
            self.transform = .identity;
            self.frame = UIScreen.main.bounds;
            self.talkbackBtn.isHidden = true;

        }) { (isFinished) in
            
        }
    }
    
    func dismiss() {
        UIView.animate(withDuration: 0.15, animations: {
            self.transform = self.transform.scaledBy(x: 0.01, y: 0.01)

        }) { (isFinished) in
            if isFinished == true {
                self.removeFromSuperview()
            }
        }
    }
    
    func smallToButton() {
        superview?.addSubview(talkbackBtn)
        talkbackBtn.isHidden = false;
        superview?.bringSubviewToFront(talkbackBtn);

        UIView.animate(withDuration: 0.15, animations: {
//            self.backgroundColor = UIColor.black.withAlphaComponent(0);
//            self.transform = self.transform.scaledBy(x: 0.01, y: 0.01)
            
//            let transform = CGAffineTransform(translationX: 90, y: 90)
//            self.transform = transform.scaledBy(x: 0.01, y: 0.01)
            self.frame = self.talkbackBtn.frame;

        }) { (isFinished) in
            if isFinished == true {
               self.isHidden = true;
           }
        }
    }
    
    lazy var talkbackBtn: NNSuspendButton = {
//        let view = UIButton(type: .custom)
//        view.frame = CGRectMake(20, 110, 70, 70)
        
        let view = NNSuspendButton(frame: CGRectMake(20, 110, 70, 70))
        
        view.setTitleColor(UIColor.hexValue(0x39C179), for: .normal)
        view.setTitle("00:00", for: .normal)
        view.setImage(UIImage(named: "icon_phone_green"), for: .normal)
        view.setBackgroundImage(UIImage(), for: .normal)
        view.backgroundColor = UIColor.hexValue(0xdddddd)
        view.adjustsImageWhenHighlighted = false;
        view.layer.cornerRadius = 3.5;
        view.layer.masksToBounds = true;
        view.layoutButton(direction: 0)
        view.addActionHandler({ (sender) in
            self.show();
            
        })
        return view
    }()
    
    @objc func handleActionControl(_ sender: UIButton) {
        delegate?.callPhoneView(self, idx: sender.tag);

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
            
            AVAudioSession.appAVAudioVolume(sender.isSelected)

        case 3:
            DDLog("缩小")
            self.smallToButton();

        default:
            break;
        }
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
        lab.textColor = UIColor.hexValue(0xD4D6D9)
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
        let btn = UIButton(type: .custom)
        btn.setImage(UIImage(named: "icon_phone_refuse"), for: .normal)
        btn.tag = 0;
        btn.addTarget(self, action: #selector(handleActionControl(_:)), for: .touchUpInside)

        return btn;
    }();
    
    lazy var btnSure: UIButton = {
        let btn = UIButton(type: .custom)
        btn.setImage(UIImage(named: "icon_phone_answer"), for: .normal)
        btn.tag = 1;
        btn.addTarget(self, action: #selector(handleActionControl(_:)), for: .touchUpInside)

        return btn;
    }();
    
    lazy var btnSoundSwitch: UIButton = {
        let btn = UIButton(type: .custom)
        btn.setImage(UIImage(named: "icon_phone_soundon"), for: .normal)
        btn.tag = 2;
        btn.addTarget(self, action: #selector(handleActionControl(_:)), for: .touchUpInside)

        return btn;
    }();
    
    lazy var btnSoundSmall: UIButton = {
        let btn = UIButton(type: .custom)
        btn.setImage(UIImage(named: "icon_toSmall"), for: .normal)
        btn.tag = 3;
        btn.addTarget(self, action: #selector(handleActionControl(_:)), for: .touchUpInside)
        return btn;
    }();
    
    lazy var timer: Timer = {
        let timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(handActionTimer(_:)), userInfo: nil, repeats: true)
        RunLoop.main.add(timer, forMode: .common)
        return timer;
    }()
    
    @objc func handActionTimer(_ timer: Timer) {
        labTwo.text = "\((startDate as NSDate).agoInfo(1, length: 5))"

    }
}

extension UIView{
    /// 计时显示
    
}
