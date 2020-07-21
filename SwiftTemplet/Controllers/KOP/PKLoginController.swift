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

class PKLoginController: UIViewController {
    
    lazy var label: UILabel = {
        let view = UILabel(frame: .zero);
        view.text = "登录注册享受更多福利";
        view.font = UIFont.systemFont(ofSize: 15);
        view.textAlignment = .center;
        view.textColor = .black;
        return view;
    }()
    
    lazy var labelTip: UILabel = {
        let view = UILabel(frame: .zero);
        view.text = "未注册手机号验证后自动创建为停车王账号";
        view.font = UIFont.systemFont(ofSize: 15);
        view.textAlignment = .left;
        view.textColor = .gray;
        return view;
    }()
    
    lazy var labelAgreement: UILabel = {
        let view = UILabel(frame: .zero);
        view.text = "同意《用户协议》和《隐私政策》";
        view.font = UIFont.systemFont(ofSize: 15);
        view.textAlignment = .left;
        view.numberOfLines = 1
        view.adjustsFontSizeToFitWidth = true
        return view;
    }()
    
    lazy var btnClose: UIButton = {
        let view = UIButton(type: .custom);
        
        view.titleLabel?.font = UIFont.systemFont(ofSize: 16);
        view.setTitle("关闭", for: .normal);
        view.setTitleColor(UIColor.theme, for: .normal);
        view.addActionHandler({ (control) in
            guard let sender = control as? UIButton else { return }
            DDLog(sender.currentTitle!)

        }, for: .touchUpInside)
        return view;
    }()
    
