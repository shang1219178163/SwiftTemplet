//
//  UITableViewCellParkType.swift
//  SwiftTemplet
//
//  Created by Bin Shang on 2020/9/8.
//  Copyright © 2020 BN. All rights reserved.
//

import UIKit
import SwiftExpand


class UITableViewCellParkType: UITableViewCell {

    var inset = UIEdgeInsets(top: 5, left: 10, bottom: 5, right: 10)
    var spacing: CGFloat = 15
    
    var parkType = "未知"{
        willSet{
            label.text = newValue
        }
    }
    
    var parkTags = [String](){
        willSet{
            items = self.contentView.updateLabelItems(newValue.count, type: UILabel.self) { (sender) in
                sender.text = newValue[sender.tag]
                sender.textColor = .textColor6
                sender.textAlignment = .center
                sender.font = UIFont.systemFont(ofSize: 12)
                sender.adjustsFontSizeToFitWidth = true
                
                sender.layer.borderWidth = 0.5
                sender.layer.borderColor = UIColor.textColor6.cgColor
            }
        }
    }
    
    private var items: [UILabel] = []
    
    // MARK: -lazy
    lazy var label: UILabel = {
        let view = UILabel(frame: .zero);
        view.text = "未知";
        view.textColor = UIColor.textColor3
        view.textAlignment = .left
        view.font = UIFont.systemFont(ofSize: 11)
        view.numberOfLines = 1;

        return view
    }()
        
    
    private lazy var lineView: UIImageView = {
        let view = UIImageView(frame: .zero);
        view.backgroundColor = .line
        return view
    }()
    
    // MARK: -life cycle
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier);
  
        contentView.addSubview(label)
        contentView.addSubview(lineView)
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
        if bounds.height <= 10 {
            return;
        }
        let height = bounds.height - inset.top - inset.bottom
        let tailSpacing: CGFloat = accessoryType == .none ? inset.right : 0.0
        
        
        contentView.addSubview(label)

        let labelSize = label.sizeThatFits(.zero)
        label.snp.remakeConstraints { (make) in
            make.centerY.equalToSuperview().offset(inset.top - inset.bottom);
            make.left.equalToSuperview().offset(inset.left);
            make.size.equalTo(labelSize);
        }
        
        lineView.isHidden = items.count <= 0
        
        lineView.snp.remakeConstraints { (make) in
            make.centerY.equalToSuperview()
            make.left.equalTo(label.snp.right).offset(8);
            make.width.equalTo(1);
            make.height.equalTo(label);
        }
        
        let padding: CGFloat = 8
        let itemsStartX: CGFloat = inset.left + labelSize.width + padding*2
        
        
        let itemWidth: CGFloat = 40
        let itemHeight = bounds.height - inset.top - inset.bottom
        for e in items.enumerated() {
            let x = CGFloat(e.offset % 5) * (itemWidth + padding)
            let y = CGFloat(e.offset / 5) * (itemHeight + padding)
            let rect = CGRect(x: itemsStartX + x, y: y + inset.top, width: itemWidth, height: itemHeight)
            e.element.frame = rect
        }
        
//        items.snp.distributeViewsAlong(axisType: .horizontal, fixedItemLength: 40, leadSpacing: itemsStartX, tailSpacing: inset.right)
////        items.snp.distributeViewsAlong(axisType: .horizontal, fixedSpacing: 8, leadSpacing: itemsStartX, tailSpacing: inset.right)
//        items.snp.makeConstraints { (make) in
//            make.top.equalToSuperview().offset(inset.top)
//            make.bottom.equalToSuperview().offset(-inset.bottom)
//        }
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    // MARK: -funtions
    

    
    
}

