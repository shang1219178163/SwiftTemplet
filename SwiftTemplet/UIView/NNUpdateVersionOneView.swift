//
//	NNUpdateVersionOneView.swift
//	MacTemplet
//
//	Created by shang on 2020/08/11 20:29
//	Copyright © 2020 shang. All rights reserved.
//


import UIKit
import SnapKit
import SwiftExpand
        
@objc protocol NNUpdateVersionOneViewDelegate{
    @objc func updateVersionOneViewDelegate(_ view: NNUpdateVersionOneView, sender: UIButton)
    
}
        
///
@objcMembers class NNUpdateVersionOneView: UIView {

    weak var delegate: NNUpdateVersionOneViewDelegate?
    
    var inset = UIEdgeInsets(top: 160, left: 60, bottom: 10, right: 60)
    
    var contentCornerRadius: CGFloat = 8
    
           
    var appStoreID = kAppStoreID
    var isForceUpdate = false{
        willSet{
            btnCancell.isHidden = newValue
        }
    }
    
    //MARK: -lazy
    lazy var imgView: UIImageView = {
        var view = UIImageView(frame: .zero);
        view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        view.contentMode = .scaleAspectFit
        view.image = UIImage(named: "img_update")
        
        return view;
    }()
    
    lazy var labelVers: UILabel = {
        let view = UILabel(frame: .zero);
        view.font = UIFont.systemFont(ofSize: 14, weight: .semibold)
        view.text = "发现新版本 v1.0.0";
        view.textColor = .black;
        view.textAlignment = .center;
        return view;
    }()
    
    lazy var labelTip: UILabel = {
        let view = UILabel(frame: .zero);
        view.font = UIFont.systemFont(ofSize: 12)
        view.text = "升级功能：";
        view.textColor = .gray;
        view.textAlignment = .left;
        return view;
    }()
    
    lazy var labelContent: UILabel = {
        let view = UILabel(frame: .zero);
        view.font = UIFont.systemFont(ofSize: 12)
        view.text = "请选择";
        view.textColor = .gray;
        view.textAlignment = .left;
        view.numberOfLines = 0
        return view;
    }()
    
    lazy var btnSure: UIButton = {
        let view = UIButton(type: .custom);
        view.tag = 1;
        
        view.titleLabel?.font = UIFont.systemFont(ofSize: 16);
        view.setTitle(kTitleUpdate, for: .normal);
        view.setTitleColor(.systemBlue, for: .normal);
        view.addActionHandler({ (control) in
            if let sender = control as? UIButton {
                self.delegate?.updateVersionOneViewDelegate(self, sender: sender)
            }
            UIApplication.openURLString(UIApplication.appUrlWithID(self.appStoreID))

        }, for: .touchUpInside)
        return view;
    }()
    
    lazy var btnCancell: UIButton = {
        let view = UIButton(type: .custom);
        view.tag = 0;
        
        view.titleLabel?.font = UIFont.systemFont(ofSize: 16);
        view.setTitle(kTitleCancell, for: .normal);
        view.setTitleColor(.systemRed, for: .normal);
        view.addActionHandler({ (control) in
            if let sender = control as? UIButton {
                if let sender = control as? UIButton {
                    self.delegate?.updateVersionOneViewDelegate(self, sender: sender)
                }
            }
            self.dismiss()
        }, for: .touchUpInside)
        return view;
    }()
    
    lazy var lineVer: UIView = {
        let view = UIView()
        view.backgroundColor = .line
        return view
    }()
    
    lazy var lineHor: UIView = {
        let view = UIView()
        view.backgroundColor = .line
        return view
    }()
    
    lazy var contentView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.layer.cornerRadius = contentCornerRadius
        view.layer.masksToBounds = true
        
        view.addSubview(imgView)
        view.addSubview(labelVers)
        view.addSubview(labelTip)
        view.addSubview(labelContent)
        view.addSubview(btnCancell)
        view.addSubview(btnSure)
        
        view.addSubview(lineVer)
        view.addSubview(lineHor)
        return view
    }()
    
    // MARK: -lifecycle
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.frame = UIScreen.main.bounds
        addSubview(contentView);

