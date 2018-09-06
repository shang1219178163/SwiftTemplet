//
//  UIAnnularProgress.swift
//  Test
//
//  Created by hsf on 2018/9/6.
//  Copyright © 2018年 fly. All rights reserved.
//

import UIKit

struct ProgressModel{
    var width: CGFloat;
    var bgColor: UIColor;
    var color: UIColor;
    var start: CGFloat;
    var end: CGFloat;
    
    init(width:CGFloat,end:CGFloat,color:UIColor) {
        self.width = width;
        self.end = end;
        self.color = color;
        bgColor = UIColor.lightGray;
        start = 0.0;
    }
    
    init() {
        width = 10;
        bgColor = UIColor.lightGray;
        color = UIColor.orange;
        start = 0.0;
        end = 0.25;
    }
}


class UIAnnularProgress: UIView {

    var progressModel = ProgressModel.init()
    private let progressLayer = CAShapeLayer();
    
    init(model:ProgressModel,frame:CGRect) {
        self.progressModel = model
        super.init(frame: frame)
        self.backgroundColor = UIColor.clear;
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = UIColor.clear;
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func draw(_ rect: CGRect) {
        let path = UIBezierPath(ovalIn: bounds).cgPath;
        
        let trackLayer = CAShapeLayer();
        trackLayer.frame = bounds;
        trackLayer.fillColor = UIColor.clear.cgColor;
        trackLayer.strokeColor = progressModel.bgColor.cgColor;
        trackLayer.lineWidth = progressModel.width;
        trackLayer.path = path;
        layer.addSublayer(trackLayer);
        
        progressLayer.frame = bounds;
        progressLayer.fillColor = UIColor.clear.cgColor;
        progressLayer.strokeColor = progressModel.color.cgColor;
        progressLayer.lineWidth = progressModel.width;
        progressLayer.path = path;
        progressLayer.strokeStart = progressModel.start;
        progressLayer.strokeEnd = progressModel.end;
        layer.addSublayer(progressLayer);
        
    }
    
    func setProgress(progress:CGFloat,time:CFTimeInterval,animate:Bool) {
        CATransaction.begin();
        CATransaction.setDisableActions(!animate);
        CATransaction.setAnimationDuration(time);
        CATransaction.setAnimationTimingFunction(CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseInEaseOut));
        progressLayer.strokeEnd = progress;
        CATransaction.commit();
        
    }
}

