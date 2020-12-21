//
//    NNSearchbarTitleView.swift
//    MacTemplet
//
//    Created by shang on 2020/08/21 15:19
//    Copyright © 2020 shang. All rights reserved.
//


import UIKit
import SnapKit
import SwiftExpand

///
@objcMembers class NNSearchbarTitleView: UIView {
    
    var inset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)

    var searchbarHeight: CGFloat = 30
    
    // MARK: -lifecycle
    override var intrinsicContentSize: CGSize{
        return UIView.layoutFittingExpandedSize;
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubview(searchBar)
        addSubview(cancellBtn)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        if bounds.height <= 10 {
            return;
        }
        
        if #available(iOS 11.0, *) {
//            inset = UIEdgeInsets(top: 6, left: inset.left, bottom: 6, right: inset.right)
        }
        
        let searchBarEndX = cancellBtn.isHidden == false ? 40 + 5 + inset.right : inset.right
        
        if cancellBtn.isHidden == false {
            cancellBtn.snp.makeConstraints { (make) in
                make.top.equalToSuperview().offset(inset.top);
                make.right.equalToSuperview().offset(-inset.right);
                make.bottom.equalToSuperview().offset(-inset.bottom);
                make.width.equalTo(40);
            }
        }

        searchBar.snp.remakeConstraints { (make) in
            make.centerY.equalToSuperview().offset(inset.top - inset.bottom)
            make.left.equalToSuperview().offset(inset.left);
            make.right.equalToSuperview().offset(-searchBarEndX);
            make.height.equalTo(searchbarHeight)
        }
    }
    
    // MARK: - funtions
        
    //MARK: -lazy
    lazy var searchBar: UISearchBar = {
        let view = UISearchBar.create(.zero)
        view.layer.cornerRadius = 0;
        view.showsCancelButton = false;
        view.backgroundColor = .white
        view.setImage(UIImage(named: "icon_search"), for: .search, state: .normal)
//        view.searchTextPositionAdjustment = UIOffset(horizontal: 5, vertical: 0)
        view.placeholder = "请输入名称";
        view.textField?.backgroundColor = UIColor.background
        view.textField?.layer.cornerRadius = 5;
        view.textField?.layer.masksToBounds = true;
        view.textField?.font = UIFont.systemFont(ofSize: 14)
//        if #available(iOS 11.0, *) {
//            view.heightAnchor.constraint(equalToConstant: 44).isActive = true
//        }
        return view
    }()
    
    lazy var cancellBtn: UIButton = {
        let view = UIButton(type: .custom);
        view.setTitle("取消", for: .normal);
        view.setTitleColor(UIColor.hexValue(0x333333), for: .normal);
        view.titleLabel?.font = UIFont.systemFont(ofSize: 16);
        view.adjustsImageWhenHighlighted = false;
        view.tag = 1;

        view.addActionHandler({ (sender) in
            DDLog(sender.currentTitle ?? "")

        }, for: .touchUpInside)
        return view;
    }()
}
