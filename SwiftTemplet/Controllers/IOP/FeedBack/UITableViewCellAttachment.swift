//
//  UITableViewCellAttachment.swift
//  SwiftTemplet
//
//  Created by Bin Shang on 2021/8/18.
//  Copyright © 2021 BN. All rights reserved.
//

import UIKit

//class UITableViewCellAttachment: UITableViewCell {
//
//
//
//}
//
//
//
/////
//@objcMembers class NNAttachmentView: UIView {
//
//
//    var block: ((NNAttachmentView, Int) -> Void)?
//    
//    var inset = UIEdgeInsets(top: 10, left: 15, bottom: 10, right: 15)
//
//    // MARK: -lifecycle
//    override init(frame: CGRect) {
//        super.init(frame: frame)
//        
//        
//    }
//    
//    required init?(coder aDecoder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
//    
//    override func layoutSubviews() {
//        super.layoutSubviews()
//        
//        if bounds.height <= 10.0 {
//            return;
//        }
//        
//    }
//    
//    // MARK: - funtions
//
//        
//    //MARK: -lazy
//    lazy var btnSure: UIButton = {
//        let view = UIButton(type: .custom);
//        view.setTitle("这是一个附件名称", for: .normal);
//        view.setTitleColor(.systemBlue, for: .normal);
//        view.titleLabel?.font = UIFont.systemFont(ofSize: 16);
//        view.adjustsImageWhenHighlighted = false;
//        
//        view.addActionHandler({ (sender) in
//
//            
//        }, for: .touchUpInside)
//        return view;
//    }()
//    
//}
