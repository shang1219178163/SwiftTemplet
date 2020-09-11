//
//  NNCustomAimator.swift
//  SwiftTemplet
//
//  Created by Bin Shang on 2020/9/11.
//  Copyright © 2020 BN. All rights reserved.
//

import UIKit

///自定义动画
class NNCustomAimator: NSObject {
    ///自定义动画实现
    var block: ((UIViewControllerContextTransitioning)->Void)?
    
}

extension NNCustomAimator: UIViewControllerAnimatedTransitioning {

    public func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return 0.3
    }
    
    public func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        block?(transitionContext)
//        guard let fromVC = transitionContext.viewController(forKey: .from),
//        let toVC = transitionContext.viewController(forKey: .to),
//        let fromView = transitionContext.view(forKey: .from) ?? fromVC.view,
//        let toView = transitionContext.view(forKey: .to) ?? toVC.view
//        else { return }
    }
}
