//
//  PHHQrcodeOverageNewCell.swift
//  ParkingWangCoupon
//
//  Created by Bin Shang on 2021/2/26.
//  Copyright © 2021 Xi'an iRain IOT Technology Service CO., Ltd. . All rights reserved.
//

import UIKit
import SwiftExpand


@objc enum PHHQRcodeCouponType: Int {
    case normal, dynamic
}

@objcMembers public class PHHQrcodeOverageNewCell: UITableViewCell {
    
    private lazy var imgView: UIImageView = {
        let view = UIImageView()
        view.image = UIImage(named: "icon_qrcode_placeholder")
        return view
    }()
    
    lazy var labTitle: UILabel = {
        let view = UILabel()
        view.font = UIFont.systemFont(ofSize: 13)
        view.textColor = .textColor3
        view.text = "--"
        return view
    }()
    
    lazy var labSubTitle: UILabel = {
        let view = UILabel()
        view.font = UIFont.systemFont(ofSize: 11)
        view.textColor = .textColor9
        view.text = "--"
        return view
    }()
    
    lazy var btnOther: UIButton = {
        let btn = UIButton(type: .custom)
        btn.titleLabel?.font = UIFont.systemFont(ofSize: 11)
        btn.setTitle("剩余回收", for: .normal)
        btn.setTitleColor(.theme, for: .normal)
        return btn
    }()
    
    lazy var btnQRcode: UIButton = {
        let btn = UIButton(type: .custom)
        btn.titleLabel?.font = UIFont.systemFont(ofSize: 11)
        btn.setTitle("查看二维码", for: .normal)
        btn.setTitleColor(.theme, for: .normal)
        return btn
    }()
    
    
//    var model = PHHQrcodeOverageModel()
    var qrCodeType: PHHQRcodeCouponType = .normal{
        willSet{
            let name = newValue == .normal ? "icon_qrcode_placeholder" : "icon_qrcode_dynamic_placeholder"
            imgView.image = UIImage(named: name)
        }
    }
    

    // MARK: -lifcycle
    public override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        contentView.addSubview(imgView)
        contentView.addSubview(labTitle)
        contentView.addSubview(labSubTitle)
        contentView.addSubview(btnOther)
        contentView.addSubview(btnQRcode)
        
        btnQRcode.setBorderColor(.theme, for: .normal)
        btnOther.setBorderColor(.theme, for: .normal)
        
        btnQRcode.layer.cornerRadius = 10;
        btnQRcode.layer.borderColor = UIColor.theme.cgColor;

        btnOther.layer.cornerRadius = 10;
        btnOther.layer.borderColor = UIColor.theme.cgColor;
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public override func layoutSubviews() {
        super.layoutSubviews()
        
        imgView.snp.makeConstraints { (make) in
            make.top.equalToSuperview().offset(15);
            make.left.equalToSuperview().offset(18);
            make.bottom.equalToSuperview().offset(-15);
            make.width.equalTo(40);
        }
                
        labTitle.snp.makeConstraints { (make) in
            make.centerY.equalToSuperview().offset(-20);
            make.left.equalTo(imgView.snp.right).offset(25);
            make.right.equalToSuperview().offset(-10);
            make.height.equalTo(20);
        }
        
        btnQRcode.snp.makeConstraints { (make) in
            make.centerY.equalToSuperview().offset(15);
            make.right.equalToSuperview().offset(-10);
            make.width.equalTo(72);
            make.height.equalTo(20);
        }
        
        btnOther.snp.makeConstraints { (make) in
            make.centerY.equalTo(btnQRcode).offset(0);
            make.right.equalTo(btnQRcode.snp.left).offset(-10);
            make.width.equalTo(72);
            make.height.equalTo(20);
        }
        
        labSubTitle.snp.makeConstraints { (make) in
            make.centerY.equalTo(btnQRcode).offset(0);
            make.left.equalTo(labTitle).offset(0);
            make.right.equalTo(btnOther.snp.left).offset(-10);
            make.height.equalTo(20);
        }
        
        addLineDashLayer(color: .theme, start: CGPoint(x: 70, y: 0), end: CGPoint(x: 70, y: 75))
    }
}
