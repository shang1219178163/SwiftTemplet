//
//  PlateNumberController.swift
//  SwiftTemplet
//
//  Created by Bin Shang on 2019/7/9.
//  Copyright © 2019 BN. All rights reserved.
//

import UIKit

import SwiftExpand
import NNPlateKeyboard

class PlateNumberController: UIViewController {
  
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        title = "车牌号键盘"
        
        let rightBtn = UIButton.createBtnBarItem("next")
        rightBtn.addActionHandler({ (control) in
            let controller = PlateNumOriginController()
            self.navigationController?.pushViewController(controller, animated: true);
        })
        navigationItem.rightBarButtonItem = UIBarButtonItem(customView: rightBtn)

        
        view.addGestureTap { (reco) in
            UIApplication.shared.keyWindow?.endEditing(true)

        }
        
        view.addSubview(textField)
        
        plateKeyboard.bindTextField(textField, showSearch: true)
        plateKeyboard.plateNumber = "京H123456"
        textField.becomeFirstResponder()


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
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
//        textField.becomeFirstResponder()
        
//        let format = "yyyy-MM-dd HH:mm:ss";
//        let time = "2019-05-08 18:32:12"
        let format = "yyyy-MM";
        let time = "2019-05"
        
        let isSame = DateFormatter.isSameFormat(time, fmt: format)
        DDLog("isSame", isSame);
    }
        
    //MARK: -funtions
    func setupInputView() {
        textField.inputView = {
            let view: UIView = UIView(frame: CGRectMake(0, 0, kScreenWidth, 216))
            view.backgroundColor = UIColor.green
            
            return view
        }()
        
        textField.inputAccessoryView = {
            let view: UIView = UIView(frame: CGRectMake(0, 0, kScreenWidth, 50))
            view.backgroundColor = UIColor.red
            
            return view
        }()
    }
    
    //MARK: -lazy
    lazy var textField: UITextField = {
        let view: UITextField = UITextField(frame: .zero)
        view.placeholder = "  请输入车牌号码"
   
        return view
    }()
    
    ///车牌键盘
    lazy var plateKeyboard: NNPlateKeyboard = {
        let keyboard = NNPlateKeyboard()
        keyboard.numType = .airport
        keyboard.delegate = self;

        return keyboard;
    }()
  
}

extension PlateNumberController: NNPlateKeyboardDeleagte{
    
    func plateDidChange(_ plate: String, complete: Bool) {
        textField.text = plate
    }
    
}
