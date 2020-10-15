//
//	NNAgreementView.swift
//	MacTemplet
//
//	Created by shang on 2020/08/19 14:03
//	Copyright © 2020 shang. All rights reserved.
//


import UIKit
import SnapKit
import SwiftExpand
        
@objc protocol NNAgreementViewDelegate{
    @objc func agreementView(_ view: NNAgreementView, sender: UIButton)
    @objc func agreementView(_ textView: UITextView, shouldInteractWith URL: URL, in characterRange: NSRange) -> Bool;

}
        
///
@objcMembers class NNAgreementView: UIView {

    weak var delegate: NNAgreementViewDelegate?
    
    var inset = UIEdgeInsets(top: 160, left: 60, bottom: 10, right: 60)
    
    var contentCornerRadius: CGFloat = 15
    
    var actionBlock: ((NNAgreementView, UIButton)->Void)?
    var tapTextBlock: ((UITextView, URL, NSRange)->Bool)?

    //MARK: -lazy
//    lazy var imgView: UIImageView = {
//        var view = UIImageView(frame: .zero);
//        view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
//        view.contentMode = .scaleAspectFit
//        view.image = UIImage(named: "img_update")
//
//        return view;
//    }()
    
    lazy var labelTitle: UILabel = {
        let view = UILabel(frame: .zero);
        view.font = UIFont.systemFont(ofSize: 16)
        view.text = "发现新版本 v1.0.0";
        view.textColor = .black;
        view.textAlignment = .center;
        return view;
    }()
        
    lazy var textView: UITextView = {
        let textView = UITextView(frame: .zero)
        textView.font = UIFont.systemFont(ofSize: 14)
        textView.isSelectable = true
        textView.isEditable = false
        textView.delegate = self
        return textView
    }()
    
    lazy var btnSure: UIButton = {
        let view = UIButton(type: .custom);
        view.tag = 1;
        
        view.titleLabel?.font = UIFont.systemFont(ofSize: 16);
        view.setTitle(kTitleSure, for: .normal);
        view.setTitleColor(.systemBlue, for: .normal);
        view.addActionHandler({ (control) in
            if let sender = control as? UIButton {
                self.delegate?.agreementView(self, sender: sender)
                self.actionBlock?(self, sender)
            }

        }, for: .touchUpInside)
        return view;
    }()
    
    lazy var btnCancell: UIButton = {
        let view = UIButton(type: .custom);
        view.tag = 0;
        
        view.titleLabel?.font = UIFont.systemFont(ofSize: 16);
        view.setTitle(kTitleCancell, for: .normal);
        view.setTitleColor(.systemRed, for: .normal);
        view.addActionHandler({ (control) in
            if let sender = control as? UIButton {
                if let sender = control as? UIButton {
                    self.delegate?.agreementView(self, sender: sender)
                    self.actionBlock?(self, sender)
                }
            }
            self.dismiss()
        }, for: .touchUpInside)
        return view;
    }()
    
    lazy var lineVer: UIView = {
        let view = UIView()
        view.backgroundColor = .line
        return view
    }()
    
    lazy var lineHor: UIView = {
        let view = UIView()
        view.backgroundColor = .line
        return view
    }()
    
    lazy var contentView: UIView = {
        var view = UIView()
        view.backgroundColor = .white
        view.layer.cornerRadius = contentCornerRadius
        view.layer.masksToBounds = true
        
        view.addSubview(labelTitle)
        view.addSubview(textView)
        view.addSubview(btnCancell)
        view.addSubview(btnSure)
        
        view.addSubview(lineVer)
        view.addSubview(lineHor)
        return view
    }()
    
    // MARK: -lifecycle
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.frame = UIScreen.main.bounds
        addSubview(contentView);

//        contentView.getViewLayer()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        if bounds.height <= 10 {
            return;
        }
        
        contentView.snp.makeConstraints { (make) in
            make.top.equalToSuperview().offset(inset.top)
            make.left.equalToSuperview().offset(inset.left)
            make.right.equalToSuperview().offset(-inset.right)
        }
        
//        imgView.snp.makeConstraints { (make) in
//            make.top.equalToSuperview().offset(10);
//            make.left.equalToSuperview().offset(10);
//            make.right.equalToSuperview().offset(-10);
//            make.height.equalTo(88);
//        }
        
        labelTitle.snp.makeConstraints { (make) in
            make.top.equalToSuperview().offset(8);
            make.left.equalToSuperview().offset(10);
            make.right.equalToSuperview().offset(-10);
            make.height.equalTo(25);
        }
                
        let contentWidth: CGFloat = (bounds.width - inset.left - inset.right - 20)
        let contentSize = textView.sizeThatFits(CGSize(width: contentWidth, height: CGFloat.greatestFiniteMagnitude))
        let contentHeight = min(550, contentSize.height + textView.textContainerInset.top + textView.textContainerInset.bottom)
//        DDLog(contentSize, textView.contentSize)
        textView.snp.remakeConstraints { (make) in
            make.top.equalTo(labelTitle.snp.bottom).offset(0);
            make.left.equalToSuperview().offset(10);
            make.right.equalToSuperview().offset(-10);
            make.bottom.equalToSuperview().offset(-50);
            make.height.greaterThanOrEqualTo(contentHeight)
        }
                
        if btnCancell.isHidden {
            btnSure.snp.makeConstraints { (make) in
                make.left.equalToSuperview().offset(0);
                make.right.equalToSuperview().offset(0);
                make.bottom.equalToSuperview().offset(0);
                make.height.equalTo(44);
            }
            return
        }
        
        let items = [btnCancell, btnSure].filter { $0.isHidden == false }
        items.snp.distributeViewsAlong(axisType: .horizontal, fixedSpacing: 1, leadSpacing:0, tailSpacing: 0)
        items.snp.makeConstraints { (make) in
            make.height.equalTo(44)
            make.bottom.equalToSuperview().offset(0)
        }
        
        lineHor.snp.makeConstraints { (make) in
            make.top.equalTo(btnSure).offset(-1);
            make.left.equalToSuperview().offset(0);
            make.right.equalToSuperview().offset(0);
            make.height.equalTo(0.5);
        }
        
        lineVer.snp.makeConstraints { (make) in
            make.centerX.equalToSuperview()
            make.top.equalTo(lineHor).offset(0);
            make.bottom.equalToSuperview().offset(0);
            make.width.equalTo(0.5);
        }
        
    }
    
    
    //MARK: -funtions
    func show() {
        UIApplication.shared.keyWindow?.endEditing(true)
        UIApplication.shared.keyWindow?.addSubview(self);
        
//        self.transform = self.transform.scaledBy(x: 2.5, y: 2.5)
        UIView.animate(withDuration: 0.15, animations: {
            self.backgroundColor = UIColor.black.withAlphaComponent(0.6);
            self.transform = CGAffineTransform.identity
            
        }, completion: nil);
    }
    
    func dismiss() {
        UIView.animate(withDuration: 0.15, animations: {
            self.backgroundColor = UIColor.black.withAlphaComponent(0);
//            self.transform = self.transform.scaledBy(x: 0.5, y: 0.5)

        }) { (isFinished) in
            self.removeFromSuperview();
        }
    }
    
}

extension NNAgreementView: UITextViewDelegate{
    func textView(_ textView: UITextView, shouldInteractWith URL: URL, in characterRange: NSRange) -> Bool {
        if let tapTextBlock = tapTextBlock{
            return tapTextBlock(textView, URL, characterRange)
        }
        if delegate != nil {
            return delegate!.agreementView(textView, shouldInteractWith: URL, in: characterRange)
        }
        return true
    }
}
