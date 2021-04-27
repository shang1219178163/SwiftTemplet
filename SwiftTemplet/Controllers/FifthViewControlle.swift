//
//  FifthViewControlle.swift
//  SwiftTemplet
//
//  Created by Bin Shang on 2018/9/6.
//  Copyright © 2018年 BN. All rights reserved.
//

import UIKit

import SwiftExpand

class FifthViewControlle: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    
        imgView.frame = CGRect(x: 20, y: 20, width: 100, height: 100)
        view.addSubview(imgView)
        
        imgView.addGestureTap { [weak self] (obj:UIGestureRecognizer) in
            if obj is UITapGestureRecognizer {
                self?.imgView.tintColor = UIColor.random
                UIColor.theme = (self?.imgView.tintColor)!
                
                self!.textField.backgroundColor = UIColor.theme
            }
        }
        
        textField.frame = CGRect(x: imgView.frame.minX, y: imgView.frame.maxY+20, width: imgView.frame.width, height: 35)
        view.addSubview(textField)
        
        view.addGestureTap { (tap) in
            self.textField.endEditing(true)
        }
        
        imgViewOne.image = UIImage(named: "icon_select_YES")
        view.addSubview(imgViewOne)
        imgViewOne.tintColor = UIColor.theme

        view.addSubview(radioBtn)
        view.addSubview(radioBtnOne)

        view.getViewLayer()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        imgView.snp.makeConstraints { (make) in
            make.left.top.equalToSuperview().offset(20)
            make.width.height.equalTo(100)
        }
        
        imgViewOne.snp.makeConstraints { (make) in
            make.top.equalToSuperview().offset(20)
            make.left.equalTo(imgView.snp.right).offset(20)
            make.width.height.equalTo(100*0.3)
        }
        
        radioBtn.snp.makeConstraints { (make) in
            make.top.equalTo(imgView.snp.bottom).offset(20);
            make.left.equalTo(imgView);
            make.size.equalTo(CGSize(width: 100, height: 35));
        }
        
        radioBtnOne.snp.makeConstraints { (make) in
            make.top.equalTo(radioBtn).offset(0);
            make.left.equalTo(radioBtn.snp.right).offset(20);
            make.size.equalTo(CGSize(width: 100, height: 35));
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    //MARK: - layz
    lazy var imgView: UIImageView = {
        let view = UIImageView(frame: .zero);
        view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        view.image = UIImage(named: "bug.png")

        return view;
    }();

    lazy var imgViewOne: UIImageView = {
        let view = UIImageView(frame: .zero);
        view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        view.image = UIImage(named: "icon_select_YES")

        return view;
    }();
    
    lazy var textField: UITextField = {
        let view = UITextField(frame: .zero);
        view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        view.textAlignment = .left;
        view.contentVerticalAlignment = .center;
        view.autocapitalizationType = .none;
        view.autocorrectionType = .no;
        view.clearButtonMode = .whileEditing;
        view.backgroundColor = .white;
        return view
    }()
    
    lazy var radioBtn: UIButton = {
        let btn = UIButton(type: .custom)
        btn.setImage(UIImage(named: "icon_select_NO"), for: .normal)
        btn.setImage(UIImage(named: "icon_select_YES"), for: .selected)
        btn.setTitle("未选择", for: .normal)
        btn.setTitle("已选择", for: .selected)
        btn.setTitleColor(UIColor.gray, for: .normal)
        
        btn.imageView?.tintColor = UIColor.theme;
        btn.setTitleColor(btn.imageView?.tintColor, for: .selected)
        
        btn.imageView?.contentMode = .scaleAspectFit;
        btn.addTarget(self, action: #selector(handleActionSender(_:)), for: .touchUpInside)
     
        return btn
    }()
    
    @objc func handleActionSender(_ sender: UIButton) {
        sender.isSelected = !sender.isSelected

    }
    
    lazy var radioBtnOne: NNButton = {
        let btn = NNButton(type: .custom)

        return btn
    }()
}
