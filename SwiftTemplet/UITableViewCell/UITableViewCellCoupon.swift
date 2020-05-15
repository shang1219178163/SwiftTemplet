

//
//  UITableViewCellCoupon.swift
//  SwiftTemplet
//
//  Created by Bin Shang on 2019/9/18.
//  Copyright © 2019 BN. All rights reserved.
//

import UIKit
import SnapKit
import SwiftExpand

class UITableViewCellCoupon: UITableViewCell {
    
    /// 优惠券类型(0正常, 1已使用, 2已过期)
    var couponType: Int = 0{
        willSet{
            guard let dic: [String : Any] = couponTypeDic[newValue] else { return }
            guard let color = dic["color"] else { return }
            labelLeft.backgroundColor = (color as! UIColor)
            labelTop.textColor = (color as! UIColor)
            guard let title = dic["title"] else { return }
            labelLeft.text = (title as! String)
//            DDLog("title_\(title)")
        }
    }
    /// 优惠券状态(0正常, 1已使用, 2已过期)
    var couponStatus: Int = 0{
        willSet{
            switch newValue {
            case 1:
                labelLeft.backgroundColor = UIColor.hexValue(0xCCCCCC);
                labelTop.textColor = UIColor.hexValue(0xCCCCCC)
                labelMid.textColor = UIColor.hexValue(0xCCCCCC)
                labelBom.textColor = UIColor.hexValue(0xCCCCCC)
                btn.isHidden = true;
                imgViewRight.isHidden = false;
                imgViewRight.image = UIImage(named: "icon_coupon_used")

            case 2:
                labelLeft.backgroundColor = UIColor.hexValue(0xCCCCCC);
                labelTop.textColor = UIColor.hexValue(0xCCCCCC)
                labelMid.textColor = UIColor.hexValue(0xCCCCCC)
                labelBom.textColor = UIColor.hexValue(0xCCCCCC)
                btn.isHidden = true;
                imgViewRight.isHidden = false;
                imgViewRight.image = UIImage(named: "icon_coupon_fail")

            default:
                contentView.backgroundColor = UIColor.white
                btn.isHidden = false;
                imgViewRight.isHidden = true;
            }
        }
    }
    
    
   
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier);
  
        contentView.addSubview(labelLeft);
        contentView.addSubview(labelTop);
        contentView.addSubview(labelMid);
        contentView.addSubview(labelBom);
        contentView.addSubview(btn);
        contentView.addSubview(imgViewRight);

        labelLeft.numberOfLines = 2;
        labelTop.numberOfLines = 1;
        labelMid.numberOfLines = 1;
        labelBom.numberOfLines = 1;
        
        btn.setTitle("立即使用", for: .normal)
        btn.titleLabel?.font = UIFont.systemFont(ofSize: 11)
