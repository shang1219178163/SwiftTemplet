//
//  UITableViewCellTextView.swift
//  SwiftTemplet
//
//  Created by Bin Shang on 2019/1/10.
//  Copyright © 2019 BN. All rights reserved.
//

import UIKit

import SwiftExpand

class UITableViewCellTextView: UITableViewCell,UITextViewDelegate {

    var wordCount: Int = 140{
        willSet {
            labelLeftSub.text = "\(textView.text.count)" + "/" + "\(wordCount)字"
        }
    }
    
    var type: Int = 0 {
        willSet {
            setNeedsLayout()
        }
    }
    private var viewBlock: ((UITableViewCellTextView, String) -> Void)?
    
    var Xgap: CGFloat = 15;
    /// 是否有星标
    var hasAsterisk = false;
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier);
        
        contentView.addSubview(labelLeft);
        contentView.addSubview(textView);
        contentView.addSubview(labelLeftSub);

        labelLeftSub.text = "0" + "/" + "\(wordCount)字"
        labelLeftSub.textAlignment = .right
        labelLeftSub.font = UIFont.systemFont(ofSize: 13)
        textView.delegate = self;
        textView.returnKeyType = .done
        
        labelLeft.addObserver(self, forKeyPath: "text", options: .new, context: nil)

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
        labelLeft.sizeToFit()
        labelLeft.frame.size = CGSize(width: labelLeft.frame.width, height: 35)
        
        switch type {
        case 1:
            labelLeft.snp.makeConstraints { (make) in
                make.top.equalToSuperview().offset(kY_GAP)
                make.left.equalToSuperview().offset(Xgap)
//                make.size.equalTo(labelLeft.frame.size);
            }
            
            labelLeftSub.snp.makeConstraints { (make) in
                make.top.equalTo(labelLeft)
                make.right.equalToSuperview().offset(-Xgap)
                make.size.equalTo(labelLeft.frame.size);
            }
            
            textView.snp.makeConstraints { (make) in
                make.top.equalTo(labelLeft.snp.bottom).offset(kPadding);
                make.left.equalTo(labelLeft)
                make.right.equalTo(labelLeftSub.snp.right)
                make.bottom.equalToSuperview().offset(-kY_GAP);
            }
            
        default:
            labelLeft.snp.makeConstraints { (make) in
                make.top.equalToSuperview().offset(kY_GAP)
                make.left.equalToSuperview().offset(Xgap)
                make.size.equalTo(labelLeft.size);
            }
            
            labelLeftSub.snp.makeConstraints { (make) in
                make.left.equalTo(labelLeft)
                make.size.equalTo(labelLeft.frame.size);
                make.bottom.equalToSuperview().offset(-kY_GAP);
            }
            
            textView.snp.makeConstraints { (make) in
                make.top.equalTo(labelLeft);
                make.left.equalTo(labelLeft.snp.right).offset(kPadding)
                make.right.equalToSuperview().offset(-Xgap)
                make.bottom.equalToSuperview().offset(-kY_GAP);
            }
        }
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
    }

    //MARK: -UITextView
    func textViewShouldBeginEditing(_ textView: UITextView) -> Bool {
        return true
    }
    
    func textViewDidChange(_ textView: UITextView) {
        labelLeftSub.text = "\(textView.text.count)" + "/" + "\(wordCount)字"
        
    }
    
    func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
        //如果是删除减少字数，都返回允许修改
        if text == "" {
            return true
        }
        
        if text == "\n" {
            UIApplication.shared.keyWindow?.endEditing(true)
            return false
        }
        
        if range.location > wordCount {
            return false
        }
        return true
    }
    
    func textViewDidEndEditing(_ textView: UITextView) {
        if self.viewBlock != nil {
            self.viewBlock!(self, textView.text)
        }
    }
    
    //MARK: -observe
    override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
        if keyPath == "text" {
            //标题星号处理
            if hasAsterisk == true {
                labelLeft.attributedText = labelLeft.text?.toAsterisk(labelLeft.textColor, font: labelLeft.font.pointSize)
            }
        }
    }
    
    //MARK: -funtions
    func block(_ action: @escaping ((UITableViewCellTextView, String) -> Void)) {
        self.viewBlock = action;
    }
    
//    lazy var placeHolderTextView: UITextView = {
//        var view = UITextView(frame: .zero);
//        view!.autoresizingMask = [.flexibleWidth, .flexibleHeight]
//        view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
//
//        view.textAlignment = .left;
//        view.autocapitalizationType = .none;
//        view.autocorrectionType = .no;
////        view.backgroundColor = .clear;
//        view.backgroundColor = .red;
//        view.textColor = .gray
//
//        return view
//    }()
    
}
