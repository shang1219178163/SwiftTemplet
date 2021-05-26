//
//  NNAnnouncementAlertView.swift
//  SwiftTemplet
//
//  Created by Bin Shang on 2021/3/24.
//  Copyright © 2021 BN. All rights reserved.
//

import UIKit
import SnapKit
import SwiftExpand

@objc protocol NNAnnouncementAlertViewDelegate: NSObjectProtocol {
    @objc optional func annoView(_ view: NNAnnouncementAlertView, sender: UIButton)
}

///弹窗
@objcMembers class NNAnnouncementAlertView: UIView {
    
    weak var delegate: NNAnnouncementAlertViewDelegate?

    let edge = UIEdgeInsetsMake(120, 20, 120, 20)
    
    let btnH: CGFloat = 45
    let contentPadding: CGFloat = 15

    var urlString: String = ""{
        willSet{
            DispatchQueue.main.async{
                self.webView.urlString = newValue
            }
        }
    }

    var htmlString: String = ""{
        willSet{
//            webView.loadHTMLString(newValue, baseURL: nil)
            self.webView.htmlString = newValue
        }
    }
    
    var block: ((NNAnnouncementAlertView, UIButton) -> Void)?

    private var timer: Timer?
    private var countdown = 5
    
    private var isHiddenTitleAndDate = true

    // MARK: -lifecycle
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.frame = UIScreen.main.bounds
        addSubview(contentView);

        contentView.layer.cornerRadius = 10
        backgroundColor = UIColor.black.withAlphaComponent(0.3)

        label.font = UIFont.systemFont(ofSize: 20, weight: .semibold)
        label.textColor = .textColor3

