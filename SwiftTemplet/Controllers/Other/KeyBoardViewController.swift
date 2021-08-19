//
//  KeyBoardViewController.swift
//  SwiftTemplet
//
//  Created by Bin Shang on 2019/3/15.
//  Copyright © 2019 BN. All rights reserved.
//

import UIKit

class KeyBoardViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        view.addSubview(textField)
        keyBoardView.inputSource = textField

        view.getViewLayer()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        textField.snp.makeConstraints { (make) in
            make.top.equalToSuperview().offset(20)
            make.left.equalToSuperview().offset(20)
            make.right.equalToSuperview().offset(-20)
            make.height.equalTo(35)
        }
    }

    lazy var textField: UITextField = {
        let view = UITextField(frame: .zero)
        view.inputView = keyBoardView
        return view
    }()
    
    lazy var keyBoardView: ZMKeyBoardView = {
        let view = ZMKeyBoardView()
        return view
    }()
}
