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

    var viewBlock:((UITableViewCellPickerView, String, [Any]) -> Void)?

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
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

        // Configure the view for the selected state
    }
    
    //MARK: -observe
    override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
        if keyPath == "text" {
            //标题星号处理
            labelLeft.attributedText = labelLeft.text?.toAsterisk()
        }
    }
    
    //MARK: -funtions
    func block(_ action: @escaping ((UITableViewCellPickerView, String, [Any]) -> Void)) {
        self.viewBlock = action
    }
    
    //MARK: -lazy
    lazy var pickView: NNPickListView = {
        var view = NNPickListView(frame: .zero)
//        view.title = "请选择"
        view.tips = "新年快乐!"
        view.itemList = [["11111", "123"],
                        ["22222", "234"],
                        ["33333", "456"],
                    ]
        view.block({ (view:NNPickListView, indexP:IndexPath) in
            DDLog(indexP.string)
            let cellItem = view.itemList![indexP.row] 
            self.textfield.text = cellItem.first
            if self.viewBlock != nil {
                self.viewBlock!(self, cellItem.first!, cellItem)
            }
        })
        return view;
    }()

}
