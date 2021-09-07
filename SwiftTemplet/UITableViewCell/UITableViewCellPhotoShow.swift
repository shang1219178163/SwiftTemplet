//
//  UITableViewCellPhotoShow.swift
//  SwiftTemplet
//
//  Created by Bin Shang on 2020/7/27.
//  Copyright © 2020 BN. All rights reserved.
//

import UIKit
import SwiftExpand

///单图片展示
@objcMembers class UITableViewCellPhotoShow: UITableViewCell {

    public var inset = UIEdgeInsets(top: 5, left: 10, bottom: 5, right: 10)

    private(set) lazy var lineView: UIImageView = {
        let view = UIImageView(frame: .zero);
        view.backgroundColor = .line
        return view
    }()


    // MARK: -life cycle
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier);

        contentView.addSubview(lineView)
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder);
        fatalError("init(coder:) has not been implemented")
    }

    override func layoutSubviews() {
        super.layoutSubviews();

        if bounds.height <= 10 {
            return
        }

        let height = bounds.height - inset.top - inset.bottom
        let endX = accessoryType == .none ? inset.right : kPadding
        
        guard let textLabel = textLabel,
              let imageView = imageView
              else { return }
        
        textLabel.snp.makeConstraints { (make) in
            make.top.equalToSuperview().offset(inset.top)
            make.left.equalToSuperview().offset(inset.left)
            make.right.equalToSuperview().offset(-endX)
            make.height.equalTo(30)
        }

        lineView.snp.makeConstraints { (make) in
            make.top.equalTo(textLabel.snp.bottom).offset(3);
            make.left.equalTo(textLabel)
            make.right.equalTo(textLabel)
            make.height.equalTo(1);
        }

        imageView.snp.makeConstraints { (make) in
            make.top.equalTo(lineView.snp.bottom).offset(3);
            make.left.equalTo(textLabel)
            make.right.equalTo(textLabel)
            make.bottom.equalToSuperview().offset(-inset.bottom);
        }
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }


}

