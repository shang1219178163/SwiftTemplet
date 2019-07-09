
//
//  PlateNumOriginController.swift
//  SwiftTemplet
//
//  Created by Bin Shang on 2019/7/9.
//  Copyright © 2019 BN. All rights reserved.
//

import UIKit
import SwiftExpand

class PlateNumOriginController: UIViewController, PWHandlerDelegate {
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        title = "车牌号键盘(原始)"
        
        createBtnBarItem("Do", isLeft: false) { (tap, view, idx) in
            self.handler.vehicleKeyBoardEndEditing()
        }
        
        view.addSubview(btn)
        
        btn.setBackgroundImage(UIImageColor(.green), for: .normal)
        
//        setupKeyboradView(textField, handler: handler)
//        handler.setKeyBoardView(view: btn);

//        handler.setPlate(plate: "京H123456", type: PWKeyboardNumType.wuJing)
        
        view.getViewLayer()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        btn.snp.makeConstraints { (make) in
            make.top.equalToSuperview().offset(20)
            make.left.equalToSuperview().offset(20)
            make.right.equalToSuperview().offset(-20)
            make.height.equalTo(35)
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        handler.vehicleKeyBoardBecomeFirstResponder()
    }
    
    //MARK: -plate
    func palteDidChnage(plate: String, complete: Bool) {
        DDLog(plate, complete)
//        btn.setTitle(plate, for: .normal)
    }
    func plateInputComplete(plate: String) {
        
    }
    
    //MARK: -funtions
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
//                    //                    DDLog(control.isSelected)
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
    lazy var btn: UIButton = {
        let view: UIButton = UIButton(type: .custom)
        view.setTitle("请输入车牌号码", for: .normal)
        view.setTitleColor(UIColor.gray, for: .normal)
        view.addActionHandler({ (control) in
            self.handler.vehicleKeyBoardBecomeFirstResponder()
            
        }, for: .touchUpInside)
        return view
    }()
    
    lazy var handler: PWHandler = {
        let keyboradHandler = PWHandler();
        
        keyboradHandler.setKeyBoardView(view: btn);
        keyboradHandler.textFontSize = 18;
        keyboradHandler.delegate = self;
        
        return keyboradHandler;
    }()
    
}
