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
        
        let tap = view.addGestureTap { (gesture) in
            DDLog(gesture);
        }
        tap.delegate = self;

        let swipeLeft = view.addGestureSwip({ (gesture) in
            DDLog(gesture);

        }, for: .left)
        swipeLeft.delegate = self;


        let swipeRight = view.addGestureSwip({ (gesture) in
            DDLog(gesture);

        }, for: .right)
        swipeRight.delegate = self;

        let long = view.addGestureLongPress({ (gesture) in
            DDLog(gesture);

        }, for: 0.5)
        long.delegate = self;

        let rotation = view.addGestureRotation { (gesture) in
            DDLog(gesture);

        }
        rotation.delegate = self;

        let pan = view.addGesturePan { (gesture) in
            DDLog(gesture);

        }
        pan.delegate = self;


        let edgPanLeft = view.addGestureEdgPan ({ (gesture) in
            DDLog(gesture);

        }, for: .left);
        edgPanLeft.delegate = self;

        let edgPanRight = view.addGestureEdgPan ({ (gesture) in
            DDLog(gesture);

        }, for: .right);
        edgPanRight.delegate = self;

        
        let pinchView = view.addGesturePinch { (gesture) in
            DDLog(gesture);

        }
        pinchView.delegate = self;
        
        let panOne = imgView.addGesturePan { (gesture) in
            DDLog(gesture);

//            let translate:CGPoint = recognizer.translation(in: recognizer.view?.superview)
//
//            DDLog(recognizer.view?.center,(recognizer.view?.center.x)! + translate.x,(recognizer.view?.center.y)! + translate.y)
//
//            recognizer.view?.center = CGPoint(x: (recognizer.view?.center.x)! + translate.x, y: (recognizer.view?.center.y)! + translate.y)
//            recognizer.setTranslation( .zero, in: recognizer.view?.superview)
//            //            print(sender.view?.center)
//            DDLog(translate,recognizer.view?.center)
            
        }
        panOne.delegate = self;
        
        let pinchOne = imgView.addGesturePinch { (gesture) in
            DDLog(gesture);

        }
        pinchOne.delegate = self;

        let rotationOne = imgView.addGestureRotation { (gesture) in
            DDLog(gesture);

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
        let view = UIImageView(frame: .zero)
        view.image = UIImage(named: "Skull.jpg")
        return view
    }()

}
