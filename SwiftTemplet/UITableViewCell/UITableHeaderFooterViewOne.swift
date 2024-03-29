//
//  UITableHeaderFooterViewOne.swift
//  SwiftTemplet
//
//  Created by Bin Shang on 2018/12/24.
//  Copyright © 2018 BN. All rights reserved.
//

import UIKit
import SwiftExpand

/// 图片+文字+文字+图片
@objcMembers class UITableHeaderFooterViewOne: UITableViewHeaderFooterView {

    var isOpen: Bool = false

    var isCanOpen: Bool = false
    
    private var viewBlock: ((UITableHeaderFooterViewOne) -> Void)?

    var type: Int = 0{
        didSet {
            if oldValue == 0 {
                //右边文字优先展示
                labelLeft.textAlignment = .left;
                labelLeft.adjustsFontSizeToFitWidth = true
                
            } else {
                //左边文字优先展示
                labelRight.textAlignment = .right;
                labelRight.adjustsFontSizeToFitWidth = true
                
            }
        }
    }
    // MARK: -life cycle
    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        contentView.addSubview(imgViewLeft);
        contentView.addSubview(imgViewRight);
        contentView.addSubview(labelLeft);
        contentView.addSubview(labelRight);
        contentView.addSubview(lineBottom)

        labelRight.numberOfLines = 1;
        labelLeft.numberOfLines = 1;
        imgViewRight.image = UIImage(named: "img_arrowRight_gray")

