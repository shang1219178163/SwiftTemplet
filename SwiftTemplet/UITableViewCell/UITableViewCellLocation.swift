//
//  UITableViewCellLocation.swift
//  SwiftTemplet
//
//  Created by Bin Shang on 2020/9/2.
//  Copyright © 2020 BN. All rights reserved.
//

import UIKit
import SwiftExpand


class UITableViewCellLocation: UITableViewCell {

    var inset = UIEdgeInsets(top: 10, left: 15, bottom: 10, right: 15)
    var imagSize = CGSize(width: 11, height: 15)
    
    var limitPlates = [String](){
        willSet{
            limitPlateLabels = contentView.updateItems(newValue.count, type: UIButton.self, hanler: { (sender) in
                sender.backgroundColor = UIColor.hexValue(0xC9EBFF)
                sender.layer.cornerRadius = 4

//                sender.textColor = .textColor3
//                sender.font = UIFont.systemFont(ofSize: 11, weight: .medium)
//                sender.text = newValue[sender.tag]
                
                sender.titleLabel?.font = UIFont.systemFont(ofSize: 11, weight: .medium)
                sender.setTitle(newValue[sender.tag], for: .normal)
                sender.setTitleColor(.textColor3, for: .normal)
            })
        }
    }
    
    private var limitPlateLabels = [UIButton]()
    
    lazy var imgView: UIImageView = {
        var view = UIImageView(frame: .zero);
        view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        view.image = UIImage(named: "icon_park_location")

        return view;
    }()
    
    lazy var label: UILabel = {
        let view = UILabel(frame: .zero);
        view.font = UIFont.systemFont(ofSize: 13)
        view.text = "地址信息";
        view.textColor = .lightGray;
        view.textAlignment = .left;
        view.tag = 50
        return view;
    }()
    
    
    lazy var weatherImgView: UIImageView = {
        var view = UIImageView(frame: .zero);
        view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
//        view.image = UIImage(named: "icon_park_location")
        view.contentMode = .scaleAspectFit
        return view;
    }()
    
    lazy var weatherLabel: UILabel = {
        let view = UILabel(frame: .zero);
        view.font = UIFont.systemFont(ofSize: 12, weight: .medium)
        view.text = "";
        view.textColor = .textColor3;
        view.textAlignment = .center;
        return view;
    }()
    
    private lazy var plateLabel: UILabel = {
        let view = UILabel(frame: .zero);
        view.font = UIFont.systemFont(ofSize: 12, weight: .regular)
        view.text = "限行";
        view.textColor = .textColor3;
        view.textAlignment = .center;
        return view;
    }()
    
    private lazy var lineView: UIView = {
        let view = UIView()
        view.backgroundColor = .line
        view.backgroundColor = .red

        return view
    }()
    
    // MARK: -life cycle

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier);
                
        contentView.addSubview(imgView)
        contentView.addSubview(label)
        contentView.addSubview(weatherLabel)
        contentView.addSubview(weatherImgView)
        
        contentView.addSubview(lineView)
        contentView.addSubview(plateLabel)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder);
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        if bounds.height <= 10 {
            return;
        }
        
        let labelStartX: CGFloat = imgView.isHidden == false ? inset.left + imagSize.width + 8 : inset.left
//        let labelEndX: CGFloat = limitPlates.count == 0 ? inset.right : inset.right + 26 + limitPlates.count.toCGFloat*(10+4) - 4 + 8*2
//        let labelHeight: CGFloat = (self.bounds.height - inset.top - inset.bottom - 5)*0.5
        
        imgView.snp.makeConstraints { (make) in
            make.centerY.equalToSuperview()
            make.left.equalToSuperview().offset(inset.left);
            make.size.equalTo(imagSize);
        }
        
        plateLabel.isHidden = limitPlates.count == 0
        lineView.isHidden = limitPlates.count == 0
        limitPlateLabels.forEach { (sender) in
            sender.isHidden = limitPlates.count == 0
        }
        
        if limitPlates.count == 0 {
            let weatherLabelSize = weatherLabel.sizeThatFits(.zero)
            weatherLabel.snp.remakeConstraints { (make) in
                make.centerY.equalToSuperview()
                make.right.equalToSuperview().offset(-inset.right);
                make.size.equalTo(weatherLabelSize);
            }
            
            weatherImgView.snp.makeConstraints { (make) in
                make.centerY.equalToSuperview()
                make.right.equalTo(weatherLabel.snp.left).offset(-5);
                make.width.equalTo(20);
                make.height.equalTo(20);
            }
            
            label.snp.remakeConstraints { (make) in
                make.top.equalToSuperview().offset(inset.top);
                make.left.equalToSuperview().offset(labelStartX);
                make.right.equalTo(weatherImgView.snp.left).offset(-5);
                make.bottom.equalToSuperview().offset(-inset.bottom);
            }
            return
        }

        plateLabel.snp.makeConstraints { (make) in
            make.centerY.equalToSuperview()
            make.right.equalToSuperview().offset(-inset.right);
            make.width.equalTo(26);
            make.height.equalTo(13);
        }
        
        let plateTailSpacing: CGFloat = 26 + 8 + inset.right

        var prev: UIView?
        for (_, v) in limitPlateLabels.enumerated().reversed() {
            v.snp.remakeConstraints { (make) in
                make.centerY.equalToSuperview()
                make.width.equalTo(10);
                make.height.equalTo(13);

                if prev == nil {
                    make.right.equalToSuperview().offset(-plateTailSpacing)
                } else {
                    make.right.equalTo(prev!.snp.left).offset(-4)
                }
            }
            prev = v
        }
        
        lineView.snp.remakeConstraints { (make) in
            make.centerY.equalToSuperview()
            make.right.equalTo(prev!.snp.left).offset(-8);
            make.width.equalTo(1);
            make.height.equalTo(14);
        }

        let weatherLabelSize = weatherLabel.sizeThatFits(.zero)
        weatherLabel.snp.remakeConstraints { (make) in
            make.centerY.equalToSuperview()
            make.right.equalTo(lineView.snp.left).offset(-8);
            make.size.equalTo(weatherLabelSize);
        }
        
        weatherImgView.snp.remakeConstraints { (make) in
            make.centerY.equalToSuperview()
            make.right.equalTo(weatherLabel.snp.left).offset(-5);
            make.width.equalTo(20);
            make.height.equalTo(20);
        }
        
        label.snp.remakeConstraints { (make) in
            make.top.equalToSuperview().offset(inset.top);
            make.left.equalToSuperview().offset(labelStartX);
            make.right.equalTo(weatherImgView.snp.left).offset(-5);
            make.bottom.equalToSuperview().offset(-inset.bottom);
        }
    }
        
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    // MARK: -funtions

}
