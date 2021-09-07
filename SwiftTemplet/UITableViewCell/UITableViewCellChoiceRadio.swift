//
//  UITableViewCellChoiceRadio.swift
//  SwiftTemplet
//
//  Created by Bin Shang on 2020/12/16.
//  Copyright © 2020 BN. All rights reserved.
//

import SnapKit
import SwiftExpand

/// 一行多选/单选
@objcMembers class UITableViewCellChoiceRadio: UITableViewCell {
     
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
        
        guard let items = groupView.items else {
            return
        }
        
        let segmentWidth: CGFloat = 70
        groupView.snp.makeConstraints { (make) in
            make.top.equalToSuperview().offset(inset.top);
            make.right.equalToSuperview().offset(-inset.right);
            make.bottom.equalToSuperview().offset(-inset.bottom);
            make.width.equalTo(segmentWidth*items.count.cgFloat)
        }
        
        labelLeft.snp.remakeConstraints { (make) in
            make.top.equalToSuperview().offset(inset.top);
            make.left.equalToSuperview().offset(inset.left);
            make.right.equalTo(groupView.snp.left).offset(-5);
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
    public lazy var labelLeft: UILabel = {
        let view = UILabel(frame: CGRect.zero)
        view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        view.textAlignment = .left
        view.numberOfLines = 0
        view.lineBreakMode = .byCharWrapping
        
        return view
    }()
    
    lazy var groupView: NNButtonGroupView = {
        let view = NNButtonGroupView(frame: .zero)
        view.padding = 10;
        view.numberOfRow = 4;
        
        view.cornerRadius = 3.0
        view.fontSize = 12
        view.isMutiChoose = false;
        view.hasLessOne = true
        
        view.iconLocation = .rightBottom
        
        view.titleColor = .hexValue(0x999999)
        view.backgroudImage = UIImage(color: .hexValue(0xF3F3F3))

        view.selectedTitleColor = .systemBlue
//        view.selectedBackgroudImage = UIImage(named: "btn_selected_multiple")!

        view.block({ (groupView, sender) in
            print(sender.currentTitle ?? "", groupView.selectedIdxList)
        })
        return view;
    }()

}
