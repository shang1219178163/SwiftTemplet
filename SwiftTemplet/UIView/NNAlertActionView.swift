//
//  NNAlertActionView.swift
//  SwiftTemplet
//
//  Created by Bin Shang on 2021/8/13.
//  Copyright © 2021 BN. All rights reserved.
//

import UIKit
import SnapKit

@objcMembers class NNAlertActionView: UIView {
    
    public lazy var imageView: UIImageView = {
        let view = UIImageView()
        view.contentMode = .scaleAspectFit
        return view
    }()
    
    
    public lazy var textLabel: UILabel = {
        let view = UILabel()
        view.textColor = .black
        view.backgroundColor = .clear
        view.font = UIFont.boldSystemFont(ofSize: 17)
        return view
    }()

    
    public lazy var detailTextLabel: UILabel = {
        let view = UILabel()
        view.textColor = .black
        view.backgroundColor = .clear
        view.font = UIFont.systemFont(ofSize: 13)
        return view
    }()
    
    public var accessoryView: UIView?
    
    public var inset = UIEdgeInsets(top: 10, left: 15, bottom: 10, right: 15)

//    lazy var accessoryView: UIImageView = {
//        let view = UIImageView()
//        view.contentMode = .center
//        return view
//    }()

    private lazy var contentView: UIView = {
        let view = UIView(frame: self.bounds)
        view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        return view
    }()
        
    // MARK: -lifecycle
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        autoresizingMask = [.flexibleWidth, .flexibleHeight]
        contentView.addSubview(imageView)
        contentView.addSubview(textLabel)
        contentView.addSubview(detailTextLabel)
        
        addSubview(contentView)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        let padding: CGFloat = 8
        let imageHeight: CGFloat = self.bounds.height - inset.top - inset.bottom
        
        let beiginX: CGFloat = !imageView.isHidden ? inset.left + padding + imageHeight : inset.left
        let endX: CGFloat = accessoryView != nil && !accessoryView!.isHidden ? inset.right + padding + accessoryView!.bounds.size.width : inset.right
        
        if let accessoryView = accessoryView {
            contentView.addSubview(accessoryView)
            
            let accessoryViewSize = accessoryView.sizeThatFits(bounds.size)
            accessoryView.snp.makeConstraints { make in
                make.centerY.equalToSuperview()
                make.right.equalToSuperview().offset(-inset.right)
                make.size.equalTo(accessoryViewSize)
            }
        }
        
        if !imageView.isHidden {
            imageView.snp.makeConstraints { (make) in
                make.centerY.equalToSuperview()
                make.left.equalToSuperview().offset(inset.right)
                make.width.equalTo(imageHeight)
                make.height.equalTo(imageHeight)
            }
        }

        if detailTextLabel.isHidden {
            textLabel.snp.makeConstraints { (make) in
                make.top.equalToSuperview().offset(inset.top)
                make.left.equalToSuperview().offset(beiginX)
                make.right.equalToSuperview().offset(-endX)
                make.bottom.equalToSuperview().offset(-inset.bottom)
            }
        } else {
            let textLabelSize = textLabel.sizeThatFits(CGSize(width: bounds.width - beiginX - endX, height: .greatestFiniteMagnitude))
            textLabel.snp.makeConstraints { (make) in
                make.top.equalToSuperview().offset(5)
                make.left.equalToSuperview().offset(beiginX)
                make.right.equalToSuperview().offset(-endX)
                make.height.equalTo(textLabelSize.height)
            }
            
            detailTextLabel.snp.makeConstraints { (make) in
                make.top.equalTo(textLabel.snp.bottom).offset(5)
                make.left.right.equalTo(textLabel)
                make.bottom.equalToSuperview().offset(-5)
            }
        }
    }
}

