//
//  BNDatePicker.swift
//  SwiftTemplet
//
//  Created by hsf on 2018/9/7.
//  Copyright © 2018年 BN. All rights reserved.
//

import UIKit

class BNDatePicker: UIView {
    
    typealias ViewClick = (BNDatePicker,Int) -> Void;
    var viewblock: ViewClick?;

    private let btnSize = CGSize(width: 60, height: kH_NaviagtionBar);
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }

    convenience init(_ model:UIDatePickerMode) {
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
        
        UIView.animate(withDuration: 0.5, animations: {
            self.backgroundColor = UIColor.black.withAlphaComponent(0.5);
//            self.containView.frame.orignY -= self.containView.frame.height;
            self.containView.y -= self.containView.frame.height;
        }, completion: nil);
    }

    func dismiss() -> Void {

        UIView.animate(withDuration: 0.5, animations: {
            self.backgroundColor = UIColor.black.withAlphaComponent(0);
//            self.containView.frame.orignY += self.containView.frame.height;
            self.containView.y += self.containView.frame.height;

        }) { (isFinished) in
            self.removeFromSuperview();
            self.containView.frame = CGRect(x: 0, y: UIScreen.height, width: UIScreen.width, height: (kH_StatusBar + kH_PickerView));

        }
    }
   
   
    func block(_ action:@escaping ViewClick) -> Void {
        self.viewblock = action;
        
    }
    
    
    //MARK: - layz
    lazy var containView:UIView = {
        let view = UIView(frame: CGRect(x: 0, y: UIScreen.height, width: UIScreen.width, height: (kH_NaviagtionBar + kH_PickerView)));
        
        view.backgroundColor = UIColor.RGBA(230, 230, 230, 1);
        
        btnCancel.frame = CGRect(x: 0, y: 0, width: btnSize.width, height: btnSize.height);
        btnSure.frame = CGRect(x: UIScreen.width - 60, y: 0, width: btnSize.width, height: btnSize.height);
        datePicker.frame = CGRect(x: 0, y: kH_NaviagtionBar, width: UIScreen.width, height: kH_PickerView);
        label.frame = CGRect(x: btnSize.width, y: 0, width: UIScreen.width - btnSize.width*2, height: kH_NaviagtionBar);

        view.addSubview(btnCancel);
        view.addSubview(btnSure);
        view.addSubview(label);
        view.addSubview(datePicker);
        
        return view;
    }();
    
    lazy var datePicker : UIDatePicker = {
        let datePicker: UIDatePicker = UIDatePicker();
        datePicker.datePickerMode = UIDatePickerMode.date;
        datePicker.locale = Locale(identifier: "zh_CN");
        datePicker.backgroundColor = UIColor.white;

        datePicker.addTarget(self, action: #selector(handleActionControl(sender:)), for: .valueChanged);
        return datePicker;
    }();
    
    lazy var btnCancel:UIButton = {
        let btn = UIButton(type: UIButtonType.system);
//        btn.frame = CGRect(x: 0, y: 0, width: 60, height: kH_NaviagtionBar);
        btn.tag = 0;

        btn.titleLabel?.font = UIFont.systemFont(ofSize: 16);
        btn.setTitle(kActionTitle_Cancell, for: UIControlState.normal);
        btn.setTitleColor(UIColor.red, for: UIControlState.normal);
        btn.addTarget(self, action: #selector(handleActionControl(sender:)), for:.touchUpInside);
        
        return btn;
    }();
    
    lazy var btnSure:UIButton = {
        let btn = UIButton(type: UIButtonType.system);
//        btn.frame = CGRect(x: 0, y: 0, width: 60, height: kH_NaviagtionBar);
        btn.tag = 1;

        btn.titleLabel?.font = UIFont.systemFont(ofSize: 16);
        btn.setTitle(kActionTitle_Sure, for: UIControlState.normal);
        btn.setTitleColor(UIColor.theme, for: UIControlState.normal);
        btn.addTarget(self, action: #selector(handleActionControl(sender:)), for:.touchUpInside);

        return btn;
    }();
    
    lazy var label:UILabel = {
        let lab = UILabel(frame: CGRect(x: btnSize.width, y: 0, width: UIScreen.width - btnSize.width*2, height: kH_NaviagtionBar));
        lab.tag = 10;
        lab.text = "请选择";
        lab.textColor = UIColor.lightGray;
        lab.textAlignment = NSTextAlignment.center;
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
                self.viewblock!(self,sender.tag);
                
            }
            self.dismiss();
        }
    }
    
    /*
     func show() -> Void {
     UIApplication.shared.keyWindow?.addSubview(self);
     
     var tmpFrame = self.containView.frame;
     tmpFrame.origin.y = tmpFrame.minY - tmpFrame.height;
     
     UIView.animate(withDuration: 0.5, animations: {
         self.backgroundColor = UIColor.black.withAlphaComponent(0.5);
         self.containView.frame = tmpFrame;
         }, completion: nil);
     }
     
     func dismiss() -> Void {
     
     var tmpFrame = self.containView.frame;
     tmpFrame.origin.y = tmpFrame.minY + tmpFrame.height;
     
     UIView.animate(withDuration: 0.5, animations: {
         self.backgroundColor = UIColor.black.withAlphaComponent(0);
         self.containView.frame = tmpFrame;
     
         }) { (isFinished) in
             self.removeFromSuperview();
             self.containView.frame = CGRect(x: 0, y: UIScreen.height, width: UIScreen.width, height: (kH_StatusBar + kH_PickerView));
     
         }
     }
     */
}
