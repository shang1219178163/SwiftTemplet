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
        
        let tap = view.addGestureTap { (sender) in
            if let recognizer = sender as? UITapGestureRecognizer {
                DDLog(recognizer);

            }
        }
        tap.delegate = self;

        let swipeLeft = view.addGestureSwip({ (sender) in
            if let recognizer = sender as? UISwipeGestureRecognizer {
                DDLog(recognizer);

            }
        }, for: .left)
        swipeLeft.delegate = self;


        let swipeRight = view.addGestureSwip({ (sender) in
            if let recognizer = sender as? UISwipeGestureRecognizer {
                DDLog(recognizer);

            }
        }, for: .right)
        swipeRight.delegate = self;

        let long = view.addGestureLongPress({ (sender) in
            if let recognizer = sender as? UILongPressGestureRecognizer {
                DDLog(recognizer);

            }
        }, for: 0.5)
        long.delegate = self;

        let rotation = view.addGestureRotation { (sender) in
            if let recognizer = sender as? UIRotationGestureRecognizer {
                DDLog(recognizer);

            }
        }
        rotation.delegate = self;

        let pan = view.addGesturePan { (sender) in
            if let recognizer = sender as? UIPanGestureRecognizer {
                DDLog(recognizer);

            }
        }
        pan.delegate = self;


        let edgPanLeft = view.addGestureEdgPan ({ (sender) in
            if let recognizer = sender as? UIScreenEdgePanGestureRecognizer {
                DDLog(recognizer);

            }
        }, for: .left);
        edgPanLeft.delegate = self;

        let edgPanRight = view.addGestureEdgPan ({ (sender) in
            if let recognizer = sender as? UIScreenEdgePanGestureRecognizer {
                DDLog(recognizer);
                
            }
        }, for: .right);
        edgPanRight.delegate = self;

        
        let pinchView = view.addGesturePinch { (sender) in
            if let recognizer = sender as? UIPinchGestureRecognizer {
                DDLog(recognizer);
                
            }
        }
        pinchView.delegate = self;
        
        let panOne = imgView.addGesturePan { (sender) in
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
        panOne.delegate = self;
        
        let pinchOne = imgView.addGesturePinch { (sender) in
            if let recognizer = sender as? UIPinchGestureRecognizer {
                DDLog(recognizer);
                
            }
        }
        pinchOne.delegate = self;

        let rotationOne = imgView.addGestureRotation { (sender) in
            if let recognizer = sender as? UIRotationGestureRecognizer {
                DDLog(recognizer);
                
            }
        }
        rotationOne.delegate = self;

    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        for i in 100..<110{
            let intStr = i.description
            DDLog(intStr)
        }
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
