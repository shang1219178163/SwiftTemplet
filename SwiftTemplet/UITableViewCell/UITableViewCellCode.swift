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
class UITableViewCellCode: UITableViewCell,UITextFieldDelegate {
    
    var viewBlock: ObjClosure?
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier);
        
        contentView.addSubview(labelLeft);
        contentView.addSubview(textfield);
        contentView.addSubview(btnCode);
        
     
        labelLeft.isHidden = true
        
        textfield.placeholder = "请输入验证码";
        textfield.delegate = self;
        
        btnCode.titleLabel?.font = UIFont.systemFont(ofSize: 15)
        btnCode.layer.cornerRadius = 3;
        btnCode.layer.masksToBounds = true;
        
        labelLeft.addObserver(self, forKeyPath: "text", options: .new, context: nil)
    }
    
    override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
        if keyPath == "text" {
            //标题星号处理
            labelLeft.attributedText = labelLeft.text?.toAsterisk()
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder);
        fatalError("init(coder:) has not been implemented")
    }
    
    deinit {
        labelLeft.removeObserver(self, forKeyPath: "text")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews();
        
        setupConstraint()
    }
    
    func setupConstraint() -> Void {
        
        if labelLeft.isHidden == false {
            labelLeft.sizeToFit()
            labelLeft.snp.makeConstraints { (make) in
                make.centerY.equalToSuperview()
                make.left.equalToSuperview().offset(kX_GAP)
                make.size.equalTo(CGSize(width: labelLeft.frame.width, height: 35));
            }
            
            btnCode.snp.makeConstraints { (make) in
                make.top.equalTo(labelLeft);
                make.right.equalToSuperview().offset(-kX_GAP)
                make.width.equalTo(100);
                make.bottom.equalTo(labelLeft);
            }
            
            textfield.snp.makeConstraints { (make) in
                make.top.equalTo(labelLeft);
                make.left.equalTo(labelLeft.snp_right).offset(kPadding)
                make.right.equalTo(btnCode.snp_left).offset(-kPadding)
                make.height.equalTo(labelLeft);
            }
        } else {
            btnCode.snp.makeConstraints { (make) in
                make.centerY.equalToSuperview()
                make.right.equalToSuperview().offset(-kX_GAP)
                make.width.equalTo(100);
                make.height.equalTo(35);
            }
            
            textfield.snp.makeConstraints { (make) in
                make.top.equalTo(btnCode);
                make.left.equalToSuperview().offset(kX_GAP)
                make.right.equalTo(btnCode.snp_left).offset(-kPadding)
                make.height.equalTo(btnCode);
            }
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
    func block(_ action:@escaping ObjClosure) {
        viewBlock = action
    }
    
    lazy var btnCode: UIButton = {
        let view = UIButton.createBtn(.zero, title: "发送验证码", imgName: nil, type: 1)
        return view
    }()

}


