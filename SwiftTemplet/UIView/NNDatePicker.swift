//
//  NNDatePicker.swift
//  SwiftTemplet
//
//  Created by Bin Shang on 2018/9/7.
//  Copyright © 2018年 BN. All rights reserved.
//

import UIKit
import SwiftExpand

@objc protocol NNDatePickerDelegate{
    
    @objc func datePicker(_ picker: NNDatePicker, index: Int)
}


class NNDatePicker: UIView {
    
    weak var delegate: NNDatePickerDelegate?

    typealias ViewClick = (NNDatePicker, Int) -> Void;
    var viewBlock: ViewClick?;

    private let btnSize = CGSize(width: 60, height: 44);
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }

    convenience init(model: UIDatePicker.Mode = .date) {
        self.init(frame: UIScreen.main.bounds);

        self.datePicker.datePickerMode = model;
        self.addSubview(contentView);

        self.addGestureTap { (tap) in
            self.dismiss();
        };
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func show() {
//        guard let keyWindow = UIApplication.shared.keyWindow as? UIWindow else { return }
        UIApplication.shared.keyWindow?.endEditing(true)
        UIApplication.shared.keyWindow?.addSubview(self);
        
        contentView.transform = contentView.transform.translatedBy(x: 0, y: contentView.frame.height)
        UIView.animate(withDuration: 0.35, animations: {
            self.backgroundColor = UIColor.black.withAlphaComponent(0.3);
            self.contentView.transform = .identity;

        }, completion: nil);
    }

    func dismiss() {
        UIView.animate(withDuration: 0.35, animations: {
            self.backgroundColor = UIColor.black.withAlphaComponent(0);
            self.contentView.transform = self.contentView.transform.translatedBy(x: 0, y: self.contentView.frame.height)

        }) { (isFinished) in
            if isFinished {
                self.removeFromSuperview();
            }
        }
    }
   
    func block(_ action:@escaping ViewClick) {
        self.viewBlock = action;
    }
    
    
    //MARK: - layz
    lazy var contentView: UIView = {
        let view = UIView(frame: CGRect(x: 0, y: UIScreen.sizeHeight - (44 + kPickerViewHeight), width: UIScreen.sizeWidth, height: (44 + kPickerViewHeight)));
       
        view.backgroundColor = UIColor(r: 230, g: 230, b: 230, a: 1);
        
        btnCancel.frame = CGRect(x: 0, y: 0, width: btnSize.width, height: btnSize.height);
        btnSure.frame = CGRect(x: UIScreen.sizeWidth - 60, y: 0, width: btnSize.width, height: btnSize.height);
        datePicker.frame = CGRect(x: 0, y: 44, width: UIScreen.sizeWidth, height: kPickerViewHeight);
        label.frame = CGRect(x: btnSize.width, y: 0, width: UIScreen.sizeWidth - btnSize.width*2, height: 44);

        view.addSubview(btnCancel);
        view.addSubview(btnSure);
        view.addSubview(label);
        view.addSubview(datePicker);
        
        return view;
    }();
    
    lazy var datePicker: UIDatePicker = {
        let datePicker = UIDatePicker();
        datePicker.datePickerMode = .date;
        datePicker.locale = Locale(identifier: "zh_CN");
        datePicker.backgroundColor = .white;
        if #available(iOS 13.4, *) {
            datePicker.preferredDatePickerStyle = .wheels
        }
        
        datePicker.addTarget(self, action: #selector(handleAction(_:)), for: .valueChanged);
        return datePicker;
    }();
    
    lazy var btnCancel: UIButton = {
        let btn = UIButton(type: .custom);
//        btn.frame = CGRect(x: 0, y: 0, width: 60, height: 44);
        btn.tag = 0;

        btn.titleLabel?.font = UIFont.systemFont(ofSize: 16);
        btn.setTitle(kTitleCancell, for: .normal);
        btn.setTitleColor(.lightGray, for: .normal);
        btn.addTarget(self, action: #selector(handleAction(_:)), for:.touchUpInside);
        
        return btn;
    }();
    
    lazy var btnSure: UIButton = {
        let btn = UIButton(type: .custom);
//        btn.frame = CGRect(x: 0, y: 0, width: 60, height: 44);
        btn.tag = 1;

        btn.titleLabel?.font = UIFont.systemFont(ofSize: 16);
        btn.setTitle(kTitleSure, for: .normal);
        btn.setTitleColor(.systemBlue, for: .normal);
        btn.addTarget(self, action: #selector(handleAction(_:)), for:.touchUpInside);

        return btn;
    }();
    
    lazy var label: UILabel = {
        let lab = UILabel(frame: CGRect(x: btnSize.width, y: 0, width: UIScreen.sizeWidth - btnSize.width*2, height: 44));
        lab.tag = 10;
        lab.text = "请选择";
        lab.textColor = .lightGray;
        lab.textAlignment = .center;
        return lab;
    }();
    
    //MRAK: - funtion
    @objc func handleAction(_ sender: UIControl) {
        if let control = sender as? UIDatePicker {
            DDLog(control.date);
        }
        else if let control = sender as? UIButton {
            DDLog(control.titleLabel?.text);
            if control.titleLabel?.text == kTitleSure {
                delegate?.datePicker(self, index: sender.tag)
                self.viewBlock?(self, sender.tag);
                
            }
            self.dismiss();
        }
    }
    
}
