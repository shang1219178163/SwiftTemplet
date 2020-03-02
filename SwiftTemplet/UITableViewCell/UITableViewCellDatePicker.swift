//
//  UITableViewCellDatePicker.swift
//  SwiftTemplet
//
//  Created by Bin Shang on 2018/9/7.
//  Copyright © 2018年 BN. All rights reserved.
//

import UIKit

import SnapKit
import SwiftExpand

/// 文字+时间选择器
class UITableViewCellDatePicker: UITableViewCell {

    typealias ViewClick = (UITableViewCellDatePicker, NNDatePicker, Int) -> Void;
    var viewBlock: ViewClick?;
     /// 是否有星标
     var hasAsterisk = false;
 
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier);
        
        contentView.addSubview(labelLeft);
        contentView.addSubview(textfield);

        labelLeft.addObserver(self, forKeyPath: "text", options: .new, context: nil)
        
        textfield.placeholder = "请选择";
        textfield.text = DateFormatter.stringFromDate(Date(), fmt: kDateFormatDay)
        textfield.textColor = UIColor.theme
        textfield.textAlignment = .center;
        
        let image = UIImage.image(named: kIMG_arrowRight, podClassName: "SwiftExpand")
        textfield.asoryView(true, image: image)
//        textfield.asoryView(true, unitName: "公斤(万元)");
//        textfield.delegate = self;
        textfield.isEnabled = false
        
//        contentView.insertSubview(backView, at: 0)
        let _ = contentView.addGestureTap { (sender: UIGestureRecognizer) in
            UIApplication.shared.keyWindow?.endEditing(true)
            self.datePicker.show();
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder);
        fatalError("init(coder:) has not been implemented")
    }

    
    override func layoutSubviews() {
        super.layoutSubviews();
//        backView.frame = contentView.frame;
        setupConstraint()
    }
    
    func setupConstraint() {
        if bounds.height <= 0.0 {
            return
        }
        labelLeft.sizeToFit()
        labelLeft.frame.size = CGSize(width: labelLeft.frame.width, height: 35)
        labelLeft.snp.makeConstraints { (make) in
            make.centerY.equalToSuperview()
            make.left.equalToSuperview().offset(kX_GAP)
            make.size.equalTo(labelLeft.size)
        }
        
        textfield.snp.makeConstraints { (make) in
            make.top.equalTo(labelLeft);
            make.left.equalTo(labelLeft.snp.right).offset(kPadding)
            make.right.equalToSuperview().offset(-kX_GAP)
            make.height.equalTo(labelLeft);
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
    }
    
    //MARK: -funtions
    func block(_ action: @escaping ViewClick) {
        viewBlock = action;
    }
    
    //MARK: -lazy
    lazy var datePicker: NNDatePicker = {
        let view = NNDatePicker();
        view.block({ (sender, idx) in
//                DDLog(view,sender.datePicker.date,idx);
            if self.viewBlock != nil {
                self.viewBlock!(self,sender,idx);
            
            }
            let dateStr = DateFormatter.stringFromDate(view.datePicker.date, fmt: kDateFormatDay)
            self.textfield.text = idx == 1 ? dateStr : "";
        });
        return view;
    }();
    
//    lazy var backView: UIView = {
//        var view = UIView(frame: .zero)
//        view.backgroundColor = contentView.backgroundColor;
//        return view
//    }()
}

extension UITableViewCellDatePicker: UITextFieldDelegate {
    //MARK: -textfield
//    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
////        superview?.superview?.endEditing(true);
////        datePicker.show();
//        return false;
//    }
//
//    func textFieldDidEndEditing(_ textField: UITextField) {
//
//    }
//
//    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
//        return true;
//    }
}
