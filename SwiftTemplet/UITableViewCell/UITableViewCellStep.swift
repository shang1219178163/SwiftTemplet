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
    
    var Xgap: CGFloat = 15;
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
        let size = labelLeft.sizeThatFits(.zero)
        labelLeft.snp.makeConstraints { (make) in
            make.top.equalToSuperview().offset(10)
            make.left.equalToSuperview().offset(Xgap)
            make.bottom.equalToSuperview().offset(-10)
            make.width.equalTo(size.width)
        }
        
        ppBtn.snp.makeConstraints { (make) in
            make.top.equalToSuperview().offset(12)
            make.right.equalToSuperview().offset(-Xgap)
            make.bottom.equalToSuperview().offset(-12)
            make.width.equalTo(120)
        }
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    lazy var ppBtn: PPNumberButton = {
        var numberBtn = PPNumberButton(frame: CGRect(x: 100, y: 220, width: 150, height: 44))
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
