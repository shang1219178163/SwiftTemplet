//
//  IOPParkButton.swift
//  SwiftTemplet
//
//  Created by Bin Shang on 2019/11/15.
//  Copyright © 2019 BN. All rights reserved.
//

import UIKit
import SnapKit

class IOPParkButton: UIButton {

    var iconSize: CGSize = CGSize(width: 12, height: 12)
    
    var heightRatio: CGFloat = 0.25
    
    var iconLocation: UIView.Location = .leftTop
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        titleLabel!.textAlignment = .center
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
//    override func imageRect(forContentRect contentRect: CGRect) -> CGRect {
//        var rect: CGRect = .zero
//        switch iconLocation {
//        case .leftTop:
//            rect = CGRect(x: 0, y: 0, width: iconSize.width, height: iconSize.height)
//
//        case .leftBottom:
//            rect = CGRect(x: 0, y: bounds.height - iconSize.height, width: iconSize.width, height: iconSize.height)
//
//        case .rightBottom:
//            rect = CGRect(x: bounds.width - iconSize.width, y: bounds.height - iconSize.height, width: iconSize.width, height: iconSize.height)
//
//        default:
//            rect = CGRect(x: bounds.width - iconSize.width, y: 0, width: iconSize.width, height: iconSize.height)
//
//            break;
//        }
//        return rect
//    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
//        guard let titleLabel = titleLabel, let imageView = imageView else { return }
//        let height = bounds.height*0.25;
//        imageView!.frame = CGRect(x: 0, y: 0, width: height, height: height)
        titleLabel!.frame = bounds;
        
        if heightRatio > 0 {
            iconSize = CGSize(width: bounds.height*heightRatio, height: bounds.height*heightRatio)
        }
        
        switch iconLocation {
        case .leftTop:
            imageView!.frame = CGRect(x: 0, y: 0, width: iconSize.width, height: iconSize.height)

        case .leftBottom:
            imageView!.frame = CGRect(x: 0, y: bounds.height - iconSize.height, width: iconSize.width, height: iconSize.height)

        case .rightBottom:
            imageView!.frame = CGRect(x: bounds.width - iconSize.width, y: bounds.height - iconSize.height, width: iconSize.width, height: iconSize.height)

        default:
            imageView!.frame = CGRect(x: bounds.width - iconSize.width, y: 0, width: iconSize.width, height: iconSize.height)

            break;
        }
    }
    

}
