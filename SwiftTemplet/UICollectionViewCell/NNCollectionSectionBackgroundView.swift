//
//  NNCollectionSectionBackgroundView.swift
//  SwiftTemplet
//
//  Created by Bin Shang on 2020/6/17.
//  Copyright © 2020 BN. All rights reserved.
//

import UIKit

class NNCollectionSectionBackgroundView: UICollectionReusableView {
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("not implemented")
    }
    
    func configure() {
        backgroundColor = UIColor.white
        layer.borderColor = UIColor.white.cgColor
        layer.borderWidth = 1
        layer.cornerRadius = 8
    }
}
