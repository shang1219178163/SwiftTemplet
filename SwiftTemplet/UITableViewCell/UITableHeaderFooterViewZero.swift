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
    
    var inset = UIEdgeInsets(top: 10, left: 15, bottom: 10, right: 15)

    // MARK: -life cycle

    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        contentView.addSubview(indicatorView);
        contentView.addSubview(imgViewLeft);
        contentView.addSubview(labelLeft);
        contentView.addSubview(labelRight);
        contentView.addSubview(lineBottom)

        labelRight.numberOfLines = 1;
        labelLeft.numberOfLines = 1;
        
        indicatorView.image = UIImageNamed(kIMG_arrowRight)
        labelRight.textAlignment = .center

        _ = contentView.addGestureTap {[weak self] (sender) in
            guard let self = self else { return }
            if self.isCanOpen == true {
                self.viewBlock?(self)
            }
        }
        
    }
    
    func block(_ action: @escaping ((UITableHeaderFooterViewZero) -> Void)) {
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
    
    func setupConstraint() {
        if bounds.height <= 10.0 {
            return
        }
        let height = bounds.height - inset.top - inset.bottom

        indicatorView.snp.makeConstraints { (make) in
            make.centerY.equalToSuperview()
            make.left.equalToSuperview().offset(inset.left)
            make.size.equalTo(CGSize(width: 25, height: 25))
        }
        
        if imgViewLeft.isHidden == false {
            imgViewLeft.snp.makeConstraints { (make) in
                make.centerY.equalToSuperview()
                make.left.equalTo(indicatorView.snp.right).offset(kPadding)
                make.width.height.equalTo(height)
            }
            
            let labelLeftSize = labelLeft.sizeThatFits(.zero)
            labelLeft.snp.makeConstraints { (make) in
                make.centerY.equalToSuperview()
                make.left.equalTo(imgViewLeft.snp.right).offset(kPadding)
                make.width.lessThanOrEqualTo(labelLeftSize.width)
                make.height.equalTo(height)
            }
        } else {
            let labelLeftSize = labelLeft.sizeThatFits(.zero)
            labelLeft.snp.makeConstraints { (make) in
                make.centerY.equalToSuperview()
                make.left.equalTo(indicatorView.snp.right).offset(kPadding)
                make.width.lessThanOrEqualTo(labelLeftSize.width)
                make.height.equalTo(height)
            }
        }
        
        let labelRightSize = labelRight.sizeThatFits(.zero)
        labelRight.snp.makeConstraints { (make) in
            make.centerY.equalToSuperview()
            make.right.equalToSuperview().offset(-inset.right)
            make.width.lessThanOrEqualTo(labelRightSize.width)
            make.height.equalTo(height)
        }
        
        lineBottom.snp.makeConstraints { (make) in
            make.left.equalToSuperview();
            make.right.equalToSuperview();
            make.bottom.equalToSuperview().offset(0);
            make.height.equalTo(0.33);
        }
    }

}
