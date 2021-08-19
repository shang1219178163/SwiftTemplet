//
//	NNInputAsoryView.swift
//	MacTemplet
//
//	Created by shang on 2020/08/10 10:40
//	Copyright © 2020 shang. All rights reserved.
//


import UIKit
import SnapKit
import SwiftExpand
        
@objc protocol NNInputAsoryViewDelegate{
    @objc func inputAsoryview(_ view: NNInputAsoryView, sender: UIButton)
    @objc optional func inputAsoryview(_ view: NNInputAsoryView, textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String)

}
        
///
@objcMembers class NNInputAsoryView: UIView {

    weak var delegate: NNInputAsoryViewDelegate?

    typealias ViewClick = (NNInputAsoryView, Int) -> Void;
    var viewBlock: ViewClick?;
    
    lazy var btnVoice: UIButton = {
        let view = UIButton(type: .custom);
        view.tag = 0;
        
        view.titleLabel?.font = UIFont.systemFont(ofSize: 16);
//        view.setTitle(kTitleSure, for: .normal);
        view.setTitleColor(.systemBlue, for: .normal);
        view.setBackgroundImage(UIImage(named: "img_chat_voice"), for: .normal)
        
        view.addActionHandler({ (sender) in
            self.delegate?.inputAsoryview(self, sender: sender)

        }, for: .touchUpInside)
        return view;
    }()
    
    lazy var btnKeyborad: UIButton = {
        let view = UIButton(type: .custom);
        view.tag = 1;
        

        view.titleLabel?.font = UIFont.systemFont(ofSize: 16);
//        view.setTitle(kTitleSure, for: .normal);
        view.setTitleColor(.systemBlue, for: .normal);
        
        view.setBackgroundImage(UIImage(named: "img_chat_keyboard"), for: .normal)

        view.addActionHandler({ (sender) in
            self.delegate?.inputAsoryview(self, sender: sender)

        }, for: .touchUpInside)
        return view;
    }()
    
    lazy var btnMore: UIButton = {
        let view = UIButton(type: .custom);
        view.tag = 2;
        
        view.titleLabel?.font = UIFont.systemFont(ofSize: 16);
//        view.setTitle(kTitleSure, for: .normal);
        view.setTitleColor(.systemBlue, for: .normal);
        
        view.setBackgroundImage(UIImage(named: "img_chat_more"), for: .normal)

        view.addActionHandler({ (sender) in
            self.delegate?.inputAsoryview(self, sender: sender)

        }, for: .touchUpInside)
        return view;
    }()
    
    lazy var textView: UITextView = {
        let view = UITextView()
        view.font = UIFont.systemFont(ofSize: 16)
        view.isScrollEnabled = false
        view.layer.cornerRadius = 3
        view.layer.masksToBounds = true
        view.delegate = self
        return view
    }()
    
    lazy var keyboardInputView: NNChatKeyboardView = {
        let view = NNChatKeyboardView(frame: CGRect(x: 0, y: 0, width: self.bounds.width, height: 216))
        view.backgroundColor = .systemGreen
        return view
    }()

    // MARK: -lifecycle
    override init(frame: CGRect) {
        super.init(frame: frame)
                
        backgroundColor = .background
        addSubview(btnVoice)
        addSubview(btnKeyborad)
        addSubview(btnMore)
        addSubview(textView)
            
        //监听键盘
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardShow(_:)), name: UIResponder.keyboardDidShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardDismiss(_:)), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    //键盘弹出监听
    @objc func keyboardShow(_ n: Notification)  {
        keyboardInputView.isHidden = true
    }
    
    //键盘隐藏监听
    @objc func keyboardDismiss(_ n: Notification){
        keyboardInputView.isHidden = false
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        if bounds.height <= 10 {
            return;
        }
        
        btnVoice.snp.makeConstraints { (make) in
            make.left.equalToSuperview().offset(10);
            make.bottom.equalToSuperview().offset(-8);
            make.width.equalTo(35);
            make.height.equalTo(35);
        }
        
        btnMore.snp.makeConstraints { (make) in
            make.right.equalToSuperview().offset(-10);
            make.bottom.equalTo(btnVoice)
            make.width.height.equalTo(btnVoice);
        }
        
        btnKeyborad.snp.makeConstraints { (make) in
            make.right.equalTo(btnMore.snp.left).offset(-8);
            make.bottom.equalTo(btnVoice)
            make.width.height.equalTo(btnVoice);
        }
        
        textView.snp.makeConstraints { (make) in
            make.top.equalToSuperview().offset(5);
            make.left.equalTo(btnVoice.snp.right).offset(8);
            make.right.equalTo(btnKeyborad.snp.left).offset(-8);
            make.bottom.equalToSuperview().offset(-5);
        }
                
    }
    
    // MARK: - funtions
    func block(_ action: @escaping ViewClick) {
        self.viewBlock = action;
    }
    
        
    //MARK: -lazy
}

extension NNInputAsoryView: UITextViewDelegate {

    //MARK: -UITextView
    func textViewShouldBeginEditing(_ textView: UITextView) -> Bool {
        return true
    }
    func textViewDidBeginEditing(_ textView: UITextView) {
        textView.inputView = nil
        textView.reloadInputViews()
    }
    
    func textViewDidChange(_ textView: UITextView) {

    }
    
    func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
        //如果是删除减少字数，都返回允许修改
//        if text == "" {
//            return true
//        }
        
        if text == "\n" {
            UIApplication.shared.keyWindow?.endEditing(true)
            return false
        }
        
        delegate?.inputAsoryview?(self, textView: textView, shouldChangeTextIn: range, replacementText: text)
        return true
    }
    
    func textViewDidEndEditing(_ textView: UITextView) {

    }
    
    
}
