//
//  UITableViewCellTextField.swift
//  SwiftTemplet
//
//  Created by Bin Shang on 2019/1/9.
//  Copyright © 2019 BN. All rights reserved.
//

import UIKit

import SnapKit
import SwiftExpand

/// 文字+UITextField(输入框)
@objcMembers class UITableViewCellTextField: UITableViewCell {

    var viewBlock: ((UITextField) ->Void)?
    var textFieldEditingChangedBlock: ((UITextField) -> Void)?

    var inset = UIEdgeInsets(top: 10, left: 15, bottom: 10, right: 15)
    /// 是否有星标
    var hasAsterisk = false
    ///清空输入框
    var isBackDelete = true
    
    ///最大字数
    var wordCount: Int?
    ///汉字模式
    var pattern: String? = "[^\\u4E00-\\u9FA5]"
    ///最小值,最大值,几位小数
    var moneyTuple: (CGFloat, CGFloat, Int)?

    // MARK: -life cycle
    deinit {
        labelLeft.removeObserver(self, forKeyPath: "text")
        NotificationCenter.default.removeObserver(self, name: UITextField.textDidChangeNotification, object: textfield)
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier);
        
        contentView.addSubview(labelLeft);
        contentView.addSubview(textfield);
        
        labelLeft.numberOfLines = 1
        textfield.placeholder = "请输入";
        textfield.textAlignment = .center;
        textfield.delegate = self;
        textfield.addTarget(self, action: #selector(handleEditingChanged(_:)), for: .editingChanged)

//        let image = UIImage(named: "img_arrowRight_gray", podName: "SwiftExpand")
//        _ = textfield.asoryView(true, image: image)
//        textfield.asoryView(true, unitName: "公斤(万元)");

        NotificationCenter.default.addObserver(self, selector: #selector(handleTextFieldChangedNotifation(_:)), name: UITextField.textDidChangeNotification, object: textfield)
        
        labelLeft.numberOfLines = 1
        labelLeft.addObserver(self, forKeyPath: "text", options: .new, context: nil)
    }
    
    override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
        if keyPath == "text" {
            if hasAsterisk {
                //标题星号处理
                labelLeft.attributedText = labelLeft.text?.matt.appendPrefix(font: labelLeft.font)
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
        let endX = accessoryType == .none ? inset.right : kPadding
        
        if labelLeft.isHidden {
            textfield.snp.makeConstraints { (make) in
                make.edges.equalTo(inset)
            }
            return
        }

        let labelLeftSize = labelLeft.sizeThatFits(.zero)
        labelLeft.snp.remakeConstraints { (make) in
            make.centerY.equalToSuperview()
            make.left.equalToSuperview().offset(inset.left)
            make.width.equalTo(labelLeftSize.width)
            make.height.equalTo(height)
        }
        
        textfield.snp.remakeConstraints { (make) in
            make.top.equalTo(labelLeft)
            make.left.equalTo(labelLeft.snp.right).offset(kPadding)
            make.right.equalToSuperview().offset(-endX)
            make.height.equalTo(labelLeft)
        }
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
    }
    
    //MARK: -funtions
    func block(_ action:@escaping ((UITextField) ->Void)) {
        viewBlock = action
    }
    
    @objc func handleEditingChanged(_ textField: UITextField) {
        textFieldEditingChangedBlock?(textfield)
    }
    
    @objc func handleTextFieldChangedNotifation(_ n: Notification) {
        guard let textField = n.object as? UITextField else {
            return
        }
        guard let wordCount = wordCount else {
            return
        }
        //非 marketedText 才继续往下处理
        guard let _: UITextRange = textField.markedTextRange else {
            //记录当前光标的位置，后面需要进行修改
            let cursorPostion = textField.offset(from: textField.endOfDocument, to: textField.selectedTextRange!.end)
            
            var text = textField.text!
            if let pattern = pattern {
                //判断非中文的正则表达式
//                let pattern = "[^\\u4E00-\\u9FA5]"
                text = textField.text!.pregReplace(pattern: pattern, with: "")
            }
            //限制最大输入长度
            if text.count > wordCount {
                text = String(text.prefix(wordCount))
            }
            textField.text = text
            //让光标停留在正确的位置
            let targetPosion = textField.position(from: textField.endOfDocument, offset: cursorPostion)!
            textField.selectedTextRange = textField.textRange(from: targetPosion, to: targetPosion)
            return
        }
    }
    // MARK: -lazy
    public lazy var labelLeft: UILabel = {
        let view = UILabel(frame: CGRect.zero)
        view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        view.textAlignment = .left
        view.numberOfLines = 0
        view.lineBreakMode = .byCharWrapping
        
        return view
    }()
    
    public lazy var btn: UIButton = {
        let view = UIButton(type: .custom)
        view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        view.titleLabel?.adjustsFontSizeToFitWidth = true
        view.titleLabel?.minimumScaleFactor = 1.0
        view.isExclusiveTouch = true
        view.adjustsImageWhenHighlighted = false
        view.setTitleColor(.black, for: .normal)
        
        return view
    }()
    
    public lazy var textfield: UITextField = {
         let view = UITextField(frame: .zero)
         view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
         view.textAlignment = .left
         view.contentVerticalAlignment = .center
         view.autocapitalizationType = .none
         view.autocorrectionType = .no
         view.clearButtonMode = .whileEditing
         view.backgroundColor = .white
         
         return view
    }()
}

extension UITableViewCellTextField: UITextFieldDelegate{
    
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
            if isBackDelete {
                textField.text = ""
            }
            textFieldEditingChangedBlock?(textField)
            return true
        }
        
        guard let text = textField.text else {
            return true }
        if let (minValue, maxValue, maxFractionDigits) = moneyTuple {
//            DDLog(text.cgFloatValue, maxValue)
            if string == "." && text.cgFloatValue >= maxValue{
                return false
            }
            
            let result = text.replacingCharacters(range.location, range.length, with: string)
            if result.cgFloatValue > maxValue{
                return false
            }
            return result.validMoney(maxFractionDigits)
        }
        return true
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        viewBlock?(textField)
    }
}
