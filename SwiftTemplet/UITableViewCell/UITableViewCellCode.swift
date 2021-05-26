//
//  UITableViewCellCode.swift
//  SwiftTemplet
//
//  Created by Bin Shang on 2019/8/5.
//  Copyright © 2019 BN. All rights reserved.
//

import SnapKit
import SwiftExpand

/// 文字+UITextField(输入框)
class UITableViewCellCode: UITableViewCell {
    
    var inset = UIEdgeInsets(top: 10, left: 15, bottom: 10, right: 15)
    var btnSize = CGSize(width: 100, height: 35)
    
    var viewBlock: ((UITextField) ->Void)?
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
        contentView.addSubview(btnCode);
                
        textfield.placeholder = "请输入验证码";
        textfield.delegate = self;
        
        btnCode.titleLabel?.font = UIFont.systemFont(ofSize: 15)
        btnCode.layer.cornerRadius = 3;
        btnCode.layer.masksToBounds = true;
        
        labelLeft.text = "验  证  码:"
        labelLeft.numberOfLines = 1
        labelLeft.addObserver(self, forKeyPath: "text", options: .new, context: nil)
    }
    
    override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
        if keyPath == "text" {
            //标题星号处理
            if hasAsterisk == true {
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
        
        if labelLeft.isHidden == false {
            let size = labelLeft.sizeThatFits(.zero)
            labelLeft.snp.remakeConstraints { (make) in
                make.centerY.equalToSuperview()
                make.left.equalToSuperview().offset(inset.left)
                make.width.equalTo(size.width)
                make.height.equalTo(height)
            }
            
            btnCode.snp.makeConstraints { (make) in
                make.centerY.equalToSuperview()
                make.right.equalToSuperview().offset(-inset.right)
                make.size.equalTo(btnSize)
            }
            
            textfield.snp.remakeConstraints { (make) in
                make.centerY.equalToSuperview()
                make.left.equalTo(labelLeft.snp.right).offset(kPadding)
                make.right.equalTo(btnCode.snp.left).offset(-kPadding)
                make.height.equalTo(height)
            }
        } else {
            btnCode.snp.makeConstraints { (make) in
                make.centerY.equalToSuperview()
                make.right.equalToSuperview().offset(-inset.right)
                make.size.equalTo(btn)
            }
            
            textfield.snp.makeConstraints { (make) in
                make.centerY.equalToSuperview()
                make.left.equalToSuperview().offset(inset.left)
                make.right.equalTo(btnCode.snp.left).offset(-kPadding)
                make.height.equalTo(height);
            }
        }
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
    }
        
    //MARK: -funtions
    func block(_ action:@escaping ((UITextField) ->Void)) {
        viewBlock = action
    }
    
    lazy var btnCode: UIButton = {
        let view = UIButton.create(.zero, title: "发送验证码", textColor: .white, backgroundColor: .clear)
        view.setBackgroundImage(UIImage(color: .theme), for: .normal)
        view.setBackgroundImage(UIImage(color: .lightGray), for: .disabled)
        return view
    }()

}

extension UITableViewCellCode: UITextFieldDelegate {
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
        if string == "" {
            textField.text = ""
        }
        return true
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        viewBlock?(textField)
    }
}
