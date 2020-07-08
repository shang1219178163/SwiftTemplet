//
//  IOPOrdersChooseView.swift
//  SwiftTemplet
//
//  Created by Bin Shang on 2020/3/4.
//  Copyright © 2020 BN. All rights reserved.
//

import UIKit
import SwiftExpand

@objc protocol IOPOrdersChooseViewDelegate{
    func ordersChooseViewAll(_ sender: UIButton, isAll: Bool)
    func ordersChooseViewNext(_ sender: UIButton)
}

class IOPOrdersChooseView: UIView {

    weak var delegate: IOPOrdersChooseViewDelegate?
    var count: Int = 0{
        willSet{
            let specialStr = "\(newValue)"
            let text = "\(specialStr)个订单"
            labelTitle.attributedText = getAttString(text, textTaps: [specialStr])
        }
    }
    
    var amount: String = "0.00"{
        willSet{
            let specialStr = newValue
            let text = "合计 ¥\(specialStr)"
            labelTitleSub.attributedText = getAttString(text, textTaps: [specialStr])
        }
    }
    
    var chooseAll: Bool = false

    lazy var checkBox: UIButton = {
        var view = UIButton(type: .custom)
        view.frame = CGRect(x: 0, y: 0, width: 100, height: 35)
        view.titleLabel?.font = UIFont.systemFont(ofSize: 15)
        view.setTitle("全选", for: .normal);

        let normlImage: UIImage = UIImage(named: "photo_cancell")!
        let seletedImage: UIImage = UIImage(named: "photo_select")!
        let normlTextColor: UIColor = UIColor.black.withAlphaComponent(0.3)
        let seletedTextColor: UIColor = UIColor.systemBlue
        view.setImage(normlImage, for: .normal)
        view.setImage(seletedImage, for: .selected)
        view.setTitleColor(normlTextColor, for: .normal)
        view.setTitleColor(seletedTextColor, for: .selected)
        
        view.adjustsImageWhenHighlighted = false
        
        view.sizeToFit()
//        view.titleEdgeInsets = UIEdgeInsetsMake(0, -view.imageView!.bounds.width, 0, view.imageView!.bounds.width)
//        view.imageEdgeInsets = UIEdgeInsetsMake(0, view.titleLabel!.bounds.width+0.0, 0, -view.titleLabel!.bounds.width-0.0)
        view.layoutButton(direction: 1, imageTitleSpace: 2)
        view.addActionHandler({ (control) in
            control.isSelected = !control.isSelected
            self.chooseAll = control.isSelected
            self.delegate?.ordersChooseViewAll(control as! UIButton, isAll: self.chooseAll)

            guard let sender = control as? UIButton else { return }
//            DDLog(sender.currentTitle as Any)
        }, for: .touchUpInside)
        return view
    }()
    
    @objc lazy var btn: UIButton = {
        var view: UIButton = UIButton.create( .zero, title: "下一步", imgName: nil, type: 1);
        view.titleLabel?.font = UIFont.systemFont(ofSize: 15)
        view.addActionHandler({ (control) in
            guard let sender = control as? UIButton else { return }
            DDLog(sender.currentTitle as Any)
            self.delegate?.ordersChooseViewNext(sender)
            
        }, for: .touchUpInside)
        
        return view;
    }();
    
    @objc lazy var labelTitle: UILabel = {
        let view = UILabel()
        view.textColor = UIColor.hex("#999999")
        view.font = UIFont.systemFont(ofSize: 14)
        view.numberOfLines = 0
        view.lineBreakMode = .byWordWrapping
        view.isUserInteractionEnabled = true
        return view
    }()
    
    @objc lazy var labelTitleSub: UILabel = {
        let view = UILabel()
        view.textColor = UIColor.hex("#999999")
        view.font = UIFont.systemFont(ofSize: 14)
        view.numberOfLines = 0
        view.lineBreakMode = .byWordWrapping
        view.isUserInteractionEnabled = true
        return view
    }()
    
    // MARK: -life cycle
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = UIColor.white
        
        addSubview(checkBox)
        addSubview(btn)
        addSubview(labelTitle)
        addSubview(labelTitleSub)
        
        count = 0
        amount = "0.00"
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        if bounds.height <= 10.0 {
            return
        }

        let heigth = bounds.height - 8*2
        
        btn.snp.makeConstraints { (make) in
            make.centerY.equalToSuperview()
            make.right.equalToSuperview().offset(-10);
            make.width.equalTo(120);
            make.height.equalTo(heigth);
        }
        
        checkBox.sizeToFit()
        checkBox.snp.makeConstraints { (make) in
            make.centerY.equalToSuperview()
            make.left.equalToSuperview().offset(10);
        }
        
        labelTitle.snp.makeConstraints { (make) in
            make.top.equalTo(btn).offset(0);
            make.left.greaterThanOrEqualTo(checkBox.maxX + 15);
            make.right.equalTo(btn.snp.left).offset(-8);
            make.height.equalTo(heigth/2);
        }
        
        labelTitleSub.snp.makeConstraints { (make) in
            make.top.equalTo(labelTitle.snp.bottom).offset(0);
            make.left.right.height.equalTo(labelTitle);
        }
        
//        DDLog(checkBox.frame, labelTitle.frame)
        if subviews.contains(lineTop) == false {
            addSubview(lineTop)
        }
    }
    
    // MARK: -funtions
    
    func getAttString(_ text: String, textTaps: [String]) -> NSAttributedString {
        let attString = NSAttributedString.attString(text, textTaps: textTaps, font: 12, tapFont: 12, color: UIColor.textColor6, tapColor: UIColor.theme, alignment: .right)
        return attString
    }
}

extension IOPOrdersChooseView{
    
    /// 创建默认的确定按钮
//    static func create(_ title: String = "确定", topPadding: CGFloat = 30, height: CGFloat = 180) -> NNTableFooterView {
//        let view = NNTableFooterView(frame: CGRectMake(0, 0, UIScreen.sizeWidth, height))
//        view.topPadding = topPadding;
//        view.labelTop.font = UIFont.systemFont(ofSize: 12)
//        view.labelTop.text = ""
//
//        view.btn.setTitle(title, for: .normal)
//        view.btn.setBackgroundImage(UIImage(color: UIColor.theme), for: .normal);
//        view.btn.setTitleColor(UIColor.white, for: .normal)
//        view.btn.addActionHandler({ (control) in
//            DDLog(control)
//
//        }, for: .touchUpInside)
//        return view;
//    }
}
