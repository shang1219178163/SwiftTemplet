//
//  FCCycleView.swift
//  Study
//
//  Created by wyzw on 2018/4/10.
//  Copyright © 2018年 wyzw. All rights reserved.
//

import UIKit

@objc protocol NNCircleProgressViewDelegate: NSObjectProtocol {
    ///value等于1的时候的代理
    func circleProgressView(_ view: NNCircleProgressView)
    @objc optional func circleProgressViewTap(_ view: NNCircleProgressView)
}

///圆形进度条
@objcMembers class NNCircleProgressView: UIView {
    
    weak var delegate: NNCircleProgressViewDelegate?
    var block: ((NNCircleProgressView)->Void)?
    var blockTap: ((NNCircleProgressView)->Void)?

    ///线宽
    var strokeWidth: CGFloat = 5{
        willSet{
            topLayer.lineWidth = newValue
            bottomLayer.lineWidth = newValue
        }
    }
    var bottomStrokeColor: UIColor = .lightGray{
        willSet{
            bottomLayer.strokeColor = newValue.cgColor
        }
    }
    var topStrokeColor: UIColor = .systemBlue{
        willSet{
            topLayer.strokeColor = newValue.cgColor
        }
    }
        
    var radius: CGFloat = 0//半径
    
    //进度值0-1.0之间
    var value: CGFloat = 0.0{
        willSet{
            setValue(newValue, animated: true)
        }
    }
    
    private lazy var label: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 15)
        label.textAlignment = .center
        
        label.text = "0.00"
        label.textColor = .systemBlue
        label.adjustsFontSizeToFitWidth = true
        label.backgroundColor = UIColor.clear
        return label
    }()
    
    private lazy var bottomLayer: CAShapeLayer = {
        let layer = CAShapeLayer()
        layer.fillColor = UIColor.clear.cgColor
        layer.strokeColor = UIColor.groupTableViewBackground.cgColor
        layer.lineWidth = 3

        return layer
    }()
    
    private lazy var topLayer: CAShapeLayer = {
        let layer = CAShapeLayer()
        layer.lineCap = .round
        layer.fillColor = UIColor.clear.cgColor
        layer.strokeColor = UIColor.systemBlue.cgColor
        layer.lineWidth = 3

        return layer
    }()
    
    // MARK: -lifecycle
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .clear
        
        layer.addSublayer(bottomLayer)
        layer.addSublayer(topLayer)
        addSubview(label)
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(reloadValue))
        addGestureRecognizer(tap)
    }
    
    @objc func reloadValue() {
        if let delegate = delegate, delegate.responds(to: #selector(delegate.circleProgressViewTap(_:))) {
            delegate.circleProgressViewTap!(self)
            return
        }
        
        if blockTap != nil {
            blockTap!(self)
            return
        }
        setValue(value, animated: true)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()

        let center = CGPoint(x: bounds.size.width/2, y: bounds.size.height/2)

        label.frame = CGRect(x: 0, y: 0, width: bounds.size.width - strokeWidth*2, height: 20)
        label.center = center
        
        radius = bounds.size.width/2 - strokeWidth/2
        let bottomPath = UIBezierPath(arcCenter: center, radius: radius, startAngle: 0, endAngle: CGFloat(Double.pi*2), clockwise: true)
        bottomLayer.path = bottomPath.cgPath
        
        setValue(value, animated: true)
    }
    
    // MARK: -funtions
    @objc func setValue(_ newValue: CGFloat, animated: Bool) {
        delegate?.circleProgressView(self)
        block?(self)
        
        let origin = CGPoint(x: bounds.size.width/2, y: bounds.size.height/2)
        let radius = bounds.size.width/2 - strokeWidth/2

        label.text = "\(newValue * 100)" + "%"
        let startAngle: CGFloat = -CGFloat(Double.pi/2)
        let endAngle: CGFloat = startAngle + newValue * CGFloat(Double.pi * 2)
        let topPath = UIBezierPath(arcCenter: origin,
                                    radius: radius,
                                    startAngle: startAngle,
                                    endAngle: endAngle,
                                    clockwise: true)
        topLayer.path = topPath.cgPath//添加路径
        if animated == false {
            return
        }
        //添加动画
        let pathAnimation = CABasicAnimation(keyPath: "strokeEnd")
        pathAnimation.duration = 1//动画持续时间
        pathAnimation.timingFunction = CAMediaTimingFunction(name: .easeOut)
        pathAnimation.fromValue = 0
        pathAnimation.toValue = 1
        topLayer.add(pathAnimation, forKey: "strokeEndAnimation")
    }
    
    
    
}


