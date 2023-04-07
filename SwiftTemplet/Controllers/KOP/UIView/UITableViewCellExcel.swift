//
//  UITableViewCellExcel.swift
//  SwiftTemplet
//
//  Created by Bin Shang on 2020/7/24.
//  Copyright © 2020 BN. All rights reserved.
//

import UIKit
import SwiftExpand
import NNExcelView

class UITableViewCellExcel: UITableViewCell {

    var inset = UIEdgeInsets(top: 10, left: 15, bottom: 10, right: 15)
    
    // MARK: -lazy
    lazy var excelView: NNExcelView = {
        let excelView = NNExcelView(frame: self.bounds)
//        excelView.lockColumn = 2
        excelView.delegate = self
        return excelView
    }()
    
    // MARK: -life cycle
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier);
  
        contentView.addSubview(excelView)
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
        if bounds.height <= 10 {
            return;
        }

        excelView.snp.makeConstraints { (make) in
            make.edges.equalTo(inset)
        }
        
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    // MARK: -funtions
    

    
    
}

extension UITableViewCellExcel: NNExcelViewDelegate {
    
    func excelView(_ label: UILabel, didSelectItemAt indexPath: IndexPath) {
        DDLog(indexPath.toString())
    }
    
}
