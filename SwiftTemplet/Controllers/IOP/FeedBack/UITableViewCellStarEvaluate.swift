//
//  UITableViewCellStarEvaluate.swift
//  SwiftTemplet
//
//  Created by Bin Shang on 2021/8/19.
//  Copyright © 2021 BN. All rights reserved.
//

import UIKit
import SwiftExpand
import SnapKitExtend

///评价(满意度评价: 星号视图)
class UITableViewCellStarEvaluate: UITableViewCell {
    
    var inset = UIEdgeInsets(top: 10, left: 15, bottom: 10, right: 15)
    
    var starViewSize = CGSize(width: 140, height: 20)

    // MARK: -lifeycycle
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        contentView.addSubview(titleLabel)
        contentView.addSubview(starView)
        
        titleLabel.text = "满意度评价:"
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        guard bounds.height > 10 else { return }
        
        if titleLabel.isHidden {
            starView.snp.makeConstraints { (make) in
                make.centerY.equalToSuperview()
                make.left.equalToSuperview().offset(inset.left)
                make.size.equalTo(starViewSize)
            }
            return
        }
        
        let dateLabelSize = titleLabel.sizeThatFits(CGSize(width: bounds.width, height: 40))
        titleLabel.snp.makeConstraints { (make) in
            make.centerY.equalToSuperview()
            make.left.equalToSuperview().offset(inset.left)
            make.size.equalTo(dateLabelSize)
        }
        
        starView.snp.makeConstraints { (make) in
            make.centerY.equalToSuperview()
            make.left.equalTo(titleLabel.snp.right).offset(kPadding)
            make.size.equalTo(starViewSize)
        }
    }

    // MARK: -lazy
    
    private(set) lazy var titleLabel: UILabel = {
        let view = UILabel(frame: .zero)
        view.textAlignment = .right
        return view
    }()

    lazy var starView: NNStarEvaluateView = {
        let view = NNStarEvaluateView(frame: .zero)
        view.totalStarCount = 5
        view.currentStarCount = 3
//        view.isUserInteractionEnabled = false
        return view
    }()
    
//    private(set) lazy var starView: StarEvaluateView = {
//        let sender = StarEvaluateView(sumCount: 5, starSpace: 15, norImg: UIImage(named: "icon_star_blank"), selImg: UIImage(named: "icon_star_yellow"))
//        sender.successBlock = {
//            DDLog($0, $1, $2)
//        }
//        return sender
//    }()
}
