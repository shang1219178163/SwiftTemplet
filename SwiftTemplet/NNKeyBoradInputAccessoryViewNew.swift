//
//  NNKeyBoradInputAccessoryViewNew.swift
//  SwiftTemplet
//
//  Created by Bin Shang on 2021/8/21.
//  Copyright © 2021 BN. All rights reserved.
//

import UIKit
import SnapKit
import SwiftExpand
        

///
@objcMembers class NNKeyBoradInputAccessoryViewNew: UIView {

    var block: ((NNKeyBoradInputAccessoryViewNew, Int) -> Void)?
    
    var inset = UIEdgeInsets(top: 10, left: 15, bottom: 10, right: 15)

    
    private var labelHeight: CGFloat = 25
    private var btnSize: CGSize = CGSize(width: 40, height: 35)
    private var spacing: CGFloat = 5
    
        
    weak var responder: UIResponder?
    

    // MARK: -lifecycle
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.frame = UIScreen.main.bounds
        
        addSubview(dimView)
        dimView.addSubview(contentView)

        contentView.addSubview(promptLabel)
        contentView.addSubview(textView)
        
        contentView.addSubview(picBtn)
        contentView.addSubview(docBtn)
        contentView.addSubview(wordCountLabel)
        contentView.addSubview(sendBtn)
        
        
        [(UIResponder.keyboardWillShowNotification, #selector(keyboradWillShow(_:))),
         (UIResponder.keyboardDidShowNotification, #selector(keyboradDidShow(_:))),
         (UIResponder.keyboardWillHideNotification, #selector(keyboradWillHide(_:))),
         (UIResponder.keyboardDidHideNotification, #selector(keyboradDidHide(_:))),
        ].forEach { (name, sel) in
            NotificationCenter.default.addObserver(self, selector: sel, name: name, object: nil)
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        if bounds.height <= 10.0 {
            return
        }
        dimView.snp.remakeConstraints { (make) in
            make.left.equalToSuperview().offset(0)
            make.right.equalToSuperview().offset(0)
            make.bottom.equalToSuperview().offset(0)
            make.height.equalTo(kScreenHeight)
        }
        
        contentView.snp.remakeConstraints { (make) in
            make.left.equalToSuperview().offset(0)
            make.right.equalToSuperview().offset(0)
            make.bottom.equalToSuperview().offset(0)
            make.height.equalTo(235)
        }
        
        
        let promptLabelSize = promptLabel.sizeThatFits(bounds.size)
        let textViewY = promptLabel.isHidden ? inset.top : inset.top + promptLabelSize.height + spacing
        if !promptLabel.isHidden {
            promptLabel.snp.remakeConstraints { (make) in
                make.top.equalToSuperview().offset(inset.top)
                make.left.equalToSuperview().offset(inset.left)
                make.size.equalTo(promptLabelSize)
            }
        }
        
        picBtn.snp.remakeConstraints { (make) in
            make.left.equalToSuperview().offset(inset.left)
            make.bottom.equalToSuperview().offset(-inset.bottom)
            make.size.equalTo(btnSize)
        }
        
        docBtn.snp.remakeConstraints { (make) in
            make.centerY.equalTo(picBtn)
            make.left.equalTo(picBtn.snp.right).offset(spacing)
            make.size.equalTo(btnSize)
        }
        
        sendBtn.snp.remakeConstraints { (make) in
            make.centerY.equalTo(picBtn)
            make.right.equalToSuperview().offset(-inset.right)
            make.height.equalTo(35)
            make.width.equalTo(60)
        }
        
        wordCountLabel.snp.remakeConstraints { (make) in
            make.centerY.equalTo(picBtn)
            make.right.equalTo(sendBtn.snp.left).offset(-spacing)
            make.height.equalTo(35)
            make.width.equalTo(60)
        }
        
        textView.snp.remakeConstraints { (make) in
            make.top.equalToSuperview().offset(textViewY)
            make.left.equalToSuperview().offset(inset.left)
            make.right.equalToSuperview().offset(-inset.right)
            make.bottom.equalTo(picBtn.snp.top).offset(-spacing)
        }

    }
    
    // MARK: - funtions
        
    @objc func keyboradWillShow(_ n: Notification) {
        self.dimView.alpha = 1

    }
    
    @objc func keyboradDidShow(_ n: Notification) {
//        self.responder?.resignFirstResponder()
//        self.textView.becomeFirstResponder()
    }
    
    @objc func keyboradWillHide(_ n: Notification) {
//        self.dimView.alpha = 0

    }
    
    @objc func keyboradDidHide(_ n: Notification) {
//        self.dimView.alpha = 1
    }
    
    //MARK: -lazy
    private(set) lazy var dimView: UIView = {
        let view = UIView(frame: .zero)
        view.backgroundColor = .black.withAlphaComponent(0.3)
        view.addGestureTap { tap in
            self.dimView.alpha = 0

            self.textView.resignFirstResponder()
            self.responder?.resignFirstResponder()
        }
        return view
    }()
    
    private(set) lazy var contentView: UIView = {
        let view = UIView(frame: .zero)
        view.backgroundColor = .white
        return view
    }()
    
    private(set) lazy var promptLabel: UILabel = {
        let view = UILabel(frame: .zero);
        view.text = "请选择";
        view.textColor = .lightGray;
        view.textAlignment = .center;
        return view;
    }()
    
    private(set) lazy var wordCountLabel: UILabel = {
        let view = UILabel(frame: .zero);
        view.text = "0/1000";
        view.textColor = .lightGray;
        view.textAlignment = .center;
        return view;
    }()
    
    private(set) lazy var textView: UITextView = {
        let view = UITextView(frame: .zero)
        view.font = UIFont.systemFont(ofSize: 17)
        return view
    }()
    
    private(set) lazy var picBtn: UIButton = {
        let view = UIButton(type: .custom)
        view.setTitle("图片", for: .normal)
        view.setTitleColor(.white, for: .normal)
        view.setBackgroundColor(.theme, for: .normal)
        view.titleLabel?.font = UIFont.systemFont(ofSize: 16)
        view.adjustsImageWhenHighlighted = false
        
        view.layer.cornerRadius = 4
        view.layer.masksToBounds = true

        view.addActionHandler({ (sender) in
            DDLog(sender.currentTitle)
            
        }, for: .touchUpInside)
        return view
    }()
    
    private(set) lazy var docBtn: UIButton = {
        let view = UIButton(type: .custom)
        view.setTitle("文档", for: .normal)
        view.setTitleColor(.white, for: .normal)
        view.setBackgroundColor(.theme, for: .normal)
        view.titleLabel?.font = UIFont.systemFont(ofSize: 16)
        view.adjustsImageWhenHighlighted = false
        
        view.layer.cornerRadius = 4
        view.layer.masksToBounds = true

        view.addActionHandler({ (sender) in
            DDLog(sender.currentTitle)
            
        }, for: .touchUpInside)
        return view
    }()
    
    private(set) lazy var sendBtn: UIButton = {
        let view = UIButton(type: .custom)
        view.setTitle("发送", for: .normal)
        view.setTitleColor(.white, for: .normal)
        view.setBackgroundColor(.theme, for: .normal)
        view.titleLabel?.font = UIFont.systemFont(ofSize: 16)
        view.adjustsImageWhenHighlighted = false
        
        view.layer.cornerRadius = 4
        view.layer.masksToBounds = true

        view.addActionHandler({ (sender) in
            DDLog(sender.currentTitle)
            DDLog(self.textView.text)
            self.textView.resignFirstResponder()
            self.responder?.resignFirstResponder()
            
            UIApplication.shared.keyWindow?.endEditing(true)
        }, for: .touchUpInside)
        return view
    }()
}
