//
//  NNTablePlainView.swift
//  SwiftTemplet
//
//  Created by Bin Shang on 2019/1/22.
//  Copyright © 2019 BN. All rights reserved.
//

import UIKit
import SwiftExpand

/// 自定义协议
@objc protocol NNTablePlainViewDelegate{
    @objc optional func plainView(_ plainView: NNTablePlainView, tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat
    @objc optional func plainView(_ plainView: NNTablePlainView, tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    @objc func plainView(_ plainView: NNTablePlainView, tableView: UITableView, didSelectRowAt indexPath: IndexPath)
}

/// 通用列表视图
class NNTablePlainView: UIView {
    weak var delegate: NNTablePlainViewDelegate?

    var list:[Any]?
    var viewBlockCellForRow: CellForRowClosure?
    var viewBlockDidSelectRow: DidSelectRowClosure?
    var viewBlockHeightForRow: ((UITableView, IndexPath) ->CGFloat)?

    
    var heightForHeaderInSection: CGFloat = 10
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    
        addSubview(tableView)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        
    }

    // MARK: - funtions
    func blockCellHeightForRow(_ action: @escaping ((UITableView, IndexPath) ->CGFloat)) {
        viewBlockHeightForRow = action;
    }
    
    func blockCellForRow(_ action: @escaping CellForRowClosure) {
        viewBlockCellForRow = action;
    }
    
    func blockDidSelectRow(_ action: @escaping DidSelectRowClosure) {
        viewBlockDidSelectRow = action;
    }
    
    //MARK: -lazy
    @objc lazy var tableView: UITableView = {
        let table = UITableView(rect: bounds, style: .plain, rowHeight: kH_CellHeight)
        table.dataSource = self
        table.delegate = self
        return table
    }()
}

extension NNTablePlainView: UITableViewDataSource, UITableViewDelegate{
    //    MARK: - tableView
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1;
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return list!.count;
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if let viewBlockHeightForRow = viewBlockHeightForRow {
           let height = viewBlockHeightForRow(tableView, indexPath)
            return height
        }
        
        if let rowHeight = delegate?.plainView?(self, tableView: tableView, heightForRowAt: indexPath) {
            return rowHeight
        }
        return tableView.rowHeight
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if viewBlockCellForRow != nil && viewBlockCellForRow!(tableView, indexPath) != nil {
            return viewBlockCellForRow!(tableView, indexPath)!;
        }
        if let cell = delegate?.plainView?(self, tableView: tableView, cellForRowAt: indexPath) {
            return cell
        }
        let cell = UITableViewCell.dequeueReusableCell(tableView)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if viewBlockDidSelectRow != nil {
            return viewBlockDidSelectRow!(tableView, indexPath);
        }
        delegate?.plainView(self, tableView: tableView, didSelectRowAt: indexPath)
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return heightForHeaderInSection
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        return UIView();
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 0.01
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        let label = UILabel(frame: .zero);
        //        label.backgroundColor = .green;
        //        label.text = "header\(section)";
        return label;
    }
}
