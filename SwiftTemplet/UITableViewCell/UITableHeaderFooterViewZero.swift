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

    private var viewBlock: ((UITableHeaderFooterViewZero) -> Void)?

    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        contentView.addSubview(indicatorView);
        contentView.addSubview(imgViewLeft);
        contentView.addSubview(labelLeft);
        contentView.addSubview(labelRight);
        
        labelRight.numberOfLines = 1;
        labelLeft.numberOfLines = 1;
        
        indicatorView.image = UIImageNamed(kIMG_arrowRight)
        labelRight.textAlignment = .center

        let _ = contentView.addGestureTap {[weak self] (sender:UIGestureRecognizer) in
            if self!.isCanOpen == true {
                if self!.viewBlock != nil {
                    self!.viewBlock!(self!)
                }
            }
        }
        
    }
    
    func block(_ action: @escaping ((UITableHeaderFooterViewZero) -> Void)) -> Void {
        self.viewBlock = action;
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder);
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews();
        
        setupConstraint()
    }
    
    func setupConstraint() -> Void {
        
        indicatorView.snp.makeConstraints { (make) in
            make.centerY.equalToSuperview()
            make.left.equalToSuperview().offset(kX_GAP)
            make.size.equalTo(CGSize(width: 25, height: 25))
        }
        
        if imgViewLeft.image != nil {
            imgViewLeft.snp.makeConstraints { (make) in
                make.centerY.equalToSuperview()
                make.left.equalTo(indicatorView.snp.right).offset(kPadding)
//                make.width.height.equalTo(contentView.bounds.height - kY_GAP*2)
                make.width.height.equalTo(40)
            }
            
            labelLeft.sizeToFit()
            labelLeft.snp.makeConstraints { (make) in
                make.centerY.equalToSuperview()
                make.left.equalTo(imgViewLeft.snp.right).offset(kPadding)
                make.height.lessThanOrEqualTo(kSizeArrow.height)
            }
        } else {
            labelLeft.sizeToFit()
            labelLeft.snp.makeConstraints { (make) in
                make.centerY.equalToSuperview()
                make.left.equalTo(indicatorView.snp.right).offset(kPadding)
                make.height.lessThanOrEqualTo(kSizeArrow.height)
            }
        }
        
        labelRight.sizeToFit()
        labelRight.snp.makeConstraints { (make) in
            make.centerY.equalToSuperview()
            make.right.equalToSuperview().offset(-kX_GAP)
            make.height.equalTo(kSizeArrow.height)
        }
    }

}
