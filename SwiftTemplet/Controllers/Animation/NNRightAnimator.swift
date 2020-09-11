//
//  NNRightAnimator.swift
//  SwiftTemplet
//
//  Created by Bin Shang on 2020/9/11.
//  Copyright © 2020 BN. All rights reserved.
//

import UIKit

class NNRightAnimator: NSObject {

}

extension NNRightAnimator: UIViewControllerAnimatedTransitioning {

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
        containerView.addSubview(toView)

        let fromViewFrame = transitionContext.initialFrame(for: fromVC)
        let toViewFrame = transitionContext.finalFrame(for: toVC)
        
        var offset: CGVector = .zero
        offset = CGVector(dx: 1, dy: 0)

        fromView.frame = fromViewFrame
        toView.frame = toViewFrame.offsetBy(dx: toViewFrame.size.width * offset.dx, dy: 0)

        UIView.animate(withDuration: transitionDuration(using: transitionContext), animations: {
            fromView.frame = fromViewFrame.offsetBy(dx: fromViewFrame.size.width * offset.dx * -1, dy: 0)
            toView.frame = toViewFrame

        }, completion: { finished in
            transitionContext.completeTransition(!transitionContext.transitionWasCancelled)
        })
    }
}
