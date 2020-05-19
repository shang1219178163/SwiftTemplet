//
//  BNTableViewCellView.swift
//  SwiftTemplet
//
//  Created by Bin Shang on 2019/1/17.
//  Copyright © 2019 BN. All rights reserved.
//

import UIKit
import SnapKit

import SwiftExpand
/// 图片+文字+文字+图片
class NNCellDefaultView: UIView {

    var Xgap: CGFloat = 10;

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
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubview(imgViewLeft);
        addSubview(labelLeft);
        addSubview(labelRight);
        
        labelRight.numberOfLines = 1;
        labelLeft.numberOfLines = 1;
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        setupConstraint()
    }
    
    func setupConstraint() {
        if bounds.height <= 0.0 {
            return
        }
        let height: CGFloat = bounds.height - kPadding*2
        //头像不为空
        if imgViewLeft.isHidden == false {
            imgViewLeft.snp.makeConstraints { (make) in
                make.centerY.equalToSuperview()
                make.left.equalToSuperview().offset(Xgap)
                make.width.height.equalTo(height)
            }
            
            if type == 0 {
                //右边文字优先展示
                let size: CGSize = labelRight.sizeThatFits(.zero)
                labelRight.snp.makeConstraints { (make) in
                    make.top.equalToSuperview().offset(kPadding)
                    make.right.equalToSuperview().offset(-Xgap)
                    make.width.equalTo(ceil(size.width))
                    make.bottom.equalToSuperview().offset(-kPadding)
                }
                
                labelLeft.snp.makeConstraints { (make) in
                    make.top.bottom.equalTo(labelRight)
                    make.left.equalTo(imgViewLeft.snp.right).offset(kPadding)
                    make.right.equalTo(labelRight.snp.left).offset(-kPadding)
                }
                
            } else {
                //左边文字优先展示
                let size: CGSize = labelLeft.sizeThatFits(.zero)
                labelLeft.snp.makeConstraints { (make) in
                    make.top.equalToSuperview().offset(kPadding)
                    make.left.equalTo(imgViewLeft.snp.right).offset(kPadding)
                    make.width.equalTo(ceil(size.width))
                    make.bottom.equalToSuperview().offset(-kPadding)
                }
                
                labelRight.snp.makeConstraints { (make) in
                    make.top.bottom.equalTo(labelLeft)
                    make.left.equalTo(labelLeft.snp.right).offset(kPadding)
                    make.right.equalToSuperview().offset(-Xgap)
                }
            }
          return
        }
        
        //头像为空
        if type == 0 {
            //右边文字优先展示
            let size: CGSize = labelRight.sizeThatFits(.zero)
            labelRight.snp.makeConstraints { (make) in
                make.top.equalToSuperview().offset(kPadding)
                make.right.equalToSuperview().offset(-Xgap)
                make.width.equalTo(ceil(size.width))
                make.bottom.equalToSuperview().offset(-kPadding)
            }
            
            labelLeft.snp.makeConstraints { (make) in
                make.top.bottom.equalTo(labelRight)
                make.left.equalToSuperview().offset(Xgap)
                make.right.equalTo(labelRight.snp.left).offset(-kPadding)
            }
            
        } else {
            //左边文字优先展示
            let size: CGSize = labelLeft.sizeThatFits(.zero)
            labelLeft.snp.makeConstraints { (make) in
                make.top.equalToSuperview().offset(kPadding)
                make.left.equalToSuperview().offset(Xgap)
                make.width.equalTo(ceil(size.width))
                make.bottom.equalToSuperview().offset(-kPadding)
            }
            
            labelRight.snp.makeConstraints { (make) in
                make.top.bottom.equalTo(labelLeft)
                make.left.equalTo(labelLeft.snp.right).offset(kPadding)
                make.right.equalToSuperview().offset(-Xgap)
            }
        }
    }
    
