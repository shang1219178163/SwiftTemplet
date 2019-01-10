//
//  FifthViewControlle.swift
//  SwiftTemplet
//
//  Created by hsf on 2018/9/6.
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
                
                
            }
        }
        
        textField.frame = CGRect(x: imgView.frame.minX, y: imgView.frame.maxY+20, width: imgView.frame.width, height: 35)
        view.addSubview(textField)
        
        
        view.addActionHandler { (sender:UITapGestureRecognizer?, view:UIView, idx:Int) in
            self.textField.endEditing(true)
        }
        view.getViewLayer()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        imgView.snp.makeConstraints { (make) in
            make.left.top.equalToSuperview().offset(20)
            make.width.height.equalTo(100)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    //MARK: - layz
    lazy var imgView: UIImageView = {
        var view = UIImageView(frame: .zero);
        view.image = UIImage(named: "bug1.png")

        return view;
    }();

    
    lazy var textField: UITextField = {
        var view = UITextField(frame: .zero);
        view.textAlignment = .left;
        view.contentVerticalAlignment = .center;
        view.autocapitalizationType = .none;
        view.autocorrectionType = .no;
        view.clearButtonMode = .whileEditing;
        view.backgroundColor = .white;
        return view
    }()
}
