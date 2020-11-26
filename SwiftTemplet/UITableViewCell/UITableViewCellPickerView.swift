//
//  UITableViewCellPickerView.swift
//  SwiftTemplet
//
//  Created by Bin Shang on 2019/1/10.
//  Copyright © 2019 BN. All rights reserved.
//

import UIKit
import SnapKit
import SwiftExpand


/// 单选+NNPickListView(UITableView)
class UITableViewCellPickerView: UITableViewCell {
    var inset = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)

    var viewBlock:((UITableViewCellPickerView, String, [Any]) -> Void)?
    
    /// 是否有星标
    var hasAsterisk = false;
    // MARK: -life cycle
    deinit {
        labelLeft.removeObserver(self, forKeyPath: "text")
    }
    // MARK: -life cycle

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
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
            self.pickView.show();
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        setupConstraint()
    }
    
    func setupConstraint() {
        if bounds.height <= 10 {
            return
        }
        let height = bounds.height - inset.top - inset.bottom
        let endX = accessoryType == .none ? inset.right : 0

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

        // Configure the view for the selected state
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
    func block(_ action: @escaping ((UITableViewCellPickerView, String, [Any]) -> Void)) {
        self.viewBlock = action
    }
    
    //MARK: -lazy
    lazy var pickView: NNPickListView = {
        let view = NNPickListView(frame: .zero)
        view.title = "请选择"
//        view.tips = "新年快乐!"
        view.itemList = [["11111", "123"],
                        ["22222", "234"],
                        ["33333", "456"],
                    ]
        view.block({ (view, indexP) in
            DDLog(indexP.string)
            let cellItem = view.itemList![indexP.row] 
            self.textfield.text = cellItem.first
            self.viewBlock?(self,  cellItem.first!, cellItem)
            
        })
        return view;
    }()

}
