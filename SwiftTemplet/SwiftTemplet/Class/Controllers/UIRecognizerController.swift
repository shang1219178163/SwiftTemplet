//
//  UIRecognizerController.swift
//  SwiftTemplet
//
//  Created by Bin Shang on 2019/1/5.
//  Copyright © 2019 BN. All rights reserved.
//

import UIKit

import SwiftExpand

class UIRecognizerController: UIViewController,UIGestureRecognizerDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        imgView.frame = CGRect(x: 0, y: 0, width: 200, height: 400)
        imgView.center = view.center
        view.addSubview(imgView)
        
//        view.addGestureTap { (sender:UIGestureRecognizer) in
//            if let recognizer = sender as? UITapGestureRecognizer {
//                DDLog(recognizer);
//
//            }
//        }
//
//        view.addGestureSwip({ (sender:UIGestureRecognizer) in
//            if let recognizer = sender as? UISwipeGestureRecognizer {
//                DDLog(recognizer);
//
//            }
//        }, for: .left)
//
//
//        view.addGestureSwip({ (sender:UIGestureRecognizer) in
//            if let recognizer = sender as? UISwipeGestureRecognizer {
//                DDLog(recognizer);
//
//            }
//        }, for: .right)
//
//        view.addGestureLongPress({ (sender:UIGestureRecognizer) in
//            if let recognizer = sender as? UILongPressGestureRecognizer {
//                DDLog(recognizer);
//
//            }
//        }, for: 0.5)
//
//        view.addGestureRotation { (sender:UIGestureRecognizer) in
//            if let recognizer = sender as? UIRotationGestureRecognizer {
//                DDLog(recognizer);
//
//            }
//        }
        
//        view.addGesturePan { (sender:UIGestureRecognizer) in
//            if let recognizer = sender as? UIPanGestureRecognizer {
//                DDLog(recognizer);
//
//            }
//        }
//
//
//        view.addGestureEdgPan({ (sender:UIGestureRecognizer) in
//            if let recognizer = sender as? UIScreenEdgePanGestureRecognizer {
//                DDLog(recognizer);
//
//            }
//        }, for: .left);
//
//        view.addGestureEdgPan({ (sender:UIGestureRecognizer) in
//            if let recognizer = sender as? UIScreenEdgePanGestureRecognizer {
//                DDLog(recognizer);
//
//            }
//        }, for: .right);
    
        view.addGesturePinch { (sender:UIGestureRecognizer) in
            if let recognizer = sender as? UIPinchGestureRecognizer {
                DDLog(recognizer);

            }
        }
        
        let pan = imgView.addGesturePan { (sender:UIGestureRecognizer) in
            if let recognizer = sender as? UIPanGestureRecognizer {
                DDLog(recognizer);
//
//                let translate:CGPoint = recognizer.translation(in: recognizer.view?.superview)
//
//                DDLog(recognizer.view?.center,(recognizer.view?.center.x)! + translate.x,(recognizer.view?.center.y)! + translate.y)
//
//                recognizer.view?.center = CGPoint(x: (recognizer.view?.center.x)! + translate.x, y: (recognizer.view?.center.y)! + translate.y)
//                recognizer.setTranslation( .zero, in: recognizer.view?.superview)
//                //            print(sender.view?.center as Any)
//                DDLog(translate,recognizer.view?.center)

            }
        }
        pan.delegate = self;
        
//        imgView.addGesturePan { (sender:UIGestureRecognizer) in
//            if let recognizer = sender as? UIPanGestureRecognizer {
//                DDLog(recognizer);
//
//            }
//        }
        
        let pinch = imgView.addGesturePinch { (sender:UIGestureRecognizer) in
            if let recognizer = sender as? UIPinchGestureRecognizer {
                DDLog(recognizer);
                
            }
        }
        pinch.delegate = self;

        let rotation = imgView.addGestureRotation { (sender:UIGestureRecognizer) in
            if let recognizer = sender as? UIRotationGestureRecognizer {
                DDLog(recognizer);
                
            }
        }
        rotation.delegate = self;

    }
    
    
    //MARK: -代理方法 手势
    func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldReceive touch: UITouch) -> Bool {
        return true;
    }

    
    lazy var imgView: UIImageView = {
        var view = UIImageView(frame: .zero)
        view.image = UIImageNamed("Skull.jpg")
        return view
    }()

}
