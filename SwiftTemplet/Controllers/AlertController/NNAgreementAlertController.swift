//
//  NNAgreementAlertController.swift
//  SwiftTemplet
//
//  Created by Bin Shang on 2020/4/17.
//  Copyright © 2020 BN. All rights reserved.
//

import UIKit

@objc protocol NNAgreementAlertControllerDelegate: NSObjectProtocol {
    @objc func agreementAlertVC(_ controller: NNAgreementAlertController, sender: UIButton);
    @objc func agreementAlertTextView(_ textView: UITextView, shouldInteractWith URL: URL, in characterRange: NSRange) -> Bool;
}

@objcMembers class NNAgreementAlertController: UIViewController {
        
    weak var delegate: NNAgreementAlertControllerDelegate?
    
    let contentInset = UIEdgeInsets.zero
    
    var actionTitles = ["取消", "确定"]{
        didSet{
            btns.removeAll()
            for e in oldValue.enumerated() {
                let button: UIButton = {
                    let button = UIButton(type: .custom);
                    button.setTitle(e.element, for: .normal);
                    button.setTitleColor(UIColor.theme, for: .normal)
                    button.titleLabel?.font = UIFont.systemFont(ofSize: 15);
                    button.titleLabel?.adjustsFontSizeToFitWidth = true;
                    button.titleLabel?.minimumScaleFactor = 1.0;
                    button.isExclusiveTouch = true;
                    
                    button.backgroundColor = UIColor.white;
                    button.tag = e.offset;
                    button.addActionHandler({ (control) in
                        guard let sender = control as? UIButton else { return }
//                        DDLog(sender.currentTitle)
                        self.delegate?.agreementAlertVC(self, sender: sender)
                        
                    }, for: .touchUpInside)
                    
                    return button;
                }()
                btns.append(button)
            }
        }
    }
    
    var btns: [UIButton] = []
//    var btnSeprateView: [UIView] = []

    lazy var textView: UITextView = {
        let textView = UITextView(frame: .zero)
        textView.isSelectable = true
        textView.isEditable = false
        textView.delegate = self

        return textView
    }()
    
    private lazy var horLineView: UIView = {
        let view = UIView(frame: .zero)
        view.backgroundColor = UIColor.line
        return view
    }()
    
    private lazy var verLineView: UIView = {
        let view = UITextView(frame: .zero)
        view.backgroundColor = UIColor.line
        return view
    }()
    
    // MARK: -lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        title = "用户协议和隐私政策"
        actionTitles = ["暂不使用", "同意"]
        setupContent()

        view.addSubview(textView)
        view.addSubview(horLineView)
        view.addSubview(verLineView)

        for e in btns.enumerated() {
            view.addSubview(e.element)
        }
        
//        view.getViewLayer()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        setupConstraints()
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        ///UIImage()透明
        navigationController?.navigationBar.shadowImage = UIImage()
        navigationController?.navigationBar.setBackgroundImage(UIImage(color: .white), for: .default)
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.black.withAlphaComponent(0.8)]
        setupConstraints()
        
        UIApplication.shared.keyWindow?.endEditing(true)
    }
    
    func setupConstraints() {
        let itemHeight: CGFloat = 50

        textView.snp.remakeConstraints { (make) in
            make.top.equalToSuperview().offset(0);
            make.left.equalToSuperview().offset(12);
            make.right.equalToSuperview().offset(-12);
            make.bottom.equalToSuperview().offset(-itemHeight-5);
        }
        
        horLineView.snp.makeConstraints { (make) in
            make.top.equalTo(textView.snp.bottom).offset(0);
            make.left.equalToSuperview().offset(0);
            make.right.equalToSuperview().offset(0);
            make.height.equalTo(0.33);
        }
        
        if btns.count == 0 {
            return
        }
        
        switch btns.count {
        case 1:
            btns[0].snp.remakeConstraints { (make) in
                make.left.equalToSuperview().offset(0);
                make.right.equalToSuperview().offset(0);
                make.bottom.equalToSuperview().offset(0);
                make.height.equalTo(itemHeight);
            }
             
            verLineView.isHidden = true

        case 3:
            btns[0].snp.remakeConstraints { (make) in
                make.left.equalToSuperview().offset(0);
                make.bottom.equalToSuperview().offset(0);
                make.width.equalToSuperview().multipliedBy(0.33)
                make.height.equalTo(itemHeight);
            }
                        
            btns[2].snp.remakeConstraints { (make) in
                make.right.equalToSuperview().offset(0);
                make.bottom.equalToSuperview().offset(0);
                make.width.equalToSuperview().multipliedBy(0.33)
                make.height.equalTo(itemHeight);
            }

            btns[1].snp.remakeConstraints { (make) in
                make.left.equalTo(btns[0].snp.right).offset(0);
                make.right.equalTo(btns[2].snp.left).offset(0);
                make.bottom.equalToSuperview().offset(0);
                make.height.equalTo(itemHeight);
            }
            
            verLineView.isHidden = true

//            DDLog(view.frame, btns[0], btns[1], btns[2])

        default:
            btns[0].snp.remakeConstraints { (make) in
                make.left.equalToSuperview().offset(0);
                make.bottom.equalToSuperview().offset(0);
                make.width.equalToSuperview().multipliedBy(0.5).offset(-0.5)
                make.height.equalTo(itemHeight);
            }
            
            btns[1].snp.remakeConstraints { (make) in
                make.right.equalToSuperview().offset(0);
                make.bottom.equalToSuperview().offset(0);
                make.width.equalToSuperview().multipliedBy(0.5).offset(-0.5)
                make.height.equalTo(itemHeight);
            }
            
            verLineView.isHidden = false
            verLineView.snp.remakeConstraints { (make) in
                make.centerX.equalToSuperview().offset(0)
                make.top.equalTo(horLineView.snp.bottom).offset(0)
                make.bottom.equalToSuperview().offset(0);
                make.width.equalTo(0.33);
            }
        }

    }
    

    func setupContent() {
        title = "用户协议和隐私政策"
        
        let tapTexts = ["《用户协议》", "《隐私政策》",];
        let tapUrls = ["http://api.parkingwang.com/app/iop/register.html", "http://api.parkingwang.com/app/iop/register.html",];
        let string = "\t用户协议和隐私政策请您务必审值阅读、充分理解 “用户协议” 和 ”隐私政策” 各项条款，包括但不限于：为了向您提供即时通讯、内容分享等服务，我们需要收集您的设备信息、操作日志等个人信息。\n\t您可阅读\(tapTexts[0])和\(tapTexts[1])了解详细信息。如果您同意，请点击 “同意” 开始接受我们的服务;"
        textView.setupUserAgreements(string, tapTexts: tapTexts, tapUrls: tapUrls)
    }
}

extension NNAgreementAlertController: UITextViewDelegate{
    func textView(_ textView: UITextView, shouldInteractWith URL: URL, in characterRange: NSRange) -> Bool {
        if delegate != nil {
            return delegate!.agreementAlertTextView(textView, shouldInteractWith: URL, in: characterRange)
        }
        return true
    }
}
