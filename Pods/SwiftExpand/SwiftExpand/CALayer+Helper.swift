//
//  CALayer+Helper.swift
//  SwiftTemplet
//
//  Created by Bin Shang on 2019/1/15.
//  Copyright © 2019 BN. All rights reserved.
//

import UIKit

extension CALayer{
    
    @objc public static func create(_ rect: CGRect, contents: Any?) -> CALayer {
        let layer = CALayer()
        layer.frame = rect
        layer.contents = contents
        layer.contentsScale = UIScreen.main.scale
        layer.rasterizationScale = UIScreen.main.scale
        layer.shouldRasterize = true
        return layer
    }
    
}
