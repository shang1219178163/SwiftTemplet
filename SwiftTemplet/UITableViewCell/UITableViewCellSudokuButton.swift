//
//  UITableViewCellSudokuButton.swift
//  SwiftTemplet
//
//  Created by Bin Shang on 2020/6/19.
//  Copyright © 2020 BN. All rights reserved.
//

import UIKit

class UITableViewCellSudokuButton: UITableViewCell {

    var numOfRow: Int = 3
    
    var row: Int = 3

    var inset = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)

    // MARK: -lazy
    lazy var items: [UIButton] = {
        if let list = self.contentView.subviews.filter({ $0.isKind(of: UIButton.self) }) as? [UIButton] {
            if list.count == self.row*self.numOfRow {
                return list
            }
        }
        
        self.contentView.subviews.forEach { $0.removeFromSuperview() }
        
        var arr: [UIButton] = [];
        for i in 0..<self.row*self.numOfRow {
            let subview = UIButton(type: .custom)
            subview.titleLabel?.font = UIFont.systemFont(ofSize: 15)
            subview.setTitle("UIButton\(i)", for: .normal)
            subview.setTitleColor(.black, for: .normal)
            
            subview.setBackgroundColor(.gray, for: .disabled)
            self.contentView.addSubview(subview)
            arr.append(subview)
        }
        return arr;
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
        if bounds.height <= 0.0 {
            return;
        }
        items.snp.distributeSudokuViews(fixedLineSpacing: 5, fixedInteritemSpacing: 10, warpCount: numOfRow, edgeInset: inset)
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    // MARK: -funtions
    

    
    
}

