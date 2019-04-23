//
//  UIView+Helper.swift
//  SwiftTemplet
//
//  Created by Bin Shang on 2018/8/14.
//  Copyright © 2018年 BN. All rights reserved.
//

import UIKit

extension UIView{
    
    @objc public var x: CGFloat {
        get {
            return frame.origin.x
        }
        set {
            frame.origin = CGPoint(x:newValue, y:frame.origin.y)
        }
    }
    
    @objc public var y: CGFloat {
        get {
            return frame.origin.y
        }
        set {
            frame.origin = CGPoint(x:frame.origin.x, y:newValue)
        }
    }
    
    @objc public var width: CGFloat {
        get {
            return frame.width
        }
        set {
            frame.size.width = newValue
        }
    }
    
    @objc public var height: CGFloat {
        get {
            return frame.size.height
        }
        set {
            frame.size.height = newValue
        }
    }
    
    @objc public var size: CGSize  {
        get {
            return frame.size
        }
        set{
            frame.size = newValue
        }
    }
    
    @objc public var origin: CGPoint {
        get {
            return frame.origin
        }
        set {
            frame.origin = newValue
        }
    }
    
    @objc public var minX: CGFloat {
        get {
            return frame.minX
        }
    }
    
    @objc public var minY: CGFloat {
        get {
            return frame.minY
        }
    }
    
    @objc public var midX: CGFloat {
        get {
            return frame.midX
        }
    }
    
    @objc public var midY: CGFloat {
        get {
            return frame.midY
        }
    }
    
    @objc public var maxX: CGFloat {
        get {
            return frame.maxX
        }
    }
    
    @objc public var maxY: CGFloat {
        get {
            return frame.maxY
        }
    }
    
    @objc public var cornerRadius: CGFloat {
        get {
            return layer.cornerRadius
        }
        set {
            layer.cornerRadius = newValue
            layer.masksToBounds = true
        }
    }
   
    //MARK: -funtions

    @objc public func autoresizeMask() -> Void {
        self.autoresizingMask = UIViewAutoresizing(rawValue: UIViewAutoresizing.flexibleWidth.rawValue | UIViewAutoresizing.flexibleHeight.rawValue)
    }
    /// 图层调试
    @objc public func getViewLayer() -> () {
        let subviews = self.subviews;
        if subviews.count == 0 {
            return;
        }
        for subview in subviews {
            subview.layer.borderWidth = kW_LayerBorder;
            subview.layer.borderColor = UIColor.blue.cgColor;
//            subview.layer.borderColor = UIColor.clear.cgColor;

            subview.getViewLayer();
        }
    }
    
    /// 移除所有子视图
    @objc public func removeAllSubViews(){
        self.subviews.forEach { (view: UIView) in
            view.removeFromSuperview()
        }
    }
    
    @objc public func addCorners(_ corners: UIRectCorner, cornerRadii: CGSize = CGSize(width: 8.0, height: 8.0), width: CGFloat, color: UIColor) -> CAShapeLayer {
        let path = UIBezierPath(roundedRect: bounds, byRoundingCorners: corners, cornerRadii: cornerRadii)
        let maskLayer = CAShapeLayer()
        maskLayer.frame = bounds
        maskLayer.path = path.cgPath
        maskLayer.borderWidth = width
        maskLayer.borderColor = color.cgColor
        layer.mask = maskLayer;
        return maskLayer
    }
    
    /// 高性能圆角
    @objc public func drawCorners(_ radius: CGFloat, width: CGFloat, color: UIColor, bgColor: UIColor) -> Void {
        let image = drawCorners( .allCorners, radius: radius, width: width, color: color, bgColor: bgColor)
        let imgView = UIImageView(image: image)
        self.insertSubview(imgView, at: 0)
    }
    
