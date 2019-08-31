//
//  NNSuspendBtn.swift
//  SwiftTemplet
//
//  Created by Bin Shang on 2019/1/25.
//  Copyright © 2019 BN. All rights reserved.
//

import UIKit

class NNSuspendBtn: UIButton {

    var isLock: Bool?
    var insets: UIEdgeInsets = .zero
    weak var parController: UIViewController?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        adjustsImageWhenHighlighted = false
        layer.zPosition = 1;
        backgroundColor = UIColor.clear;
        imageView?.contentMode = .scaleAspectFit;
        setBackgroundImage(UIImage(named: "btn_add"), for: .normal)
        
        let pan = UIPanGestureRecognizer(target: self, action: #selector(handleActionPan(_:)))
        pan.minimumNumberOfTouches = 1
        pan.delaysTouchesBegan = true
        pan.cancelsTouchesInView = true
        addGestureRecognizer(pan)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    
    @objc func handleActionPan(_ recognizer: UIPanGestureRecognizer) -> Void {
        if isLock == true {
            return
        }
        
        switch recognizer.state {
//        case .began:
            
        case .changed:
            let translate: CGPoint = recognizer.translation(in: recognizer.view!.superview)
            recognizer.view!.center = CGPoint(x: recognizer.view!.center.x + translate.x, y: recognizer.view!.center.y + translate.y)
            
        case .ended:
            let superViewRect = parController!.view.frame
            var stopPoint = recognizer.view?.center
            if stopPoint!.x - frame.width*0.5 - insets.left <= 0 {
                stopPoint = CGPoint(x: frame.width*0.5 + insets.left, y: stopPoint!.y)
            }
            
            if stopPoint!.x + frame.width*0.5 + insets.right >= superViewRect.width {
                stopPoint = CGPoint(x: superViewRect.maxX - frame.width*0.5 - insets.right, y: stopPoint!.y)
            }
            
            if stopPoint!.y - frame.height*0.5 - insets.top <= 0 {
                stopPoint = CGPoint(x: stopPoint!.x, y: frame.width*0.5 + insets.top)
            }
            
            if stopPoint!.y + frame.height*0.5 + insets.bottom >= superViewRect.height {
                stopPoint = CGPoint(x: stopPoint!.x, y: superViewRect.height - frame.height*0.5 - insets.bottom)
            }
            
            UIView.animate(withDuration: 0.35) {
                recognizer.view?.center = stopPoint!
            }
            
        default:
            break;
        }
        recognizer.setTranslation(.zero, in: recognizer.view?.superview)
    }
    

}
