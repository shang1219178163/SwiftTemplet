//
//  UITableViewCellDefault.swift
//  SwiftTemplet
//
//  Created by Bin Shang on 2019/1/17.
//  Copyright © 2019 BN. All rights reserved.
//

import UIKit

class UITableViewCellDefault: UITableViewCell {

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier);
        
        contentView.addSubview(defaultView);
        defaultView.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder);
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews();

    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    lazy var defaultView: NNCellDefaultView = {
        var view = NNCellDefaultView(frame: .zero)
        view.autoresizingMask = [.flexibleWidth, .flexibleHeight]

        return view
    }()

}
