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
@objcMembers class UITableViewCellSegment: UITableViewCell {
        
    var inset = UIEdgeInsets(top: 10, left: 15, bottom: 10, right: 15)
    
    var isShowLeft = false
    var spacing: CGFloat = 20

    /// 是否有星标
    var hasAsterisk = false
    // MARK: -life cycle
    deinit {
        labelLeft.removeObserver(self, forKeyPath: "text")
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier);
        
        contentView.addSubview(labelLeft);
        contentView.addSubview(segmentCtl);
        
        labelLeft.numberOfLines = 1
        labelLeft.addObserver(self, forKeyPath: "text", options: .new, context: nil)
    }
    
    override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
        if keyPath == "text" {
            //标题星号处理
            if hasAsterisk {
                labelLeft.attributedText = labelLeft.text?.matt.appendPrefix(font: labelLeft.font)
            }
        }
        else {
            super.observeValue(forKeyPath: keyPath, of: object, change: change, context: context)
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
        if bounds.height <= 10 {
            return
        }
        let height = bounds.height - inset.top - inset.bottom
        if labelLeft.isHidden {
            segmentCtl.snp.makeConstraints { (make) in
                make.edges.equalTo(inset)
            }
            return
        }
        

        let labelLeftSize = labelLeft.sizeThatFits(.zero)
        labelLeft.snp.remakeConstraints { (make) in
            make.centerY.equalToSuperview()
            make.left.equalToSuperview().offset(inset.left)
            make.width.equalTo(labelLeftSize.width)
            make.height.equalTo(height)
        }
        
        let ctlWidth: CGFloat = CGFloat(segmentCtl.numberOfSegments)*68.0
        if isShowLeft == false {
            segmentCtl.snp.makeConstraints { (make) in
                make.centerY.equalToSuperview()
                make.right.equalToSuperview().offset(-inset.right)
                make.width.lessThanOrEqualTo(ctlWidth)
                make.height.equalTo(30);
            }
            return
        }
        segmentCtl.snp.remakeConstraints { (make) in
            make.centerY.equalToSuperview()
            make.left.equalTo(labelLeft.snp.right).offset(spacing)
            make.width.lessThanOrEqualTo(ctlWidth)
            make.height.equalTo(30);
        }

    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
    }
    
    //MARK: -lazy
    public lazy var labelLeft: UILabel = {
        let view = UILabel(frame: CGRect.zero)
        view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        view.textAlignment = .left
        view.numberOfLines = 0
        view.lineBreakMode = .byCharWrapping
        
        return view
    }()
    
    lazy var segmentCtl: NNSegmentedControl = {
        let view = NNSegmentedControl.create( .zero, items: ["是","否"], selectedIdx: 0, type: 0);
        view.cornerRadius = 4
        return view
    }()
    
}


