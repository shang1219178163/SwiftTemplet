//
//  UITableViewCellChoose.swift
//  SwiftTemplet
//
//  Created by Bin Shang on 2021/6/9.
//  Copyright © 2021 BN. All rights reserved.
//


import SnapKit
import SwiftExpand

/// 一行多选/单选
class UITableViewCellChoose: UITableViewCell {
     
    var inset = UIEdgeInsets(top: 10, left: 15, bottom: 10, right: 15)
     /// 是否有星标
    var hasAsterisk = false;
    // MARK: -life cycle
    deinit {
        labelLeft.removeObserver(self, forKeyPath: "text")
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
         super.init(style: style, reuseIdentifier: reuseIdentifier);
        
        contentView.addSubview(labelLeft);
        contentView.addSubview(groupView);
        
        labelLeft.text = "选择:"
        labelLeft.textColor = .gray
        labelLeft.font = UIFont.systemFont(ofSize: 12)
        
        labelLeft.numberOfLines = 1
        labelLeft.addObserver(self, forKeyPath: "text", options: .new, context: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder);
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        if labelLeft.isHidden {
            groupView.snp.makeConstraints { (make) in
                make.edges.equalTo(inset);
            }
            return
        }
        
        labelLeft.snp.makeConstraints { (make) in
            make.top.equalToSuperview().offset(inset.top);
            make.left.equalToSuperview().offset(inset.left);
            make.right.equalToSuperview().offset(-inset.right);
            make.height.lessThanOrEqualTo(25);
        }
        
        groupView.snp.makeConstraints { (make) in
            make.top.equalTo(labelLeft.snp.bottom).offset(5);
            make.left.right.equalTo(labelLeft)
            make.bottom.equalToSuperview().offset(-inset.bottom);
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
    lazy var groupView: NNGroupButton = {
        let sender = NNGroupButton()
        sender.items = [UIButton].init(count: 6, generator: { (i) -> UIButton in
            let sender = NNButton(type: .custom)
            sender.setTitle("item_\(i)", for: .normal)
            sender.setTitleColor(.gray, for: .normal)
            sender.setTitleColor(.systemBlue, for: .selected)

            sender.setBorderColor(.line, for: .normal)
            sender.setBorderColor(.systemBlue, for: .selected)
            
            sender.layer.cornerRadius = 5;
            sender.titleLabel?.font = UIFont.systemFont(ofSize: 12, weight: .regular)
                        
//            sender.iconSize = CGSize(width: 30, height: 18)
//            sender.iconBtn.setTitle("\(i)", for: .normal)
//            sender.iconBtn.setTitleColor(.red, for: .normal)
            return sender
        })
        sender.isMutiChoose = true
        sender.itemsIndexs = []
        sender.block = { view, sender in
            DDLog(view.itemsIndexs)
//            DDLog(view.itemsIndexs)
        }
        return sender
    }()
}
