//
//	NNChatKeyboardView.swift
//	MacTemplet
//
//	Created by shang on 2020/08/10 16:39
//	Copyright © 2020 shang. All rights reserved.
//


import UIKit
import SnapKit
import SwiftExpand
        
@objc protocol NNChatKeyboardViewDelegate{
    @objc func chatkeyboardview(_ view: NNChatKeyboardView)
    
}
        
///
@objcMembers class NNChatKeyboardView: UIView {

    weak var delegate: NNChatKeyboardViewDelegate?

    typealias ViewClick = (NNChatKeyboardView, Int) -> Void;
    var viewBlock: ViewClick?;
    
    // MARK: -lifecycle
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        if bounds.height <= 10 {
            return;
        }
        
        
    }
    
    // MARK: - funtions
    func block(_ action: @escaping ViewClick) {
        self.viewBlock = action;
    }
    
        
    //MARK: -lazy
    lazy var imgView: UIImageView = {
        var view = UIImageView(frame: .zero);
        view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        view.image = UIImage(named: "icon_avatar")
        
        return view;
    }()
    
    lazy var label: UILabel = {
        let view = UILabel(frame: .zero);
        view.text = "请选择";
        view.textColor = .lightGray;
        view.textAlignment = .center;
        return view;
    }();
    
    lazy var btnSure: UIButton = {
        let view = UIButton(type: .custom);
        view.tag = 1;
        
        view.titleLabel?.font = UIFont.systemFont(ofSize: 16);
        view.setTitle(kTitleSure, for: .normal);
        view.setTitleColor(.systemBlue, for: .normal);
        view.addActionHandler({ (sender) in
            self.viewBlock?(self, sender.tag);

        }, for: .touchUpInside)
        return view;
    }();
}
