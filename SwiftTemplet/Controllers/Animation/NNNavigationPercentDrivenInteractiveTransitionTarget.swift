//
//  NNNavigationPercentDrivenInteractiveTransitionTarget.swift
//  SwiftTemplet
//
//  Created by Bin Shang on 2020/7/25.
//  Copyright © 2020 BN. All rights reserved.
//

import UIKit

///交互式转场动画研究
class NNNavigationPercentDrivenInteractiveTransitionTarget: NSObject {
    
    private var interaction: UIPercentDrivenInteractiveTransition?
    private weak var controller: UIViewController?
    
    var panGesture: UIPanGestureRecognizer?
//    private var transitionContext: UIViewControllerContextTransitioning?
//    private var initialLocationInContainerView: CGPoint = .zero
//    private var initialTranslationInContainerView: CGPoint = .zero
    
    @objc init(controller: UIViewController) {
        self.controller = controller
    }
        
//    private func percentForGesture(gesture: UIPanGestureRecognizer) -> CGFloat {
//        guard let transitionContext = transitionContext else { return 0}
//
//        let transitionContainerView = transitionContext.containerView
//        let translationInContainerView = gesture.translation(in: transitionContainerView)
//
//        if (translationInContainerView.x > 0 && self.initialTranslationInContainerView.x < 0) ||
//            (translationInContainerView.x < 0 && self.initialTranslationInContainerView.x > 0) {
//            return -1
//        }
//        return abs(translationInContainerView.x) / transitionContainerView.bounds.width
//    }

    @objc func updateInteractionProgress(_ gesture: UIPanGestureRecognizer, handler: @escaping(()->Void)) {
        guard let controller = controller else {
            return;
        }
        
        let progress = -1.0 * gesture.translation(in: controller.view).y / (controller.view.frame.height - 400) // 400:ParkBottomVew.height + NavigationHeight: 64 + locabelLabelHeight = 36;
        switch gesture.state {
        case .began:
            interaction = UIPercentDrivenInteractiveTransition()
            handler()

        case .changed:
            interaction?.update(progress)
            
        case .cancelled, .ended:
            if progress > 0.3 {
                interaction?.finish()
            } else {
                interaction?.cancel()
            }
            interaction = nil
            
        default:
            break
        }
    }
    
    func distance(_ pointA: CGPoint, pointB: CGPoint) -> CGFloat {
        let result = sqrt(pow(pointA.x - pointB.x, 2) + pow(pointA.y - pointB.y, 2))
        return result
    }
    
}

extension NNNavigationPercentDrivenInteractiveTransitionTarget: UINavigationControllerDelegate {
    
    func navigationController(_ navigationController: UINavigationController, animationControllerFor operation: UINavigationController.Operation, from fromVC: UIViewController, to toVC: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return nil
    }
    
    func navigationController(_ navigationController: UINavigationController, interactionControllerFor animationController: UIViewControllerAnimatedTransitioning) -> UIViewControllerInteractiveTransitioning? {
        return interaction
    }
    
}

//extension NNNavigationPercentDrivenInteractiveTransitionTarget: UIViewControllerInteractiveTransitioning {
//    func startInteractiveTransition(_ transitionContext: UIViewControllerContextTransitioning) {
//        self.transitionContext = transitionContext
//
//        self.initialLocationInContainerView = self.panGesture!.location(in: transitionContext.containerView)
//        self.initialTranslationInContainerView = self.panGesture!.translation(in: transitionContext.containerView)
//    }
//}
