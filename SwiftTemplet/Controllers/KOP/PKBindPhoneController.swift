//
//  PKBindPhoneController.swift
//  SwiftTemplet
//
//  Created by Bin Shang on 2020/7/15.
//  Copyright © 2020 BN. All rights reserved.
//

import UIKit
import SwiftExpand
import SnapKitExtend

class PKBindPhoneController: UIViewController {
    
    lazy var labelTitle: UILabel = {
        let view = UILabel(frame: .zero);
        view.text = "绑定手机";
        view.font = UIFont.systemFont(ofSize: 20);
//        view.textAlignment = .center;
        view.textColor = .black;
        view.numberOfLines = 0

        return view;
    }()
    
    lazy var label: UILabel = {
        let view = UILabel(frame: .zero);
        view.text = """
为保障账号安全，请完成手机绑定.
绑定过程中会用到短信，请注意您的手机提示，我们将保护您个人手机号信息.
""";
        view.font = UIFont.systemFont(ofSize: 13);
//        view.textAlignment = .center;
        view.textColor = .gray;
        view.numberOfLines = 0

        return view;
    }()
        
    lazy var labelAgreement: UILabel = {
        let view = UILabel(frame: .zero);
        view.text = "同意《用户协议》和《隐私政策》";
        view.font = UIFont.systemFont(ofSize: 12);
        view.textAlignment = .left;
        view.numberOfLines = 1
        view.adjustsFontSizeToFitWidth = true
        return view;
    }()
    
    lazy var btn: UIButton = {
        let view = UIButton(type: .custom);
        
        view.titleLabel?.font = UIFont.systemFont(ofSize: 16);
        view.setTitle("绑定", for: .normal);
        view.setTitleColor(.white, for: .normal)
        view.setBackgroundColor(.theme, for: .normal)
        view.setBackgroundColor(.gray, for: .disabled);

//        view.layer.borderColor = UIColor.gray.cgColor;
//        view.layer.borderWidth = 1;
        view.layer.masksToBounds = true;
        view.isEnabled = false
        view.addActionHandler({ (control) in
            guard let sender = control as? UIButton else { return }
            DDLog(sender.currentTitle ?? "无标题")
            sender.isSelected.toggle()
            if !self.btnRadio.isSelected {
                NNProgressHUD.showText("您必须同意用户协议和隐私政策才可操作")
                return
            }
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
    
    
    lazy var textFieldView: NNTextFieldView = {
        let view = NNTextFieldView(frame: .zero)
        view.label.text = "手    机    号"
        view.textfield.placeholder = "请输入"
//        view.label.isHidden = true
        view.btn.isHidden = true

        view.btn.addActionHandler { (control) in
            guard let sender = control as? UIButton else { return }
            DDLog(sender.currentTitle ?? "无标题")
        }
        view.block { (textFieldView, text) in
            DDLog(text)
        }
        return view
    }()
    
    lazy var textFieldCodeView: NNTextFieldView = {
        let view = NNTextFieldView(frame: .zero)
        view.label.text = "短信验证码"
        view.textfield.placeholder = "请输入"
//        view.btn.isHidden = true
//        view.label.isHidden = true
//        view.btn.layer.borderColor = UIColor.clear.cgColor
        
        view.btn.addActionHandler { (control) in
            guard let sender = control as? UIButton else { return }
            DDLog(sender.currentTitle ?? "无标题")
        }
        view.block { (textFieldView, text) in
            DDLog(text)
            
            if let phone = self.textFieldView.textfield.text {
                self.btn.isEnabled = (phone.count >= 11 && text.count >= 4)
            }
            
        }
        return view
    }()
    
    
    // MARK: -lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        edgesForExtendedLayout = []
        view.backgroundColor = .white
        
        title = "绑定手机"
        view.addSubview(labelTitle)
        view.addSubview(label)
        view.addSubview(textFieldView)
        view.addSubview(textFieldCodeView)
        
        view.addSubview(btn)
        view.addSubview(btnRadio)
        view.addSubview(labelAgreement)
        
//        view.getViewLayer()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        labelTitle.snp.makeConstraints { (make) in
            make.top.equalToSuperview().offset(40)
            make.left.equalToSuperview().offset(15);
            make.right.equalToSuperview().offset(-15);
            make.height.equalTo(25);
        }
        
        let size = label.sizeThatFits(CGSize(width: self.view.bounds.width - 30, height: 0))
        label.snp.remakeConstraints { (make) in
            make.top.equalTo(labelTitle.snp.bottom).offset(10)
            make.left.right.equalTo(labelTitle)
            make.height.equalTo(size.height);
        }
                
        textFieldView.snp.makeConstraints { (make) in
            make.top.equalTo(label.snp.bottom).offset(50);
            make.left.right.equalTo(labelTitle)
            make.height.equalTo(65)
        }
        
        textFieldCodeView.snp.makeConstraints { (make) in
            make.top.equalTo(textFieldView.snp.bottom).offset(5);
            make.left.right.width.height.equalTo(textFieldView)
        }
        
        btnRadio.snp.makeConstraints { (make) in
            make.top.equalTo(textFieldCodeView.snp.bottom).offset(10);
            make.left.equalTo(textFieldView).offset(0)
            make.height.equalTo(20)
            make.width.equalTo(20)
        }
        
        labelAgreement.snp.makeConstraints { (make) in
            make.top.equalTo(btnRadio).offset(0);
            make.left.equalTo(btnRadio.snp.right).offset(10)
            make.right.equalTo(btn)
            make.height.equalTo(btnRadio)
        }
        
        btn.snp.makeConstraints { (make) in
            make.top.equalTo(btnRadio.snp.bottom).offset(50);
            make.left.equalToSuperview().offset(40)
            make.right.equalToSuperview().offset(-40)
            make.height.equalTo(45)
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
