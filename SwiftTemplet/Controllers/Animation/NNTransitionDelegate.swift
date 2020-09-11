//
//  NNTransitionDelegate.swift
//  SwiftTemplet
//
//  Created by Bin Shang on 2020/9/11.
//  Copyright © 2020 BN. All rights reserved.
//

import UIKit

///转场动画delegate
class NNTransitionDelegate: NSObject {
    
    var presentedAnimator: UIViewControllerAnimatedTransitioning?
    var dismissedAnimator: UIViewControllerAnimatedTransitioning?
    
    var interaction: UIPercentDrivenInteractiveTransition?

    @objc required convenience init(presented: UIViewControllerAnimatedTransitioning, dismissed: UIViewControllerAnimatedTransitioning) {
        self.init()
        self.presentedAnimator = presented
        self.dismissedAnimator = dismissed
    }
}


extension NNTransitionDelegate: UIViewControllerTransitioningDelegate {
    func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return presentedAnimator
    }
    
    func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return dismissedAnimator
    }
    
    func interactionControllerForPresentation(using animator: UIViewControllerAnimatedTransitioning) -> UIViewControllerInteractiveTransitioning? {
        return interaction
    }
    
    func interactionControllerForDismissal(using animator: UIViewControllerAnimatedTransitioning) -> UIViewControllerInteractiveTransitioning? {
        return interaction
    }
    

}
