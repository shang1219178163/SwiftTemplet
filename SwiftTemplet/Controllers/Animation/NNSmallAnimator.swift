//
//  NNSmallAnimator.swift
//  LSInteractiveAnimation
//
//  Created by Bin Shang on 2020/9/11.
//  Copyright © 2020 John_LS. All rights reserved.
//

import UIKit

class NNSmallAnimator: NSObject {

}

extension NNSmallAnimator: UIViewControllerAnimatedTransitioning {

    public func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return 0.3
    }
    
    public func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        guard let fromVC = transitionContext.viewController(forKey: .from),
        let toVC = transitionContext.viewController(forKey: .to),
        let fromView = transitionContext.view(forKey: .from) ?? fromVC.view,
        let toView = transitionContext.view(forKey: .to) ?? toVC.view
        else { return }
        
        let containerView = transitionContext.containerView
        containerView.insertSubview(toView, belowSubview: fromView)

        UIView.animate(withDuration: transitionDuration(using: transitionContext), animations: {
            fromView.transform = CGAffineTransform(scaleX: 0.1, y: 0.1)
            
        }, completion: ({completed in
            transitionContext.completeTransition(true)
        }))
    }
}


