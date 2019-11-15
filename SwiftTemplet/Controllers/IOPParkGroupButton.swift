//
//  IOPParkGroupButton.swift
//  SwiftTemplet
//
//  Created by Bin Shang on 2019/11/15.
//  Copyright © 2019 BN. All rights reserved.
//

import UIKit

class IOPParkGroupButton: UIButton {

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        titleLabel!.textAlignment = .center
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
//    override func imageRect(forContentRect contentRect: CGRect) -> CGRect {
//        return
//    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        let height = bounds.height*0.25;
        imageView!.frame = CGRect(x: 0, y: 0, width: height, height: height)
        titleLabel!.frame = bounds;
    }
    

}
