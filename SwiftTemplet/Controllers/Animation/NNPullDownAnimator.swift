//
//  NNPullDownAnimator.swift
//  SwiftTemplet
//
//  Created by Bin Shang on 2020/9/11.
//  Copyright © 2020 BN. All rights reserved.
//

import UIKit

class NNPullDownAnimator: NSObject {

}

extension NNPullDownAnimator: UIViewControllerAnimatedTransitioning {

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

        var frame = containerView.bounds
        frame.origin.y = -frame.size.height
        toView.frame = frame
        
        toView.alpha = 0

        containerView.insertSubview(toView, aboveSubview: fromView)
        UIView.animate(withDuration: transitionDuration(using: transitionContext), animations: {
            toView.frame = containerView.bounds
            toView.alpha = 1

        }, completion: { finished in
            transitionContext.completeTransition(!transitionContext.transitionWasCancelled)
        })
    }
}
