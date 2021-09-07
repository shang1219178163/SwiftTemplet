//
//  UICTViewCellLevel.swift
//  SwiftTemplet
//
//  Created by Bin Shang on 2020/8/11.
//  Copyright © 2020 BN. All rights reserved.
//

import UIKit
import SnapKit
import SwiftExpand

class UICTViewCellLevel: UICollectionViewCell {
    var inset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
    
    
    lazy var progressView: NNLevelProgressView = {
        let view = NNLevelProgressView(frame: .zero)
        return view
    }()
    // MARK: -lifecycle
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        contentView.addSubview(imgView)
        contentView.addSubview(lab)
        contentView.addSubview(progressView)

        imgView.contentMode = .scaleToFill
        lab.textAlignment = .center
//        lab.backgroundColor = UIColor.random
//        imgView.backgroundColor = UIColor.random

        progressView.progress.progressTintColor = UIColor.hexValue(0x875614)
        progressView.labelBegin.textColor = .white
        progressView.labelEnd.textColor = .white
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        imgView.snp.makeConstraints { (make) in
            make.edges.equalTo(inset)
        }
        
        lab.snp.makeConstraints { (make) in
            make.top.left.equalToSuperview().offset(inset.top)
            make.bottom.right.equalToSuperview().offset(-inset.bottom)
        }
        
        progressView.snp.makeConstraints { (make) in
            make.left.equalToSuperview().offset(18);
            make.right.equalToSuperview().multipliedBy(0.5)
            make.bottom.equalToSuperview().offset(-12);
            make.height.equalTo(20);
        }
    }
    // MARK: -lazy
    public lazy var imgView: UIImageView = {
        let view = UIImageView(frame: CGRect.zero)
        view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        view.isUserInteractionEnabled = true
        view.contentMode = .scaleAspectFit
        view.backgroundColor = .clear

        return view
    }()
                   
    public lazy var lab: UILabel = {
       let view = UILabel(frame: .zero)
       view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
       view.font = UIFont.systemFont(ofSize: 15)
       view.numberOfLines = 0
       view.lineBreakMode = .byCharWrapping
       view.textAlignment = .center
//       view.backgroundColor = UIColor.random

       return view
    }()
}
