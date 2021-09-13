//
//  NNTableFooterView.swift
//  SwiftTemplet
//
//  Created by Bin Shang on 2018/12/24.
//  Copyright © 2018 BN. All rights reserved.
//

import UIKit
import SwiftExpand


@objcMembers class NNTableFooterView: UIView {
    /// 图像距离顶端间距
    var topPadding: CGFloat = 20;
    
    var layoutBlock:((NNTableFooterView)->Void)?
    
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubview(btn)
        addSubview(label)
        addSubview(labelTop)

        backgroundColor = .groupTableViewBackground
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        if let layoutBlock = layoutBlock {
            layoutBlock(self)
            return
        }
        
        if ![labelTop.isHidden, label.isHidden].contains(false) {
            btn.snp.makeConstraints { (make) in
                make.edges.equalToSuperview()
            }
            return
        }
        
        labelTop.snp.makeConstraints { (make) in
            make.top.equalToSuperview().offset(5)
            make.left.equalToSuperview().offset(10)
            make.right.equalToSuperview().offset(-10)
            make.height.equalTo(topPadding - 10)
        }
        
        btn.snp.makeConstraints { (make) in
            make.top.equalToSuperview().offset(topPadding)
            make.left.equalToSuperview().offset(10)
            make.right.equalToSuperview().offset(-10)
            make.height.equalTo(45)
        }
        
        label.snp.makeConstraints { (make) in
            make.top.equalTo(btn.snp.bottom).offset(15)
            make.left.right.equalTo(btn)
            make.bottom.equalToSuperview()
        }
    }

    lazy var btn: UIButton = {
        let view = UIButton(type: .custom)
        view.setTitle("确定", for: .normal)

        view.setBackgroundImage(UIImage(color: .theme), for: .normal)
        view.setBackgroundImage(UIImage(color: .lightGray), for: .disabled)
        
        view.addActionHandler({ (sender) in
            DDLog(sender.currentTitle)
                
        }, for: .touchUpInside)
        
        return view;
    }()
    
    lazy var label: UILabel = {
        let view = UILabel()
        view.textColor = UIColor.hex("#999999")
        view.font = UIFont.systemFont(ofSize: 14)
        view.numberOfLines = 0
        view.lineBreakMode = .byWordWrapping
        view.isUserInteractionEnabled = true
        return view
    }()
    
    lazy var labelTop: UILabel = {
        let view = UILabel()
        view.textColor = UIColor.hex("#999999")
        view.font = UIFont.systemFont(ofSize: 14)
        view.numberOfLines = 0
        view.lineBreakMode = .byWordWrapping
        view.isUserInteractionEnabled = true
        return view
    }()
    
}

extension NNTableFooterView{
    
    /// 创建默认的确定按钮
    static func create(_ title: String = "确定", topPadding: CGFloat = 30, height: CGFloat = 180) -> NNTableFooterView {
        let view = NNTableFooterView(frame: CGRectMake(0, 0, UIScreen.sizeWidth, height))
        view.topPadding = topPadding;
        view.labelTop.font = UIFont.systemFont(ofSize: 12)
        view.labelTop.text = ""
        
        view.btn.setTitle(title, for: .normal)
        view.btn.setBackgroundImage(UIImage(color: UIColor.theme), for: .normal);
        view.btn.setTitleColor(UIColor.white, for: .normal)
        view.btn.addActionHandler({ (sender) in
            DDLog(sender)
            
        }, for: .touchUpInside)
        return view;
    }
}




@objcMembers class NNTableFooterViewNew: UIView {
    
    public var inset = UIEdgeInsets(top: 10, left: 15, bottom: 10, right: 15)

    public var spacing: CGFloat = 10
    
    var contentView: UIView?
    
    var contentViewConstant: CGFloat = 40

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .groupTableViewBackground

        addSubview(stackView)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        let sender: UIView = contentView ?? btn
        if stackView.axis == .vertical {
            let constant = max(contentViewConstant, sender.bounds.height)
            sender.heightAnchor.constraint(equalToConstant: constant).isActive = true
        } else {
            let constant = max(contentViewConstant, sender.bounds.width)
            sender.widthAnchor.constraint(equalToConstant: constant).isActive = true
        }

        let list = [labelHeader, sender, labelFooter].filter { $0.isHidden == false }
        stackView.removeArrangedSubviews()
        stackView.addArrangedSubviews(list)
        
        stackView.snp.remakeConstraints { make in
            make.edges.equalToSuperview().inset(inset)
        }
    }

    // MARK: -lazy
    lazy var stackView: UIStackView = {
        let view = UIStackView(frame: .zero)
        view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        view.spacing = self.spacing
        view.axis = .vertical
        //子视图的高度或宽度保持一致
        view.distribution = .fillProportionally
//        view.distribution = .fillEqually
        return view
    }()
    
    lazy var btn: UIButton = {
        let view = UIButton(type: .custom)
        view.setTitle("确定", for: .normal)
        view.setTitleColor(.white, for: .normal)

        view.setBackgroundImage(UIImage(color: .theme), for: .normal)
        view.setBackgroundImage(UIImage(color: .lightGray), for: .disabled)
        
        view.addActionHandler({ (sender) in
            DDLog(sender.currentTitle)
                
        }, for: .touchUpInside)
        
        return view;
    }()
    
    lazy var labelFooter: UILabel = {
        let view = UILabel()
        view.textColor = UIColor.hex("#999999")
        view.font = UIFont.systemFont(ofSize: 14)
        view.numberOfLines = 0
        view.lineBreakMode = .byWordWrapping
        view.isUserInteractionEnabled = true
        return view
    }()
    
    lazy var labelHeader: UILabel = {
        let view = UILabel()
        view.textColor = UIColor.hex("#999999")
        view.font = UIFont.systemFont(ofSize: 14)
        view.numberOfLines = 0
        view.lineBreakMode = .byWordWrapping
        view.isUserInteractionEnabled = true
        view.contentMode = .top
        return view
    }()
    
}
