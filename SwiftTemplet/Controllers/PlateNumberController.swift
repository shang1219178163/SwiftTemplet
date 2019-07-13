//
//  PlateNumberController.swift
//  SwiftTemplet
//
//  Created by Bin Shang on 2019/7/9.
//  Copyright © 2019 BN. All rights reserved.
//

import UIKit

import SwiftExpand

class PlateNumberController: UIViewController, PWHandlerDelegate {
  
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        title = "车牌号键盘"
        
        createBtnBarItem("segment", isLeft: true) { (tap, view, idx) in
            let controller = TitleViewController()
            self.navigationController?.pushViewController(controller, animated: true);
        }
        
        createBtnBarItem("Do", isLeft: false) { (tap, view, idx) in
            let controller = PlateNumOriginController()
            self.navigationController?.pushViewController(controller, animated: true);
        }
        
        
        view.addGestureTap { (reco) in
            UIApplication.shared.keyWindow?.endEditing(true)

        }
     
        
        view.addSubview(textField)
        
//        handler.inputCollectionView = handler.collectionView
//
//        handler.inputTextfield = textField
//        handler.inputTextfield.inputView = handler.keyboardView
//        handler.inputTextfield.inputAccessoryView = {
//            let switchWidth: CGFloat = 70.0
//
//            let view: UIView = {
//                let view: UIView = UIView(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 50))
//
//                view.layer.borderWidth = 1;
//                view.layer.borderColor = handler.cellBorderColor.cgColor;
//                return view;
//            }()
//
//            handler.inputCollectionView.frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width - switchWidth, height: 50)
//            view.addSubview(handler.inputCollectionView)
//
//            let btn: UIButton = {
//                let view: UIButton = UIButton(type: .custom)
//                view.frame = CGRect(x: UIScreen.main.bounds.width - switchWidth, y: 0, width: switchWidth, height: 50)
//                view.setImage(UIImage(named: "plateNumberSwitch_N"), for: .normal)
//                view.setImage(UIImage(named: "plateNumberSwitch_H"), for: .selected)
//                view.imageEdgeInsets = UIEdgeInsets(top: 8, left: 0, bottom: 8, right: 0)
//                view.imageView?.contentMode = .scaleAspectFit
//
//                view.layer.borderWidth = 1;
//                view.layer.borderColor = handler.cellBorderColor.cgColor;
//                view.addActionHandler({ (control) in
//                    control.isSelected = !control.isSelected;
//                    DDLog(control.isSelected)
//                    self.handler.changeInputType(isNewEnergy: control.isSelected)
//
//                }, for: .touchUpInside)
//                return view;
//            }()
//
//            view.addSubview(btn)
//            return view;
//        }()
        
//        setupKeyboradView(textField, handler: handler)
        handler.setPlate(plate: "京H123456", type: PWKeyboardNumType.wuJing)


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
    
//    @objc func isDateString(_ format: String = "yyyy-MM-dd HH:mm:ss") -> Bool {
//        if time.count == dateFormat.count {
//            if time[4] == "-" && time[7] == "-" && time[13] == ":" && time[16] == ":" {
//                return true
//            }
//        }
//        return false
//    }
    
    //MARK: -plate
    func plateDidChange(plate: String, complete: Bool) {
        DDLog(plate, complete)
        textField.text = plate
    }
    func plateInputComplete(plate: String) {
        
    }
    
    //MARK: -funtions
    func setupInputView() -> Void {
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

//    func setupKeyboradView(_ textField: UITextField, handler: PWHandler) -> Void {
//
//        handler.inputTextfield = textField
//        handler.inputTextfield.inputView = handler.keyboardView
//        handler.inputTextfield.inputAccessoryView = {
//            let switchWidth: CGFloat = 70.0
//
//            let view: UIView = {
//                let view: UIView = UIView(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 50))
//
//                view.layer.borderWidth = 1;
//                view.layer.borderColor = handler.cellBorderColor.cgColor;
//                return view;
//            }()
//
//            handler.inputCollectionView.frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width - switchWidth, height: 50)
//            view.addSubview(handler.inputCollectionView)
//
//            let btn: UIButton = {
//                let view: UIButton = UIButton(type: .custom)
//                view.frame = CGRect(x: UIScreen.main.bounds.width - switchWidth, y: 0, width: switchWidth, height: 50)
//                view.setImage(UIImage(named: "plateNumberSwitch_N"), for: .normal)
//                view.setImage(UIImage(named: "plateNumberSwitch_H"), for: .selected)
//                view.imageEdgeInsets = UIEdgeInsets(top: 8, left: 0, bottom: 8, right: 0)
//                view.imageView?.contentMode = .scaleAspectFit
//
//                view.layer.borderWidth = 1;
//                view.layer.borderColor = handler.cellBorderColor.cgColor;
//                view.addActionHandler({ (control) in
//                    control.isSelected = !control.isSelected;
////                    DDLog(control.isSelected)
//                    self.handler.changeInputType(isNewEnergy: control.isSelected)
//
//                }, for: .touchUpInside)
//                return view;
//            }()
//
//            view.addSubview(btn)
//            return view;
//        }()
//    }
    
    
    //MARK: -lazy
    lazy var textField: UITextField = {
        let view: UITextField = UITextField(frame: .zero)
        view.placeholder = "  请输入车牌号码"
   
        return view
    }()
    
    lazy var handler: PWHandler = {
        let keyboradHandler = PWHandler();
//        keyboradHandler.setKeyBoardView(view: textField);
        keyboradHandler.bindTextField(textField)
        keyboradHandler.textFontSize = 18;
        keyboradHandler.delegate = self;
        
        return keyboradHandler;
    }()

  
}
