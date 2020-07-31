//
//  UITableViewCellSudokuButtonNew.swift
//  SwiftTemplet
//
//  Created by Bin Shang on 2020/7/15.
//  Copyright © 2020 BN. All rights reserved.
//

import UIKit

import SwiftExpand
///九宫格
@objcMembers class UITableViewCellSudokuButtonNew<T: UIButton>: UITableViewCell {

    var numOfRow: Int = 4
    
    var row: Int = 3
    
    private var _count: Int = 0
    
    var count: Int{
        set{
            if (newValue <= numOfRow * (row - 1)) || (newValue > numOfRow * row) {
                fatalError("只能隐藏最后一行的元素")
            }
            _count = newValue
        }
        get{
             return _count
        }
    }

    var lineSpacing: CGFloat = 10

    var interitemSpacing: CGFloat = 10

    var inset = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)

    var itemType: T.Type = T.self

    // MARK: -lazy
    lazy var items: [T] = {
        return self.contentView.updateItems(self.row*self.numOfRow, type: self.itemType) {
            $0.titleLabel?.font = UIFont.systemFont(ofSize: 15)
            $0.setTitle("\(self.itemType)\($0.tag)", for: .normal)
            $0.setTitleColor(.systemBlue, for: .normal)
        }
    }()
    
    // MARK: -life cycle
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier);
  
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
            return;
        }
        
        if numOfRow == 1 {
            items.snp.distributeViewsAlong(axisType: .vertical, fixedSpacing: 0, leadSpacing: inset.top, tailSpacing: inset.bottom)
            items.snp.makeConstraints { (make) in
                make.left.equalToSuperview().offset(inset.left)
                make.right.equalToSuperview().offset(-inset.right)
            }
            return
        }
        
        if row == 1 {
            items.snp.distributeViewsAlong(axisType: .horizontal, fixedSpacing: interitemSpacing, leadSpacing: inset.left, tailSpacing: inset.right)
            items.snp.makeConstraints { (make) in
                make.top.equalToSuperview().offset(inset.top)
                make.bottom.equalToSuperview().offset(-inset.top)
            }
            return
        }
        
        items.snp.distributeSudokuViews(fixedLineSpacing: lineSpacing, fixedInteritemSpacing: interitemSpacing, warpCount: numOfRow, edgeInset: inset)
        
        if count > 0 {
            items.filter { $0.tag >= count }.forEach({ $0.isHidden = true })
        }
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    // MARK: -funtions
    
}
