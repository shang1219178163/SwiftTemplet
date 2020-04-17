//
//  NNTransitionAnimator.swift
//  SwiftTemplet
//
//  Created by Bin Shang on 2020/4/17.
//  Copyright © 2020 BN. All rights reserved.
//

import UIKit


public class NNTransitionAnimator: NSObject {
    public enum AnimateType: Int {
        case fade
        case top
        case left
        case bottom
        case right
    }
    
    public var animateType: AnimateType = .fade
    public var duration: TimeInterval = 0.25

    init(duration: TimeInterval, animateType: AnimateType) {
        self.duration = duration
        self.animateType = animateType
    }
}

extension NNTransitionAnimator: UIViewControllerAnimatedTransitioning {
    public func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return self.duration
    }
    
    public func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        NNTransitionAnimator.animateTransition(using: transitionContext,
                                               duration: duration,
                                               type: animateType)
    }
}

extension NNTransitionAnimator {
    
    static func animateTransition(using transitionContext: UIViewControllerContextTransitioning,
                                  duration: TimeInterval,
                                  type: AnimateType = .fade) {
        guard let fromVC = transitionContext.viewController(forKey: UITransitionContextViewControllerKey.from),
            let toVC = transitionContext.viewController(forKey: UITransitionContextViewControllerKey.to),
            let fromView = transitionContext.view(forKey: UITransitionContextViewKey.from) ?? fromVC.view,
            let toView = transitionContext.view(forKey: UITransitionContextViewKey.to) ?? toVC.view
            else { return }
        
        let containerView = transitionContext.containerView
        
        let fromViewFrame = transitionContext.initialFrame(for: fromVC)
        let toViewFrame = transitionContext.finalFrame(for: toVC)
        
//        let screenWidth = UIScreen.main.bounds.width
//        let screenHeight = UIScreen.main.bounds.height
//        print("\(#function)0_\(fromView.frame)_\(toView.frame)")

        var offset: CGVector = .zero
        if type == .left || type == .right {
            let dx = (type == .left) ? -1.0 : 1.0
            offset = CGVector(dx: dx, dy: 0)
        
            fromView.frame = fromViewFrame
            toView.frame = toViewFrame.offsetBy(dx: toViewFrame.size.width * offset.dx, dy: 0)
        } else if type == .top || type == .bottom {
            let dy = (type == .top) ? -1.0 : 1.0
            offset = CGVector(dx: 0, dy: dy)

            fromView.frame = fromViewFrame
            toView.frame = toViewFrame.offsetBy(dx: 0, dy: toViewFrame.size.height * offset.dy)
        } else {
            fromView.alpha = 1.0
            toView.alpha = 0.0
            fromView.frame = fromViewFrame
            toView.frame = toViewFrame
        }

        containerView.addSubview(toView)

        UIView.animate(withDuration: duration, animations: {
            if type == .left || type == .right {
                fromView.frame = fromViewFrame.offsetBy(dx: fromViewFrame.size.width * offset.dx * -1, dy: 0)
                toView.frame = toViewFrame

            } else if type == .top || type == .bottom {
                fromView.frame = fromViewFrame.offsetBy(dx: 0, dy: toViewFrame.size.height * offset.dy * -1)
                toView.frame = toViewFrame
            } else {
                fromView.alpha = 0.0
                toView.alpha = 1.0
            }
            
            print("\(#function)_\(fromView.frame)_\(toView.frame)")
            
        }) { (finished) in
            transitionContext.completeTransition(!transitionContext.transitionWasCancelled)
//            if wasCancelled == false {
//                UIApplication.shared.keyWindow?.addSubview(toVC.view)
//            }
        }
        
    }

}
