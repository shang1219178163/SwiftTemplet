//
//  BNCircleView.swift
//  SwiftTemplet
//
//  Created by hsf on 2018/9/6.
//  Copyright © 2018年 BN. All rights reserved.
//


/*
 环形进度条
 */


import UIKit

class BNCircleView: UIView {

    
    var value: CGFloat = 0 {
        didSet {
            self.setNeedsDisplay();
        }
    }
    
    var maximumValue: CGFloat = 0 {
        didSet {
            self.setNeedsDisplay();
            
            
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame);
        self.backgroundColor = UIColor.red;
        self.isOpaque = false;
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func draw(_ rect: CGRect) {
        // Drawing code
        super.draw(rect);
        
        //线宽度
        let lineWidth: CGFloat = 10.0;
        //半径
        let radius = rect.width / 2.0 - lineWidth;
        //中心点x
        let centerX = rect.midX;
        //中心点y
        let centerY = rect.midY;
        //弧度起点
        let startAngle = CGFloat(-90 * Double.pi / 180);
        //弧度终点
        let endAngle = CGFloat(((self.value / self.maximumValue) * 360.0 - 90.0) ) * CGFloat(Double.pi) / 180.0;
        
        //创建一个画布
        let context = UIGraphicsGetCurrentContext();
        
        //画笔颜色
        context!.setStrokeColor(UIColor.orange.cgColor);
        
        //画笔宽度
        context!.setLineWidth(lineWidth);
        
        //（1）画布 （2）中心点x（3）中心点y（4）圆弧起点（5）圆弧结束点（6） 0顺时针 1逆时针
        context?.addArc(center: CGPoint(x:centerX,y:centerY), radius: radius, startAngle: startAngle, endAngle: endAngle, clockwise: false);
        
        //绘制路径
        context!.strokePath();
        
        //画笔颜色
        context!.setStrokeColor(UIColor.lightGray.cgColor);
        
        //（1）画布 （2）中心点x（3）中心点y（4）圆弧起点（5）圆弧结束点（6） 0顺时针 1逆时针
        context?.addArc(center: CGPoint(x:centerX,y:centerY), radius: radius, startAngle: startAngle, endAngle: endAngle, clockwise: true);
        
        //绘制路径
        context!.strokePath();
    }
}
