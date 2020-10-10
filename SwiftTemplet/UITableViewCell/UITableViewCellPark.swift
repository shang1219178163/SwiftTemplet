//
//  UITableViewCellPark.swift
//  CloudCustomerService
//
//  Created by Bin Shang on 2019/10/8.
//  Copyright © 2019 Xi'an iRain IoT. Technology Service CO., Ltd. . All rights reserved.
//

import UIKit

import SnapKit
import SwiftExpand

class UITableViewCellPark: UITableViewCell {
    

    var parkStatus: Int = 0{
        willSet{
            switch newValue {
            case 1:
                btnLeft.setImage(UIImage(named: "icon_time_out"), for: .normal)
                
            default:
                btnLeft.setImage(UIImage(named: "icon_time_in"), for: .normal)
                labelRightSub.text = "未出场"
            }
        }
    }
    
    // MARK: -life cycle

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier);
        
        contentView.addSubview(labelLeft);
        contentView.addSubview(btnLeft);
        contentView.addSubview(btnLeftMark);
        contentView.addSubview(labelRight);
        contentView.addSubview(labelRightSub);
        
        
        labelLeft.font = UIFont.systemFont(ofSize: 15)
        labelRight.textColor = UIColor.textColor6;
        labelRightSub.textColor = UIColor.theme;
        labelRightSub.textAlignment = .right;
        labelRightSub.font = UIFont.systemFont(ofSize: 14)

        btnLeft.titleLabel?.font = UIFont.systemFont(ofSize: 13)
        btnLeft.setTitleColor(UIColor.textColor6, for: .normal)
        btnLeft.setImage(UIImage(named: "icon_time_in"), for: .normal)
        
        btnLeftMark.titleLabel?.font = UIFont.systemFont(ofSize: 13)
        btnLeftMark.setTitleColor(UIColor.textColor6, for: .normal)
        btnLeftMark.setImage(UIImage(named: "icon_time_duration"), for: .normal)
        
        labelLeft.text = "车牌号"
        labelRight.text = "临时车"
        labelRightSub.text = "未出场"
        btnLeft.setTitle("  20:00:00", for: .normal)
        btnLeftMark.setTitle("  2小时20分", for: .normal)
    }
    
//    override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
//        if keyPath == "text" {
//            let value: String = change![NSKeyValueChangeKey.newKey] as! String;
//            if value.contains(" ") == true {
//                let list = value.components(separatedBy: " ");
//                self.labelTop.attributedText = NSAttributedString.attString(self.labelTop.text, textTaps: [list.last!], font: 22, tapFont: 11, color: UIColor.white, tapColor: UIColor.hexValue(0xCADFFF), alignment: .center)
//            }
//        } else if keyPath == "backgroundColor" {
//            let value: UIColor = change![NSKeyValueChangeKey.newKey] as! UIColor;
//            addLineDashLayer(color: value, width: 2, cornerRadius: 0, view: labelLeft, size: CGSize(width: 80, height: 80))
//
//        }
//        else {
//            super.observeValue(forKeyPath: keyPath, of: object, change: change, context: context)
//        }
//    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder);
        fatalError("init(coder:) has not been implemented")
    }
    
//    deinit {
//        labelLeft.removeObserver(self, forKeyPath: "text")
//        labelLeft.removeObserver(self, forKeyPath: "backgroundColor")
//    }
    
    override func layoutSubviews() {
        super.layoutSubviews();
        
        setupConstraint()
    }
    
    func setupConstraint() {
        if bounds.height <= 10.0 {
            return;
        }
        
        labelRight.sizeToFit();
        labelRight.snp.makeConstraints { (make) in
            make.top.equalToSuperview().offset(10);
            make.right.equalToSuperview().offset(-10);
            make.width.equalTo(labelRight.frame.width);
            make.height.equalTo(25);
        }
        
        labelRightSub.sizeToFit();
        labelRightSub.snp.makeConstraints { (make) in
            make.top.equalTo(labelRight.snp.bottom).offset(0);
            make.right.equalTo(labelRight);
            make.width.equalTo(100);
            make.height.equalTo(labelRight);
        }
        
        labelLeft.sizeToFit();
        labelLeft.snp.makeConstraints { (make) in
            make.centerY.equalTo(labelRight);
            make.left.equalToSuperview().offset(10);
            make.width.equalTo(labelLeft.frame.width);
            make.height.equalTo(25);
        }
        
        btnLeft.snp.makeConstraints { (make) in
            make.centerY.equalTo(labelRightSub);
            make.left.equalTo(labelLeft);
        }
        
        btnLeftMark.snp.makeConstraints { (make) in
            make.centerY.equalTo(labelRightSub);
            make.left.equalTo(btnLeft.snp.right).offset(30);
        }
        

    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }

    
    // MARK: -lazy

    lazy var btnLeft: UIButton = {
        let view = UIButton(type: .custom);
        view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        view.titleLabel?.font = UIFont.systemFont(ofSize: 13);
        view.titleLabel?.adjustsFontSizeToFitWidth = true;
        view.titleLabel?.minimumScaleFactor = 1.0;
        view.isExclusiveTouch = true;
        return view
    }()
    
    lazy var btnLeftMark: UIButton = {
        let view = UIButton(type: .custom);
        view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        view.titleLabel?.font = UIFont.systemFont(ofSize: 13);
        view.titleLabel?.adjustsFontSizeToFitWidth = true;
        view.titleLabel?.minimumScaleFactor = 1.0;
        view.isExclusiveTouch = true;
        return view
    }()
 
}

