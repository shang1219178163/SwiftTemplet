//
//  NNTableViewCellPhotoShow.swift
//  SwiftTemplet
//
//  Created by Bin Shang on 2020/7/27.
//  Copyright © 2020 BN. All rights reserved.
//

import UIKit
import SwiftExpand

///
class NNTableViewCellPhotoShow: UITableViewCell {
    var inset = UIEdgeInsets(top: 5, left: 10, bottom: 5, right: 10)

    lazy var lineView: UIImageView = {
        var view = UIImageView(frame: .zero);
        view.backgroundColor = .line
        return view
    }()
    
    
    // MARK: -life cycle

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier);
        
        contentView.addSubview(labelLeft);
        contentView.addSubview(lineView);
        contentView.addSubview(btn);
        
        btn.setBackgroundImage(UIImage(color: .theme), for: .normal)
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
        let endX = accessoryType == .none ? inset.right : 0

        labelLeft.snp.makeConstraints { (make) in
            make.top.equalToSuperview().offset(inset.top)
            make.left.equalToSuperview().offset(inset.left)
            make.right.equalToSuperview().offset(-endX)
            make.height.equalTo(30)
        }
                
        lineView.snp.makeConstraints { (make) in
            make.top.equalTo(labelLeft.snp.bottom).offset(3);
            make.left.equalTo(labelLeft)
            make.right.equalTo(labelLeft)
            make.height.equalTo(1);
        }
        
        btn.snp.makeConstraints { (make) in
            make.top.equalTo(lineView.snp.bottom).offset(3);
            make.left.equalTo(labelLeft)
            make.right.equalTo(labelLeft)
            make.bottom.equalToSuperview().offset(-inset.bottom);
        }
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
    }


}



