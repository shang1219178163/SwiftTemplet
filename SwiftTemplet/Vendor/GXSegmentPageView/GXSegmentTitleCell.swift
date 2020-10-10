//
//  GXSegmentTitleCell.swift
//  GXSegmentPageViewSample
//
//  Created by Gin on 2020/8/21.
//  Copyright © 2020 gin. All rights reserved.
//

import UIKit

public class GXSegmentTitleCell: UICollectionViewCell {
    private var config: GXSegmentTitleView.Configuration!
    
    public var isChecked: Bool = false {
        didSet {
            self.updateCell(isChecked: self.isChecked)
        }
    }
    
    private(set) lazy var titleLabel: UILabel = {
        let label = UILabel(frame: self.contentView.bounds)
        label.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        label.textAlignment = .center
        return label
    }()
    
    private lazy var rightLine: UIView = {
        let line = UIView()
        line.autoresizingMask = [.flexibleLeftMargin, .flexibleHeight]
        return line
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.createSubviews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

public extension GXSegmentTitleCell {
    func setCell(config: GXSegmentTitleView.Configuration, title: String, isMaxItem: Bool) {
        self.config = config
        self.titleLabel.text = title
        self.titleLabel.font = self.config?.titleNormalFont
        self.titleLabel.textColor = self.config.titleNormalColor
        
        self.rightLine.isHidden = isMaxItem
        if self.config.isShowSeparator && !isMaxItem {
            self.rightLine.backgroundColor = self.config.separatorColor
            let left = self.bounds.width - self.config.separatorWidth
            let top = self.config.separatorInset.top
            let height = self.bounds.height - top - self.config.separatorInset.bottom
            self.rightLine.frame = CGRect(x: left, y: top, width: self.config.separatorWidth, height: height)
        }
    }
    func updateCellTitle(progress: CGFloat, isWillSelected: Bool) {
        if self.config.isTitleZoom {
            let scale = self.config.changeFontScale(progress: progress, isWillSelected: isWillSelected)
            self.titleLabel.transform = CGAffineTransform(scaleX: scale, y: scale)
        }
        if self.config.isTitleColorGradient {
            self.titleLabel.textColor = self.config.changeColor(progress: progress, isWillSelected: isWillSelected)
        }
    }
    func updateCellTitle(isChecked: Bool, animated: Bool) {
        let color = isChecked ? self.config.titleSelectedColor:self.config.titleNormalColor
        let scale = self.config.titleSelectedFontScale
        let transform = isChecked ? CGAffineTransform(scaleX: scale, y: scale):.identity
        
        self.titleLabel.textColor = color
        if self.config.isTitleZoom {
            if animated {
                UIView.animate(withDuration: self.config.indicatorDuration) {
                    self.titleLabel.transform = transform
                }
            } else {
                self.titleLabel.transform = transform
            }
        } else {
            self.titleLabel.font = self.config.titleSelectedFont
        }
    }
}

fileprivate extension GXSegmentTitleCell {
    func createSubviews() {
        self.contentView.addSubview(self.titleLabel)
        self.contentView.addSubview(self.rightLine)
    }
    func updateCell(isChecked: Bool) {
        if isChecked {
            if self.config.isTitleZoom {
                let scale = self.config.titleSelectedFontScale
                self.titleLabel.transform = CGAffineTransform(scaleX: scale, y: scale)
            }
            else {
                self.titleLabel.font = self.config?.titleSelectedFont
            }
            self.titleLabel.textColor = self.config.titleSelectedColor
        }
        else {
            self.titleLabel.transform = .identity
            self.titleLabel.font = self.config?.titleNormalFont
            self.titleLabel.textColor = self.config.titleNormalColor
        }
    }
}