        contentView.addGestureTap {[weak self] (sender) in
            guard let self = self else { return }
            if self.isCanOpen == true {
                self.viewBlock?(self)
            }
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder);
        fatalError("init(coder:) has not been implemented")
    }
    
    func block(_ action: @escaping ((UITableHeaderFooterViewOne) -> Void)) {
        self.viewBlock = action;
    }
    
    override func layoutSubviews() {
        super.layoutSubviews();
        
        setupConstraint()
    }
    
    func setupConstraint() {
        if bounds.height <= 10 {
            return
        }
        //箭头不隐藏
        if imgViewRight.isHidden == false {
            imgViewRight.snp.makeConstraints { (make) in
                make.centerY.equalToSuperview()
                make.right.equalToSuperview().offset(-kX_GAP)
                make.size.equalTo(kSizeArrow)
            }
            //头像不为空
            if imgViewLeft.image != nil {
                imgViewLeft.snp.makeConstraints { (make) in
                    make.centerY.equalToSuperview()
                    make.left.equalToSuperview().offset(kX_GAP)
                    make.width.height.equalTo(contentView.frame.height - kY_GAP*2)
                }
                
                if type == 0 {
                    //右边文字优先展示
                    labelRight.sizeToFit();
                    labelRight.snp.makeConstraints { (make) in
                        make.centerY.equalToSuperview()
                        make.right.equalTo(imgViewRight.snp.left).offset(-kPadding)
                        make.height.equalTo(kSizeArrow.height)
                    }
                    
                    labelLeft.snp.makeConstraints { (make) in
                        make.centerY.equalToSuperview()
                        make.left.equalTo(imgViewLeft.snp.right).offset(kPadding)
                        make.right.equalTo(labelRight.snp.left).offset(-kPadding)
                        make.height.equalTo(kSizeArrow.height)
                    }
                    
                } else {
                    //左边文字优先展示
                    labelLeft.sizeToFit();
                    labelLeft.snp.makeConstraints { (make) in
                        make.centerY.equalToSuperview()
                        make.left.equalTo(imgViewLeft.snp.right).offset(kPadding)
                        make.height.equalTo(kSizeArrow.height)
                    }
                    
                    labelRight.snp.makeConstraints { (make) in
                        make.centerY.equalToSuperview()
                        make.left.equalTo(labelLeft.snp.right).offset(kPadding)
                        make.right.greaterThanOrEqualTo(imgViewRight.snp.left).offset(-kPadding)
                        make.height.equalTo(kSizeArrow.height)
                    }
                }
                
            } else {
                //头像为空
                imgViewLeft.snp.makeConstraints { (make) in
                    make.centerY.equalToSuperview()
                    make.left.equalToSuperview().offset(kX_GAP)
                    make.width.height.equalTo(0.0)
                }
                
                if type == 0 {
                    labelRight.sizeToFit();
                    labelRight.snp.makeConstraints { (make) in
                        make.centerY.equalToSuperview()
                        make.right.equalTo(imgViewRight.snp.left).offset(-kPadding)
                        make.height.equalTo(kSizeArrow.height)
                    }
                    
                    labelLeft.snp.makeConstraints { (make) in
                        make.centerY.equalToSuperview()
                        make.left.equalToSuperview().offset(kX_GAP)
                        make.right.equalTo(labelRight.snp.left).offset(-kPadding)
                        make.height.equalTo(kSizeArrow.height)
                    }
                    
                } else {
                    labelLeft.sizeToFit();
                    labelLeft.snp.makeConstraints { (make) in
                        make.centerY.equalToSuperview()
                        make.left.equalToSuperview().offset(kX_GAP)
                        make.height.equalTo(kSizeArrow.height)
                    }
                    
                    labelRight.snp.makeConstraints { (make) in
                        make.centerY.equalToSuperview()
                        make.left.equalTo(labelLeft.snp.right).offset(kPadding)
                        make.right.equalTo(imgViewRight.snp.left).offset(-kPadding)
                        make.height.equalTo(kSizeArrow.height)
                    }
                }
            }
            
        } else {
            //头像不为空
            if imgViewLeft.image != nil {
                imgViewLeft.snp.makeConstraints { (make) in
                    make.centerY.equalToSuperview()
                    make.left.equalToSuperview().offset(kX_GAP)
                    make.width.height.equalTo(contentView.frame.height - kY_GAP*2)
                }
                
                if type == 0 {
                    //右边文字优先展示
                    labelRight.sizeToFit();
                    labelRight.snp.makeConstraints { (make) in
                        make.centerY.equalToSuperview()
                        make.right.equalToSuperview().offset(-kX_GAP);
                        make.height.equalTo(kSizeArrow.height)
                    }
                    
                    labelLeft.snp.makeConstraints { (make) in
                        make.centerY.equalToSuperview()
                        make.left.equalTo(imgViewLeft.snp.right).offset(kPadding)
                        make.right.equalTo(labelRight.snp.left).offset(-kPadding)
                        make.height.equalTo(kSizeArrow.height)
                    }
                    
                } else {
                    //左边文字优先展示
                    labelLeft.sizeToFit();
                    labelLeft.snp.makeConstraints { (make) in
                        make.centerY.equalToSuperview()
                        make.left.equalTo(imgViewLeft.snp.right).offset(kPadding)
                        make.height.equalTo(kSizeArrow.height)
                    }
                    
                    labelRight.snp.makeConstraints { (make) in
                        make.centerY.equalToSuperview()
                        make.left.equalTo(labelLeft.snp.right).offset(kPadding)
                        make.right.equalToSuperview().offset(-kX_GAP)
                        make.height.equalTo(kSizeArrow.height)
                    }
                }
                
            } else {
                imgViewLeft.snp.makeConstraints { (make) in
                    make.centerY.equalToSuperview()
                    make.left.equalToSuperview().offset(kX_GAP)
                    make.width.height.equalTo(0.0)
                }
                if type == 0 {
                    //右边文字优先展示
                    labelRight.sizeToFit();
                    labelRight.snp.makeConstraints { (make) in
                        make.centerY.equalToSuperview()
                        make.right.equalToSuperview().offset(-kX_GAP);
                        make.height.equalTo(kSizeArrow.height)
                    }
                    
                    labelLeft.snp.makeConstraints { (make) in
                        make.centerY.equalToSuperview()
                        make.left.equalToSuperview().offset(kX_GAP)
                        make.right.equalTo(labelRight.snp.left).offset(-kPadding)
                        make.height.equalTo(kSizeArrow.height)
                    }
                } else {
                    //左边文字优先展示
                    labelLeft.sizeToFit();
                    labelLeft.snp.makeConstraints { (make) in
                        make.centerY.equalToSuperview()
                        make.left.equalToSuperview().offset(kX_GAP)
                        make.height.equalTo(kSizeArrow.height)
                    }
                    
                    labelRight.snp.makeConstraints { (make) in
                        make.centerY.equalToSuperview()
                        make.left.equalTo(labelLeft.snp.right).offset(kPadding)
                        make.right.equalToSuperview().offset(-kX_GAP)
                        make.height.equalTo(kSizeArrow.height)
                    }
                }
            }
        }
        
        lineBottom.snp.makeConstraints { (make) in
            make.left.equalToSuperview();
            make.right.equalToSuperview();
            make.bottom.equalToSuperview().offset(0);
            make.height.equalTo(0.33);
        }
    }
    
    
    // MARK: -lazy
    public lazy var imgViewLeft: UIImageView = {
        let view = UIImageView(frame: .zero)
        view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        view.isUserInteractionEnabled = true
        view.contentMode = .scaleAspectFit
        view.backgroundColor = .clear

        return view
    }()
    
    public lazy var imgViewRight: UIImageView = {
        let view = UIImageView(frame: .zero)
        view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        view.isUserInteractionEnabled = true
        view.contentMode = .scaleAspectFit
        view.backgroundColor = .clear
        view.image = UIImage(named: "img_arrowRight_gray")
        
        return view
    }()
    
    public lazy var labelLeft: UILabel = {
        let view = UILabel(frame: CGRect.zero)
        view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        view.textAlignment = .left
        view.numberOfLines = 0
        view.lineBreakMode = .byCharWrapping
        
        return view
    }()

    
    public lazy var labelRight: UILabel = {
        let view = UILabel(frame: CGRect.zero)
        view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        view.textAlignment = .left
        view.numberOfLines = 0
        view.lineBreakMode = .byCharWrapping
        
        return view
    }()
}
