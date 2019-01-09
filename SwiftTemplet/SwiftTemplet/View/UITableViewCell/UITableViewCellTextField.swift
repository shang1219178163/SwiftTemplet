//
//  UITableViewCellTextField.swift
//  SwiftTemplet
//
//  Created by Bin Shang on 2019/1/9.
//  Copyright © 2019 BN. All rights reserved.
//

import UIKit

import SnapKit
import SwiftExpand

class UITableViewCellTextField: UITableViewCell,UITextFieldDelegate {
    
    typealias ViewClick = (UITableViewCellDatePicker,BNDatePicker,Int) -> Void;
    var viewBlock: ObjClosure?

    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier);
        
        //文字+时间选择器
        contentView.addSubview(labelLeft);
        contentView.addSubview(textfield);
        
        textfield.text = DateFormatter.format(Date(), fmt: kDateFormat_one)
        textfield.textColor = UIColor.theme
        textfield.placeholder = "99.0";
        textfield.textAlignment = .center;
        textfield.asoryView(true, unitName: kIMG_arrowDown);
        //        textfield.asoryView(true, unitName: "公斤(万元)");
        textfield.delegate = self;
        
        //拦截响应事件,不用再走tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
        contentView.insertSubview(backView, at: 0)
        let _ = backView.addGestureTap { (sender: UIGestureRecognizer) in
//            self.textfield.becomeFirstResponder()
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder);
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews();
        backView.frame = contentView.frame;
        
        labelLeft.sizeToFit()
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
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
    }
    
    //    MARK: -textfield
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {

        
        return true
    }
    
    //    func textFieldDidEndEditing(_ textField: UITextField) {
    //
    //    }
    //
    //    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
    //
    //    }
    
    //MARK: -funtions
    func block(_ action:@escaping ObjClosure) -> Void {
        viewBlock = action;
        
    }
    
    //MARK: -lazy
    lazy var backView: UIView = {
        var view = UIView(frame: .zero)
        view.backgroundColor = contentView.backgroundColor;
        return view
    }()
}


