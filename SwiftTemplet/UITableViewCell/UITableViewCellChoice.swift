//
//  UITableViewCellChoice.swift
//  SwiftTemplet
//
//  Created by Bin Shang on 2020/6/2.
//  Copyright © 2020 BN. All rights reserved.
//

import UIKit

import SnapKit
import SwiftExpand

/// 一行多选/单选
class UITableViewCellChoice: UITableViewCell {
     
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
                make.top.equalTo(labelLeft.snp.bottom).offset(10);
                make.left.equalToSuperview().offset(15);
                make.right.equalToSuperview().offset(-15);
                make.bottom.equalToSuperview().offset(-10);
            }
            return
        }
        
        labelLeft.snp.makeConstraints { (make) in
            make.top.equalToSuperview().offset(5);
            make.left.equalToSuperview().offset(15);
            make.right.equalToSuperview().offset(-10);
            make.height.lessThanOrEqualTo(25);
        }
        
        groupView.snp.makeConstraints { (make) in
            make.top.equalTo(labelLeft.snp.bottom).offset(5);
            make.left.equalToSuperview().offset(15);
            make.right.equalToSuperview().offset(-15);
            make.bottom.equalToSuperview().offset(-10);
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
                labelLeft.attributedText = labelLeft.text?.toAsterisk(labelLeft.textColor, font: labelLeft.font.pointSize)
            }
        }
    }
    
    //MARK: -lazy
    lazy var groupView: NNButtonGroupView = {
        var view = NNButtonGroupView(frame: .zero)
        view.padding = 10;
        view.numberOfRow = 4;
        
        view.cornerRadius = 3.0
        view.fontSize = 12
        view.isMutiChoose = true;
        view.hasLessOne = true
        
        view.iconLocation = .rightBottom
        
        view.titleColor = .hexValue(0x999999)
        view.backgroudImage = UIImage(color: .hexValue(0xF3F3F3))

        view.selectedTitleColor = .systemBlue
        view.selectedBackgroudImage = UIImage(named: "btn_selected_multiple")!
        
        view.block({ (itemsView, sender) in
            if let btn = sender as UIButton? {
                print(btn.titleLabel?.text as Any, itemsView.selectedList.count, itemsView.selectedIdxList.count)

            }
        })
        return view;
    }()

}
