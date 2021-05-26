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
class UITableViewCellTextField: UITableViewCell {

    var viewBlock: ((UITextField) ->Void)?
    var textFieldEditingChangedBlock: ((UITextField) -> Void)?

    var inset = UIEdgeInsets(top: 10, left: 15, bottom: 10, right: 15)
    /// 是否有星标
    var hasAsterisk = false
    
    var isBackDelete = true

    // MARK: -life cycle
    deinit {
        labelLeft.removeObserver(self, forKeyPath: "text")
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier);
        
        contentView.addSubview(labelLeft);
        contentView.addSubview(textfield);
        
        labelLeft.numberOfLines = 1
        textfield.placeholder = "请输入";
        textfield.textAlignment = .center;
        textfield.delegate = self;
        textfield.addTarget(self, action: #selector(handleEditingChanged(_:)), for: .editingChanged)

//        let image = UIImage(named: "img_arrowRight_gray", podName: "SwiftExpand")
//        _ = textfield.asoryView(true, image: image)
//        textfield.asoryView(true, unitName: "公斤(万元)");

        labelLeft.numberOfLines = 1
        labelLeft.addObserver(self, forKeyPath: "text", options: .new, context: nil)
//        textfield.addTarget(self, action: #selector(handleSend(_:)), for: [.editingChanged, .editingDidEnd, .editingDidEndOnExit])
//        textfield.addActionHandler({ (sender) in
//            guard let sender = control as? UITextField else { return }
//            DDLog(sender.text)
//
//        }, for: [.editingChanged, .editingDidEndOnExit])
    }
    
    override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
        if keyPath == "text" {
            if hasAsterisk {
                //标题星号处理
                labelLeft.attributedText = labelLeft.text?.insertPrefix(labelLeft.textColor, font: labelLeft.font)
            }
        }
        else {
            super.observeValue(forKeyPath: keyPath, of: object, change: change, context: context)
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
        let height = bounds.height - inset.top - inset.bottom
        let endX = accessoryType == .none ? inset.right : kPadding
        
        if labelLeft.isHidden {
            textfield.snp.makeConstraints { (make) in
                make.edges.equalTo(inset)
            }
            return
        }

        let labelLeftSize = labelLeft.sizeThatFits(.zero)
        labelLeft.snp.remakeConstraints { (make) in
            make.centerY.equalToSuperview()
            make.left.equalToSuperview().offset(inset.left)
            make.width.equalTo(labelLeftSize.width)
            make.height.equalTo(height)
        }
        
        textfield.snp.remakeConstraints { (make) in
            make.top.equalTo(labelLeft)
            make.left.equalTo(labelLeft.snp.right).offset(kPadding)
            make.right.equalToSuperview().offset(-endX)
            make.height.equalTo(labelLeft)
        }
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
    }
    
    //MARK: -funtions
    func block(_ action:@escaping ((UITextField) ->Void)) {
        viewBlock = action
    }
    
    @objc func handleEditingChanged(_ textField: UITextField) {
        textFieldEditingChangedBlock?(textfield)
    }
    
    @objc func handleSend(_ sender: UITextField) {
        DDLog(sender.text as Any)
    }
   
}

extension UITableViewCellTextField: UITextFieldDelegate{
    
    //    MARK: -textfield
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        return true
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
//        UIApplication.shared.keyWindow?.endEditing(true);
        return true
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        if isBackDelete {
            if string == "" {
                textField.text = ""
                textFieldEditingChangedBlock?(textField)
            }
        }
        return true
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        viewBlock?(textField)
    }
}
