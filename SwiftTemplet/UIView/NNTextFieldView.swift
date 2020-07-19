//
//    NNTextFieldView.swift
//    MacTemplet
//
//    Created by shang on 2020/07/14 15:49
//    Copyright © 2020 shang. All rights reserved.
//


import UIKit

import SnapKit
import SwiftExpand
        
/// 左标题右按钮
class NNTextFieldView: UIView {

    var Xgap: CGFloat = 0;
    var lineHeight: CGFloat = 0.5;
    var btnSize: CGSize = CGSize(width: 90, height: 30)

    var isBackDelete = true
    
    typealias ViewClick = ((NNTextFieldView, UITextField) -> Void)
    var viewBlock: ViewClick?;
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubview(label);
        addSubview(textfield);
        addSubview(btn);
        addSubview(lineView);

        textfield.placeholder = "请输入验证码";
        textfield.delegate = self;
        
        btn.titleLabel?.font = UIFont.systemFont(ofSize: 15)
        btn.layer.borderWidth = 1
        btn.layer.borderColor = UIColor.theme.cgColor
        btn.layer.cornerRadius = 3;
        btn.layer.masksToBounds = true;
        
        label.text = "验  证  码:"
        label.numberOfLines = 1
        
        lineView.backgroundColor = UIColor.lightGray;
//        backgroundColor = .systemGreen
        getViewLayer()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()

        if bounds.height <= 0.0 {
            return;
        }

        if label.isHidden == false {
            let size = label.sizeThatFits(.zero)
            label.snp.makeConstraints { (make) in
                make.top.equalToSuperview().offset(2)
                make.left.equalToSuperview().offset(Xgap)
                make.bottom.equalToSuperview().offset(-2)
                make.width.equalTo(size.width)
            }

            if btn.isHidden == false {
                btn.snp.makeConstraints { (make) in
                    make.centerY.equalToSuperview()
                    make.right.equalToSuperview().offset(-Xgap)
                    make.size.equalTo(btnSize);
                }
                textfield.snp.makeConstraints { (make) in
                    make.top.equalTo(label);
                    make.left.equalTo(label.snp.right).offset(kPadding)
                    make.right.equalTo(btn.snp.left).offset(-kPadding)
                    make.height.equalTo(label);
                }

            } else {
                textfield.snp.makeConstraints { (make) in
                    make.top.equalTo(label);
                    make.left.equalTo(label.snp.right).offset(kPadding)
                    make.right.equalToSuperview().offset(-Xgap)
                    make.height.equalTo(label);
                }
            }

        } else {
            if btn.isHidden == false {
                btn.snp.makeConstraints { (make) in
                    make.centerY.equalToSuperview()
                    make.right.equalToSuperview().offset(-Xgap)
                    make.size.equalTo(btnSize)
                }
                textfield.snp.makeConstraints { (make) in
                    make.centerY.equalToSuperview()
                    make.left.equalToSuperview().offset(Xgap)
                    make.right.equalTo(btn.snp.left).offset(-kPadding)
                    make.height.equalToSuperview().multipliedBy(0.9)
                }

            } else {
                textfield.snp.makeConstraints { (make) in
                    make.centerY.equalToSuperview()
                    make.left.equalToSuperview().offset(Xgap)
                    make.right.equalToSuperview().offset(-Xgap)
                    make.height.equalToSuperview().multipliedBy(0.9)
                }
            }
        }

        lineView.snp.makeConstraints { (make) in
            make.bottom.equalToSuperview().offset(0)
            make.left.equalToSuperview().offset(Xgap)
            make.right.equalToSuperview().offset(-Xgap)
            make.height.equalTo(lineHeight);
        }
    }
    
    // MARK: - funtions
    func block(_ action: @escaping ViewClick) {
        self.viewBlock = action;
    }
    
        
    //MARK: - lazy
    
    lazy var label: UILabel = {
        let view = UILabel(frame: .zero);
        view.text = "手机号码";
        view.font = UIFont.systemFont(ofSize: 15);
        view.textAlignment = .left;
        view.textColor = UIColor.gray;
        return view;
    }()
    
    lazy var textfield: UITextField = {
        var view = UITextField(frame: CGRect.zero);
        view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        view.font = UIFont.systemFont(ofSize: 15);
        view.textAlignment = .left;
        view.contentVerticalAlignment = .center;
        view.autocapitalizationType = .none;
        view.autocorrectionType = .no;
        view.clearButtonMode = .whileEditing;
        view.backgroundColor = .white;
        view.returnKeyType = .done
        return view
    }()
    
    lazy var btn: UIButton = {
        let view = UIButton(type: .custom);
        view.tag = 1;
        
        view.titleLabel?.font = UIFont.systemFont(ofSize: 16);
        view.setTitle("获取验证码", for: .normal);
        view.setTitleColor(UIColor.theme, for: .normal);
        view.addActionHandler({ (control) in
            guard let sender = control as? UIButton else { return }
            DDLog(sender.currentTitle!)

        }, for: .touchUpInside)
        return view;
    }()
    
    
    lazy var lineView: UIView = {
        let view = UIView(frame: .zero);
        view.backgroundColor = UIColor.red;
        return view;
    }()
}


extension NNTextFieldView: UITextFieldDelegate{
    
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
            }
        }
        return true
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        viewBlock?(self, textField)
    }
}
