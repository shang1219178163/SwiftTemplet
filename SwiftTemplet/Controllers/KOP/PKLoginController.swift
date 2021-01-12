//
//  LoginController.swift
//  SwiftTemplet
//
//  Created by Bin Shang on 2020/7/15.
//  Copyright © 2020 BN. All rights reserved.
//

import UIKit
import SwiftExpand
import SnapKitExtend
import RxSwift
import RxCocoa

class PKLoginController: UIViewController {
    
    lazy var label: UILabel = {
        let view = UILabel(frame: .zero);
        view.text = "登录注册享受更多福利";
        view.font = UIFont.systemFont(ofSize: 16);
        view.textAlignment = .center;
        view.textColor = .black;
        return view;
    }()
    
    lazy var labelTip: UILabel = {
        let view = UILabel(frame: .zero);
        view.text = "未注册手机号验证后自动创建为停车王账号";
        view.font = UIFont.systemFont(ofSize: 12);
        view.textAlignment = .center;
        view.textColor = .gray;
        return view;
    }()
    
    lazy var labelAgreement: UILabel = {
        let view = UILabel(frame: .zero);
        view.text = "同意《用户协议》和《隐私政策》"
        view.font = UIFont.systemFont(ofSize: 12);
        view.textAlignment = .left;
        view.numberOfLines = 1
        view.adjustsFontSizeToFitWidth = true
        return view;
    }()
    
    lazy var seperateView: UIView = {
        let view = UIView(frame: .zero);
        view.backgroundColor = .line
        return view;
    }()
    
    lazy var labelSeperate: UILabel = {
        let view = UILabel(frame: .zero);
        view.text = "其他登录方式"
        view.textColor = .textColor9

        view.font = UIFont.systemFont(ofSize: 12);
        view.textAlignment = .center;
        view.numberOfLines = 1
        view.adjustsFontSizeToFitWidth = true
        view.backgroundColor = .white
        return view;
    }()
    
    lazy var btnClose: UIButton = {
        let view = UIButton(type: .custom);
        
//        view.titleLabel?.font = UIFont.systemFont(ofSize: 16);
//        view.setTitle("关闭", for: .normal);
//        view.setTitleColor(UIColor.theme, for: .normal);
        view.setImage(UIImage(named: "icon_quit"), for: .normal)
        view.addActionHandler({ (sender) in
            
            DDLog(sender.currentTitle ?? "无标题")

        }, for: .touchUpInside)
        return view;
    }()
    
    lazy var btn: UIButton = {
        let view = UIButton(type: .custom);
        
        view.titleLabel?.font = UIFont.systemFont(ofSize: 16);
        view.setTitle("登录", for: .normal);
        view.setTitleColor(.white, for: .normal)
        view.setBackgroundColor(.theme, for: .normal)
        view.setBackgroundColor(.lightGray, for: .disabled);
        
//        view.layer.borderColor = UIColor.gray.cgColor;
//        view.layer.borderWidth = 1;
        view.layer.masksToBounds = true;
        view.isEnabled = false
        
        view.addActionHandler({ (sender) in
            
            DDLog(sender.currentTitle ?? "无标题")
            if !self.btnRadio.isSelected {
                NNProgressHUD.showText("您必须同意用户协议和隐私政策才可登录")
                return
            }
            let controller = PKBindPhoneController()
            self.navigationController?.pushViewController(controller, animated: true)

        }, for: .touchUpInside)
        return view;
    }()
    
    lazy var btnRadio: UIButton = {
        let view = UIButton(type: .custom);
        
        view.titleLabel?.font = UIFont.systemFont(ofSize: 16);
//        view.setTitle("登录", for: .normal);
//        view.setTitleColor(UIColor.theme, for: .normal);
        
        view.setBackgroundImage(UIImage(named: "btn_selected_NO"), for: .normal)
        view.setBackgroundImage(UIImage(named: "btn_selected_YES"), for: .selected)

        view.addActionHandler({ (sender) in
            DDLog(sender)
            sender.isSelected.toggle()
        }, for: .touchUpInside)
        return view;
    }()
    
    lazy var btnLoginWx: UIButton = {
        let view = UIButton(type: .custom);
        
//        view.titleLabel?.font = UIFont.systemFont(ofSize: 16);
//        view.setTitle("微信登录", for: .normal);
//        view.setTitleColor(UIColor.theme, for: .normal);
        view.setBackgroundImage(UIImage(named: "icon_weixin"), for: .normal)

        view.addActionHandler({ (sender) in
            DDLog(sender.currentTitle ?? "无标题")

        }, for: .touchUpInside)
        return view;
    }()
    
