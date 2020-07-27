//
//  TabbarInteractionTransition.swift
//  CustomTransitions
//
//  Created by JiangT on 2019/6/16.
//  Copyright © 2019 JiangT. All rights reserved.
//

import UIKit

class TabbarInteractionTransition: UIPercentDrivenInteractiveTransition {
    
    var panGesture: UIPanGestureRecognizer?
    
    private var transitionContext: UIViewControllerContextTransitioning?
    
    private var initialLocationInContainerView: CGPoint = .zero
    private var initialTranslationInContainerView: CGPoint = .zero
    
    init(pan: UIPanGestureRecognizer) {
        super.init()
        
        self.panGesture = pan
        self.panGesture!.addTarget(self, action: #selector(gestureRecognizeDidUpdate(sender:)))
    }
    
    deinit {
        self.panGesture?.removeTarget(self, action: #selector(gestureRecognizeDidUpdate(sender:)))
    }
    
    
    override func startInteractiveTransition(_ transitionContext: UIViewControllerContextTransitioning) {
        self.transitionContext = transitionContext
        
        self.initialLocationInContainerView = self.panGesture!.location(in: transitionContext.containerView)
        self.initialTranslationInContainerView = self.panGesture!.translation(in: transitionContext.containerView)
        
        super.startInteractiveTransition(transitionContext)
    }
    
    private func percentForGesture(gesture: UIPanGestureRecognizer) -> CGFloat {
        if self.transitionContext == nil {
            return 0
        }
        
        let transitionContainerView = self.transitionContext?.containerView
        let translationInContainerView = gesture.translation(in: transitionContainerView)
        
        if (translationInContainerView.x > 0 && self.initialTranslationInContainerView.x < 0) ||
            (translationInContainerView.x < 0 && self.initialTranslationInContainerView.x > 0) {
            return -1
        }
        
        return abs(translationInContainerView.x) / transitionContainerView!.bounds.width
    }
    
    @objc func gestureRecognizeDidUpdate(sender: UIPanGestureRecognizer) {
        switch sender.state {
        case .began:
            break
        case .changed:
            print(self.percentForGesture(gesture: sender))
            if self.percentForGesture(gesture: sender) < 0 {
                self.cancel()
                self.panGesture!.removeTarget(self, action: #selector(gestureRecognizeDidUpdate(sender:)))
            } else {
                
                self.update(self.percentForGesture(gesture: sender))
            }
        case .ended:
            if self.percentForGesture(gesture: sender) >= 0.4 {
                self.finish()
            } else {
                self.cancel()
            }
        default:
            self.cancel()
        }
    }
}