    lazy var btn: UIButton = {
        let view = UIButton(type: .custom);
        
        view.titleLabel?.font = UIFont.systemFont(ofSize: 16);
        view.setTitle("登录", for: .normal);
        view.setTitleColor(UIColor.theme, for: .normal);
        
        view.layer.borderColor = UIColor.gray.cgColor;
        view.layer.borderWidth = 1;
        view.layer.cornerRadius = 20;
        
        view.addActionHandler({ (control) in
            guard let sender = control as? UIButton else { return }
            DDLog(sender.currentTitle!)
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

        view.addActionHandler({ (control) in
            guard let sender = control as? UIButton else { return }
            DDLog(sender)
            sender.isSelected.toggle()
        }, for: .touchUpInside)
        return view;
    }()
    
    lazy var btnLoginWx: UIButton = {
        let view = UIButton(type: .custom);
        
        view.titleLabel?.font = UIFont.systemFont(ofSize: 16);
        view.setTitle("微信登录", for: .normal);
        view.setTitleColor(UIColor.theme, for: .normal);
        view.addActionHandler({ (control) in
            guard let sender = control as? UIButton else { return }
            DDLog(sender.currentTitle!)

        }, for: .touchUpInside)
        return view;
    }()
    
    lazy var btnLoginQQ: UIButton = {
        let view = UIButton(type: .custom);
        
        view.titleLabel?.font = UIFont.systemFont(ofSize: 16);
        view.setTitle("QQ登录", for: .normal);
        view.setTitleColor(UIColor.theme, for: .normal);
        view.addActionHandler({ (control) in
            guard let sender = control as? UIButton else { return }
            DDLog(sender.currentTitle!)

        }, for: .touchUpInside)
        return view;
    }()
    
    lazy var btnLoginWeiBo: UIButton = {
        let view = UIButton(type: .custom);
        
        view.titleLabel?.font = UIFont.systemFont(ofSize: 16);
        view.setTitle("微博登录", for: .normal);
        view.setTitleColor(UIColor.theme, for: .normal);
        view.addActionHandler({ (control) in
            guard let sender = control as? UIButton else { return }
            DDLog(sender.currentTitle!)

        }, for: .touchUpInside)
        return view;
    }()
    
    lazy var textFieldView: NNTextFieldView = {
        var view = NNTextFieldView(frame: .zero)
        view.label.text = "手机号码:"
        view.textfield.placeholder = "请输入手机号码"
        view.label.isHidden = true

        view.btn.addActionHandler { (control) in
            guard let sender = control as? UIButton else { return }
            DDLog(sender.currentTitle!)
        }
        view.block { (textFieldView, textField) in
            DDLog(textField.text ?? "")
        }
        return view
    }()
    
    lazy var textFieldCodeView: NNTextFieldView = {
        var view = NNTextFieldView(frame: .zero)
        view.label.text = "验  证  码:"
        view.textfield.placeholder = "请输入验证码"
        view.btn.isHidden = true
        view.label.isHidden = true

        view.btn.addActionHandler { (control) in
            guard let sender = control as? UIButton else { return }
            DDLog(sender.currentTitle!)
        }
        view.block { (textFieldView, textField) in
            DDLog(textField.text ?? "")
        }
        return view
    }()
    
    
    // MARK: -lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        view.addSubview(btnClose)
        view.addSubview(label)
        view.addSubview(textFieldView)
        view.addSubview(textFieldCodeView)
        view.addSubview(labelTip)
        
        view.addSubview(btnRadio)
        view.addSubview(labelAgreement)
        view.addSubview(btn)
        view.addSubview(btnLoginWx)
        view.addSubview(btnLoginQQ)
        view.addSubview(btnLoginWeiBo)
        
        let rightBtn = UIButton.createBtnBarItem("next")
        rightBtn.addActionHandler({ (control) in
            let controller = NNOfflineTipController()
            self.navigationController?.pushViewController(controller, animated: true);
        })
        navigationItem.rightBarButtonItem = UIBarButtonItem(customView: rightBtn)
        
        view.getViewLayer()
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
                
        textFieldView.snp.makeConstraints { (make) in
            make.top.equalTo(label.snp.bottom).offset(20);
            make.left.equalToSuperview().offset(40)
            make.right.equalToSuperview().offset(-40)
            make.height.equalTo(40)
        }
        
        textFieldCodeView.snp.makeConstraints { (make) in
            make.top.equalTo(textFieldView.snp.bottom).offset(5);
            make.left.right.width.height.equalTo(textFieldView)
        }
        
        labelTip.snp.makeConstraints { (make) in
            make.top.equalTo(textFieldCodeView.snp.bottom).offset(0);
            make.left.right.width.equalTo(textFieldCodeView)
            make.height.equalTo(25)
        }
        
        btn.snp.makeConstraints { (make) in
            make.top.equalTo(labelTip.snp.bottom).offset(30);
            make.left.equalToSuperview().offset(40)
            make.right.equalToSuperview().offset(-40)
            make.height.equalTo(35)
        }
        
        btnRadio.snp.makeConstraints { (make) in
            make.top.equalTo(btn.snp.bottom).offset(20);
            make.left.equalTo(btn).offset(40)
            make.height.equalTo(30)
            make.width.equalTo(30)
        }
        
        labelAgreement.snp.makeConstraints { (make) in
            make.top.equalTo(btn.snp.bottom).offset(20);
            make.left.equalTo(btnRadio.snp.right).offset(10)
            make.right.equalTo(btn)
            make.height.equalTo(btnRadio)
        }
                
        let Xgap: CGFloat = 85;
        let list = [btnLoginWx, btnLoginQQ, btnLoginWeiBo].filter { $0.isHidden == false }
        list.snp.distributeViewsAlong(axisType: .horizontal, fixedItemLength: 50, leadSpacing: Xgap, tailSpacing: Xgap)
        list.snp.makeConstraints { (make) in
            make.top.equalTo(labelAgreement.snp.bottom).offset(20);
            make.height.equalTo(50)
        }
        
        DDLog(labelAgreement.frame)
        updateAgreement()
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
                
    }
    
    // MARK: -funtions
    func updateAgreement() {
        let tapTexts = ["用户协议", "隐私政策"]
        labelAgreement.text = "同意《\(tapTexts[0])》和《\(tapTexts[1])》"
        labelAgreement.attributedText = NSAttributedString.attString(labelAgreement.text!, textTaps: tapTexts, font: 13, tapFont: 13)

        _ = labelAgreement.addGestureTap { (reco) in
            guard let sender = reco as? UITapGestureRecognizer, let label = reco.view as? UILabel else { return }
            sender.didTapAttributedTextIn(label: label, tapTexts: tapTexts) { (text, idx) in
                DDLog(text, idx)
                
                let agreementVC = NNWebViewController()
                agreementVC.title = text
                switch idx {
                case 0:
                    agreementVC.urlString = ""
                case 1:
                    agreementVC.urlString = ""

                default:
                    break
                }
                self.navigationController?.pushViewController(agreementVC, animated: true)
            }
        }
    }


}