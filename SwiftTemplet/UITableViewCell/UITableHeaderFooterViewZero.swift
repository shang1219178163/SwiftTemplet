//
//  UITableHeaderFooterViewZero.swift
//  SwiftTemplet
//
//  Created by Bin Shang on 2019/1/17.
//  Copyright © 2019 BN. All rights reserved.
//

import UIKit

import SwiftExpand

///  指示器 标题     子标题
class UITableHeaderFooterViewZero: UITableViewHeaderFooterView {

    var block: ((UITableHeaderFooterViewZero)->Void)?
    
    var inset = UIEdgeInsets(top: 10, left: 15, bottom: 10, right: 15)
    
    var indicatorViewSize = CGSize(width: 25, height: 25)
    var imgViewLeftSize = CGSize(width: 30, height: 30)

    var spacing: CGFloat = 8

    // MARK: -life cycle

    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        contentView.addSubview(indicatorView);
        contentView.addSubview(imgViewLeft);
        contentView.addSubview(labelLeft);
        contentView.addSubview(btn);
        contentView.addSubview(lineBottom)

        labelLeft.numberOfLines = 1;
        
        indicatorView.image = UIImageNamed(kIMG_arrowRight)

        _ = contentView.addGestureTap {[weak self] (sender) in
            guard let self = self else { return }
            if self.isCanOpen == true {
                self.block?(self)
            }
        }
        
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder);
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews();
        
        setupConstraint()
    }
    
    func setupConstraint() {
        if bounds.height <= 10.0 {
            return
        }
        let height = bounds.height - inset.top - inset.bottom
        
        var labStartX = inset.left
        var imgViewLeftStartX = inset.left

        
        let btnSize = btn.sizeThatFits(.zero)
        let labeEndX = btn.isHidden == false ? btnSize.width + inset.right + spacing : inset.right
        if btn.isHidden == false {
            btn.snp.remakeConstraints { (make) in
                make.centerY.equalToSuperview().offset(inset.top - inset.bottom)
                make.right.equalToSuperview().offset(-inset.right)
                make.size.equalTo(btnSize)
            }
        }
        
        if indicatorView.isHidden == false {
            indicatorView.snp.remakeConstraints { (make) in
                make.centerY.equalToSuperview().offset(inset.top - inset.bottom)
                make.left.equalToSuperview().offset(inset.left)
                make.size.equalTo(indicatorViewSize)
            }
            labStartX += indicatorViewSize.width + spacing
            imgViewLeftStartX += indicatorViewSize.width + spacing
        }
        
        if imgViewLeft.isHidden == false {
            imgViewLeft.snp.makeConstraints { (make) in
                make.centerY.equalToSuperview().offset(inset.top - inset.bottom)
                make.left.equalToSuperview().offset(imgViewLeftStartX)
                make.size.equalTo(imgViewLeftSize)
            }
            labStartX += imgViewLeftSize.width + spacing
        }
        
        labelLeft.snp.remakeConstraints { (make) in
            make.centerY.equalToSuperview().offset(inset.top - inset.bottom)
            make.left.equalToSuperview().offset(labStartX)
            make.right.equalToSuperview().offset(-labeEndX)
            make.height.equalTo(height)
        }
    }

}
