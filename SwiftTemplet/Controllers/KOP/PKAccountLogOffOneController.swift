//
//	PKAccountLogOffOneController.swift
//	MacTemplet
//
//	Created by shang on 2020/11/17 14:38
//	Copyright © 2020 shang. All rights reserved.
//


import UIKit
import SwiftExpand

///
@objcMembers class PKAccountLogOffOneController: UIViewController{
        

    lazy var rightBtn: UIButton = {
        let view = UIButton.create(title: "Next", textColor: .white, backgroundColor: .theme)
        view.addActionHandler({ (sender) in
            let controller = TmpViewController()
            self.navigationController?.pushViewController(controller, animated: true)
            
        }, for: .touchUpInside)
        return view
    }()
    
    lazy var headerView: NNTableFooterView = {
        let view = NNTableFooterView.create("退出当前账号", topPadding: 30)
        view.backgroundColor = .clear
        view.labelTop.textColor = .black
        view.labelTop.textAlignment = .center
        view.labelTop.font = UIFont.systemFont(ofSize: 15, weight: .medium)
        
        view.label.font = UIFont.systemFont(ofSize: 11)
        view.label.textAlignment = .center

//        view.btn.setBackgroundColor(.systemRed, for: .normal)
        view.btn.setTitle("", for: .normal)
        view.btn.setBackgroundImage(UIImage(named: "img_warning"), for: .normal)
        view.btn.backgroundColor = .clear
        
//        view.btn.addTarget(self, action: #selector(handleAction(_:)), for: .touchUpInside)
        view.labelTop.text = "将189****9810所绑定账号注销"
        view.label.text = "注意，注销账号后以下信息将清空且无法找回"
        view.layoutBlock = { sender in
            sender.btn.snp.remakeConstraints { (make) in
                make.centerX.equalToSuperview()
                make.top.equalToSuperview().offset(25)
                make.width.height.equalTo(50)
            }
            
            sender.labelTop.snp.remakeConstraints { (make) in
                make.top.equalTo(sender.btn.snp.bottom).offset(5)
                make.left.equalToSuperview().offset(10)
                make.right.equalToSuperview().offset(-10)
                make.height.equalTo(20)
            }
            
            sender.label.snp.remakeConstraints { (make) in
                make.top.equalTo(sender.labelTop.snp.bottom).offset(5)
                make.left.right.equalTo(sender.labelTop)
                make.height.equalTo(20)
            }
        }
        
        return view
    }()
    
    lazy var labelTip: UILabel = {
        let view = UILabel(frame: .zero);
        view.font = UIFont.systemFont(ofSize: 13)
        view.textColor = .gray;
        view.textAlignment = .left;
        view.numberOfLines = 0
        
        let message = "1、你的账号基本信息（手机）将被清空且无法恢复\n2、你的账号所含等级、经验将被清空且无法恢复\n3、你的账号所有积分将被清空且无法恢复\n4、你的账号绑定的社交账号信息（微信、支付宝），将被解绑且无法恢复"
        view.attributedText = NSAttributedString.createAttString(message, textTaps: [], font: view.font, color: .textColor6,  lineSpacing: 5)
        return view;
    }()
    
    
    lazy var lineDashView: NNLineDashView = {
        let view = NNLineDashView(frame: .zero);
//        let view = NNLineDashView(frame: CGRectMake(0, 0, kScreenWidth, 5));

        view.style = .line
        return view;
    }()
    
    lazy var contentView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.layer.cornerRadius = 5
        view.layer.masksToBounds = true
        
        view.addSubview(headerView)
        view.addSubview(lineDashView)
        view.addSubview(labelTip)
        return view
    }()
    
    
    lazy var btnCancel: UIButton = {
        let view = UIButton.create(title: "取消", textColor: .white, backgroundColor: .theme)
        view.titleLabel?.font = UIFont.systemFont(ofSize: 17)
        view.addActionHandler({ (sender) in
            if let obj = sender as? UIButton {
                DDLog(obj.currentTitle as Any)
                
            }
        }, for: .touchUpInside)
        
        return view;
    }()
    
    lazy var btnDone: UIButton = {
        let view = UIButton.create(title: "下一步", textColor: .textColor3, backgroundColor: .white)
        view.titleLabel?.font = UIFont.systemFont(ofSize: 17)
        view.addActionHandler({ (sender) in
            if let obj = sender as? UIButton {
                DDLog(obj.currentTitle as Any)
                
                self.navigationController?.pushVC(PKAccountLogOffTwoController.self)
            }
        }, for: .touchUpInside)
        
        return view;
    }()
        
    // MARK: - lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupExtendedLayout()
        title = "注销账号"
//        navigationItem.rightBarButtonItem = UIBarButtonItem(customView: rightBtn)

        setupUI()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        contentView.snp.makeConstraints { (make) in
            make.top.equalToSuperview().offset(15);
            make.left.equalToSuperview().offset(10);
            make.right.equalToSuperview().offset(-10);
            make.height.equalTo(320);
        }
        
        lineDashView.snp.makeConstraints { (make) in
            make.centerY.equalTo(contentView).offset(0);
            make.left.equalToSuperview().offset(10);
            make.right.equalToSuperview().offset(-10);
            make.height.equalTo(5);
        }
        
        headerView.snp.makeConstraints { (make) in
            make.top.equalToSuperview().offset(0);
            make.left.equalToSuperview().offset(10);
            make.right.equalToSuperview().offset(-10);
            make.bottom.equalTo(lineDashView.snp.top).offset(-15)
        }

        labelTip.snp.makeConstraints { (make) in
            make.top.equalTo(lineDashView.snp.bottom).offset(10);
            make.left.equalToSuperview().offset(10);
            make.right.equalToSuperview().offset(-10);
            make.bottom.equalToSuperview().offset(-15);
        }

        btnCancel.snp.makeConstraints { (make) in
            make.top.equalTo(contentView.snp.bottom).offset(50);
            make.left.equalToSuperview().offset(10);
            make.right.equalToSuperview().offset(-10);
            make.height.equalTo(45);
        }

        btnDone.snp.makeConstraints { (make) in
            make.top.equalTo(btnCancel.snp.bottom).offset(20);
            make.left.equalToSuperview().offset(10);
            make.right.equalToSuperview().offset(-10);
            make.height.equalTo(45);
        }
        
        
        //阴影
        contentView.layer.shadowColor = UIColor.hexValue(0x000000, a: 0.12).cgColor
        contentView.layer.shadowColor = UIColor.hexValue(0x000000, a: 0.12).cgColor
        contentView.layer.shadowRadius = 3.5
        contentView.layer.shadowOpacity = 1
        contentView.layer.shadowOffset = CGSize(width: 0, height: 0)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated);
        
    }
        
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - funtions
    func setupUI() {
        edgesForExtendedLayout = []
        view.backgroundColor = UIColor.hexValue(0xF6F5F8, a: 1)

//        navigationItem.rightBarButtonItem = UIBarButtonItem(customView: rightBtn)
        
        view.addSubview(contentView)
        view.addSubview(btnCancel)
        view.addSubview(btnDone)
        
//        view.getViewLayer()
    }

}
        