    /// [源]高性能圆角
    @objc public func drawCorners(_ corners: UIRectCorner, radius: CGFloat, width: CGFloat, color: UIColor, bgColor: UIColor) -> UIImage? {
        UIGraphicsBeginImageContextWithOptions(bounds.size, false, UIScreen.main.scale)
        let ctx = UIGraphicsGetCurrentContext()
        
        ctx?.setLineWidth(width)
        ctx?.setStrokeColor(color.cgColor)
        ctx?.setFillColor(bgColor.cgColor)
        
        let halfBorderWidth = width/2.0
        let point0 = CGPointMake(bounds.width - halfBorderWidth, radius + halfBorderWidth)
        let point1 = CGPointMake(bounds.width - halfBorderWidth, bounds.height - halfBorderWidth)
        let point2 = CGPointMake(bounds.width - radius - halfBorderWidth, bounds.height - halfBorderWidth)
        let point3 = CGPointMake(halfBorderWidth, halfBorderWidth)
        let point4 = CGPointMake(bounds.width - halfBorderWidth, halfBorderWidth)
        let point5 = CGPointMake(bounds.width - halfBorderWidth, halfBorderWidth)
        let point6 = CGPointMake(bounds.width - halfBorderWidth, radius + halfBorderWidth)
        
        ctx?.move(to: point0)
        ctx?.addArc(tangent1End: point1, tangent2End: point2, radius: radius)
        ctx?.addArc(tangent1End: point3, tangent2End: point4, radius: radius)
        ctx?.addArc(tangent1End: point5, tangent2End: point6, radius: radius)
    
        ctx?.drawPath(using: .fillStroke)
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return image
    }
    
    @objc public func addCornerAll() -> CAShapeLayer {
        let cornerRadii = CGSize(width: bounds.width*0.5, height: bounds.height*0.5)
        return addCorners( .allCorners, cornerRadii: cornerRadii, width: 1.0, color: .white)
    }
   