    lazy var btnLoginQQ: UIButton = {
        let view = UIButton(type: .custom);
        
        view.titleLabel?.font = UIFont.systemFont(ofSize: 16);
        view.setTitle("QQ登录", for: .normal);
        view.setTitleColor(UIColor.theme, for: .normal);
        view.addActionHandler({ (sender) in
            DDLog(sender.currentTitle ?? "无标题")

        }, for: .touchUpInside)
        return view;
    }()
    
    lazy var btnLoginWeiBo: UIButton = {
        let view = UIButton(type: .custom);
        
        view.titleLabel?.font = UIFont.systemFont(ofSize: 16);
        view.setTitle("微博登录", for: .normal);
        view.setTitleColor(UIColor.theme, for: .normal);
        view.addActionHandler({ (sender) in
            DDLog(sender.currentTitle ?? "无标题")

        }, for: .touchUpInside)
        return view;
    }()
    
    lazy var btnLoginAppleID: UIButton = {
        let view = UIButton(type: .custom);
        
        view.titleLabel?.font = UIFont.systemFont(ofSize: 16);
        view.setTitle("Apple登录", for: .normal);
        view.setTitleColor(.theme, for: .normal);
        view.addActionHandler({ (sender) in
            DDLog(sender.currentTitle ?? "无标题")

        }, for: .touchUpInside)
        return view;
    }()
    
    lazy var textFieldView: NNTextFieldView = {
        let view = NNTextFieldView(frame: .zero)
        view.isBackDelete = false

        view.label.text = "手机号码:"
        view.textfield.placeholder = "手机号码"
        view.label.isHidden = true
        view.btn.isHidden = true

        view.btn.addActionHandler { (sender) in
            DDLog(sender.currentTitle ?? "无标题")
        }
        view.block { (textFieldView, text) in
            DDLog(text)
        }
        return view
    }()
    
    lazy var textFieldCodeView: NNTextFieldView = {
        let view = NNTextFieldView(frame: .zero)
        view.label.text = "验  证  码:"
        view.textfield.placeholder = "短信验证码"
        view.label.isHidden = true
//        view.btn.isHidden = true
        view.btn.isEnabled = false
        view.btn.layer.borderColor = UIColor.lightGray.cgColor

        view.btn.addActionHandler { (sender) in
            
            DDLog(sender.currentTitle ?? "无标题")
        }
        view.block { (textFieldView, text) in
            DDLog(text)
            
//            if let phone = self.textFieldView.textfield.text {
//                self.btn.isEnabled = (phone.count >= 11 && text.count >= 4)
//            }
        }
        return view
    }()
    
    let minimalUsernameLength = 11
    let minimalPasswordLength = 4

    let disposeBag = DisposeBag()
    
    // MARK: -lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        edgesForExtendedLayout = []
        view.backgroundColor = .white
        
        view.addSubview(btnClose)
        view.addSubview(label)
        view.addSubview(textFieldView)
        view.addSubview(textFieldCodeView)
        view.addSubview(labelTip)
        
        view.addSubview(btnRadio)
        view.addSubview(labelAgreement)
        view.addSubview(btn)
        view.addSubview(seperateView)
        view.addSubview(labelSeperate)

        view.addSubview(btnLoginWx)
        view.addSubview(btnLoginQQ)
        view.addSubview(btnLoginWeiBo)
        
        let rightBtn = UIButton.createBtnBarItem("next")
        rightBtn.addActionHandler({ (sender) in
            let controller = NNOfflineTipController()
            self.navigationController?.pushViewController(controller, animated: true);
        })
        navigationItem.rightBarButtonItem = UIBarButtonItem(customView: rightBtn)
                
        btnLoginQQ.isHidden = true
        btnLoginWeiBo.isHidden = true
        btnLoginAppleID.isHidden = true
        
