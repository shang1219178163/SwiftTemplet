//
//  BNSliderControlView.swift
//  SwiftTemplet
//
//  Created by Bin Shang on 2019/2/27.
//  Copyright © 2019 BN. All rights reserved.
//

import UIKit

import SnapKit
import SwiftExpand

class BNSliderControlView: UIView {

    var isLock: Bool?
    var insets: UIEdgeInsets = .zero
    
    var text: String = "👉向右滑动" {
        willSet {
            labBack.text = newValue
        }
    }
    
    var textFinish: String = "操作成功!" {
        willSet {
            labFront.text = newValue
        }
    }
    
    var thumbImage: UIImage? = nil {
        willSet {
            imgView.image = newValue
        }
    }
    
    var thumbFinishImage: UIImage? = nil;
    
    var allCornerRadius: CGFloat = 0.0 {
        willSet {
            layer.borderWidth = 0.5
            layer.cornerRadius = newValue
            for view in subviews {
                view.layer.borderWidth = 0.5;
                view.layer.cornerRadius = newValue;
                view.layer.masksToBounds = true;
                
            }
        }
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        clipsToBounds = true
        addSubview(labFront)
        addSubview(labBack)
        addSubview(imgView)
        
        imgView.addObserver(self, forKeyPath: "center", options: .new, context: nil)
        self.addObserver(self, forKeyPath: "frame", options: .new, context: nil)
        
//        labFront.backgroundColor = UIColor.green
//        labBack.backgroundColor = UIColor.orange
        labFront.backgroundColor = UIColorHex("#2dae70")
        labBack.backgroundColor = UIColorHex("#ff6b22")
        
        imgView.frame = CGRectMake(0, 0, frame.height+15, frame.height);
        labFront.frame = CGRectMake(0, 0, frame.width, frame.height);
        labBack.frame = CGRectMake(0, 0, frame.width, imgView.frame.height);
        allCornerRadius = frame.height*0.2;

    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    deinit {
        imgView.removeObserver(self, forKeyPath: "center")
        self.removeObserver(self, forKeyPath: "frame")
    }
    
    override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
        if keyPath == "center" {
            let point: CGPoint = change![NSKeyValueChangeKey.newKey] as! CGPoint
            let halfWidth = imgView.frame.width/2.0;
            
            var rectBack = labBack.frame;
            rectBack.origin.x = point.x - halfWidth;
            rectBack.size.width = frame.width - rectBack.origin.x + halfWidth;
            labBack.frame = rectBack;
            
            if point.x > halfWidth {
                labBack.text = "";
                labFront.text = imgView.image == thumbFinishImage ? textFinish : "";
                
            } else {
                labBack.text = text;
                
            }
        } else if keyPath == "frame" {
            let frame: CGRect = change![NSKeyValueChangeKey.newKey] as! CGRect
            imgView.frame = CGRectMake(0, 0, frame.height+15, frame.height);
            labFront.frame = CGRectMake(0, 0, frame.width, frame.height);
            labBack.frame = CGRectMake(0, 0, frame.width, imgView.frame.height);
            allCornerRadius = frame.height/2.0;
          
//            imgView.layer.borderWidth = 0.5;
//            imgView.layer.cornerRadius = frame.height*0.5;
//            imgView.layer.masksToBounds = true;
        }
    }
    
    @objc func handleActionPan(_ recognizer: UIPanGestureRecognizer) -> Void {
        if isLock == true {
            return
        }
        
        switch recognizer.state {
        case .began:
            self.imgView.image = self.thumbImage;

        case .changed:
            let translate: CGPoint = recognizer.translation(in: recognizer.view!.superview)
            recognizer.view!.center = CGPoint(x: recognizer.view!.center.x + translate.x, y: recognizer.view!.center.y)
            
        case .ended:

            var stopPoint = recognizer.view!.center
            DDLog(stopPoint)
            if stopPoint.x - imgView.width*0.5 - insets.left <= frame.width {
                stopPoint = CGPoint(x: imgView.frame.width*0.5, y: stopPoint.y)
            }
            
            if recognizer.view!.center.x + imgView.width*0.5 + insets.right >= frame.width {
                stopPoint = CGPoint(x: frame.width - imgView.frame.width*0.5 - insets.right, y: stopPoint.y)
                
                labFront.text = textFinish;
                if thumbFinishImage != nil {
                    imgView.image = thumbFinishImage
                }
            }
            
            UIView.animate(withDuration: 0.35) {
                recognizer.view?.center = stopPoint
            }
            
        default:
            break;
        }
        recognizer.setTranslation(.zero, in: recognizer.view?.superview)
    }
    
    //MARK: -lazy
    lazy var labFront: UILabel = {
        var view = UILabel(frame: .zero);
        view.font = UIFont.systemFont(ofSize: 17)
        view.textColor = UIColor.white;
        view.textAlignment = .center;
        view.numberOfLines = 0;
        view.isUserInteractionEnabled = true;
        return view;
    }();
    
    lazy var labBack: UILabel = {
        var view = UILabel(frame: .zero);
        view.font = UIFont.systemFont(ofSize: 17)
        view.textColor = UIColor.white;
        view.textAlignment = .center;
        view.numberOfLines = 0;
        view.isUserInteractionEnabled = true;
        
        //渐变色
//        let colors = [UIColorHex("#ffda6a").withAlphaComponent(0.9).cgColor, UIColorHex("#ff6b22").withAlphaComponent(0.9).cgColor]
//        let gradientLayer = CAGradientLayer.layerRect(self.bounds, colors: colors, start: CGPointMake(0, 0), end: CGPointMake(1.0, 0))
//        //        gradientLayer.locations = [0.5,1.0]
//        view.layer.insertSublayer(gradientLayer, at: 0)
        return view;
    }();
    
    lazy var imgView: UIImageView = {
        var view = UIImageView(frame: .zero);
        view.autoresizingMask = UIViewAutoresizing(rawValue: UIViewAutoresizing.flexibleWidth.rawValue | UIViewAutoresizing.flexibleHeight.rawValue)
        view.isUserInteractionEnabled = true;
        view.contentMode = .scaleAspectFit;
        view.image = UIImageColor(.red);
        view.backgroundColor = UIColor.white
        
        //创建移动手势事件
        let recognizer = UIPanGestureRecognizer(target: self, action: #selector(handleActionPan(_:)))
        //最大最小的手势触摸次数
        recognizer.minimumNumberOfTouches = 1
        recognizer.maximumNumberOfTouches = 3
        view.isUserInteractionEnabled = true
        view.isMultipleTouchEnabled = true
        view.addGestureRecognizer(recognizer)
        
        return view;
    }()
        
        
}


