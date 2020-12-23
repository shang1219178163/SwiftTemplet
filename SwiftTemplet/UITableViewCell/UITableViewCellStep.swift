//
//  UITableViewCellStep.swift
//  SwiftTemplet
//
//  Created by Bin Shang on 2019/1/10.
//  Copyright © 2019 BN. All rights reserved.
//

import UIKit
import SwiftExpand

/// 文字+ppnumber(商品j加减控件)
class UITableViewCellStep: UITableViewCell {
    
    var inset = UIEdgeInsets(top: 10, left: 15, bottom: 10, right: 15)
    
    var isShowLeft = false
    var spacing: CGFloat = 20
    
    /// 是否有星标
    var hasAsterisk = false;
    // MARK: -life cycle
    deinit {
        labelLeft.removeObserver(self, forKeyPath: "text")
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier);
        
        contentView.addSubview(labelLeft);
        contentView.addSubview(ppBtn);
        
        labelLeft.numberOfLines = 1
        labelLeft.addObserver(self, forKeyPath: "text", options: .new, context: nil)
    }
    
    override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
        if keyPath == "text" {
            //标题星号处理
            if hasAsterisk == true {
                labelLeft.attributedText = labelLeft.text?.toAsterisk(labelLeft.textColor, font: labelLeft.font.pointSize)
            }
        }
        else {
            super.observeValue(forKeyPath: keyPath, of: object, change: change, context: context)
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
        if bounds.height < 20 {
            return;
        }
        let height = bounds.height - inset.top - inset.bottom
//        let endX = accessoryType == .none ? inset.right : kPadding

        let labelLeftSize = labelLeft.sizeThatFits(.zero)
        labelLeft.snp.remakeConstraints { (make) in
            make.centerY.equalToSuperview()
            make.left.equalToSuperview().offset(inset.left)
            make.width.equalTo(labelLeftSize.width)
            make.height.equalTo(height)
        }
        
        if isShowLeft == false {
            ppBtn.snp.makeConstraints { (make) in
                make.centerY.equalToSuperview()
                make.right.equalToSuperview().offset(-inset.right)
                make.width.equalTo(120)
                make.height.equalTo(35)
            }
            return
        }
        
        ppBtn.snp.remakeConstraints { (make) in
            make.centerY.equalToSuperview()
            make.left.equalTo(labelLeft.snp.right).offset(spacing)
            make.width.equalTo(120)
            make.height.equalTo(35)
        }
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    lazy var ppBtn: PPNumberButton = {
        let numberBtn = PPNumberButton(frame: CGRect(x: 100, y: 220, width: 150, height: 44))
        //设置加减按钮的标题
//        numberBtn.setTitle(decreaseTitle: "减", increaseTitle: "加")
        numberBtn.setImage(decreaseImage: UIImage(named: kIMG_elemetDec)!, increaseImage: UIImage(named: kIMG_elemetInc)!)

        //设置加减按钮标题的字体大小
        numberBtn.buttonTitleFont(UIFont.systemFont(ofSize: 15))
        //开启抖动动画
        numberBtn.shakeAnimation = true
        //加减按钮的闭包回调
        numberBtn.numberResult { (number) in
            print(number)
        }
        return numberBtn
    }()
    
}
