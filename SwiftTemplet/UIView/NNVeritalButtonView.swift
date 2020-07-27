//
//  NNVeritalButtonView.swift
//  SwiftTemplet
//
//  Created by Bin Shang on 2020/7/24.
//  Copyright © 2020 BN. All rights reserved.
//

import UIKit
import SnapKit
import SwiftExpand
        
@objc protocol NNVeritalButtonDelegate{
    @objc func veritalButton(_ view: NNVeritalButtonView, sender: UIButton)
    
}
        
///
@objcMembers class NNVeritalButtonView: UIView {

    weak var delegate: NNVeritalButtonDelegate?

    typealias ViewClick = ((NNVeritalButtonView, UIButton) -> Void);
    var viewBlock: ViewClick?;
    
    
    var inset = UIEdgeInsets(top: 5, left: 10, bottom: 5, right: 10)
        
    var lineSpacing: CGFloat = 5{
        willSet{
            setNeedsLayout()
        }
    }
    
    var titles: [String] = ["标题0", "标题1"]
    lazy var items: [NNButton] = {
        return self.updateItems(self.titles.count, type: NNButton.self) {
            $0.titleLabel?.adjustsFontSizeToFitWidth = true
            $0.titleLabel?.textAlignment = .center
            $0.titleLabel?.font = UIFont.systemFont(ofSize: 14)
            $0.setTitle(self.titles[$0.tag], for: .normal)
            if self.backgroundColor != UIColor.white {
                $0.setTitleColor(.white, for: .normal)
            }
            $0.addTarget(self, action: #selector(handleAction(_:)), for: .touchUpInside)
        }
    }()
    
    @objc func handleAction(_ sender: NNButton) {
        delegate?.veritalButton(self, sender: sender)
        viewBlock?(self, sender)
    }
    
    // MARK: -lifecycle
    override init(frame: CGRect) {
        super.init(frame: frame)
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        if bounds.height <= 0.0 {
            return;
        }
        
        if items.count == 1 {
            items.first!.snp.makeConstraints { (make) in
                make.edges.equalTo(inset)
            }
            return
        }
        items.snp.distributeViewsAlong(axisType: .vertical, fixedSpacing: lineSpacing, leadSpacing: inset.top, tailSpacing: inset.bottom)
        items.snp.makeConstraints { (make) in
            make.left.equalToSuperview().offset(inset.left);
            make.right.equalToSuperview().offset(-inset.right);
        }
    }
    
    // MARK: - funtions
    func block(_ action: @escaping ViewClick) {
        self.viewBlock = action;
    }
    
        
    //MARK: -lazy
}
