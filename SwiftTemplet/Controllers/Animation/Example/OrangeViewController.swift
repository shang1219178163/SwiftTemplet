//
//  OrangeViewController.swift
//  SwiftTemplet
//
//  Created by Bin Shang on 2020/9/11.
//  Copyright © 2020 BN. All rights reserved.
//

import UIKit

class OrangeViewController: UIViewController {

    lazy var btn: UIButton = {
        let view = UIButton.create(title: "上推", textColor: .white, backgroundColor: .clear)
        return view
    }()
    
    lazy var transitionDelegate: NNTransitionDelegate = {
        let delgate = NNTransitionDelegate(presented: NNPullDownAnimator(), dismissed: NNPushUpAnimator())
        return delgate
    }()
     // MARK: -lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        edgesForExtendedLayout = []
        title = "OrangeViewController"
        view.backgroundColor = UIColor.systemOrange
        transitioningDelegate = transitionDelegate
        
        view.addSubview(btn)
        
        let panUp = UIPanGestureRecognizer(target: self, action: #selector(handleGesture(_:)))
//        panUp.delegate = self
        view.addGestureRecognizer(panUp)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        btn.sizeToFit()
        btn.snp.makeConstraints { (make) in
            make.center.equalToSuperview()
        }
    }
    
    // MARK: -funtions
    let interaction = UIPercentDrivenInteractiveTransition()
    
    @objc func handleGesture(_ gesture: UIPanGestureRecognizer) {
        let translate = gesture.translation(in: gesture.view)
        let percent   = -translate.y / gesture.view!.bounds.size.height
        
        if gesture.state == .began {
            transitionDelegate.interaction = interaction
            
            dismiss(animated: true)
        } else if gesture.state == .changed {
            interaction.update(percent)
        } else if gesture.state == .ended {
            let velocity = gesture.velocity(in: gesture.view)
            interaction.completionSpeed = 0.999  // https://stackoverflow.com/a/42972283/1271826
            if (percent > 0.5 && velocity.y == 0) || velocity.y < 0 {
                interaction.finish()
            } else {
                interaction.cancel()
            }
        }
        
    }
}


extension OrangeViewController: UIGestureRecognizerDelegate {
    
    // make sure it only recognizes upward gestures
    func gestureRecognizerShouldBegin(_ gestureRecognizer: UIGestureRecognizer) -> Bool {
        if let pan = gestureRecognizer as? UIPanGestureRecognizer {
            let translation = pan.translation(in: pan.view)
            let angle = atan2(translation.y, translation.x)
            return abs(angle + .pi / 2.0) < (.pi / 8.0)
        }
        return false
    }
}