//    func setupConstraint() {
//        if bounds.height <= 0.0 {
//            return
//        }
//        let height: CGFloat = bounds.height - kY_GAP*2
//        //头像不为空
//        if imgViewLeft.isHidden == false {
//            imgViewLeft.snp.makeConstraints { (make) in
//                make.centerY.equalToSuperview()
//                make.left.equalToSuperview().offset(kX_GAP)
//                make.width.height.equalTo(height)
//            }
//
//            if type == 0 {
//                //右边文字优先展示
//                labelRight.sizeToFit();
//                labelRight.snp.makeConstraints { (make) in
//                    make.centerY.equalToSuperview()
//                    make.right.equalToSuperview().offset(-kX_GAP)
////                    make.height.equalTo(kSizeArrow.height)
//                }
//
//                labelLeft.snp.makeConstraints { (make) in
//                    make.centerY.equalToSuperview()
//                    make.left.equalTo(imgViewLeft.snp.right).offset(kPadding)
//                    make.right.equalTo(labelRight.snp.left).offset(-kPadding)
//                    make.height.equalTo(kSizeArrow.height)
//                }
//
//            } else {
//                //左边文字优先展示
//                labelLeft.sizeToFit();
//                labelLeft.snp.makeConstraints { (make) in
//                    make.centerY.equalToSuperview()
//                    make.left.equalTo(imgViewLeft.snp.right).offset(kPadding)
////                    make.height.equalTo(kSizeArrow.height)
//                }
//
//                labelRight.snp.makeConstraints { (make) in
//                    make.centerY.equalToSuperview()
//                    make.left.equalTo(labelLeft.snp.right).offset(kPadding)
//                    make.right.equalToSuperview().offset(-kX_GAP)
//                    make.height.equalTo(kSizeArrow.height)
//                }
//            }
//
//        } else {
//            //头像为空
//            if type == 0 {
//                labelRight.sizeToFit();
//                labelRight.snp.makeConstraints { (make) in
//                    make.centerY.equalToSuperview()
//                    make.right.equalToSuperview().offset(-kPadding)
////                        make.height.equalTo(kSizeArrow.height)
//                }
//
//                labelLeft.snp.makeConstraints { (make) in
//                    make.centerY.equalToSuperview()
//                    make.left.equalToSuperview().offset(kX_GAP)
//                    make.right.equalTo(labelRight.snp.left).offset(-kPadding)
//                    make.height.equalTo(kSizeArrow.height)
//                }
//
//            } else {
//                labelLeft.sizeToFit();
//                labelLeft.snp.makeConstraints { (make) in
//                    make.centerY.equalToSuperview()
//                    make.left.equalToSuperview().offset(kX_GAP)
////                        make.height.equalTo(kSizeArrow.height)
//                }
//
//                labelRight.snp.makeConstraints { (make) in
//                    make.centerY.equalToSuperview()
//                    make.left.equalTo(labelLeft.snp.right).offset(kPadding)
//                    make.right.equalToSuperview().offset(-kX_GAP)
//                    make.height.equalTo(kSizeArrow.height)
//                }
//            }
//        }
//    }
    //MARK: -funtions
  
    
    //MARK: -lazy
    
    lazy var imgViewLeft: UIImageView = {
        var view = UIImageView(frame: .zero);
        view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        view.isUserInteractionEnabled = true;
        view.contentMode = .scaleAspectFit;
        
        return view;
    }()
    
    lazy var imgViewRight: UIImageView = {
        var view = UIImageView(frame: .zero);
        view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        view.isUserInteractionEnabled = true;
        view.contentMode = .scaleAspectFit;
        view.image = UIImage(named: kIMG_arrowRight);
        return view;
    }()
    
    lazy var labelLeft: UILabel = {
        var view = UILabel(frame: .zero);
        view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        view.textAlignment = .left;
        view.numberOfLines = 0;
        view.lineBreakMode = .byCharWrapping;
        view.isUserInteractionEnabled = true;
  
        return view;
    }()
    
    lazy var labelRight: UILabel = {
        var view = UILabel(frame: .zero);
        view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        view.textAlignment = .left;
        view.numberOfLines = 0;
        view.lineBreakMode = .byCharWrapping;
        view.isUserInteractionEnabled = true;
    
        return view;
    }()
    
}
