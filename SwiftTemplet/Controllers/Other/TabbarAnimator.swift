//
//  TabbarAnimator.swift
//  CustomTransitions
//
//  Created by JiangT on 2019/6/16.
//  Copyright © 2019 JiangT. All rights reserved.
//

import UIKit

@objcMembers class TabbarAnimator: NSObject {
    var targetEdge: UIRectEdge
    var duration: TimeInterval

    init(edge: UIRectEdge, duration: TimeInterval = 0.35) {
        self.targetEdge = edge
        self.duration = duration
    }
}

extension TabbarAnimator: UIViewControllerAnimatedTransitioning {
    public func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return self.duration
    }
    
    public func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        guard let fromVC = transitionContext.viewController(forKey: UITransitionContextViewControllerKey.from),
            let toVC = transitionContext.viewController(forKey: UITransitionContextViewControllerKey.to),
            let fromView = transitionContext.view(forKey: UITransitionContextViewKey.from) ?? fromVC.view,
            let toView = transitionContext.view(forKey: UITransitionContextViewKey.to) ?? toVC.view
            else { return }
            
        let containerView = transitionContext.containerView
        
        let fromFrame = transitionContext.initialFrame(for: fromVC)
        let toFrame = transitionContext.finalFrame(for: toVC)
        
        var offset: CGVector
        if self.targetEdge == UIRectEdge.left {
            offset = CGVector(dx: -1.0, dy: 0)
        } else {
            offset = CGVector(dx: 1.0, dy: 0.0)
        }
        
        fromView.frame = fromFrame
        toView.frame = toFrame.offsetBy(dx: toFrame.size.width * offset.dx, dy: 0)
//        print("\(#function)前:_\(fromView.frame)_\(toView.frame)")

        containerView.addSubview(toView)
        
        let transitionDuration = self.transitionDuration(using: transitionContext)
        UIView.animate(withDuration: transitionDuration, animations: {
            fromView.frame = fromFrame.offsetBy(dx: fromFrame.size.width * offset.dx * -1, dy: 0)
            toView.frame = toFrame
            
        }) { (finished) in
            transitionContext.completeTransition(!transitionContext.transitionWasCancelled)
        }
        
    }
}
