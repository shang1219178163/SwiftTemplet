//
//	NNExcelAlertView.swift
//	MacTemplet
//
//	Created by shang on 2020/11/19 09:39
//	Copyright © 2020 shang. All rights reserved.
//


import UIKit
import SnapKit
import SwiftExpand
import NNExcelView

@objc protocol IOPParkInnerCarViewDelegate{
    @objc func parkInnerCarView(_ view: NNExcelAlertView)
    
}
        
///
@objcMembers class NNExcelAlertView: UIView {

    weak var delegate: IOPParkInnerCarViewDelegate?

    var block: ((UIButton) -> Void)?
    
    ///表格距离周围边距
    var inset = UIEdgeInsets(top: 15, left: 15, bottom: 15, right: 15)
    ///白色视图距离左右边距
    var contentViewInset = UIEdgeInsets(top: 0, left: 40, bottom: 0, right: 40)

    lazy var contentView: UIView = {
        let view = UIView(frame: .zero)
        view.backgroundColor = .white

        view.addSubview(label);
        view.addSubview(excelView);
        view.addSubview(btnSure);
        view.addSubview(lineView);
        return view;
    }()
    
    lazy var excelView: NNExcelView = {
        let excelView = NNExcelView(frame: self.bounds)
//        excelView.lockColumn = 2
        excelView.cellItemBlock = { label, indexP in
            label.adjustsFontSizeToFitWidth = true
            label.font = UIFont.systemFont(ofSize: 13)
            label.textColor = .textColor3
        }
        
        return excelView
    }()
    
    // MARK: -lifecycle
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubview(contentView)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        if bounds.height <= 10.0 {
            return;
        }
        
        let btnHeight = 44
                
        contentView.snp.remakeConstraints { (make) in
            make.centerY.equalToSuperview()
            make.left.equalToSuperview().offset(contentViewInset.left);
            make.right.equalToSuperview().offset(-contentViewInset.right);
//            make.height.equalTo(320);
        }
        
        let rowCount = excelView.dataList.count
        let height: CGFloat = excelView.itemSizeHeight*min(CGFloat(rowCount), 7.0)
        excelView.snp.remakeConstraints { (make) in
            make.centerY.equalToSuperview()
            make.left.equalToSuperview().offset(inset.left);
            make.right.equalToSuperview().offset(-inset.right);
            make.height.equalTo(height);
        }
        
        if label.isHidden == false {
            label.snp.remakeConstraints { (make) in
                make.left.equalToSuperview().offset(inset.left);
                make.right.equalToSuperview().offset(-inset.right);
                make.bottom.equalTo(excelView.snp.top).offset(-inset.top);
                make.height.equalTo(20);
            }
        }
        
        lineView.snp.remakeConstraints { (make) in
            make.top.equalTo(excelView.snp.bottom).offset(inset.bottom);
            make.left.equalToSuperview().offset(0);
            make.right.equalToSuperview().offset(0);
            make.height.equalTo(1);
        }
        
        btnSure.snp.remakeConstraints { (make) in
            make.top.equalTo(lineView.snp.bottom).offset(0);
            make.left.equalToSuperview().offset(0);
            make.right.equalToSuperview().offset(0);
            make.height.equalTo(btnHeight);
            make.bottom.equalToSuperview()
        }
        
    }
    
    // MARK: - funtions
        
    //MARK: -lazy
    
    lazy var label: UILabel = {
        let view = UILabel(frame: .zero);
        view.text = "请选择";
        view.textColor = .lightGray;
        view.textAlignment = .center;
        return view;
    }()
    
    lazy var lineView: UIView = {
        var view = UIView(frame: .zero);
        view.backgroundColor = UIColor.hexValue(0xE5E5E5, a: 1)
        
        return view;
    }()
    
    lazy var btnSure: UIButton = {
        let view = UIButton(type: .custom);
        view.setTitle(kTitleSure, for: .normal);
        view.setTitleColor(.systemBlue, for: .normal);
        view.titleLabel?.font = UIFont.systemFont(ofSize: 16);
        view.adjustsImageWhenHighlighted = false;
        view.tag = 1;

        view.addActionHandler({ (sender) in
            self.block?(sender)
            
        }, for: .touchUpInside)
        return view;
    }()
}


//extension UIView {
//    func show(_ animated: Bool = true, completion: ((Bool) -> Void)? = nil) {
//        guard let keyWindow = UIApplication.shared.keyWindow else { return }
//        if keyWindow.subviews.contains(self) {
//            self.dismiss()
//        }
//
//        if self.frame.equalTo(.zero) {
//            self.frame = UIScreen.main.bounds
//        }
//
//        keyWindow.endEditing(true)
//        keyWindow.addSubview(self);
//
////        self.transform = self.transform.scaledBy(x: 1.5, y: 1.5)
//        let duration = animated ? 0.15 : 0
//        UIView.animate(withDuration: duration, animations: {
//            self.backgroundColor = UIColor.black.withAlphaComponent(0.3);
////            self.transform = CGAffineTransform.identity
//
//        }, completion: completion);
//    }
//
//    func dismiss(_ animated: Bool = true, completion: ((Bool) -> Void)? = nil) {
//        let duration = animated ? 0.15 : 0
//        UIView.animate(withDuration: duration, animations: {
//            self.backgroundColor = UIColor.black.withAlphaComponent(0);
////            self.transform = self.transform.scaledBy(x: 0.5, y: 0.5)
//
//        }) { (isFinished) in
//            completion?(isFinished)
//            self.removeFromSuperview();
//        }
//    }
//}
