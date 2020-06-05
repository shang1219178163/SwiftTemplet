//
//  UITableViewCellDateRange.swift
//  SwiftTemplet
//
//  Created by Bin Shang on 2019/1/10.
//  Copyright © 2019 BN. All rights reserved.
//

import UIKit

/// 有效日期选择
class UITableViewCellDateRange: UITableViewCell {

    var Xgap: CGFloat = 15;
    /// 是否有星标
    var hasAsterisk = false;
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier);
        
        contentView.addSubview(dateRangeView);
        
        dateRangeView.labTitle.addObserver(self, forKeyPath: "text", options: .new, context: nil)
        
        dateRangeView.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder);
        fatalError("init(coder:) has not been implemented")
    }
    
    deinit {
        dateRangeView.labTitle.removeObserver(self, forKeyPath: "text")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews();
        
//        if bounds.height <= 0.0 {
//            return
//        }
//        dateRangeView.frame = contentView.bounds
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
    }
    
    //MARK: -observe
    override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
        if keyPath == "text" {
            //标题星号处理
            if hasAsterisk == true {
                dateRangeView.labTitle.attributedText = dateRangeView.labTitle.text?.toAsterisk(labelLeft.textColor, font: labelLeft.font.pointSize)
            }
        }
    }
    
    
    lazy var dateRangeView: NNDateRangeView = {
        var view = NNDateRangeView(frame: contentView.bounds)
        view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        return view
    }()

}
