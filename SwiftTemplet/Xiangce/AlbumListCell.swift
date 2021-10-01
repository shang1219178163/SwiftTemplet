//
//  AlbumListCell.swift
//  WImagePicker
//
//  Created by 王云 on 2017/11/14.
//  Copyright © 2017年 王云. All rights reserved.
//

import UIKit
import SnapKit
import Photos

let iconWidth: CGFloat = 60 * k_FitHeight
class AlbumListCell: UITableViewCell {
    
    fileprivate var iconView: UIImageView!
    private(set) var titleLabel: UILabel!
    fileprivate var numberLabel: UILabel!
    fileprivate var imageManager = PHCachingImageManager()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        accessoryType = .disclosureIndicator
        setupUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupUI() {
        iconView = UIImageView()
        iconView.contentMode = .scaleAspectFill
        iconView.clipsToBounds = true
        contentView.addSubview(iconView)
        
        titleLabel = UILabel()
        titleLabel.textColor = UIColor.black
        titleLabel.font = UIFont.boldSystemFont(ofSize: 17)
        titleLabel.textAlignment = NSTextAlignment.left
        titleLabel.numberOfLines = 1
        contentView.addSubview(titleLabel)
        
        numberLabel = UILabel()
        numberLabel.textColor = UIColor.lightGray
        numberLabel.font = UIFont.systemFont(ofSize: 15)
        numberLabel.textAlignment = NSTextAlignment.left
        numberLabel.numberOfLines = 1
        contentView.addSubview(numberLabel)
        
        iconView.snp.makeConstraints { (make) in
            make.left.top.equalToSuperview()
            make.width.equalTo(iconWidth)
            make.height.equalTo(iconWidth)
        }
        titleLabel.snp.makeConstraints { (make) in
            make.left.equalTo(iconView.snp.right).offset(10 * k_FitWidth)
            make.centerY.equalToSuperview()
        }
        numberLabel.snp.makeConstraints { (make) in
            make.left.equalTo(titleLabel.snp.right).offset(10 * k_FitWidth)
            make.centerY.equalTo(titleLabel)
        }
    }
    
    func displayData(_ item: AlbumItem) {
        titleLabel.text = item.title
        numberLabel.text = "（\(item.fetchResult.count)）"

        self.iconView.image = nil
        if let asset = item.fetchResult.firstObject {
            imageManager.requestImage(for: asset, targetSize: CGSize(width: iconWidth, height: iconWidth), contentMode: .aspectFill, options: nil, resultHandler: { [weak self](image, _) in
                self?.iconView.image = image
            })
        }
    }
}
