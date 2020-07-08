//
//  UITableViewCellTextView.swift
//  SwiftTemplet
//
//  Created by Bin Shang on 2019/1/10.
//  Copyright © 2019 BN. All rights reserved.
//

import UIKit

import SwiftExpand

class UITableViewCellTextView: UITableViewCell {

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
    // MARK: -life cycle
    deinit {
        labelLeft.removeObserver(self, forKeyPath: "text")
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier);
        
        contentView.addSubview(labelLeft);
        contentView.addSubview(textView);
        contentView.addSubview(labelLeftSub);

        labelLeftSub.textColor = .gray
        labelLeftSub.text = "0" + "/" + "\(wordCount)"
        labelLeftSub.textAlignment = .right
        labelLeftSub.font = UIFont.systemFont(ofSize: 13)
        textView.delegate = self;
        textView.returnKeyType = .done
        
        labelLeft.numberOfLines = 1
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
        if bounds.height <= 10.0 {
            return
        }
        let size = labelLeft.sizeThatFits(.zero)
        
        switch type {
        case 1:
            labelLeft.snp.makeConstraints { (make) in
                make.top.equalToSuperview().offset(kY_GAP)
                make.left.equalToSuperview().offset(Xgap)
                make.size.equalTo(size)
            }
            
            labelLeftSub.snp.makeConstraints { (make) in
                make.top.equalTo(labelLeft)
                make.right.equalToSuperview().offset(-Xgap)
                make.size.equalTo(labelLeft)
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
                make.size.equalTo(size);
            }
            
            labelLeftSub.snp.makeConstraints { (make) in
                make.left.equalTo(labelLeft)
                make.right.equalTo(labelLeft)
                make.bottom.equalToSuperview().offset(-kY_GAP);
                make.height.equalTo(25)
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

    //MARK: -observe
    override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
        if keyPath == "text" {
            //标题星号处理
            if hasAsterisk == true {
                labelLeft.attributedText = labelLeft.text?.toAsterisk(labelLeft.textColor, font: labelLeft.font.pointSize)
            }
        }
        else {
            super.observeValue(forKeyPath: keyPath, of: object, change: change, context: context)
        }
    }
    
    //MARK: -funtions
    func block(_ action: @escaping ((UITableViewCellTextView, String) -> Void)) {
        self.viewBlock = action;
    }
}

extension UITableViewCellTextView: UITextViewDelegate {

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
        self.viewBlock?(self,  textView.text)
    }
}

//extension UITableViewCellTextView{
//
//    override func canPerformAction(_ action: Selector, withSender sender: Any?) -> Bool {
//        return true
//    }
//
//    override var canBecomeFirstResponder: Bool{
//        return true
//    }
//
//    func enableCustomMenu() {
//         let cut = UIMenuItem(title: "Cut", action: #selector(runCut))
//         let copy = UIMenuItem(title: "Copy", action: #selector(runCopy))
//         let paste = UIMenuItem(title: "Paste", action: #selector(runPaste))
//         let pasteSearch = UIMenuItem(title: "Paste and Search", action: #selector(runPasteSearch))
//         let look = UIMenuItem(title: "Look Up", action: #selector(runLook))
//
//    //  ----> here Arrange as you can
//         UIMenuController.shared.menuItems = [cut, copy, paste, pasteSearch, look]
//         UIMenuController.shared.update()
//     }
//
//     func disableCustomMenu() {
//         UIMenuController.shared.menuItems = nil
//     }
//
//     @objc func runCut() {
//     }
//
//     @objc func runCopy() {
//        print(textView.text ?? "")
//     }
//     @objc func runPaste() {
//
//     }
//     @objc func runPasteSearch() {
//
//     }
//     @objc func runLook() {
//
//     }
//}
