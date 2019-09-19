//
//  NNScrollView.swift
//  CloudCustomerService
//
//  Created by Bin Shang on 2019/9/17.
//  Copyright © 2019 Xi'an iRain IoT. Technology Service CO., Ltd. . All rights reserved.
//

import UIKit

class NNScrollView: UIScrollView, UIGestureRecognizerDelegate {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.bounces = false;
        self.isPagingEnabled = true;
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: -gestureRecognizer
    func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldRecognizeSimultaneouslyWith otherGestureRecognizer: UIGestureRecognizer) -> Bool{
        if gestureRecognizer.state != .possible {
            return true;
        }
        return false;
    }

}
