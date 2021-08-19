//
//  UIRecognizerUpdateController.swift
//  SwiftTemplet
//
//  Created by Bin Shang on 2019/11/20.
//  Copyright © 2019 BN. All rights reserved.
//

import UIKit
import SwiftExpand

class UIRecognizerUpdateController: UIViewController, UIGestureRecognizerDelegate {

    func handleAction(_ sender: UIGestureRecognizer) {
        DDLog(sender);

    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        imgView.frame = CGRect(x: 0, y: 0, width: 200, height: 400)
        imgView.center = view.center
        view.addSubview(imgView)
        
        let tap = view.addGestureTap { (reco) in
            DDLog(reco);
            self.handleAction(reco)
        }
        tap.delegate = self;

        let swipeLeft = view.addGestureSwip({ (reco) in
            DDLog(reco);
            self.handleAction(reco)

        }, for: .left)
        swipeLeft.delegate = self;


        let swipeRight = view.addGestureSwip ({ (reco) in
            DDLog(reco);
            self.handleAction(reco)

        }, for: .right)
        swipeRight.delegate = self;

        let long = view.addGestureLongPress ({ (reco) in
            if let recognizer = reco as? UILongPressGestureRecognizer {
                DDLog(recognizer);
                self.handleAction(reco)

            }
        }, for: 0.5)
        long.delegate = self;

        let rotation = view.addGestureRotation { (reco) in
            if let recognizer = reco as? UIRotationGestureRecognizer {
                DDLog(recognizer);
                self.handleAction(reco)

            }
        }
        rotation.delegate = self;

//        let pan = view.addGesturePan { (reco) in
//            if let recognizer = reco as? UIPanGestureRecognizer {
//                DDLog(recognizer);
//
//            }
//        }
//        pan.delegate = self;

        let edgPanLeft = view.addGestureEdgPan ({ (reco) in
            if let recognizer = reco as? UIScreenEdgePanGestureRecognizer {
                DDLog(recognizer);
                self.handleAction(reco)

            }
        }, for: .left);
        edgPanLeft.delegate = self;

        let edgPanRight = view.addGestureEdgPan ({ (reco) in
            if let recognizer = reco as? UIScreenEdgePanGestureRecognizer {
                DDLog(recognizer);
                self.handleAction(reco)

            }
        }, for: .right);
        edgPanRight.delegate = self;
  
        let pinchView = view.addGesturePinch { (reco) in
            if let recognizer = reco as? UIPinchGestureRecognizer {
                DDLog(recognizer);
                self.handleAction(reco)

            }
        }
        pinchView.delegate = self;
        
//        let panOne = imgView.addGesturePan { (reco) in
//            if let recognizer = reco as? UIPanGestureRecognizer {
//                DDLog(recognizer);
//            }
//        }
//        panOne.delegate = self;
        
//        let pinchOne = imgView.addGesturePinch { (reco) in
//            if let recognizer = reco as? UIPinchGestureRecognizer {
//                DDLog(recognizer);
//
//            }
//        }
//        pinchOne.delegate = self;
//
//        let rotationOne = imgView.addGestureRotation { (reco) in
//            if let recognizer = reco as? UIRotationGestureRecognizer {
//                DDLog(recognizer);
//
//            }
//        }
//        rotationOne.delegate = self;

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
        let view = UIImageView(frame: .zero)
        view.image = UIImage(named: "Skull.jpg")
        return view
    }()

}
