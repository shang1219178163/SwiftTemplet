//
//  UITableViewCellDatePicker.swift
//  SwiftTemplet
//
//  Created by Bin Shang on 2018/9/7.
//  Copyright © 2018年 BN. All rights reserved.
//

import UIKit

import SnapKit
import SwiftExpand

/// 文字+时间选择器
class UITableViewCellDatePicker: UITableViewCell {
    
    var Xgap: CGFloat = 15;
     /// 是否有星标
    var hasAsterisk = false;
    // MARK: -life cycle
    deinit {
        labelLeft.removeObserver(self, forKeyPath: "text")
    }
 
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier);
        
        contentView.addSubview(labelLeft);
        contentView.addSubview(textfield);

        labelLeft.numberOfLines = 1
        labelLeft.addObserver(self, forKeyPath: "text", options: .new, context: nil)
        
        textfield.placeholder = "请选择";
        textfield.text = DateFormatter.stringFromDate(Date(), fmt: kDateFormatDay)
        textfield.textColor = UIColor.theme
        textfield.textAlignment = .center;
//        textfield.delegate = self;
        textfield.isEnabled = false
        accessoryType = .disclosureIndicator
        
        let _ = contentView.addGestureTap { (sender) in
            self.datePicker.show()
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder);
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews();
        setupConstraint()
    }
    
    func setupConstraint() {
        if bounds.height <= 0.0 {
            return
        }
        labelLeft.sizeToFit()
        labelLeft.frame.size = CGSize(width: labelLeft.frame.width, height: 35)
        labelLeft.snp.makeConstraints { (make) in
            make.centerY.equalToSuperview()
            make.left.equalToSuperview().offset(Xgap)
            make.size.equalTo(labelLeft.size)
        }
        
        textfield.snp.makeConstraints { (make) in
            make.top.equalTo(labelLeft);
            make.left.equalTo(labelLeft.snp.right).offset(kPadding)
            make.right.equalToSuperview().offset(-Xgap)
            make.height.equalTo(labelLeft);
        }
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
    }
        
    //MARK: -observe
    override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
        if keyPath == "text" {
            //标题星号处理
            if hasAsterisk == true {
                labelLeft.attributedText = labelLeft.text?.toAsterisk(labelLeft.textColor, font: labelLeft.font.pointSize)
            }
        }
    }
    
    //MARK: -funtions
    
    //MARK: -lazy
    lazy var datePicker: NNDatePicker = {
        let view = NNDatePicker(model: .date);
//        view.block({ (sender, idx) in
////          DDLog(view,sender.datePicker.date,idx);
//            self.viewBlock?(self, sender,idx);
//            let dateStr = DateFormatter.stringFromDate(view.datePicker.date, fmt: kDateFormatDay)
//            self.textfield.text = idx == 1 ? dateStr : "";
//        });
        return view;
    }();
    
}

extension UITableViewCellDatePicker: UITextFieldDelegate {
    //MARK: -textfield
//    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
////        superview?.superview?.endEditing(true);
////        datePicker.show();
//        return false;
//    }
//
//    func textFieldDidEndEditing(_ textField: UITextField) {
//
//    }
//
//    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
//        return true;
//    }
}
