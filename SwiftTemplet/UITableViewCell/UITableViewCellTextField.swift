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

/// 文字+UITextField(输入框)
class UITableViewCellTextField: UITableViewCell, UITextFieldDelegate {
    
    var viewBlock: TextFieldClosure?
    
    var Xgap: CGFloat = 15;
    /// 是否有星标
    var hasAsterisk = false
    // MARK: -life cycle
    deinit {
        labelLeft.removeObserver(self, forKeyPath: "text")
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier);
        
        contentView.addSubview(labelLeft);
        contentView.addSubview(textfield);
        
        labelLeft.numberOfLines = 1
        textfield.placeholder = "99.0";
        textfield.textAlignment = .center;
        textfield.delegate = self;
//        let image = UIImage.image(named: kIMG_arrowRight, podClassName: "SwiftExpand")
//        _ = textfield.asoryView(true, image: image)
//        textfield.asoryView(true, unitName: "公斤(万元)");

        labelLeft.numberOfLines = 1
        labelLeft.addObserver(self, forKeyPath: "text", options: .new, context: nil)
    }
    
    override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
        if keyPath == "text" {
            if hasAsterisk {
                //标题星号处理
                labelLeft.attributedText = labelLeft.text?.toAsterisk(labelLeft.textColor, font: labelLeft.font.pointSize)
            }
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

        let size: CGSize = labelLeft.sizeThatFits(.zero)
//        labelLeft.sizeToFit()
        labelLeft.snp.makeConstraints { (make) in
            make.centerY.equalToSuperview()
            make.left.equalToSuperview().offset(Xgap)
            make.width.equalTo(ceil(size.width))
            make.height.equalTo(35)
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
    
    //    MARK: -textfield
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        return true
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        //        UIApplication.shared.keyWindow?.endEditing(true);
        return true
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        if viewBlock != nil {
            viewBlock!(textField)
        }
        
    }

    //MARK: -funtions
    func block(_ action:@escaping TextFieldClosure) {
        viewBlock = action
    }
    
   
}


