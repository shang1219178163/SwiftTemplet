//
//  InputViewViewController.swift
//  SwiftTemplet
//
//  Created by Bin Shang on 2021/8/19.
//  Copyright © 2021 BN. All rights reserved.
//


import UIKit
import IQKeyboardManagerSwift

class InputViewViewController: UIViewController {
    let kScreenWidth = UIScreen.main.bounds.size.width
    let kScreenHeight = UIScreen.main.bounds.size.height

    let toolBar: UIToolbar = {
        //创建ToolBar
        let tmpToolBar = UIToolbar(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.size.width, height: 70))
        tmpToolBar.backgroundColor = UIColor.gray
        return tmpToolBar
    }()

    
    lazy var textField: UITextField = {
        let view = UITextField(frame: .zero)
        view.backgroundColor = .lightGray
        return view
    }()
    
    lazy var textView: UITextView = {
        let view = UITextView(frame: .zero)
        view.backgroundColor = .green
        return view
    }()
    
    lazy var inputView1: NNKeyBoradInputAccessoryView = {
        let view = NNKeyBoradInputAccessoryView(frame: .zero)
//        view.backgroundColor = .lightGreen
        view.promptLabel.text = "评论楼主"
        view.textView.placeHolderLabel.text = "点赞太容易,评论显真情"
        return view
    }()
    
    
    lazy var assoryView: NNKeyBoradInputAccessoryViewNew = {
        let view = NNKeyBoradInputAccessoryViewNew(frame: .zero)
        view.promptLabel.text = "评论楼主"
        view.textView.placeHolderLabel.text = "点赞太容易,评论显真情"
        return view
    }()
    
    
    // MARK: -lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        edgesForExtendedLayout = []
        navigationItem.rightBarButtonItems = ["确定",]
            .map { UIBarButtonItem(title: $0, style: .plain, target: self, action: #selector(actionItem(_:))) }

        //创建UITextView
        textView = UITextView(frame: CGRect(x: 0, y: 5, width: kScreenWidth/4*3, height: 60))

        
        let inputItem = UIBarButtonItem(customView: textView)
        //创建发送按钮
        let sendBtn = UIButton(frame: CGRect(x: 0, y: 5, width: kScreenWidth/4-40, height: 50))
        sendBtn.contentMode = .center
        sendBtn.setTitle("发送", for: .normal)
        sendBtn.setTitleColor(UIColor.blue, for: .normal)
        sendBtn.addTarget(self, action: #selector(handleSend(event:)), for: .touchUpInside)
        let sendItem = UIBarButtonItem(customView: sendBtn)
        //ToolBar添加textView和发送按钮
        toolBar.items = [inputItem, sendItem]
        
        //赋值给UITextField的inputAccessoryView
        textField = UITextField(frame: CGRect(x: 0, y: 150, width: kScreenWidth/4*3, height: 60))
        textField.inputAccessoryView = toolBar
        
        textField.backgroundColor = .green
        view.addSubview(textField)
        
        
        inputView1.frame = CGRect(x: 0, y: 0, width: kScreenWidth, height: 235)
        textField.inputAccessoryView = inputView1
        
        textField.inputAccessoryView = assoryView
        assoryView.responder = textField
        

//        view.addSubview(inputView1)
        inputView1.getViewLayer()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        IQKeyboardManager.shared.enable = false
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        textField.snp.makeConstraints { (make) in
            make.top.equalToSuperview().offset(10)
            make.left.equalToSuperview().offset(10)
            make.right.equalToSuperview().offset(-10)
            make.height.equalTo(35)
        }
        
        
//        inputView1.snp.makeConstraints { (make) in
//            make.top.equalTo(textField.snp.bottom).offset(10)
//            make.left.equalToSuperview().offset(10)
//            make.right.equalToSuperview().offset(-10)
//            make.height.equalTo(235)
//        }
        
        
    }
    
    @objc func handleSend(event: UIButton) -> () {
        print(textView.text as Any)
        view.endEditing(true)
    }
    @objc func actionItem(_ item: UIBarButtonItem) -> () {
//        view.becomeFirstResponder()
        let inputView = NNTextViewInputView()
        
        inputView.show()
    }
}
