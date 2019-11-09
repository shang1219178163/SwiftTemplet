//
//  NNTablePlainView.swift
//  SwiftTemplet
//
//  Created by Bin Shang on 2019/1/22.
//  Copyright © 2019 BN. All rights reserved.
//

import UIKit
import SwiftExpand

/// 通用列表视图
class NNTablePlainView: UIView, UITableViewDataSource, UITableViewDelegate {
    
    var list:[Any]?
    var viewBlockCellForRow: CellForRowClosure?
    var viewBlockDidSelectRow: DidSelectRowClosure?
    
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
    
    //    MARK: - tableView
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1;
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return list!.count;
    };
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return tableView.rowHeight
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if self.viewBlockCellForRow != nil && self.viewBlockCellForRow!(tableView, indexPath) != nil {
            return self.viewBlockCellForRow!(tableView, indexPath)!;
        }
        let cell = UITableViewCellZero.cellWithTableView(tableView) as! UITableViewCellZero;
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if self.viewBlockDidSelectRow != nil {
            return self.viewBlockDidSelectRow!(tableView, indexPath);
        }
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 10.0;
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
    
    func blockCellForRow(_ action: @escaping CellForRowClosure) {
        self.viewBlockCellForRow = action;
    }
    
    func blockDidSelectRow(_ action: @escaping DidSelectRowClosure) {
        self.viewBlockDidSelectRow = action;
    }
    
    //MARK: -lazy
    @objc lazy var tableView: UITableView = {
        var table = UITableView.create(bounds, style: .plain, rowHeight: kH_CellHeight)
        table.dataSource = self
        table.delegate = self
        return table
    }()
}