    //MARK: -通用响应添加方法
    @objc public func addActionHandler(action:@escaping (ViewClosure)) -> Void {
        if let sender = self as? UIButton {
            sender.addTarget(self, action:#selector(handleActionSender(sender:)), for:.touchUpInside);
            
        }
        else if let sender = self as? UIControl {
            sender.addTarget(self, action:#selector(handleActionSender(sender:)), for:.valueChanged);

        }
        else {
//            let recoginzer = objc_getAssociatedObject(self, RuntimeKey.tap);
            var obj = objc_getAssociatedObject(self, UnsafeRawPointer(bitPattern: self.hashValue)!);
            if obj == nil {
                obj = UITapGestureRecognizer(target: self, action: #selector(handleActionTap(tap:)));
                isUserInteractionEnabled = true;
                addGestureRecognizer(obj! as! UIGestureRecognizer);
                
            }
        }
//        objc_setAssociatedObject(self, RuntimeKey.tap, action, .OBJC_ASSOCIATION_COPY_NONATOMIC);
        objc_setAssociatedObject(self, UnsafeRawPointer(bitPattern: self.hashValue)!, action, .OBJC_ASSOCIATION_COPY_NONATOMIC);
    }
    
    /// 点击回调
    @objc private func handleActionTap(tap:UITapGestureRecognizer) -> Void {
//       let block = objc_getAssociatedObject(self, RuntimeKey.tap) as? ViewClosure;
        let block = objc_getAssociatedObject(self, UnsafeRawPointer(bitPattern: self.hashValue)!) as? ViewClosure;

        if block != nil{
            block!(tap, tap.view!, tap.view!.tag);
        }
    }
    
    @objc private func handleActionSender(sender:UIControl) -> Void {
        let block = objc_getAssociatedObject(self, RuntimeKey.tap) as? ViewClosure;
        if let sender = self as? UISegmentedControl {
            if block != nil {
                block!(nil, sender, sender.selectedSegmentIndex);
            }
            
        }
        else{
            if block != nil {
                block!(nil, sender, sender.tag);
            }
        }
    }

    
    //MARK: -手势
    ///手势 - 轻点
    @objc public func addGestureTap(_ action:@escaping (RecognizerClosure)) -> UITapGestureRecognizer {
        let funcAbount = NSStringFromSelector(#function)
        let runtimeKey = RuntimeKeyFromParams(self, funcAbount: funcAbount)!
        
        var obj = objc_getAssociatedObject(self, runtimeKey) as? UITapGestureRecognizer
        if obj == nil {
            obj = UITapGestureRecognizer(target: self, action: #selector(handleActionGesture(_:)))
            obj!.numberOfTapsRequired = 1  //轻点次数
            obj!.numberOfTouchesRequired = 1  //手指个数
            
            isUserInteractionEnabled = true
            isMultipleTouchEnabled = true
            addGestureRecognizer(obj!)

            obj!.runtimeKey = runtimeKey
            objc_setAssociatedObject(self, runtimeKey, action, .OBJC_ASSOCIATION_COPY_NONATOMIC)
        }
        return obj!
    }
  
    ///手势 - 长按
    @objc public func addGestureLongPress(_ action:@escaping (RecognizerClosure), for minimumPressDuration:TimeInterval) -> UILongPressGestureRecognizer {
        let funcAbount = NSStringFromSelector(#function) + ",\(minimumPressDuration)"
        let runtimeKey = RuntimeKeyFromParams(self, funcAbount: funcAbount)!
        
        var obj = objc_getAssociatedObject(self, runtimeKey) as? UILongPressGestureRecognizer
        if obj == nil {
            obj = UILongPressGestureRecognizer(target: self, action: #selector(handleActionGesture(_:)))
            obj!.minimumPressDuration = minimumPressDuration;
            
            isUserInteractionEnabled = true
            isMultipleTouchEnabled = true
            addGestureRecognizer(obj!)
            
            obj!.runtimeKey = runtimeKey
            objc_setAssociatedObject(self, runtimeKey, action, .OBJC_ASSOCIATION_COPY_NONATOMIC)
        }
        return obj!
    }
    
    ///手势 - 拖拽
    @objc public func addGesturePan(_ action:@escaping (RecognizerClosure)) -> UIPanGestureRecognizer {
        let funcAbount = NSStringFromSelector(#function)
        let runtimeKey = RuntimeKeyFromParams(self, funcAbount: funcAbount)!
        
        var obj = objc_getAssociatedObject(self, runtimeKey) as? UIPanGestureRecognizer
        if obj == nil {
            obj = UIPanGestureRecognizer(target: self, action: #selector(handleActionGesture(_:)))
            //最大最小的手势触摸次数
            obj!.minimumNumberOfTouches = 1
            obj!.maximumNumberOfTouches = 3
            isUserInteractionEnabled = true
            isMultipleTouchEnabled = true
            addGestureRecognizer(obj!)
            
            obj!.runtimeKey = runtimeKey
            objc_setAssociatedObject(self, runtimeKey, action, .OBJC_ASSOCIATION_COPY_NONATOMIC)
        }
        return obj!
    }
    
    ///手势 - 屏幕边缘
    @objc public func addGestureEdgPan(_ action:@escaping (RecognizerClosure), for edgs: UIRectEdge) -> UIScreenEdgePanGestureRecognizer {
        let funcAbount = NSStringFromSelector(#function) + ",\(edgs)"
        let runtimeKey = RuntimeKeyFromParams(self, funcAbount: funcAbount)!
        
        var obj = objc_getAssociatedObject(self, runtimeKey) as? UIScreenEdgePanGestureRecognizer
        if obj == nil {
            obj = UIScreenEdgePanGestureRecognizer(target: self, action: #selector(handleActionGesture(_:)))
            obj!.edges = edgs
            isUserInteractionEnabled = true
            isMultipleTouchEnabled = true
            addGestureRecognizer(obj!)
            
            obj!.runtimeKey = runtimeKey
            objc_setAssociatedObject(self, runtimeKey, action, .OBJC_ASSOCIATION_COPY_NONATOMIC)
        }
        return obj!
    }
    
    ///手势 - 清扫
    @objc public func addGestureSwip(_ action:@escaping (RecognizerClosure), for direction: UISwipeGestureRecognizerDirection) -> UISwipeGestureRecognizer {
        let funcAbount = NSStringFromSelector(#function) + ",\(direction)"
        let runtimeKey = RuntimeKeyFromParams(self, funcAbount: funcAbount)!
        
        var obj = objc_getAssociatedObject(self, runtimeKey) as? UISwipeGestureRecognizer
        if obj == nil {
            obj = UISwipeGestureRecognizer(target: self, action: #selector(handleActionGesture(_:)))
            obj!.direction = direction
            
            isUserInteractionEnabled = true
            isMultipleTouchEnabled = true
            addGestureRecognizer(obj!)
            
            obj!.runtimeKey = runtimeKey
            objc_setAssociatedObject(self, runtimeKey, action, .OBJC_ASSOCIATION_COPY_NONATOMIC)
        }
        return obj!
    }
    
    ///手势 - 捏合
    @objc public func addGesturePinch(_ action:@escaping (RecognizerClosure)) -> UIPinchGestureRecognizer {
        let funcAbount = NSStringFromSelector(#function)
        let runtimeKey = RuntimeKeyFromParams(self, funcAbount: funcAbount)!
        
        var obj = objc_getAssociatedObject(self, runtimeKey) as? UIPinchGestureRecognizer
        if obj == nil {
            obj = UIPinchGestureRecognizer(target: self, action: #selector(handleActionGesture(_:)))
            
            isUserInteractionEnabled = true
            isMultipleTouchEnabled = true
            addGestureRecognizer(obj!)
        
            obj!.runtimeKey = runtimeKey
            objc_setAssociatedObject(self, runtimeKey, action, .OBJC_ASSOCIATION_COPY_NONATOMIC)
        }
        return obj!
    }
    
    ///手势 - 旋转
    @objc public func addGestureRotation(_ action:@escaping (RecognizerClosure)) -> UIRotationGestureRecognizer {
        let funcAbount = NSStringFromSelector(#function)
        let runtimeKey = RuntimeKeyFromParams(self, funcAbount: funcAbount)!
        
        var obj = objc_getAssociatedObject(self, runtimeKey) as? UIRotationGestureRecognizer
        if obj == nil {
            obj = UIRotationGestureRecognizer(target: self, action: #selector(handleActionGesture(_:)))
            
            isUserInteractionEnabled = true
            isMultipleTouchEnabled = true
            addGestureRecognizer(obj!)
            
            obj!.runtimeKey = runtimeKey
            objc_setAssociatedObject(self, runtimeKey, action, .OBJC_ASSOCIATION_COPY_NONATOMIC)
        }
        return obj!
    }
    
    @objc private func handleActionGesture(_ recognizer: UIGestureRecognizer) -> Void{
    
        let block = objc_getAssociatedObject(self, recognizer.runtimeKey) as? RecognizerClosure;
//        DDLog(recognizer.funcName,block)
        switch recognizer {
        case is UISwipeGestureRecognizer:
//            print(recognizer)
            if block != nil {
                block!(recognizer)
            }
            
        case is UIScreenEdgePanGestureRecognizer:
//            print(recognizer)
            if block != nil {
                block!(recognizer)
            }
            
        case is UITapGestureRecognizer:
//            print(recognizer)
            if block != nil {
                block!(recognizer)
            }
            
        case is UILongPressGestureRecognizer:
//            print(recognizer)
            if recognizer.state == .began {
                if block != nil {
                    block!(recognizer)
                }
            }
            
        case is UIPanGestureRecognizer:
            if let sender = recognizer as? UIPanGestureRecognizer {
                let translate:CGPoint = sender.translation(in: sender.view?.superview)
                sender.view!.center = CGPoint(x: recognizer.view!.center.x + translate.x, y: recognizer.view!.center.y + translate.y)
                sender.setTranslation( .zero, in: recognizer.view!.superview)
                
                if block != nil {
                    block!(recognizer)
                }
            }
            
        case is UIPinchGestureRecognizer:
            if let sender = recognizer as? UIPinchGestureRecognizer {
                let location = recognizer.location(in: sender.view!.superview)
                sender.view!.center = location;
                sender.view!.transform = sender.view!.transform.scaledBy(x: sender.scale, y: sender.scale)
                sender.scale = 1.0
                //            print(recognizer)
                if block != nil {
                    block!(recognizer)
                }
            }
           
        case is UIRotationGestureRecognizer:
            if let sender = recognizer as? UIRotationGestureRecognizer {
//                sender.view!.transform = CGAffineTransform(rotationAngle: sender.rotation)
                sender.view!.transform = sender.view!.transform.rotated(by: sender.rotation)
                sender.rotation = 0.0;
                //            print(recognizer)
                if block != nil {
                    block!(recognizer)
                }
            }
            
        default:
            print("无法识别手势类型")
        }
    }
    
    //MARK: -Cell
    @objc public func getCell() -> UITableViewCell{
        var supView = self.superview
        while let view = supView as? UITableViewCell {
            supView = view.superview
        }
        return supView as! UITableViewCell;
    }
    
    @objc public func getCellIndexPath(_ tableView:UITableView) -> IndexPath{
        let cell = self.getCell();
        return tableView.indexPathForRow(at: cell.center)!
    }
    
    @objc public func convertToImage() -> UIImage{
        UIGraphicsBeginImageContextWithOptions(self.bounds.size, false, UIScreen.main.scale)
        let ctx = UIGraphicsGetCurrentContext()
        self.layer.render(in: ctx!)
        let image = UIGraphicsGetImageFromCurrentImageContext()
        return image!;
    }
        
    /// 保存图像到相册
    @objc public func imageToSavedPhotosAlbum(_ action: @escaping((NSError?) -> Void)) -> Void{
        var image: UIImage = self.convertToImage();
        if let imgView = self as? UIImageView {
            if imgView.image != nil {
                image = imgView.image!
            }
        }
        //保存相册
        image.toSavedPhotoAlbum { (error) in
            action(error)
        }
    }
    
}
