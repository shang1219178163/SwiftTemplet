//
//  UITableViewCellSheet.swift
//  SwiftTemplet
//
//  Created by Bin Shang on 2019/1/12.
//  Copyright © 2019 BN. All rights reserved.
//

import UIKit
import SnapKit
import SwiftExpand

/// 文字+sheet
class UITableViewCellSheet: UITableViewCell,UITextFieldDelegate {
    
    var viewBlock:((String) -> Void)?
    var itemList: [String]? {
        willSet{
            alertCtrl = UIAlertController.createSheet("请选择", msg: nil, items: newValue, handler: { (controller: UIAlertController, action:UIAlertAction) in
                if action.title != kTitleCancell {
                    self.textfield.text = action.title
                    self.viewBlock?(action.title!)
                }
            })
        }
    }
    
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
        contentView.addSubview(textfield);
        
        labelLeft.numberOfLines = 1
        labelLeft.addObserver(self, forKeyPath: "text", options: .new, context: nil)

        textfield.placeholder = "请选择";
        textfield.textColor = UIColor.theme
        textfield.textAlignment = .center;
        textfield.isEnabled = false
        accessoryType = .disclosureIndicator

        let _ = contentView.addGestureTap { (sender) in
            UIApplication.shared.keyWindow?.endEditing(true)
            UIApplication.shared.keyWindow?.rootViewController?.present(self.alertCtrl, animated: true, completion: nil)
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
        if bounds.height <= 0.0 {
            return
        }
        labelLeft.sizeToFit()
        labelLeft.frame.size = CGSize(width: labelLeft.frame.width, height: 35)
        labelLeft.snp.makeConstraints { (make) in
            make.centerY.equalToSuperview()
            make.left.equalToSuperview().offset(Xgap)
            make.size.equalTo(labelLeft.size);
        }
        
        textfield.snp.makeConstraints { (make) in
            make.top.equalTo(labelLeft);
            make.left.equalTo(labelLeft.snp.right).offset(kPadding)
            make.right.equalToSuperview().offset(-Xgap)
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
    func block(_ action: @escaping ((String) -> Void)) {
        self.viewBlock = action
    }
    
    
    //MARK: -lazy
    lazy var alertCtrl: UIAlertController = {
        var alertController = UIAlertController.createSheet("请选择", msg: nil, items:nil, handler: { (controller, action) in
            DDLog(action.title)
        })
        return alertController
    }()
    
}


