//
//  UITableViewCellTitle.swift
//  IntelligentOfParking
//
//  Created by Bin Shang on 2020/2/14.
//  Copyright © 2020 Xi'an iRain IoT. Technology Service CO., Ltd. . All rights reserved.
//

import UIKit
import SwiftExpand

/// 标题+按钮
class UITableViewCellTitle: UITableViewCell {
    
    var inset = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
    var btnSize = CGSize(width: 17, height: 17)
    
    var imageSize = CGSize(width: 2.5, height: 17)

    /// 按钮位置
    var alignment: NSTextAlignment = .left
    // MARK: -life cycle

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier);
        
        contentView.addSubview(imgViewLeft);
        contentView.addSubview(labelLeft);
        contentView.addSubview(btn);

        imgViewLeft.backgroundColor = .systemBlue
        imgViewLeft.isHidden = true
        labelLeft.font = UIFont.systemFont(ofSize: 15, weight: .bold)
//        btn.setImage(UIImage(named: "icon_card_tips"), for: .normal)
        btn.setBackgroundImage(UIImage(named: "icon_card_tips"), for: .normal)

//        btn.addTarget(self, action: #selector(handleAction), for: .touchUpInside)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder);
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews();
        
        if bounds.height <= 10.0 {
            return
        }
        let height = bounds.height - inset.top - inset.bottom
        let labStartX = imgViewLeft.isHidden ? inset.left : imageSize.width + inset.left + kPadding

        if imgViewLeft.isHidden == false {
            imgViewLeft.snp.makeConstraints { (make) in
                make.centerY.equalToSuperview().offset(0);
                make.left.equalToSuperview().offset(inset.left);
                make.size.equalTo(imageSize);
            }
        }
        
        labelLeft.sizeToFit()
        labelLeft.snp.makeConstraints { (make) in
            make.centerY.equalToSuperview()
            make.left.equalToSuperview().offset(labStartX)
        }
//        let labelLeftSize = labelLeft.sizeThatFits(.zero)
//        labelLeft.snp.remakeConstraints { (make) in
//            make.centerY.equalToSuperview()
//            make.left.equalToSuperview().offset(labStartX)
//            make.width.greaterThanOrEqualTo(labelLeftSize.width)
//            make.height.equalTo(height)
//        }
        
        if alignment == .left {
            btn.snp.makeConstraints { (make) in
                make.centerY.equalToSuperview()
                make.left.equalTo(labelLeft.snp.right).offset(5)
                make.size.equalTo(btnSize)
            }
            
        } else {
            btn.snp.makeConstraints { (make) in
                make.centerY.equalToSuperview()
                make.right.equalToSuperview().offset(-inset.right)
                make.size.equalTo(btnSize)
            }
        }
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
    }

    
    @objc func handleAction() {
        let message = """
第一杯酒，阳光明媚，窗外的青藤爬进了我的眼。
第二杯酒，春风轻漾，叶梢轻拂着我的眉。
第三杯酒，鸟儿鸣叫，轻啄着我的心。
第四杯酒，影上窗楣，让我忘了我是谁。
第五杯酒，少年将飞，穿越层林叠翠。
第六杯酒，石径弯弯，尽头有位姑娘。
……
十一杯酒，群山苍翠，有个老翁枕石而醉。
十二杯酒，临渊而窥，山崖还给年岁。
十三杯酒，蜗牛有角，彼世界如此世界一般疲惫。
十四杯酒，迷眼渐累，火堆旁的人们渐要沉睡。
……
二十五杯酒，想起父亲，窗外的雨点坠了下来。
二十六杯酒，乌蝇不飞，若心悸的你我躲在叶下看秋雨渐衰。
二十七杯酒，弹几点泪，轻轻放下酒杯。
"""
        UIAlertController.showAlert("温馨提示", msg: message)
    }
}



