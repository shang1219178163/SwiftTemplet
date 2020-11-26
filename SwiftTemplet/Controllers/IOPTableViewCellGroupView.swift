//
//  IOPTableViewCellGroupView.swift
//  SwiftTemplet
//
//  Created by Bin Shang on 2019/11/15.
//  Copyright © 2019 BN. All rights reserved.
//

import UIKit
import SnapKit
import SwiftExpand

class IOPTableViewCellGroupView: UITableViewCell {
     
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
         super.init(style: style, reuseIdentifier: reuseIdentifier);
         contentView.addSubview(parkGroupView);

    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder);
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        parkGroupView.snp.makeConstraints { (make) in
            make.top.equalToSuperview().offset(10);
            make.left.equalToSuperview().offset(kX_GAP);
            make.right.equalToSuperview().offset(-kX_GAP);
            make.bottom.equalToSuperview().offset(-10);
        }
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    
    lazy var parkGroupView: IOPParkGroupView = {
        let view = IOPParkGroupView(frame: .zero)
        view.padding = 15;
        view.numberOfRow = 3;
        view.isMutiChoose = false;
        view.block({ (itemsView, sender) in
            if let btn = sender as? UIButton {
                print(btn.titleLabel?.text as Any, itemsView.selectedList.count, itemsView.selectedIdxList.count)

            }
        })
        return view;
    }()

}
