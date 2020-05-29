//
//  NNPlateKeyboardController.swift
//  SwiftTemplet
//
//  Created by Bin Shang on 2019/12/11.
//  Copyright © 2019 BN. All rights reserved.
//

import UIKit
import SwiftExpand
import NNPlateKeyboard

class NNPlateKeyboardController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setupExtendedLayout()
        view.backgroundColor = UIColor.white

        title = "车牌键盘重构"
        textField.frame = CGRect.make(10, 20, kScreenWidth - 20, 35)
        view.addSubview(textField)
        
//        textField.inputView = keyboardView;
        textField.becomeFirstResponder()
        
        _ = view.addGestureTap { (reco) in
            self.textField.resignFirstResponder()
        }

        view.getViewLayer()
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        textField.text = ""
    }
    
    //MARK: -lazy
    lazy var textField: UITextField = {
        let view = UITextField()
        view.font = UIFont.systemFont(ofSize: 14)
        view.placeholder = "请输入车牌号码"
        view.delegate = self;
        return view
    }()
        
    lazy var plateKeyboard: NNPlateKeyboard = {
        let keyboard = NNPlateKeyboard()
        keyboard.bindTextField(textField, showSearch: true)
        keyboard.numType = .airport
        keyboard.delegate = self;

        return keyboard;
    }()
}

extension NNPlateKeyboardController: UITextFieldDelegate {

    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        DDLog(plateKeyboard.plateNumber)
        return true
    }
}


extension NNPlateKeyboardController: NNPlateKeyboardDeleagte {

    func plateDidChange(_ plate: String, complete: Bool) {
        textField.text = plate
    }
}
