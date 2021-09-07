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
@objcMembers class UITableViewCellDatePicker: UITableViewCell {
    var inset = UIEdgeInsets(top: 10, left: 15, bottom: 10, right: 15)
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
        
        contentView.addGestureTap { (sender) in
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
        if bounds.height <= 10 {
            return
        }
        
        let height: CGFloat = bounds.height - 20
        let endX = accessoryType == .none ? inset.right : kPadding

        let labelLeftSize = labelLeft.sizeThatFits(.zero)
        labelLeft.snp.remakeConstraints { (make) in
            make.centerY.equalToSuperview()
            make.left.equalToSuperview().offset(inset.left)
            make.width.equalTo(ceil(labelLeftSize.width))
            make.height.equalTo(height)
        }
        
        textfield.snp.remakeConstraints { (make) in
            make.centerY.equalToSuperview()
            make.left.equalTo(labelLeft.snp.right).offset(kPadding)
            make.right.equalToSuperview().offset(-endX)
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
                labelLeft.attributedText = labelLeft.text?.matt.appendPrefix(font: labelLeft.font)
            }
        }
        else {
            super.observeValue(forKeyPath: keyPath, of: object, change: change, context: context)
        }
    }
    
    //MARK: -funtions
    
    //MARK: -lazy
    public lazy var labelLeft: UILabel = {
        let view = UILabel(frame: CGRect.zero)
        view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        view.textAlignment = .left
        view.numberOfLines = 0
        view.lineBreakMode = .byCharWrapping
        
        return view
    }()
    
    public lazy var textfield: UITextField = {
         let view = UITextField(frame: .zero)
         view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
         view.textAlignment = .left
         view.contentVerticalAlignment = .center
         view.autocapitalizationType = .none
         view.autocorrectionType = .no
         view.clearButtonMode = .whileEditing
         view.backgroundColor = .white
         
         return view
    }()
    
    lazy var datePicker: NNDatePicker = {
        let view = NNDatePicker(model: .dateAndTime);
//        view.block({ (sender, idx) in
////          DDLog(view,sender.datePicker.date,idx);
//            self.viewBlock?(self, sender,idx);
//            let dateStr = DateFormatter.stringFromDate(view.datePicker.date, fmt: kDateFormatDay)
//            self.textfield.text = idx == 1 ? dateStr : "";
//        });
        return view;
    }()
    
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
