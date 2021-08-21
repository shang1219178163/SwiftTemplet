//
//  IOPTableViewCellIssueMark.swift
//  SwiftTemplet
//
//  Created by Bin Shang on 2021/8/19.
//  Copyright © 2021 BN. All rights reserved.
//

import UIKit
import SwiftExpand

/// 问题状态
class IOPTableViewCellIssueMark: UITableViewCell {
     
    var inset = UIEdgeInsets(top: 10, left: 15, bottom: 10, right: 0)
     /// 是否有星标
    var hasAsterisk = false;
    
    var markSize = CGSize(width: 58, height: 22)
    
    var markStatue: String = "0" {
        willSet{
            if let name = stateDic[newValue] ?? stateDic["1"] {
                markBtn.setBackgroundImage(UIImage(named: name), for: .normal)
            }
        }
    }
    
    // MARK: -life cycle
    deinit {
        labelLeft.removeObserver(self, forKeyPath: "text")
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
         super.init(style: style, reuseIdentifier: reuseIdentifier);
        
        contentView.addSubview(labelLeft)
        contentView.addSubview(markBtn)
        
        labelLeft.text = "问题详情"
        labelLeft.font = UIFont.systemFont(ofSize: 15)
        
        labelLeft.numberOfLines = 1
        labelLeft.addObserver(self, forKeyPath: "text", options: .new, context: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder);
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        markBtn.snp.remakeConstraints { (make) in
            make.centerY.equalToSuperview()
            make.right.equalToSuperview().offset(-inset.right)
            make.size.equalTo(markSize)
        }
        
        labelLeft.snp.makeConstraints { (make) in
            make.top.equalToSuperview().offset(inset.top);
            make.left.equalToSuperview().offset(inset.left);
            make.right.equalTo(markBtn.snp.left).offset(-kPadding);
            make.bottom.equalToSuperview().offset(-inset.bottom)
        }
                

    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    //MARK: -observe
    override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
        if keyPath == "text" {
            //标题星号处理
            if hasAsterisk == true {
                labelLeft.attributedText = labelLeft.text?.matt.appendPrefix(font: labelLeft.font)
            }
        }
        else {
            super.observeValue(forKeyPath: keyPath, of: object, change: change, context: context)
        }
    }
    
    //MARK: -lazy
    private(set) lazy var markBtn: UIButton = {
        let view = UIButton(type: .custom)
//        view.addActionHandler({ (sender) in
//
//        }, for: .touchUpInside)
        return view
    }()
    
    
    private(set) var stateDic: [String: String] = {
        return [
            "1": "icon_issue_watting",
            "2": "icon_issue_processing",
            "3": "icon_issue_finished",
            "4": "icon_issue_evaluated",
        ]
    }()
}
