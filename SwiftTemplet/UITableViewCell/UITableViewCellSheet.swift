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
class UITableViewCellSheet: UITableViewCell {
    
    var viewBlock:((String) -> Void)?
    var itemList: [String]? {
        willSet{
            alertCtrl = UIAlertController.createSheet("请选择", msg: nil, items: newValue, handler: { (controller, action) in
                if action.title != kTitleCancell {
                    self.textfield.text = action.title
                    self.viewBlock?(action.title!)
                }
            })
        }
    }
    
    var inset = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
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

        _ = contentView.addGestureTap { (sender) in
            if let keyWindow = UIApplication.shared.keyWindow {
                keyWindow.endEditing(true)
                keyWindow.rootViewController?.present(self.alertCtrl, animated: true, completion: nil)
            }
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
        if bounds.height <= 10.0 {
            return
        }
        let height = bounds.height - inset.top - inset.bottom
        let endX = accessoryType == .none ? inset.right : 0

        let labelLeftSize = labelLeft.sizeThatFits(.zero)
        labelLeft.snp.makeConstraints { (make) in
            make.centerY.equalToSuperview()
            make.left.equalToSuperview().offset(inset.left)
            make.width.equalTo(labelLeftSize.width)
            make.height.equalTo(height)
        }
        
        textfield.snp.makeConstraints { (make) in
            make.top.equalTo(labelLeft)
            make.left.equalTo(labelLeft.snp.right).offset(kPadding)
            make.right.equalToSuperview().offset(-endX)
            make.height.equalTo(labelLeft)
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
    func block(_ action: @escaping ((String) -> Void)) {
        self.viewBlock = action
    }
    
    
    //MARK: -lazy
    lazy var alertCtrl: UIAlertController = {
        var alertController = UIAlertController.createSheet("请选择", msg: nil, items:nil, handler: { (controller, action) in
            DDLog(action.title as Any)
        })
        return alertController
    }()
    
}


