//
//  BNDatePicker.swift
//  SwiftTemplet
//
//  Created by Bin Shang on 2018/9/7.
//  Copyright © 2018年 BN. All rights reserved.
//

import UIKit
import SwiftExpand

class BNDatePicker: UIView {
    
    typealias ViewClick = (BNDatePicker,Int) -> Void;
    var viewBlock: ViewClick?;

    private let btnSize = CGSize(width: 60, height: kNaviBarHeight);
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }

    convenience init(_ model: UIDatePicker.Mode = UIDatePicker.Mode.date) {
        self.init(frame:UIScreen.main.bounds);

        self.datePicker.datePickerMode = model;
        self.addSubview(containView);

        self.addActionHandler { (tap , view, idx) in
            self.dismiss();
        };
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func show() -> Void {
        UIApplication.shared.keyWindow?.addSubview(self);
        
        containView.transform = containView.transform.translatedBy(x: 0, y: containView.frame.height)
        UIView.animate(withDuration: 0.5, animations: {
            self.backgroundColor = UIColor.black.withAlphaComponent(0.5);
            self.containView.transform = CGAffineTransform.identity

        }, completion: nil);
    }

    func dismiss() -> Void {
        UIView.animate(withDuration: 0.5, animations: {
            self.backgroundColor = UIColor.black.withAlphaComponent(0);
            self.containView.transform = self.containView.transform.translatedBy(x: 0, y: self.containView.frame.height)

        }) { (isFinished) in
            self.removeFromSuperview();

        }
    }
   
    func block(_ action:@escaping ViewClick) -> Void {
        self.viewBlock = action;
    }
    
    
    //MARK: - layz
    lazy var containView:UIView = {
        let view = UIView(frame: CGRect(x: 0, y: UIScreen.height - (kNaviBarHeight + kPickerViewHeight), width: UIScreen.width, height: (kNaviBarHeight + kPickerViewHeight)));
       
        view.backgroundColor = UIColorRGBA(230, 230, 230, 1);
        
        btnCancel.frame = CGRect(x: 0, y: 0, width: btnSize.width, height: btnSize.height);
        btnSure.frame = CGRect(x: UIScreen.width - 60, y: 0, width: btnSize.width, height: btnSize.height);
        datePicker.frame = CGRect(x: 0, y: kNaviBarHeight, width: UIScreen.width, height: kPickerViewHeight);
        label.frame = CGRect(x: btnSize.width, y: 0, width: UIScreen.width - btnSize.width*2, height: kNaviBarHeight);

        view.addSubview(btnCancel);
        view.addSubview(btnSure);
        view.addSubview(label);
        view.addSubview(datePicker);
        
        return view;
    }();
    
    lazy var datePicker : UIDatePicker = {
        let datePicker: UIDatePicker = UIDatePicker();
        datePicker.datePickerMode = UIDatePicker.Mode.date;
        datePicker.locale = Locale(identifier: "zh_CN");
        datePicker.backgroundColor = UIColor.white;

        datePicker.addTarget(self, action: #selector(handleActionControl(sender:)), for: .valueChanged);
        return datePicker;
    }();
    
    lazy var btnCancel:UIButton = {
        let btn = UIButton(type: UIButton.ButtonType.system);
//        btn.frame = CGRect(x: 0, y: 0, width: 60, height: kNaviBarHeight);
        btn.tag = 0;

        btn.titleLabel?.font = UIFont.systemFont(ofSize: 16);
        btn.setTitle(kActionTitle_Cancell, for: .normal);
        btn.setTitleColor(UIColor.red, for: .normal);
        btn.addTarget(self, action: #selector(handleActionControl(sender:)), for:.touchUpInside);
        
        return btn;
    }();
    
    lazy var btnSure:UIButton = {
        let btn = UIButton(type: UIButton.ButtonType.system);
//        btn.frame = CGRect(x: 0, y: 0, width: 60, height: kNaviBarHeight);
        btn.tag = 1;

        btn.titleLabel?.font = UIFont.systemFont(ofSize: 16);
        btn.setTitle(kActionTitle_Sure, for: .normal);
        btn.setTitleColor(UIColor.theme, for: .normal);
        btn.addTarget(self, action: #selector(handleActionControl(sender:)), for:.touchUpInside);

        return btn;
    }();
    
    lazy var label:UILabel = {
        let lab = UILabel(frame: CGRect(x: btnSize.width, y: 0, width: UIScreen.width - btnSize.width*2, height: kNaviBarHeight));
        lab.tag = 10;
        lab.text = "请选择";
        lab.textColor = UIColor.gray;
        lab.textAlignment = .center;
        return lab;
    }();
    
    //MRAK: - funtion
    @objc func handleActionControl(sender: UIControl) {
        if let control = sender as? UIDatePicker {
            DDLog(control.date);
            
        }
        else if let control = sender as? UIButton {
            DDLog(control.titleLabel?.text as Any);
            if control.titleLabel?.text == kActionTitle_Sure {
                self.viewBlock!(self,sender.tag);
                
            }
            self.dismiss();
        }
    }
    
}
