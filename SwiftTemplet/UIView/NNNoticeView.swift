//
//  NNNoticeView.swift
//  SwiftTemplet
//
//  Created by Bin Shang on 2020/3/25.
//  Copyright © 2020 BN. All rights reserved.
//

import UIKit

import SwiftExpand

class NNNoticeView: UIView {

    var inset = UIEdgeInsets(top: 5, left: 5, bottom: 5, right: 5)

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = UIColor.background;

        addSubview(label)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        label.snp.makeConstraints { (make) in
            make.top.equalToSuperview().offset(inset.top);
            make.left.equalToSuperview().offset(inset.left);
            make.right.equalToSuperview().offset(-inset.right);
            make.bottom.equalToSuperview().offset(-inset.bottom);
        }
    }

    // MARK: -lazy
    @objc lazy var label: UILabel = {
        let view = UILabel()
        view.textColor = UIColor.white
        view.textAlignment = .center
        view.font = UIFont.systemFont(ofSize: 14)
        view.numberOfLines = 1
        view.lineBreakMode = .byWordWrapping
        view.isUserInteractionEnabled = true
        return view
    }()
}
