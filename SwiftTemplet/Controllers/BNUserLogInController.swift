//
//  BNUserLogInController.swift
//  SwiftTemplet
//
//  Created by Bin Shang on 2019/5/21.
//  Copyright © 2019 BN. All rights reserved.
//

import UIKit
import SnapKit
import SwiftExpand
import RxSwift
import RxCocoa

let minUsernameLength = 8;
let minPasswordLength = 6;

class BNUserLogInController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        title = "RxSwift函数响应型编程"
        
        view.addSubview(userNameTextField)
        view.addSubview(userNameValidLab)
        view.addSubview(userPwdTextField)
        view.addSubview(userPwdValidLab)
        view.addSubview(loginBtn)
        
        setupConfigure();
        
        view.getViewLayer()
    }
    
    func setupConfigure() -> Void {
        let disposeBag: DisposeBag = DisposeBag()
        
        userNameValidLab.text = "Username has to be at least \(minUsernameLength) characters"
        userPwdValidLab.text = "Password has to be at least \(minPasswordLength) characters"
        
        let usernameValid = userNameTextField.rx.text.orEmpty
            .map { $0.count >= minUsernameLength }
            .share(replay: 1)

        let passwordValid = userPwdTextField.rx.text.orEmpty
            .map { $0.count >= minPasswordLength }
            .share(replay: 1)
        
        let everythingValid = Observable.combineLatest(usernameValid, passwordValid) { $0 && $1 }
            .share(replay: 1)
        
        usernameValid
            .bind(to: userPwdTextField.rx.isEnabled)
            .disposed(by: disposeBag)
        
        usernameValid
            .bind(to: userNameValidLab.rx.isHidden)
            .disposed(by: disposeBag)
        
        passwordValid
            .bind(to: userPwdValidLab.rx.isHidden)
            .disposed(by: disposeBag)
        
        everythingValid
            .bind(to: loginBtn.rx.isEnabled)
            .disposed(by: disposeBag)
        
        loginBtn.rx.tap
            .subscribe(onNext: { [weak self] _ in DDLog(self!.loginBtn) })
            .disposed(by: disposeBag)
        
        //        loginBtn.rx.tap
        //            .subscribe(onNext: { [weak self] _ in
        //            DDLog("__登录__")
        //
        //            }, onError: { (error)->Void in
        //                DDLog("onError:\(error)")
        //
        //        }, onCompleted: { ()->Void in
        //            DDLog("onCompleted")
        //
        //        }, onDisposed: { ()->Void in
        //            DDLog("onDisposed")
        //
        //        })
        //        .disposed(by: disposeBag);
        //
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews();
        
        userNameTextField.snp.makeConstraints { (make) in
            make.top.equalToSuperview().offset(64)
            make.left.equalToSuperview().offset(kX_GAP)
            make.right.equalToSuperview().offset(-kX_GAP)
            make.height.equalTo(35)
        }
        
        userNameValidLab.snp.makeConstraints { (make) in
            make.top.equalTo(userNameTextField.snp.bottom).offset(kPadding)
            make.left.equalToSuperview().offset(kX_GAP)
            make.right.equalToSuperview().offset(-kX_GAP)
            make.height.equalTo(20)
        }
        
        userPwdTextField.snp.makeConstraints { (make) in
            make.top.equalTo(userNameValidLab.snp.bottom).offset(20)
            make.left.equalToSuperview().offset(kX_GAP)
            make.right.equalToSuperview().offset(-kX_GAP)
            make.height.equalTo(35)
        }
        
        userPwdValidLab.snp.makeConstraints { (make) in
            make.top.equalTo(userPwdTextField.snp.bottom).offset(kPadding)
            make.left.equalToSuperview().offset(kX_GAP)
            make.right.equalToSuperview().offset(-kX_GAP)
            make.height.equalTo(20)
        }
        
        loginBtn.snp.makeConstraints { (make) in
            make.top.equalTo(userPwdValidLab.snp.bottom).offset(40)
            make.left.equalToSuperview().offset(kX_GAP)
            make.right.equalToSuperview().offset(-kX_GAP)
            make.height.equalTo(45)
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated);
        
    }

    // MARK: -lazy
    lazy var userNameTextField: UITextField = {
        var view = UITextField();
        view.placeholder = "用户名:8~20字符"
        return view;
    }()
    
    lazy var userPwdTextField: UITextField = {
        var view = UITextField();
        view.placeholder = "用户密码:6~20字符(不能纯数字)"
        return view;
    }()
    
    lazy var userNameValidLab: UILabel = {
        var view = UILabel();
        view.textColor = .red
        return view;
    }()
    
    lazy var userPwdValidLab: UILabel = {
        var view = UILabel();
        view.textColor = .red

        return view;
    }()
    
    lazy var loginBtn: UIButton = {
//        var btn = UIButton(type: .custom);
        var view = UIView.createBtn(title: "登录", imgName: nil);
        view.setTitleColor( .white, for: .normal)
        view.setTitleColor( .black, for: .disabled)
        view.setTitle("用户名/密码错误", for: .disabled)
        view.backgroundColor = .theme
        return view;
    }()
}
