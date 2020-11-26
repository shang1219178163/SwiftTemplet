//
//  BNPickerView.swift
//  SwiftTemplet
//
//  Created by Bin Shang on 2019/2/28.
//  Copyright © 2019 BN. All rights reserved.
//

import UIKit

import SnapKit
import SwiftExpand

class NNPickerView: UIView {

    let contentViewH: CGFloat = kPickerViewHeight+kNaviBarHeight

    typealias ViewClick = (NNPickerView, Int) -> Void;
    var viewBlock: ViewClick?;
    
    // MARK: -lifecycle
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.frame = UIScreen.main.bounds
        addSubview(masView)
        addSubview(contentView)
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        contentView.snp.makeConstraints { (make) in
            make.left.right.bottom.equalToSuperview()
            make.height.equalTo(contentViewH)
        }
        
        toobarView.snp.makeConstraints { (make) in
            make.top.left.right.equalToSuperview()
            make.height.equalTo(kNaviBarHeight)
        }
        
        btnCancell.snp.makeConstraints { (make) in
            make.top.equalToSuperview().offset(kPadding)
            make.left.equalToSuperview().offset(kX_GAP)
            make.bottom.equalToSuperview().offset(-kPadding)
            make.width.equalTo(60)
        }
        
        btnSure.snp.makeConstraints { (make) in
            make.top.equalToSuperview().offset(kPadding)
            make.right.equalToSuperview().offset(-kX_GAP)
            make.bottom.equalToSuperview().offset(-kPadding)
            make.width.equalTo(60)
        }
        
        label.snp.makeConstraints { (make) in
            make.centerY.equalToSuperview()
            make.left.equalTo(btnCancell.snp.right).offset(kPadding)
            make.right.equalTo(btnSure.snp.left).offset(-kPadding)
        }
        
        lineView.snp.makeConstraints { (make) in
            make.top.equalTo(toobarView.snp.bottom)
            make.left.right.equalToSuperview()
            make.height.equalTo(kH_LINE_VIEW)
        }
        
        pickerView.snp.makeConstraints { (make) in
            make.top.equalTo(lineView.snp.bottom)
            make.left.right.bottom.equalToSuperview()
        }
        
        masView.snp.makeConstraints { (make) in
            make.top.left.right.equalToSuperview()
            make.bottom.equalTo(contentView.snp.top)
        }
        
    }

    // MARK: -funtions
    func show() {
        UIApplication.shared.keyWindow?.endEditing(true)
        UIApplication.shared.keyWindow?.addSubview(self);
        
        contentView.transform = contentView.transform.translatedBy(x: 0, y: contentViewH)
        UIView.animate(withDuration: kDurationShow, animations: {
            self.backgroundColor = UIColor.black.withAlphaComponent(0.3);
            self.contentView.transform = CGAffineTransform.identity
            
        }, completion: nil);
    }
    
    func dismiss() {
        UIView.animate(withDuration: kDurationShow, animations: {
            self.backgroundColor = UIColor.black.withAlphaComponent(0);
            self.contentView.transform = self.contentView.transform.translatedBy(x: 0, y: self.contentViewH)
            
        }) { (isFinished) in
            if isFinished {
                self.removeFromSuperview();
            }
        }
    }
    
    func block(_ action:@escaping ViewClick) {
        self.viewBlock = action;
    }
    
    // MARK: -lazy
    lazy var toobarView: UIView = {
        var view = UIView(frame: .zero)
        view.addSubview(btnCancell)
        view.addSubview(label)
        view.addSubview(btnSure)
        
        return view
    }()
    
    lazy var btnCancell: UIButton = {
        let view = UIButton(type: .custom);
        view.tag = 0;
        
        view.titleLabel?.font = UIFont.systemFont(ofSize: 16);
        view.setTitle(kTitleCancell, for: .normal);
        view.setTitleColor(.lightGray, for: .normal);
        view.addActionHandler({ (control) in
            if let sender = control as? UIButton {
                self.viewBlock?(self, sender.tag);
                self.dismiss();
            }

        }, for: .touchUpInside)
        return view;
    }();
    
    lazy var label: UILabel = {
        let view = UILabel(frame: .zero);
        view.text = "请选择";
        view.textColor = .lightGray;
        view.textAlignment = .center;
        return view;
    }();
    
    lazy var btnSure:UIButton = {
        let view = UIButton(type: .custom);
        view.tag = 1;
        
        view.titleLabel?.font = UIFont.systemFont(ofSize: 16);
        view.setTitle(kTitleSure, for: .normal);
        view.setTitleColor(.systemBlue, for: .normal);
        view.addActionHandler({ (control) in
            if let sender = control as? UIButton {
                print("被选中的索引为：\(self.pickerView.selectedRow(inComponent: 0)),\(self.pickerView.selectedRow(inComponent: 1)),\(self.pickerView.selectedRow(inComponent: 2))")
                self.viewBlock?(self, sender.tag);
                self.dismiss();
            }

        }, for: .touchUpInside)
        return view;
    }();
    
    lazy var pickerView: UIPickerView = {
        let view = UIPickerView()
        view.backgroundColor = .white

        view.delegate = self;
        view.dataSource = self
        // 设置选择框的默认值
        view.selectRow(0, inComponent: 0, animated: true)
        view.selectRow(1, inComponent: 1, animated: true)
        view.selectRow(2, inComponent: 2, animated: true)
        return view
    }()
    
    lazy var contentView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.white
        view.addSubview(toobarView)
        view.addSubview(lineView)
        view.addSubview(pickerView)
        return view
    }()
    
    lazy var masView: UIView = {
        let view = UIView()
        _ = view.addGestureTap({ (recognizer) in
            self.dismiss()
        })
        return view
    }()
    
    lazy var lineView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.line
        return view
    }()
}


extension NNPickerView: UIPickerViewDelegate, UIPickerViewDataSource {

    /// 设置选择框的列数
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 3
    }
    
    /// 设置选择框的行数
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return 9
    }

    /// 设置选择框各选项的内容
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return String(component) + "-" + String(row)
    }
}
