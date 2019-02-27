//
//  BNTipsView.swift
//  SwiftTemplet
//
//  Created by Bin Shang on 2019/2/25.
//  Copyright © 2019 BN. All rights reserved.
//

import UIKit

import SwiftExpand
import SnapKit

class BNTipsView: UIView {

    weak var parController: UIViewController?

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = .red
        backgroundColor = UIColor.red.withAlphaComponent(0.8);

        label.backgroundColor = .clear
        label.textColor = .white
        addSubview(label)
        
        label.addObserver(self, forKeyPath: "text", options: .new, context: nil)
    }
    
    convenience init(frame: CGRect, parController: UIViewController!) {
        self.init(frame: frame)
        self.parController = parController
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    deinit {
       label.removeObserver(self, forKeyPath: "text", context: nil)
    }
    
    // observeValue
    override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
        if keyPath == "text" {
            isHidden = change![.newKey] as! String == ""
            if isHidden == false {
                label.sizeToFit()
                
                frame.size.width = UIScreen.width
                frame.size.height = (label.size.height + kPadding*2);
            }
        }
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        label.snp.makeConstraints { (make) in
            make.top.left.equalToSuperview().offset(kPadding)
            make.bottom.right.equalToSuperview().offset(-kPadding)
        }
    }
    
    lazy var btn: UIButton = {
        var view = UIButton(type: .custom)
        return view
    }()
    
    lazy var label: UILabel = {
        var view = UILabel(frame: .zero);
        view.text = "请选择";
        view.textColor = UIColor.black;
        view.textAlignment = .center;
        view.tag = 10;
        return view;
    }();
    
}
