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
                    if self.viewBlock != nil {
                        self.viewBlock!(action.title!)
                    }
                }
            })
        }
    }

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier);
        
        contentView.addSubview(labelLeft);
        contentView.addSubview(textfield);
        
        labelLeft.addObserver(self, forKeyPath: "text", options: .new, context: nil)

        textfield.placeholder = "请选择";
        textfield.textColor = UIColor.theme
        textfield.textAlignment = .center;
        textfield.asoryView(true, unitName: kIMG_arrowDown);
        textfield.isEnabled = false

        let _ = contentView.addGestureTap { (sender: UIGestureRecognizer) in
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
        labelLeft.sizeToFit()
        labelLeft.frame.size = CGSize(width: labelLeft.frame.width, height: 35)
        labelLeft.snp.makeConstraints { (make) in
            make.centerY.equalToSuperview()
            make.left.equalToSuperview().offset(kX_GAP)
            make.size.equalTo(labelLeft.size);
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
            labelLeft.attributedText = labelLeft.text?.toAsterisk()
        }
    }
    
    //MARK: -funtions
    func block(_ action: @escaping ((String) -> Void)) {
        self.viewBlock = action
    }
    
    
    //MARK: -lazy
    lazy var alertCtrl: UIAlertController = {
        var alertController = UIAlertController.createSheet("请选择", msg: nil, items:nil, handler: { (controller: UIAlertController, action:UIAlertAction) in
            DDLog(action.title)
        })
        return alertController
    }()
    
}


