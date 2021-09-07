//
//  UITableViewCellReplay.swift
//  SwiftTemplet
//
//  Created by Bin Shang on 2021/8/19.
//  Copyright © 2021 BN. All rights reserved.
//

import UIKit
import SwiftExpand
import SnapKitExtend

///对话回复(支持文字+多图)
class UITableViewCellReplay: UITableViewCell {
    
    var inset = UIEdgeInsets(top: 10, left: 15, bottom: 10, right: 15)

//    let content = ""

//    var images: [UIImage] = []

//    var video: [UIImage]?
    
    // MARK: -lifeycycle
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        contentView.addSubview(titleLabel)
        contentView.addSubview(dateLabel)
        contentView.addSubview(contentlabel)
        contentView.addSubview(groupView)
        
        titleLabel.font = UIFont.systemFont(ofSize: 14)
        dateLabel.font = UIFont.systemFont(ofSize: 12)
        contentlabel.font = UIFont.systemFont(ofSize: 14)

        #if DEBUG
        let att: AttrString = "\(image: UIImage(named: "icon_sevice")!, scale: 0.75) 客服"
        titleLabel.attributedText = att.attributedString

        dateLabel.text = "提交时间：2019-12-13 12:00"
        contentlabel.text = "您好，您可以关闭网络，重新打开试试？因为现场网络不好。您好，您可以关闭网络，重新打开试试？因为现场网络不好。"
        #endif
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        guard bounds.height > 10 else { return }
        
        let dateLabelSize = dateLabel.sizeThatFits(bounds.size)
        dateLabel.snp.remakeConstraints { (make) in
            make.top.equalToSuperview().offset(inset.top)
            make.right.equalToSuperview().offset(-inset.right)
//            make.size.equalTo(dateLabelSize)
            make.height.equalTo(dateLabelSize.height)
        }
        
        titleLabel.snp.remakeConstraints { (make) in
            make.centerY.equalTo(dateLabel)
            make.left.equalToSuperview().offset(inset.left)
            make.right.equalTo(dateLabel.snp.left).offset(kPadding)
//            make.height.equalTo(dateLabel)
        }

        let groupViewHeight = groupView.items.count > 4 ? 160 : 75
        if contentlabel.isHidden {
            groupView.snp.remakeConstraints { (make) in
                make.top.equalTo(titleLabel.snp.bottom).offset(kPadding)
                make.left.equalToSuperview().offset(inset.left)
                make.right.equalToSuperview().offset(-inset.right)
//                make.height.equalTo(groupViewHeight)
                make.bottom.equalToSuperview().offset(-inset.bottom)
            }
            return
        }
        
        if groupView.isHidden || groupView.items.count == 0{
            contentlabel.snp.remakeConstraints { (make) in
                make.top.equalTo(titleLabel.snp.bottom).offset(kPadding)
                make.left.equalToSuperview().offset(inset.left)
                make.right.equalToSuperview().offset(-inset.right)
                make.bottom.equalToSuperview().offset(-inset.bottom)
            }
            return
        }

        let contentlabelSize = contentlabel.sizeThatFits(CGSize(width: bounds.width - inset.left - inset.right, height: .greatestFiniteMagnitude))
        contentlabel.snp.remakeConstraints { (make) in
            make.top.equalTo(titleLabel.snp.bottom).offset(kPadding)
            make.left.equalToSuperview().offset(inset.left)
            make.right.equalToSuperview().offset(-inset.right)
//            make.height.equalTo(contentlabelSize.height)
        }
        
        groupView.snp.remakeConstraints { (make) in
            make.top.equalTo(contentlabel.snp.bottom).offset(kPadding)
            make.left.right.equalTo(contentlabel)
//            make.height.equalTo(groupViewHeight)
            make.bottom.equalToSuperview().offset(-inset.bottom)
        }
    }
    
    override func didMoveToSuperview() {
        super.didMoveToSuperview()
        layoutIfNeeded()
    }
    // MARK: -lazy
    private(set) lazy var titleLabel: UILabel = {
        let view = UILabel(frame: .zero)
        view.textColor = .textColor6
        view.textAlignment = .left
        return view
    }()
    
    private(set) lazy var dateLabel: UILabel = {
        let view = UILabel(frame: .zero)
        view.textColor = .lightGray
        view.textAlignment = .right
        return view
    }()
    
    private(set) lazy var contentlabel: UILabel = {
        let view = UILabel(frame: .zero)
        view.textColor = .lightGray
        view.textAlignment = .left
        view.numberOfLines = 0
        view.lineBreakMode = .byCharWrapping
        return view
    }()
    
    
    private(set) lazy var group: UIView = {
        let view = UIView(frame: .zero)
        view.backgroundColor = .green
        return view
    }()
    
    
    private(set) lazy var groupView: NNGroupButton = {
        let sender = NNGroupButton()
//        sender.items = [UIButton].init(count: 6, generator: { (i) -> UIButton in
//            let sender = NNButton(type: .custom)
//            sender.setTitle("item_\(i)", for: .normal)
//
//            return sender
//        })
////        sender.isMutiChoose = true
////        sender.itemsIndexs = []
//        sender.block = { view, sender in
//            DDLog(view.itemsIndexs)
////            DDLog(view.itemsIndexs)
//        }
        return sender
    }()
}
