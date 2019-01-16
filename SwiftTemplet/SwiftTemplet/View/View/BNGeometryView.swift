
//
//  BNGeometryView.swift
//  SwiftTemplet
//
//  Created by Bin Shang on 2019/1/14.
//  Copyright © 2019 BN. All rights reserved.
//

import UIKit

class BNGeometryView: UIView {

    var onePoint: CGPoint?
    var twoPoint: CGPoint?
    var threePoint: CGPoint?
    
    var color = UIColor.red
    
    var type:Int = 0 //0:三角, 1:椭圆
    var subType:Int = 0 //0:上,左:1,下:2.右:3
    {
        willSet{
            if type == 0 {
               changeTriangleDirection(newValue)
            }
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.backgroundColor = UIColor.clear
        changeTriangleDirection(subType)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func draw(_ rect: CGRect) {
        switch type {
        case 0:
            drawTriangle()
            
        case 1:
            drawCircle(rect)
            
        default:
            break
        }
    }
    
    /// 三角形
    func drawTriangle() -> Void {
        let ctx = UIGraphicsGetCurrentContext()
        ctx?.beginPath()
        ctx?.move(to: onePoint!)
        ctx?.addLine(to: twoPoint!)
        ctx?.addLine(to: threePoint!)
        ctx?.closePath();
        
        color.setFill()
        color.setStroke()

        ctx?.strokePath()
    }
    
    func changeTriangleDirection(_ subType: Int) -> Void {
        switch subType {
        case 0:
            onePoint = CGPoint(x: 0, y: frame.height)
            twoPoint = CGPoint(x: frame.width*0.5, y: 0)
            threePoint = CGPoint(x: frame.width, y: frame.height)
            
        case 1:
            onePoint = CGPoint(x: frame.width, y: 0)
            twoPoint = CGPoint(x: 0, y: frame.height*0.5)
            threePoint = CGPoint(x: frame.width, y: frame.height)
            
        case 2:
            onePoint = CGPoint(x: 0, y: 0)
            twoPoint = CGPoint(x: frame.width*0.5, y: frame.height)
            threePoint = CGPoint(x: frame.width, y: 0)
            
        case 3:
            onePoint = CGPoint(x: 0, y: 0)
            twoPoint = CGPoint(x: frame.width, y: frame.height*0.5)
            threePoint = CGPoint(x: 0, y: frame.height)
            
        default:
            break;
        }
        setNeedsDisplay()
    }
    
    /// 椭圆
    func drawCircle(_ rect: CGRect) -> Void {
        let ctx = UIGraphicsGetCurrentContext()
        ctx?.addEllipse(in: rect)

        color.setFill()
        color.setStroke()
        ctx?.strokePath()
    }
    
    
  

}
