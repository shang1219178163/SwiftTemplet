//
//  NNBoxButton.swift
//  SwiftTemplet
//
//  Created by Bin Shang on 2019/7/13.
//  Copyright © 2019 BN. All rights reserved.
//

import UIKit

/// 单选框
class NNBoxButton: UIButton {

    var normlImage: UIImage = UIImage(named: "photo_cancell")!
    var seletedImage: UIImage = UIImage(named: "photo_select")!

    var normlTextColor: UIColor = UIColor.black.withAlphaComponent(0.3)
    var seletedTextColor: UIColor = UIColor.theme
    
    var isImageRight: Bool = false
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setImage(normlImage, for: .normal)
        setImage(seletedImage, for: .selected)
        
        setTitleColor(normlTextColor, for: .normal)
        setTitleColor(seletedTextColor, for: .selected)

        imageView?.contentMode = .scaleAspectFit;
        adjustsImageWhenHighlighted = false
        titleLabel?.adjustsFontSizeToFitWidth = true
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
//        sizeToFit()
//        let type = isImageRight ? 3 : 1
//        layoutButton(style: type, imageTitleSpace: 2)
    }
    
    //MARK: -funtions
    
}