//        contentView.getViewLayer()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        if bounds.height <= 10 {
            return;
        }
        
        contentView.snp.makeConstraints { (make) in
            make.top.equalToSuperview().offset(inset.top)
            make.left.equalToSuperview().offset(inset.left)
            make.right.equalToSuperview().offset(-inset.right)
        }
        
        imgView.snp.makeConstraints { (make) in
            make.top.equalToSuperview().offset(10);
            make.left.equalToSuperview().offset(10);
            make.right.equalToSuperview().offset(-10);
            make.height.equalTo(88);
        }
        
        labelVers.snp.makeConstraints { (make) in
            make.top.equalTo(imgView.snp.bottom).offset(8);
            make.left.equalToSuperview().offset(10);
            make.right.equalToSuperview().offset(-10);
            make.height.equalTo(25);
        }
        
        labelTip.snp.makeConstraints { (make) in
            make.top.equalTo(labelVers.snp.bottom).offset(15);
            make.left.equalToSuperview().offset(10);
            make.right.equalToSuperview().offset(-10);
            make.height.equalTo(20);
        }
        
        let contentWidth: CGFloat = (bounds.width - inset.left - inset.right - 20)
        let contentSize = labelContent.sizeThatFits(CGSize(width: contentWidth, height: CGFloat.greatestFiniteMagnitude))
        let contentHeight = min(150, contentSize.height)
//        DDLog(contentWidth, contentSize, contentHeight)

        labelContent.snp.remakeConstraints { (make) in
            make.top.equalTo(labelTip.snp.bottom).offset(0);
            make.left.equalToSuperview().offset(10);
            make.right.equalToSuperview().offset(-10);
            make.bottom.equalToSuperview().offset(-50);
            make.height.equalTo(contentHeight);
        }
                
        if btnCancell.isHidden {
            btnSure.snp.makeConstraints { (make) in
                make.left.equalToSuperview().offset(0);
                make.right.equalToSuperview().offset(0);
                make.bottom.equalToSuperview().offset(0);
                make.height.equalTo(44);
            }
            
            lineHor.snp.makeConstraints { (make) in
                make.top.equalTo(btnSure).offset(-1);
                make.left.equalToSuperview().offset(0);
                make.right.equalToSuperview().offset(0);
                make.height.equalTo(0.5);
            }
            return
        }
        
        let items = [btnCancell, btnSure].filter { $0.isHidden == false }
        items.snp.distributeViewsAlong(axisType: .horizontal, fixedSpacing: 1, leadSpacing:0, tailSpacing: 0)
        items.snp.makeConstraints { (make) in
            make.height.equalTo(44)
            make.bottom.equalToSuperview().offset(0)
        }
        
        lineHor.snp.makeConstraints { (make) in
            make.top.equalTo(btnSure).offset(-1);
            make.left.equalToSuperview().offset(0);
            make.right.equalToSuperview().offset(0);
            make.height.equalTo(0.5);
        }
        
        lineVer.snp.makeConstraints { (make) in
            make.centerX.equalToSuperview()
            make.top.equalTo(lineHor).offset(0);
            make.bottom.equalToSuperview().offset(0);
            make.width.equalTo(0.5);
        }
        
    }
    
    
    //MARK: -funtions
    func show() {
        guard let keyWindow = UIApplication.shared.keyWindow else {
            return
        }
        keyWindow.endEditing(true)
        keyWindow.addSubview(self);
        self.center = keyWindow.center
        
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
    
    func check() {
//        let dateStr = DateFormatter.stringFromDate(Date(), fmt: kDateFormatDay)
//        if dateStr == (UserDefaults.standard.string(forKey: "lastUpdateTime") ?? "") {
//            DDLog("一天只能提醒一次")
//            return
//        }
//        UserDefaults.standard.set(dateStr, forKey: "lastUpdateTime")
//        UserDefaults.standard.synchronize()
        
        dismiss()
        UIApplication.updateVersion(appStoreID: appStoreID) { (dic, appStoreVer, releaseNotes, isUpdate) in
            if isUpdate == false {
                return;
            }

            DispatchQueue.main.async {
                self.labelVers.text = "新版本 v\(appStoreVer)"
                self.labelContent.text = releaseNotes
                self.show()
            }
        }
    }
}


extension NNUpdateVersionOneView{
    

}
