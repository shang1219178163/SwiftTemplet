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
        
        view.addActionHandler { (sender:UITapGestureRecognizer?, view:UIView, idx:Int) in
            self.textField.endEditing(true)
        }
        
        imgViewOne.image = UIImageNamed("icon_select_YES@2x的副本")
        view.addSubview(imgViewOne)
        imgViewOne.tintColor = UIColor.theme

        
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
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    //MARK: - layz
    lazy var imgView: UIImageView = {
        var view = UIImageView(frame: .zero);
        view.autoresizingMask = UIView.AutoresizingMask(rawValue: UIView.AutoresizingMask.flexibleWidth.rawValue | UIView.AutoresizingMask.flexibleHeight.rawValue)
        view.image = UIImage(named: "bug.png")

        return view;
    }();

    lazy var imgViewOne: UIImageView = {
        var view = UIImageView(frame: .zero);
        view.autoresizingMask = UIView.AutoresizingMask(rawValue: UIView.AutoresizingMask.flexibleWidth.rawValue | UIView.AutoresizingMask.flexibleHeight.rawValue)
        view.image = UIImageNamed("icon_select_YES")

        return view;
    }();
    
    lazy var textField: UITextField = {
        var view = UITextField(frame: .zero);
        view.autoresizingMask = UIView.AutoresizingMask(rawValue: UIView.AutoresizingMask.flexibleWidth.rawValue | UIView.AutoresizingMask.flexibleHeight.rawValue)
        view.textAlignment = .left;
        view.contentVerticalAlignment = .center;
        view.autocapitalizationType = .none;
        view.autocorrectionType = .no;
        view.clearButtonMode = .whileEditing;
        view.backgroundColor = .white;
        return view
    }()
}
