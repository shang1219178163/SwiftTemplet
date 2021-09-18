//
//	NNKeyBoradInputAccessoryView.swift
//	MacTemplet
//
//	Created by Shang on 2021/08/21 08:47
//	Copyright © 2021 shang. All rights reserved.
//


import UIKit
import SnapKit
import SwiftExpand
        
@objc protocol NNKeyBoradInputAccessoryViewDelegate{
    @objc func NNKeyBoradInputAccessoryView(_ view: NNKeyBoradInputAccessoryView)
    
}
        
///
@objcMembers class NNKeyBoradInputAccessoryView: UIView {

    weak var delegate: NNKeyBoradInputAccessoryViewDelegate?

    var block: ((NNKeyBoradInputAccessoryView, Int) -> Void)?
    
    var inset = UIEdgeInsets(top: 10, left: 5, bottom: 10, right: 15)

    
    private var labelHeight: CGFloat = 25
    private var btnSize: CGSize = CGSize(width: 40, height: 35)
    private var spacing: CGFloat = 5

    // MARK: -lifecycle
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubview(promptLabel)
        addSubview(textView)
        
        addSubview(picBtn)
        addSubview(docBtn)
        addSubview(wordCountLabel)
        addSubview(sendBtn)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        if bounds.height <= 10.0 {
            return;
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
        
        if #available(iOS 13.0, *) {
//            [UIImage.p_circle, UIImage.folder]


        }
        
    }
    
    // MARK: - funtions
        
    private let flexibleItem = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
    //MARK: -lazy
    private let toorbar = UIToolbar()


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
//        view.isSelectable = false
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
        
        view.addActionHandler({ (sender) in
            DDLog(sender.currentTitle)
            
        }, for: .touchUpInside)
        return view
    }()
}
