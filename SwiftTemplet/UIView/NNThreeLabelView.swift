//
//  BNOperationBusyInfoView.swift
//  SwiftTemplet
//
//  Created by Bin Shang on 2019/2/26.
//  Copyright © 2019 BN. All rights reserved.
//

import UIKit

import SwiftExpand
import SnapKit

class NNThreeLabelView: UIView {

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubview(labelTop)
        addSubview(labelMid)
        addSubview(labelBom)
    }
    
//    convenience init(frame: CGRect, parController: UIViewController!) {
//        self.init(frame: frame)
//        self.parController = parController
//    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        labelTop.snp.makeConstraints { (make) in
            make.top.left.right.equalToSuperview()
            make.height.equalTo(bounds.height*0.5)
        }
        
        labelMid.snp.makeConstraints { (make) in
            make.top.equalTo(labelTop.snp.bottom)
            make.left.right.equalToSuperview()
            make.height.equalTo(bounds.height*0.25)
        }
        
        labelBom.snp.makeConstraints { (make) in
            make.top.equalTo(labelMid.snp.bottom)
            make.left.right.bottom.equalToSuperview()
        }
    }
    
    lazy var labelTop: UILabel = {
        var view = UILabel(frame: .zero);
        view.text = "top";
        view.textColor = UIColor.black;
        view.textAlignment = .center;
        view.font = UIFont.systemFont(ofSize: 36)

        return view;
    }();
    
    lazy var labelMid: UILabel = {
        var view = UILabel(frame: .zero);
        view.text = "midem";
        view.textColor = UIColor.black;
        view.textAlignment = .center;
        view.font = UIFont.systemFont(ofSize: 15)

        return view;
    }();
    
    lazy var labelBom: UILabel = {
        var view = UILabel(frame: .zero);
        view.text = "bottom";
        view.textColor = UIColor.hex("#999999")
        view.textAlignment = .center;
        view.font = UIFont.systemFont(ofSize: 13)

        return view;
    }();

}
