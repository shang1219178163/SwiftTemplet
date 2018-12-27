//
//  UITableViewCellDatePicker.swift
//  SwiftTemplet
//
//  Created by hsf on 2018/9/7.
//  Copyright © 2018年 BN. All rights reserved.
//

import UIKit

import SnapKit
import SwiftExpand

class UITableViewCellDatePicker: UITableViewCell,UITextFieldDelegate {

    typealias ViewClick = (UITableViewCellDatePicker,BNDatePicker,Int) -> Void;
    var ViewClosure: ViewClick?;
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier);
        
        //文字+时间选择器
        contentView.addSubview(labelLeft);
        contentView.addSubview(textfield);

        textfield.placeholder = "请选择";
        textfield.textAlignment = .center;
        textfield.asoryView(true, unitName: kIMG_arrowDown);
//        textfield.asoryView(true, unitName: "公斤(万元)");
        textfield.delegate = self;
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder);
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews();
        
        labelLeft.sizeToFit();
        labelLeft.snp.makeConstraints { (make) in
            make.top.equalToSuperview().offset(contentView.frame.midY - labelLeft.frame.height/2.0)
            make.left.equalToSuperview().offset(kX_GAP)
            make.width.equalTo(labelLeft.size.width);
        }
        
        textfield.snp.makeConstraints { (make) in
            make.top.equalTo(labelLeft);
            make.left.equalTo(labelLeft.snp.right).offset(kPadding)
            make.right.equalToSuperview().offset(-kX_GAP)
            make.height.equalTo(labelLeft);
        }
    }
    
//    override func layoutSubviews() {
//        super.layoutSubviews();
//
//        let gapY = (height - kH_TEXTFIELD)/2.0;
//
//        let labSize = sizeWithText(text: labelLeft.text as AnyObject, font: labelLeft.font, width: kScreenWidth);
//        labelLeft.frame = CGRect(x: kX_GAP, y: gapY, width: labSize.width, height: kH_TEXTFIELD);
//
//        textfield.frame = CGRect(x: labelLeft.frame.maxX + kPadding, y: gapY, width: width - labelLeft.frame.maxX - kPadding - kX_GAP, height: kH_TEXTFIELD);
//    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    //MARK: textfield
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        self.superview?.superview?.endEditing(true);
        
        datePicker.show();
        return false;
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
        ViewClosure = action;
        
    }
    
    lazy var datePicker:BNDatePicker = {
        let view = BNDatePicker(.date);
        view.block({ (sender, idx) in
//                DDLog(view,sender.datePicker.date,idx);
            if self.ViewClosure != nil {
                self.ViewClosure!(self,sender,idx);
            
            }
            let formatter = DateFormatter.format(kDateFormat);
            let dateStr = formatter.string(from: view.datePicker.date);
            
            self.textfield.text = idx == 1 ? dateStr : "";
        });
        return view;
    }();
    
    
}