        checkInput()
//        view.getViewLayer()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        btnClose.snp.makeConstraints { (make) in
            make.top.equalToSuperview().offset(8)
            make.right.equalToSuperview().offset(-10);
            make.width.equalTo(35);
            make.height.equalTo(35);
        }
        
        label.snp.makeConstraints { (make) in
            make.centerY.equalTo(btnClose)
            make.left.equalToSuperview().offset(45);
            make.right.equalToSuperview().offset(-45);
            make.height.equalTo(25);
        }
        
        labelTip.snp.makeConstraints { (make) in
            make.top.equalTo(label.snp.bottom).offset(0);
            make.left.equalToSuperview().offset(15);
            make.right.equalToSuperview().offset(-15);
            make.height.equalTo(20)
        }
                
        textFieldView.snp.makeConstraints { (make) in
            make.top.equalTo(labelTip.snp.bottom).offset(20);
            make.left.equalToSuperview().offset(15)
            make.right.equalToSuperview().offset(-15)
            make.height.equalTo(45)
        }
        
        textFieldCodeView.snp.makeConstraints { (make) in
            make.top.equalTo(textFieldView.snp.bottom).offset(5);
            make.left.right.width.height.equalTo(textFieldView)
        }
                
        btn.snp.makeConstraints { (make) in
            make.top.equalTo(textFieldCodeView.snp.bottom).offset(30);
            make.left.equalToSuperview().offset(40)
            make.right.equalToSuperview().offset(-40)
            make.height.equalTo(45)
        }
        
        btnRadio.snp.makeConstraints { (make) in
            make.top.equalTo(btn.snp.bottom).offset(10);
            make.left.equalTo(btn).offset(40)
            make.height.equalTo(20)
            make.width.equalTo(20)
        }
        
        labelAgreement.snp.makeConstraints { (make) in
            make.top.equalTo(btnRadio).offset(0);
            make.left.equalTo(btnRadio.snp.right).offset(10)
            make.right.equalTo(btn)
            make.height.equalTo(btnRadio)
        }
        
        seperateView.snp.makeConstraints { (make) in
            make.top.equalTo(btnRadio.snp.bottom).offset(30);
            make.left.equalToSuperview().offset(15)
            make.right.equalToSuperview().offset(-15)
            make.height.equalTo(0.5)
        }
        
        let labelSeperateSize = labelSeperate.sizeThatFits(.zero)
        labelSeperate.snp.remakeConstraints { (make) in
            make.centerX.equalToSuperview().offset(0)
            make.centerY.equalTo(seperateView).offset(0)
            make.width.equalTo(labelSeperateSize.width)
            make.height.equalTo(20)
        }
                
        let Xgap: CGFloat = 85;
        let list = [btnLoginWx, btnLoginQQ, btnLoginWeiBo, btnLoginAppleID].filter { $0.isHidden == false }
        if list.count == 1 {
            list[0].snp.makeConstraints { (make) in
                make.centerX.equalToSuperview()
                make.top.equalTo(labelSeperate.snp.bottom).offset(20);
                make.width.height.equalTo(40)
            }
        } else {
            list.snp.distributeViewsAlong(axisType: .horizontal, fixedItemLength: 50, leadSpacing: Xgap, tailSpacing: Xgap)
            list.snp.makeConstraints { (make) in
                make.top.equalTo(labelAgreement.snp.bottom).offset(20);
                make.height.equalTo(50)
            }
        }
        
        btn.layer.cornerRadius = 22.5;
        updateAgreement()
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
                
    }
    
    // MARK: -funtions
    func updateAgreement() {
        let tapTexts = ["《用户协议》", "《隐私政策》"]
        labelAgreement.text = "同意\(tapTexts[0])和\(tapTexts[1])"
        labelAgreement.attributedText = NSAttributedString.attString(labelAgreement.text!, textTaps: tapTexts, font: 13, tapFont: 13)

        _ = labelAgreement.addGestureTap { (reco) in
            guard let sender = reco as? UITapGestureRecognizer, let label = reco.view as? UILabel else { return }
            sender.didTapAttributedTextIn(label: label, tapTexts: tapTexts) { (text, idx) in
                DDLog(text, idx)
                
                let agreementVC = NNWebViewController()
                agreementVC.title = text
                switch idx {
                case 0:
                    agreementVC.urlString = AppPlatformAgreement
                case 1:
                    agreementVC.urlString = AppPrivacyAgreement

                default:
                    break
                }
                self.navigationController?.pushViewController(agreementVC, animated: true)
            }
        }
    }
    
    func checkInput() {
        ///参数校验
        let usernameValid = textFieldView.textfield.rx.text.orEmpty
            .map { [self] in $0.count >= minimalUsernameLength }
            .share(replay: 1)
        
        let passwordValid = textFieldCodeView.textfield.rx.text.orEmpty
//            .debug()
            .map { [self] in $0.count >= minimalPasswordLength }
            .share(replay: 1)
        
        usernameValid
            .bind(to: textFieldCodeView.btn.rx.isEnabled)
            .disposed(by: disposeBag)

        Observable.combineLatest(usernameValid, passwordValid) { $0 && $1 }
        .share(replay: 1)
        .bind(to: btn.rx.isEnabled)
        .disposed(by: disposeBag)

        
        textFieldCodeView.btn.rx.observeWeakly(Bool.self, "enabled", options: .new)
            .subscribe { (value) in
                guard let value = value else { return }
                self.textFieldCodeView.btn.layer.borderColor = value == true ? UIColor.theme.cgColor : UIColor.lightGray.cgColor
                self.textFieldCodeView.btn.layer.borderWidth = 1

            } onError: { (error) in
        
            } onCompleted: {
        
            } onDisposed: {
            
            }
            .disposed(by: disposeBag)

        
//        textFieldCodeView.btn.addObserverBlock(forKeyPath: "enabled") { (value1, value2, value3) in
//            DDLog(value1)
//        }
    }

}
