//
//  NNFadeAnimator.swift
//  SwiftTemplet
//
//  Created by Bin Shang on 2020/9/11.
//  Copyright © 2020 BN. All rights reserved.
//

import UIKit

class NNFadeAnimator: NSObject {

}

extension NNFadeAnimator: UIViewControllerAnimatedTransitioning {

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
        containerView.insertSubview(toView, aboveSubview: fromView)
        
        toView.alpha = 0

        UIView.animate(withDuration: transitionDuration(using: transitionContext), animations: {
            toView.alpha = 1
            
        }, completion: { finished in
            transitionContext.completeTransition(!transitionContext.transitionWasCancelled)
        })
    }
}


