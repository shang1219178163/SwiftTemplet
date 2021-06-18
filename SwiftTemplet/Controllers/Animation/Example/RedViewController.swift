//
//  RedViewController.swift
//  SwiftTemplet
//
//  Created by Bin Shang on 2020/9/11.
//  Copyright © 2020 BN. All rights reserved.
//

import UIKit

///
class RedViewController: UIViewController {
    
    lazy var btn: UIButton = {
        let view = UIButton(type: .custom)
        view.setTitle("下拉", for: .normal)
        return view
    }()
    // MARK: -lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        edgesForExtendedLayout = []
        title = "RedViewController"
        view.backgroundColor = UIColor.systemRed
        
        view.addSubview(btn)
                
        let panDown = UIPanGestureRecognizer(target: self, action: #selector(handleGesture(_:)))
//        panDown.delegate = self
        view.addGestureRecognizer(panDown)
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
        let percent   = translate.y / gesture.view!.bounds.size.height
        
        if gesture.state == .possible {
            if translate != .zero {
                let angle = atan2(translate.y, translate.x)
                print(angle)
            }
        } else if gesture.state == .began {
            let controller = OrangeViewController()
            controller.transitionDelegate.interaction = interaction
            
            present(controller, animated: true)
        } else if gesture.state == .changed {
            interaction.update(percent)
        } else if gesture.state == .ended || gesture.state == .cancelled {
            let velocity = gesture.velocity(in: gesture.view)
            interaction.completionSpeed = 0.999  // https://stackoverflow.com/a/42972283/1271826
            if (percent > 0.5 && velocity.y == 0) || velocity.y > 0 {
                interaction.finish()
            } else {
                interaction.cancel()
            }
        }
    }

}

extension RedViewController: UIGestureRecognizerDelegate {

    // make sure it only recognizes downward gestures
    func gestureRecognizerShouldBegin(_ gestureRecognizer: UIGestureRecognizer) -> Bool {
        if let pan = gestureRecognizer as? UIPanGestureRecognizer {
            let translation = pan.translation(in: pan.view)
            let angle = atan2(translation.y, translation.x)
            return abs(angle - .pi / 2.0) < (.pi / 8.0)
        }
        return false
    }

}