//        btn.setTitleColor(UIColor.theme, for: .normal)
        
        imgViewRight.isHidden = true;

        labelLeft.textColor = UIColor.white;
        labelLeft.textAlignment = .center;
        labelLeft.font = UIFont.systemFont(ofSize: 16)
        labelLeft.addObserver(self, forKeyPath: "backgroundColor", options: .new, context: nil)
        labelTop.addObserver(self, forKeyPath: "text", options: .new, context: nil)
        
        btn.isHidden = true
    }
    
    override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
        if keyPath == "text" {
            let value: String = change![NSKeyValueChangeKey.newKey] as! String;
            if value.contains(" ") == true {
                let list = value.components(separatedBy: " ");
                self.labelTop.attributedText = NSAttributedString.attString(self.labelTop.text, textTaps: [list.last!], font: 22, tapFont: 11, color: UIColor.white, tapColor: UIColor.hexValue(0xCADFFF), alignment: .center)
            }
        } else if keyPath == "backgroundColor" {
            let value: UIColor = change![NSKeyValueChangeKey.newKey] as! UIColor;
            addLineDashLayer(color: value, width: 2, cornerRadius: 0, view: labelLeft, size: CGSize(width: 80, height: 80))

        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder);
        fatalError("init(coder:) has not been implemented")
    }
    
    deinit {
        labelLeft.removeObserver(self, forKeyPath: "text")
        labelLeft.removeObserver(self, forKeyPath: "backgroundColor")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews();
        
        setupConstraint()
    }
    
    func setupConstraint() {
        if bounds.height <= 0.0 {
            return;
        }
        
        labelLeft.snp.makeConstraints { (make) in
            make.top.equalToSuperview();
            make.left.equalToSuperview().offset(10);
            make.width.equalTo(bounds.height);
            make.height.equalTo(bounds.height);
        }
        
        labelTop.sizeToFit();
        labelTop.snp.makeConstraints { (make) in
            make.top.equalToSuperview().offset(8);
            make.left.equalTo(labelLeft.snp_right).offset(8);
            make.height.equalTo(20);
        }
        
        labelMid.snp.makeConstraints { (make) in
            make.top.equalTo(labelTop.snp_bottom).offset(5);
            make.left.equalTo(labelTop);
            make.right.equalToSuperview().offset(10);
            make.height.equalTo(20);
        }
        
        labelBom.snp.makeConstraints { (make) in
            make.top.equalTo(labelMid.snp_bottom);
            make.left.equalTo(labelTop);
            make.right.equalToSuperview().offset(10);
            make.height.equalTo(20);
        }
      
        btn.snp.makeConstraints { (make) in
            make.top.equalToSuperview().offset(10);
            make.right.equalToSuperview().offset(-10);
            make.width.equalTo(60);
            make.height.equalTo(20);
        }
        
        imgViewRight.snp.makeConstraints { (make) in
            make.top.equalToSuperview().offset(8);
            make.right.equalToSuperview().offset(-10);
            make.width.equalTo(60);
            make.height.equalTo(60);
        }
        
        addLineDashLayer(color: labelLeft.backgroundColor!, width: 2, cornerRadius: 0, view: labelLeft, size: CGSize(width: 80, height: 80))

        btn.layer.borderColor = UIColor.theme.cgColor;
        btn.layer.borderWidth = 1;
        btn.layer.cornerRadius = 10;
        btn.layer.masksToBounds = true;
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    // MARK: -funtions
    @objc func addLineDashLayer(color: UIColor = UIColor.red,
                                width: CGFloat = 1,
                                dashPattern: [NSNumber] = [NSNumber(floatLiteral: 4), NSNumber(floatLiteral: 5)],
                                cornerRadius: CGFloat = 0, view: UIView,
                                size: CGSize = CGSize.zero) {
        assert(CGRect.zero.equalTo(view.bounds) == false || CGSize.zero.equalTo(size) == false);

        view.layer.borderColor = UIColor.clear.cgColor;
        view.layer.borderWidth = 0;
        
        let shapeLayer = CAShapeLayer();
        shapeLayer.strokeColor = color.cgColor;
        shapeLayer.fillColor = UIColor.clear.cgColor;
        
        shapeLayer.frame = CGSize.zero.equalTo(size) ? view.bounds : CGRect(x: 0, y: 0, width: size.width, height: size.height);
        shapeLayer.path = UIBezierPath(roundedRect: shapeLayer.frame, cornerRadius: cornerRadius).cgPath;
        
        shapeLayer.lineWidth = width;
        shapeLayer.lineDashPattern = dashPattern;
        shapeLayer.lineCap = .square;
        if cornerRadius > 0 {
            view.layer.cornerRadius = cornerRadius;
            view.layer.masksToBounds = true;
        }
        view.layer.addSublayer(shapeLayer);
    }
    
    // MARK: -lazy
    lazy var labelTop: UILabel = {
        var view = UILabel(frame: .zero);
        view.text = "top";
        view.textColor = UIColor.black;
        view.font = UIFont.systemFont(ofSize: 15)
        
        return view;
    }();
    
    lazy var labelMid: UILabel = {
        var view = UILabel(frame: .zero);
        view.text = "midem";
        view.textColor = UIColor.hexValue(0x666666)
        view.font = UIFont.systemFont(ofSize: 11)
        
        return view;
    }();
    
    lazy var labelBom: UILabel = {
        var view = UILabel(frame: .zero);
        view.text = "bottom";
        view.textColor = UIColor.hexValue(0x666666)
        view.font = UIFont.systemFont(ofSize: 11)
        
        return view;
    }();
    
    
    private lazy var couponTypeDic: [Int : [String : Any]] = {
        let dic = [0: ["title": "时长券", "color": UIColor.hexValue(0xF78F57),],
                   1: ["title": "金额券", "color": UIColor.theme,],
                   2: ["title": "次数券", "color": UIColor.hexValue(0x39C179),],
                   3: ["title": "时段券", "color": UIColor.hexValue(0xFF6A62),],
                   4: ["title": "折扣券", "color": UIColor.hexValue(0x04BCC9),],
        ]
        return dic;
    }()
}

