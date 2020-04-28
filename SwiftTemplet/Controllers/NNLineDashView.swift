
//
//  NNECouponView.swift
//  SwiftTemplet
//
//  Created by Bin Shang on 2019/9/18.
//  Copyright © 2019 BN. All rights reserved.
//

import UIKit

class NNLineDashView: UIView {
    
    var strokeColor: UIColor = UIColor.systemBlue;

    override init(frame: CGRect) {
        super.init(frame: frame)
       //设置背景色为透明，否则是黑色背景
        backgroundColor = UIColor.clear
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
    }
    
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        
        //获取绘图上下文
        guard let context = UIGraphicsGetCurrentContext() else {
            return
        }
        
        //创建一个矩形，它的所有边都内缩3
        let drawingRect = self.bounds.insetBy(dx: 1, dy: 1)
        
        //创建并设置路径
        let path = CGMutablePath()
        path.move(to: CGPoint(x:drawingRect.minX, y:drawingRect.minY))
        path.addLine(to:CGPoint(x:drawingRect.maxX, y:drawingRect.minY))
        path.addLine(to:CGPoint(x:drawingRect.maxX, y:drawingRect.maxY))
        
        //添加路径到图形上下文
        context.addPath(path)
        
        //设置笔触颜色
        context.setStrokeColor(strokeColor.cgColor)
        //设置笔触宽度
        context.setLineWidth(1)
        
        //虚线每个线段的长度与间隔
        let lengths: [CGFloat] = [5, 3]
        //设置虚线样式
        context.setLineDash(phase: 0, lengths: lengths)
        
        //绘制路径
        context.strokePath()
    }
}