        labelSub.font = UIFont.boldSystemFont(ofSize: 13)
        labelSub.textColor = .textColor9
        
//        label.text = "关于增值功能免费升级及相关奖励 政策说明"
//        labelSub.text = "2020-12-12 12:00:00"
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        setupConstraint()
    }
    
    override func willMove(toSuperview newSuperview: UIView?) {
        super.willMove(toSuperview: newSuperview)
        
        btn.isEnabled = false
        btn.setTitle("我知道了(\(countdown)s)", for: .normal);
    }
    
    override func didMoveToSuperview() {
        super.didMoveToSuperview()
        
        var duration = countdown
        timer?.invalidate()
        timer = Timer.scheduled(1, repeats: true) { (timer) in
            duration -= 1
            if duration == 0 {
                timer.invalidate()
                self.btn.isEnabled = true
                self.btn.setTitle("我知道了", for: .normal);
            } else {
                self.btn.setTitle("我知道了(\(duration)s)", for: .normal);
            }
        }
    }
    
    //MARK: -funtions

    func setupConstraint() {
        if bounds.height <= 10 {
            return
        }
        
        contentView.snp.makeConstraints { (make) in
            make.edges.equalToSuperview().inset(edge)
        }
        
        btnTitle.snp.remakeConstraints { (make) in
            make.top.equalToSuperview().offset(0)
            make.left.equalToSuperview().offset(0)
            make.right.equalToSuperview().offset(0)
            make.height.equalTo(100)
        }
        
        if isHiddenTitleAndDate {
            btn.snp.remakeConstraints { (make) in
                make.centerX.equalToSuperview()
                make.bottom.equalToSuperview().offset(-contentPadding-5)
                make.width.equalToSuperview().multipliedBy(0.5)
                make.height.equalTo(btnH)
            }
            
            webView.snp.remakeConstraints { (make) in
                make.top.equalTo(btnTitle.snp.bottom).offset(0)
                make.left.equalTo(label).offset(0)
                make.right.equalTo(label).offset(0)
                make.bottom.equalTo(btn.snp.top).offset(-contentPadding)
            }
            
            btn.layer.cornerRadius = btnH*0.5
            btn.clipsToBounds = true
            return
        }
        
        label.snp.remakeConstraints { (make) in
            make.top.equalTo(btnTitle.snp.bottom).offset(contentPadding)
            make.left.equalTo(btnTitle).offset(contentPadding)
            make.right.equalTo(btnTitle).offset(-contentPadding)
            make.height.equalTo(kH_LABEL*2)
        }
        
        labelSub.snp.remakeConstraints { (make) in
            make.top.equalTo(label.snp.bottom).offset(0)
            make.left.right.equalTo(label)
            make.height.equalTo(kH_LABEL)
        }
                
        btn.snp.remakeConstraints { (make) in
            make.centerX.equalToSuperview()
            make.bottom.equalToSuperview().offset(-contentPadding-5)
            make.width.equalToSuperview().multipliedBy(0.5)
            make.height.equalTo(btnH)
        }
    
        webView.snp.remakeConstraints { (make) in
            make.top.equalTo(labelSub.snp.bottom).offset(kPadding)
            make.left.equalTo(label).offset(-kPadding)
            make.right.equalTo(label).offset(kPadding)
            make.bottom.equalTo(btn.snp.top).offset(-contentPadding)
        }
        
        btn.layer.cornerRadius = btnH*0.5
        btn.clipsToBounds = true
    }
    
    //MARK: -lazy
    lazy var btnTitle: UIButton = {
        let view = UIButton(type: .custom)
        view.setTitle("艾润停车王公告栏", for: .normal);
        view.setTitleColor(.white, for: .normal);
        view.titleLabel?.font = UIFont.systemFont(ofSize: 28, weight: .bold)
        view.adjustsImageWhenHighlighted = false
        view.setBackgroundImage(UIImage(named: "bg_announce_top"), for: .normal)
        
        view.addActionHandler({ (sender) in
            DDLog(sender.currentTitle as Any)

        }, for: .touchUpInside)
        return view
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
    
    lazy var labelSub: UILabel = {
        let view = UILabel(frame: .zero);
        view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        view.textAlignment = .left;
        view.numberOfLines = 0;
        view.lineBreakMode = .byCharWrapping;
        view.isUserInteractionEnabled = true;
        
        return view;
    }()
    
    lazy var webView: NNWebView = {
        let view: NNWebView = NNWebView(frame: .zero)
        view.loadingProgressColor = .systemGreen
//        view.webView.scrollView.delegate = self
        view.delegate = self
        return view
    }()
     
    lazy var btn: UIButton = {
        let view = UIButton(type: .custom)
        view.setTitle("我知道了(5s)", for: .normal);
        view.setTitleColor(.white, for: .normal);
        view.setBackgroundImage(UIImage(color: .lightBlue), for: .normal)
        view.setBackgroundImage(UIImage(color: UIColor.lightBlue.withAlphaComponent(0.5)), for: .disabled)

        view.adjustsImageWhenHighlighted = false
        view.isEnabled = false

//        view.backgroundColor = .lightBlue
//        let image = UIImage(color: .systemGreen)
//        view.setBackgroundImage(image, for: .normal)
        
        view.addActionHandler({ (sender) in
            self.dismiss()
            self.block?(self,  sender)
            self.delegate?.annoView?(self, sender: sender)
            
        }, for: .touchUpInside)
        return view
    }()
    
    lazy var contentView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.addSubview(btnTitle);
        view.addSubview(label);
        view.addSubview(labelSub);
        view.addSubview(webView);
        view.addSubview(btn);

        return view
    }()
}


extension NNAnnouncementAlertView: NNWebViewDelegate{
    
    func webView(_ webView: WKWebView, url: URL) {
//        DDLog(absoluteString)
        
        switch url.absoluteString {
        case "iop://Goods?openNames=30027&activeName=960001":
            let vc = UIViewController()
            vc.view.backgroundColor = .lightGreen
            vc.view.addGestureTap { (reco) in
                vc.dismiss(animated: true, completion: nil)
            }
            vc.present()
            
        default:
            break
        }
    }
    
    
    func webView(_ webView: WKWebView, decidePolicyFor NavigationAction: WKNavigationAction, decisionHandler: @escaping (WKNavigationActionPolicy) -> Void) {
        decisionHandler(.allow)
    }

}
