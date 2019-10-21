

//
//  NNRadioButton.swift
//  SwiftTemplet
//
//  Created by Bin Shang on 2019/9/4.
//  Copyright © 2019 BN. All rights reserved.
//

import UIKit

class NNRadioButton: UIButton {

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setImage(UIImage(named: "icon_select_NO"), for: .normal)
        setImage(UIImage(named: "icon_select_YES"), for: .selected)
        setTitle("未选择", for: .normal)
        setTitle("已选择", for: .selected)
        setTitleColor(UIColor.gray, for: .normal)
        
        imageView?.tintColor = UIColor.theme;
        setTitleColor(imageView?.tintColor, for: .selected)
        
        imageView?.contentMode = .scaleAspectFit;
        addTarget(self, action: #selector(handleActionSender(_:)), for: .touchUpInside)

    }
    
    convenience init(title: String, titleSelected: String, image: UIImage?, imageSelected: UIImage?) {
        self.init()
        if image != nil {
            setImage(image, for: .normal)
        }
        
        if imageSelected != nil {
            setImage(imageSelected, for: .selected)
        }
        
        setTitle(title, for: .normal)
        setTitle(titleSelected, for: .selected)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc func handleActionSender(_ sender: UIButton) {
        sender.isSelected = !sender.isSelected
        
    }

}


extension UIButton {
   
    


}
