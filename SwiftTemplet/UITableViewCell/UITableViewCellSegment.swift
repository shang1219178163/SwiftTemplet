//
//  UITableViewCellSegment.swift
//  SwiftTemplet
//
//  Created by Bin Shang on 2019/1/10.
//  Copyright © 2019 BN. All rights reserved.
//

import UIKit
import SnapKit
import SwiftExpand

/// 文字+UISegment分段按钮
class UITableViewCellSegment: UITableViewCell, UITextFieldDelegate {
    
    var ctlAlignment = NSTextAlignment.center
    /// 是否有星标
    var hasAsterisk = false
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier);
        
        contentView.addSubview(labelLeft);
        contentView.addSubview(segmentCtl);
        labelLeft.addObserver(self, forKeyPath: "text", options: .new, context: nil)
        
    }
    
    override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
        if keyPath == "text" {
            //标题星号处理
            if hasAsterisk {
                labelLeft.attributedText = labelLeft.text?.toAsterisk(labelLeft.textColor, font: labelLeft.font.pointSize)
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
        if CGRect.zero == self.bounds {
            return
        }
        labelLeft.sizeToFit()
        labelLeft.snp.makeConstraints { (make) in
            make.centerY.equalToSuperview()
            make.left.equalToSuperview().offset(kX_GAP)
//            make.width.equalTo(labelLeft.frame.width)
            make.height.equalTo(30)
        }
        
        let width = contentView.frame.width - labelLeft.frame.maxX - kX_GAP
        let ctlWidth = width*0.7
        
        segmentCtl.snp.makeConstraints { (make) in
            make.centerY.equalToSuperview()
            make.right.equalToSuperview().offset(-15)
            make.width.greaterThanOrEqualTo(ctlWidth)
            make.height.equalTo(labelLeft);
        }
        
//        switch ctlAlignment {
//        case .left:
//            segmentCtl.snp.makeConstraints { (make) in
//                make.centerY.equalToSuperview()
//                make.left.lessThanOrEqualTo(labelLeft.snp.right).offset(kPadding)
//                make.width.equalTo(ctlWidth)
//                make.height.equalTo(labelLeft);
//            }
//
//        case .right:
//            segmentCtl.snp.makeConstraints { (make) in
//                make.centerY.equalToSuperview()
//                make.right.equalToSuperview().offset(-kX_GAP)
//                make.width.equalTo(ctlWidth)
//                make.height.equalTo(labelLeft);
//            }
//
//        case .justified:
//            segmentCtl.snp.makeConstraints { (make) in
//                make.centerY.equalToSuperview()
//                make.left.lessThanOrEqualTo(labelLeft.snp.right).offset(kPadding)
//                make.right.equalToSuperview().offset(-kX_GAP)
//                make.height.equalTo(labelLeft);
//            }
//
//        default:
//            segmentCtl.snp.makeConstraints { (make) in
//                make.centerY.equalToSuperview()
//                make.left.lessThanOrEqualTo(labelLeft.snp.right).offset((width - ctlWidth)*0.5)
//                make.width.greaterThanOrEqualTo(ctlWidth)
//                make.height.equalTo(labelLeft);
//            }
//        }
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
    }
    
    //MARK: -lazy
    lazy var segmentCtl: NNSegmentedControl = {
        var view = NNSegmentedControl.create( .zero, items: ["是","否"], selectedIdx: 0, type: 0);
        return view
    }()
    
}


