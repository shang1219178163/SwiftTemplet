//
//  NNBoxButton.swift
//  SwiftTemplet
//
//  Created by Bin Shang on 2019/7/13.
//  Copyright © 2019 BN. All rights reserved.
//

import UIKit

/// 单选框(弃用,NNButton代替)
class NNBoxButton: UIButton {

    var normlImage: UIImage = UIImage(named: "icon_selected_no_default")!
    var seletedImage: UIImage = UIImage(named: "icon_selected_yes_green")!

    var normlTextColor: UIColor = UIColor.black.withAlphaComponent(0.3)
    var seletedTextColor: UIColor = UIColor.systemBlue
    
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
        
        sizeToFit()
        let direction = isImageRight ? 3 : 1
        layoutButton(direction: direction, imageTitleSpace: 2)
    }
    
    //MARK: -funtions
    
}
