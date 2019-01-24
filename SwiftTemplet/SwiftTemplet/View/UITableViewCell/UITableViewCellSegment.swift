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
class UITableViewCellSegment: UITableViewCell,UITextFieldDelegate {
    
    var ctlAlignment = NSTextAlignment.center
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier);
        
        contentView.addSubview(labelLeft);
        contentView.addSubview(segmentCtl);
        labelLeft.addObserver(self, forKeyPath: "text", options: .new, context: nil)
        
    }
    
    override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
        if keyPath == "text" {
            //标题星号处理
            labelLeft.attributedText = labelLeft.text?.toAsterisk()
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder);
        fatalError("init(coder:) has not been implemented")
    }
    
    deinit {
        labelLeft.removeObserver(self, forKeyPath: "text")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews();
        
        setupConstraint()
    }
    
    func setupConstraint() -> Void {
        labelLeft.sizeToFit()
        labelLeft.frame.size = CGSize(width: labelLeft.frame.width, height: 35)
        labelLeft.snp.makeConstraints { (make) in
            make.centerY.equalToSuperview()
            make.left.equalToSuperview().offset(kX_GAP)
            make.size.equalTo(labelLeft.size);
        }
        
        let width = contentView.frame.width - labelLeft.frame.maxX - kX_GAP
        let ctlWidth = width*0.7
        
        switch ctlAlignment {
        case .left:
            segmentCtl.snp.makeConstraints { (make) in
                make.top.equalTo(labelLeft);
                make.left.equalTo(labelLeft.snp.right).offset(kPadding)
                make.width.equalTo(ctlWidth)
                make.height.equalTo(labelLeft);
            }
            
        case .right:
            segmentCtl.snp.makeConstraints { (make) in
                make.top.equalTo(labelLeft);
                make.right.equalToSuperview().offset(-kX_GAP)
                make.width.equalTo(ctlWidth)
                make.height.equalTo(labelLeft);
            }
            
        case .justified:
            segmentCtl.snp.makeConstraints { (make) in
                make.top.equalTo(labelLeft);
                make.left.equalTo(labelLeft.snp.right).offset(kPadding)
                make.right.equalToSuperview().offset(-kX_GAP)
                make.height.equalTo(labelLeft);
            }
            
        default:
            segmentCtl.snp.makeConstraints { (make) in
                make.top.equalTo(labelLeft);
                make.left.equalTo(labelLeft.snp.right).offset((width - ctlWidth)*0.5)
                make.width.equalTo(ctlWidth)
                make.height.equalTo(labelLeft);
            }
        }
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
    }
    
    //MARK: -lazy
    lazy var segmentCtl: UISegmentedControl = {
        var view = UIView.createSegment( .zero, items: ["是","否"], selectedIdx: 0, type: 0);
        return view
    }()
    
}


