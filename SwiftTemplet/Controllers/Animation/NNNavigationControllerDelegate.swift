//
//  NNNavigationControllerDelegate.swift
//  SwiftTemplet
//
//  Created by Bin Shang on 2020/7/25.
//  Copyright © 2020 BN. All rights reserved.
//

import UIKit

///转场动画delegate
class NNNavigationControllerDelegate: NSObject {
    
    private var pushAnimator: UIViewControllerAnimatedTransitioning?
    private var popAnimator: UIViewControllerAnimatedTransitioning?
    
    private var isInteraction: Bool = false
    var interaction: UIPercentDrivenInteractiveTransition?

    @objc required convenience init(push: UIViewControllerAnimatedTransitioning, pop: UIViewControllerAnimatedTransitioning, isInteraction: Bool) {
        self.init()
        self.pushAnimator = push
        self.popAnimator = pop
        self.isInteraction = isInteraction
    }
}

extension NNNavigationControllerDelegate: UINavigationControllerDelegate {
    
    func navigationController(_ navigationController: UINavigationController, animationControllerFor operation: UINavigationController.Operation, from fromVC: UIViewController, to toVC: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        if operation == .push {
            return pushAnimator
        } else  if operation == .pop {
            return popAnimator
        }
        return nil
    }
    
    func navigationController(_ navigationController: UINavigationController, interactionControllerFor animationController: UIViewControllerAnimatedTransitioning) -> UIViewControllerInteractiveTransitioning? {
        return isInteraction ? interaction : nil
    }
    
}
