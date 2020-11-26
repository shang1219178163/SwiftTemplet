//
//  NNTipsView.swift
//  SwiftTemplet
//
//  Created by Bin Shang on 2019/2/25.
//  Copyright © 2019 BN. All rights reserved.
//

import UIKit

import SwiftExpand
import SnapKit

class NNTipsView: UIView {

    var padding: CGFloat = 10

    weak var parController: UIViewController?

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = .red
        backgroundColor = UIColor.red.withAlphaComponent(0.8);

        addSubview(label)
        label.addObserver(self, forKeyPath: "text", options: .new, context: nil)
        
        label.backgroundColor = .clear
        label.textColor = .white
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
                
                frame.size.width = UIScreen.sizeWidth
                frame.size.height = (label.size.height + padding*2);
            }
        }
        else {
            super.observeValue(forKeyPath: keyPath, of: object, change: change, context: context)
        }
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        label.snp.makeConstraints { (make) in
            make.top.left.equalToSuperview().offset(padding)
            make.bottom.right.equalToSuperview().offset(-padding)
        }
    }
    
    lazy var btn: UIButton = {
        let view = UIButton(type: .custom)
        return view
    }()
    
    lazy var label: UILabel = {
        let view = UILabel(frame: .zero);
        view.text = "请选择";
        view.textColor = UIColor.black;
        view.textAlignment = .center;
        view.tag = 10;
        return view;
    }();
    
    
}
