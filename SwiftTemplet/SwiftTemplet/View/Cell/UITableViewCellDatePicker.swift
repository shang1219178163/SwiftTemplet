//
//  UITableViewCellDatePicker.swift
//  SwiftTemplet
//
//  Created by hsf on 2018/9/7.
//  Copyright © 2018年 BN. All rights reserved.
//

import UIKit

class UITableViewCellDatePicker: UITableViewCell,UITextFieldDelegate {

    typealias ViewClick = (UITableViewCellDatePicker,BN_DatePicker,Int) -> Void;
    var viewblock: ViewClick?;
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier);
        
        //文字+时间选择器
        contentView.addSubview(labelLeft);
        contentView.addSubview(textField);

        textField.placeholder = "请选择";
        textField.textAlignment = NSTextAlignment.center;
        
//        textField.rightView = [self getTextFieldRightView:kIMAGE_arrowDown];
//        textField.rightViewMode = UITextFieldViewModeAlways;
        
        textField.delegate = self;
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder);
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews();
        
        let gapY = (height - kH_TEXTFIELD)/2.0;
        
        let labSize = sizeWithText(text: labelLeft.text as AnyObject, font: labelLeft.font, width: kScreen_width);
        labelLeft.frame = CGRect(x: kX_GAP, y: gapY, width: labSize.width, height: kH_TEXTFIELD);

        textField.frame = CGRect(x: labelLeft.frame.maxX + kPadding, y: gapY, width: width - labelLeft.frame.maxX - kPadding - kX_GAP, height: kH_TEXTFIELD);
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    //MARK: textfield
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        self.superview?.superview?.endEditing(true);
        
        datePicker.show();
        return true;
    }
    
//    func textFieldDidEndEditing(_ textField: UITextField) {
//
//    }
//
//    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
//
//    }
    
    //MARK: funtions
    func block(_ action:@escaping ViewClick) -> Void {
        self.viewblock = action;
        
    }
    
    lazy var datePicker:BN_DatePicker = {
        let view = BN_DatePicker(.date);
        view.block({ (sender, idx) in
//                DDLog(view,sender.datePicker.date,idx);
            self.viewblock!(self,sender,idx);
        });
        return view;
    }();
    
    
}
