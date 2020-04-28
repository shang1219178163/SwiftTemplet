//
//  UITableViewCellPayBill.swift
//  SwiftTemplet
//
//  Created by Bin Shang on 2020/1/17.
//  Copyright © 2020 BN. All rights reserved.
//

import UIKit

class UITableViewCellPayBill: UITableViewCell {
    
    //订单状态(0:待支付,1:已支付,2:已取消)
    var pay_status: String = "0"{
        willSet{
            switch newValue {
            case "1":
                btnDelete.isHidden = true
                btnPay.isHidden = true
                btnCancell.isHidden = true

            case "2":
                btnDelete.isHidden = false
                btnPay.isHidden = true
                btnCancell.isHidden = true

            default:
                btnDelete.isHidden = true
                btnPay.isHidden = false
                btnCancell.isHidden = false
            }
        }
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier);
        
        contentView.addSubview(labelLeft);
        contentView.addSubview(btnDelete);
        contentView.addSubview(btnPay);
        contentView.addSubview(btnCancell);
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
        if bounds.height <= 0.0 {
            return
        }
        let btns: [UIButton] = [btnCancell, btnDelete, btnPay].filter { $0.isHidden == false }

        var btn: UIView?
        for (idx, item) in btns.reversed().enumerated() {
            if idx == 0 {
                item.snp.makeConstraints { (make) in
                    make.top.equalToSuperview().offset(8);
                    make.right.equalToSuperview().offset(-10);
                    make.width.equalTo(65);
                    make.bottom.equalToSuperview().offset(-8);
                }
            } else {
                item.snp.makeConstraints { (make) in
                    make.top.equalToSuperview().offset(8);
                    make.right.equalTo(btn!.snp.left).offset(-10);
                    make.width.equalTo(65);
                    make.bottom.equalToSuperview().offset(-8);
                }
            }
            btn = item;
        }
                
        labelLeft.snp.makeConstraints { (make) in
            make.centerY.equalToSuperview().offset(0);
            make.left.equalToSuperview().offset(10);
            make.right.equalTo(btn!.snp.left).offset(-10);
            make.height.equalTo(25);
        }
    }
//    func setupConstraint() {
//        if bounds.height <= 0.0 {
//            return
//        }
//        let btns = [btnCancell, btnDelete, btnPay].map { $0.isHidden = false }
//
//        btnDelete.snp.makeConstraints { (make) in
//            make.centerY.equalToSuperview().offset(0);
//            make.right.equalToSuperview().offset(-10);
//            make.width.equalTo(65);
//            make.height.equalTo(25);
//        }
//
//        btnPay.snp.makeConstraints { (make) in
//            make.edges.equalTo(btnDelete);
//        }
//
//        btnCancell.snp.makeConstraints { (make) in
//            make.centerY.equalToSuperview().offset(0);
//            make.right.equalTo(btnDelete.snp.left).offset(-10);
//            make.width.height.equalTo(btnDelete);
//        }
//
//        labelLeft.snp.makeConstraints { (make) in
//            make.centerY.equalToSuperview().offset(0);
//            make.left.equalToSuperview().offset(10);
//            make.right.equalTo(btnCancell.snp.left).offset(-10);
//            make.height.equalTo(25);
//        }
//    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
    }
    
    lazy var btnDelete: UIButton = {
        let view = UIButton.create(.zero, title: "删除订单", imgName: nil, type: 1)
        view.setBackgroundImage(UIImage(color: .systemRed), for: .normal)
        view.titleLabel?.font = UIFont.systemFont(ofSize: 12)
        return view
    }()

    lazy var btnPay: UIButton = {
        let view = UIButton.create(.zero, title: "支付", imgName: nil, type: 1)
        view.setBackgroundImage(UIImage(color: .systemBlue), for: .normal)
        view.titleLabel?.font = UIFont.systemFont(ofSize: 12)
        return view
    }()

    lazy var btnCancell: UIButton = {
        let view = UIButton.create(.zero, title: "取消订单", imgName: nil, type: 5)
        view.setBackgroundImage(UIImage(color: .systemBlue), for: .normal)
        view.titleLabel?.font = UIFont.systemFont(ofSize: 12)
        return view
    }()
}



