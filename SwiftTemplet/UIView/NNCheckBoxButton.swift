//
//  NNCheckBoxButton.swift
//  SwiftTemplet
//
//  Created by Bin Shang on 2019/7/13.
//  Copyright © 2019 BN. All rights reserved.
//

import UIKit

class NNCheckBoxButton: UIButton {

    var normlImage: UIImage = UIImage(named: "photo_cancell")!
    var seletedImage: UIImage = UIImage(named: "photo_select")!

    var normlTextColor: UIColor = UIColor.black.withAlphaComponent(0.5)
    var seletedTextColor: UIColor = UIColor.theme
    
    deinit {
        removeObserver(self, forKeyPath: "selected")
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setImage(normlImage, for: .normal)
        setTitleColor(normlTextColor, for: .normal)

        adjustsImageWhenHighlighted = false
        addObserver(self, forKeyPath: "selected", options: .new, context: nil)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        layoutButton(style: 1, imageTitleSpace: 2)
        
    }
    
    //MARK: -funtions
    override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
        //        DDLog("change_\(change)");
        if keyPath == "selected" {
            if let value = change![NSKeyValueChangeKey.newKey] as? NSNumber {
                let image: UIImage = value.boolValue == true ? seletedImage : normlImage;
                self.setImage(image, for: .normal)
                
                let textColor = value.boolValue == true ? seletedTextColor : normlTextColor;
                self.setTitleColor(textColor, for: .normal)
            }
        }
    }
    
//    override func setTitle(_ title: String?, for state: UIControl.State) {
//        super.setTitle(title, for: state)
//        setTitleColor(normlTextColor, for: .normal)
//
//    }
    
    //    func checkbox(_ title: String?) -> UIButton {
    //
    //
    //    }
    
}
