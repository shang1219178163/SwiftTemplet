//
//  NNFormView.swift
//  SwiftTemplet
//
//  Created by Bin Shang on 2019/11/6.
//  Copyright © 2019 BN. All rights reserved.
//

import UIKit
import SwiftExpand

/// 通用列表视图

@objcMembers class NNFormView: UIView {
    
    var list: [UITextField] = []
    var placeholders: [String] = [] {
        willSet{
            list.removeAll()
            for e in newValue.enumerated() {
                let textField = UITextField();
                textField.placeholder = e.element;
                textField.clearButtonMode = .always;
                list.append(textField)
            }
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        layer.borderWidth = 0.8;
        layer.borderColor = UIColor.hexValue(0xe4e4e4).cgColor;
           
        tableView.isScrollEnabled = false;
        addSubview(tableView)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        
        if CGRect.zero.equalTo(self.bounds) {
            return;
        }
        
        tableView.rowHeight = bounds.height/list.count.cgFloatValue;
        for e in list.enumerated() {
            e.element.frame = CGRect(8, 0, bounds.width - 8, tableView.rowHeight)
        }
        tableView.reloadData();
    }
    
    //MARK: -lazy
    lazy var tableView: UITableView = {
        let table = UITableView(rect: bounds, style: .plain, rowHeight: kH_CellHeight)
        table.dataSource = self
        table.delegate = self
        return table
    }()
}

extension NNFormView: UITableViewDataSource, UITableViewDelegate {

    //    MARK: - tableView
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return list.count;
    };
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return tableView.rowHeight
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell.dequeueReusableCell(tableView)
        let textField = list[indexPath.row];
        cell.contentView.addSubview(textField);
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
     
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 0.01;
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        return UIView();
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 0.01;
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        let label = UILabel(frame: .zero);
        //        label.backgroundColor = .green;
        //        label.text = "header\(section)";
        return label;
    }
}
