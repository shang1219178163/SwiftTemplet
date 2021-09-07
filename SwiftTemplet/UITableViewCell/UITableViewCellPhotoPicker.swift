//
//  UITableViewCellPhotoPicker.swift
//  SwiftTemplet
//
//  Created by Bin Shang on 2019/3/3.
//  Copyright © 2019 BN. All rights reserved.
//

import UIKit
import SwiftExpand

// 图片封装视图
@objcMembers class UITableViewCellPhotoPicker: UITableViewCell {
    
    lazy var pickView: NNUploadImagesView = {
        let view = NNUploadImagesView()
        view.currrentVC = currrentVC
        view.images = [view.imageDefault]
        view.rowHeight = view.frame.height
        view.delegate = self

        return view
    }()
    
    var currrentVC: UIViewController?
    
    var block: (([UIImage]) -> Void)?

    // MARK: -lifecycle
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier);
        
        contentView.addSubview(pickView);
        pickView.snp.makeConstraints { (make) in
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
    
    // MARK: - funtions

}

extension UITableViewCellPhotoPicker: NNUploadImagesViewDelegate {
    func didFinishPicker(_ images: [UIImage], isSelectOriginalPhoto: Bool) {
        DDLog(images.count)
        block?(images)
    }
}
