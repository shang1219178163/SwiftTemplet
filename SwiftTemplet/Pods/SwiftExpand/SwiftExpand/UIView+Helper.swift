//
//  UIView+Helper.swift
//  SwiftTemplet
//
//  Created by hsf on 2018/8/14.
//  Copyright © 2018年 BN. All rights reserved.
//

import UIKit

public extension UIView{
    
    public var x: CGFloat {
        get {
            return frame.origin.x
        }
        set {
            frame.origin = CGPoint(x:newValue, y:frame.origin.y)
        }
    }
    
    public var y: CGFloat {
        get {
            return frame.origin.y
        }
        set {
            frame.origin = CGPoint(x:frame.origin.x, y:newValue)
        }
    }
    
    public var width: CGFloat {
        get {
            return frame.width
        }
        set {
            frame.size.width = newValue
        }
    }
    
    public var height: CGFloat {
        get {
            return frame.size.height
        }
        set {
            frame.size.height = newValue
        }
    }
    
    public var size: CGSize  {
        get {
            return frame.size
        }
        set{
            frame.size = newValue
        }
    }
    
    public var origin: CGPoint {
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
            layer.masksToBounds = true
            layer.cornerRadius = newValue
            layer.borderWidth = kH_LINE_VIEW
            layer.borderColor = UIColor.theme.cgColor
        }
    }
   
    public func getViewLayer() -> () {
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
    
    /// 每个View都有的识别字符
//    public static var identifier: String {
//        get {
//            var str = objc_getAssociatedObject(self, RuntimeKeyFromSelector(#function)) as? String;
//            if str == nil {
//                str = NStringShortFromClass(classForCoder());
//                objc_setAssociatedObject(self, RuntimeKeyFromSelector(#function), str, .OBJC_ASSOCIATION_RETAIN_NONATOMIC);
//            }
//            return str!;
//        }
//        set {
//            objc_setAssociatedObject(self, RuntimeKeyFromSelector(#function), newValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC);
//        }
//    }
//    
//    public class var identifier: String{
//        return NSStringFromClass(self.classForCoder());
//
//    }
   
    public func addActionHandler(action:@escaping (ViewClosure)) -> Void {
        if let sender = self as? UIButton {
            sender.addTarget(self, action:#selector(handleActionSender(sender:)), for:.touchUpInside);
            
        }
        else if let sender = self as? UIControl {
            sender.addTarget(self, action:#selector(handleActionSender(sender:)), for:.valueChanged);

        }
        else {
//            let recoginzer = objc_getAssociatedObject(self, RuntimeKey.tap);
            let recoginzer = objc_getAssociatedObject(self, UnsafeRawPointer(bitPattern: self.hashValue)!);

            if recoginzer == nil {
                let recoginzer = UITapGestureRecognizer(target: self, action: #selector(handleActionTap(tap:)));
                
                self.isUserInteractionEnabled = true;
                self.addGestureRecognizer(recoginzer);
                
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

    
    ///手势 - 轻点
    public func addGestureTap(_ action:@escaping (RecognizerClosure)) -> UITapGestureRecognizer {
        let funcAbount = NSStringFromSelector(#function)
        let runtimeKey = RuntimeKeyFromParams(self, funcAbount: funcAbount)!
        
        var recognizer = objc_getAssociatedObject(self, runtimeKey) as? UITapGestureRecognizer
        if recognizer == nil {
            recognizer = UITapGestureRecognizer(target: self, action: #selector(handleActionGesture(_:)))
            recognizer!.numberOfTapsRequired = 1  //轻点次数
            recognizer!.numberOfTouchesRequired = 1  //手指个数
            
            self.isUserInteractionEnabled = true
            self.isMultipleTouchEnabled = true
            self.addGestureRecognizer(recognizer!)

            recognizer!.keyOfUnsafeRawPointer = runtimeKey
            objc_setAssociatedObject(self, runtimeKey, action, .OBJC_ASSOCIATION_COPY_NONATOMIC)
        }
        return recognizer!
    }
  
    ///手势 - 长按
    public func addGestureLongPress(_ action:@escaping (RecognizerClosure), for minimumPressDuration:TimeInterval) -> UILongPressGestureRecognizer {
        let funcAbount = NSStringFromSelector(#function) + ",\(minimumPressDuration)"
        let runtimeKey = RuntimeKeyFromParams(self, funcAbount: funcAbount)!
        
        var recognizer = objc_getAssociatedObject(self, runtimeKey) as? UILongPressGestureRecognizer
        if recognizer == nil {
            recognizer = UILongPressGestureRecognizer(target: self, action: #selector(handleActionGesture(_:)))
            recognizer!.minimumPressDuration = minimumPressDuration;
            
            self.isUserInteractionEnabled = true
            self.isMultipleTouchEnabled = true
            self.addGestureRecognizer(recognizer!)
            
            recognizer!.keyOfUnsafeRawPointer = runtimeKey
            objc_setAssociatedObject(self, runtimeKey, action, .OBJC_ASSOCIATION_COPY_NONATOMIC)
        }
        return recognizer!
    }
    
    ///手势 - 拖拽
    public func addGesturePan(_ action:@escaping (RecognizerClosure)) -> UIPanGestureRecognizer {
        let funcAbount = NSStringFromSelector(#function)
        let runtimeKey = RuntimeKeyFromParams(self, funcAbount: funcAbount)!
        
        var recognizer = objc_getAssociatedObject(self, runtimeKey) as? UIPanGestureRecognizer
        if recognizer == nil {
            recognizer = UIPanGestureRecognizer(target: self, action: #selector(handleActionGesture(_:)))
            //最大最小的手势触摸次数
            recognizer!.minimumNumberOfTouches = 1
            recognizer!.maximumNumberOfTouches = 3
            self.isUserInteractionEnabled = true
            self.isMultipleTouchEnabled = true
            self.addGestureRecognizer(recognizer!)
            
            recognizer!.keyOfUnsafeRawPointer = runtimeKey
            objc_setAssociatedObject(self, runtimeKey, action, .OBJC_ASSOCIATION_COPY_NONATOMIC)
        }
        return recognizer!
    }
    
    ///手势 - 屏幕边缘
    public func addGestureEdgPan(_ action:@escaping (RecognizerClosure), for edgs: UIRectEdge) -> UIScreenEdgePanGestureRecognizer {
        let funcAbount = NSStringFromSelector(#function) + ",\(edgs)"
        let runtimeKey = RuntimeKeyFromParams(self, funcAbount: funcAbount)!
        
        var recognizer = objc_getAssociatedObject(self, runtimeKey) as? UIScreenEdgePanGestureRecognizer
        if recognizer == nil {
            recognizer = UIScreenEdgePanGestureRecognizer(target: self, action: #selector(handleActionGesture(_:)))
            recognizer!.edges = edgs
            self.isUserInteractionEnabled = true
            self.isMultipleTouchEnabled = true
            self.addGestureRecognizer(recognizer!)
            
            recognizer!.keyOfUnsafeRawPointer = runtimeKey
            objc_setAssociatedObject(self, runtimeKey, action, .OBJC_ASSOCIATION_COPY_NONATOMIC)
        }
        return recognizer!
    }
    
    ///手势 - 清扫
    public func addGestureSwip(_ action:@escaping (RecognizerClosure), for direction: UISwipeGestureRecognizerDirection) -> UISwipeGestureRecognizer {
        let funcAbount = NSStringFromSelector(#function) + ",\(direction)"
        let runtimeKey = RuntimeKeyFromParams(self, funcAbount: funcAbount)!
        
        var recognizer = objc_getAssociatedObject(self, runtimeKey) as? UISwipeGestureRecognizer
        if recognizer == nil {
            recognizer = UISwipeGestureRecognizer(target: self, action: #selector(handleActionGesture(_:)))
            recognizer!.direction = direction
            
            self.isUserInteractionEnabled = true
            self.isMultipleTouchEnabled = true
            self.addGestureRecognizer(recognizer!)
            
            recognizer!.keyOfUnsafeRawPointer = runtimeKey
            objc_setAssociatedObject(self, runtimeKey, action, .OBJC_ASSOCIATION_COPY_NONATOMIC)
        }
        return recognizer!
    }
    
    ///手势 - 捏合
    public func addGesturePinch(_ action:@escaping (RecognizerClosure)) -> UIPinchGestureRecognizer {
        let funcAbount = NSStringFromSelector(#function)
        let runtimeKey = RuntimeKeyFromParams(self, funcAbount: funcAbount)!
        
        var recognizer = objc_getAssociatedObject(self, runtimeKey) as? UIPinchGestureRecognizer
        if recognizer == nil {
            recognizer = UIPinchGestureRecognizer(target: self, action: #selector(handleActionGesture(_:)))
            
            self.isUserInteractionEnabled = true
            self.isMultipleTouchEnabled = true
            self.addGestureRecognizer(recognizer!)
        
            recognizer!.keyOfUnsafeRawPointer = runtimeKey
            objc_setAssociatedObject(self, runtimeKey, action, .OBJC_ASSOCIATION_COPY_NONATOMIC)
        }
        return recognizer!
    }
    
    ///手势 - 旋转
    public func addGestureRotation(_ action:@escaping (RecognizerClosure)) -> UIRotationGestureRecognizer {
        let funcAbount = NSStringFromSelector(#function)
        let runtimeKey = RuntimeKeyFromParams(self, funcAbount: funcAbount)!
        
        var recognizer = objc_getAssociatedObject(self, runtimeKey) as? UIRotationGestureRecognizer
        if recognizer == nil {
            recognizer = UIRotationGestureRecognizer(target: self, action: #selector(handleActionGesture(_:)))
            
            self.isUserInteractionEnabled = true
            self.isMultipleTouchEnabled = true
            self.addGestureRecognizer(recognizer!)
            
            recognizer!.keyOfUnsafeRawPointer = runtimeKey
            objc_setAssociatedObject(self, runtimeKey, action, .OBJC_ASSOCIATION_COPY_NONATOMIC)
        }
        return recognizer!
    }
    
    @objc private func handleActionGesture(_ recognizer: UIGestureRecognizer) -> Void{
    
        let block = objc_getAssociatedObject(self, recognizer.keyOfUnsafeRawPointer) as? RecognizerClosure;
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
    
    public func getCell() -> UITableViewCell{
        var supView = self.superview
        while let view = supView as? UITableViewCell {
            supView = view.superview
        }
        return supView as! UITableViewCell;
    }
    
    public func getCellIndexPath(_ tableView:UITableView) -> IndexPath{
        let cell = self.getCell();
        return tableView.indexPathForRow(at: cell.center)!
    }
    
    public func removeAllSubViews(){
        self.subviews.forEach { (view: UIView) in
            view.removeFromSuperview()
        }
    }
    
    ///MARK: -view
    public static func createView(rect:CGRect, list:Array<String>!, numberOfRow:Int, viewHeight:CGFloat, padding:CGFloat, type:Int, action:@escaping (UITapGestureRecognizer?,UIView,NSInteger)->()) -> UIView! {
        
        let rowCount: Int = list.count % numberOfRow == 0 ? list.count/numberOfRow : list.count/numberOfRow + 1;
        
        let backView = UIView(frame: CGRect(x: rect.minX, y: rect.minY, width: rect.width, height: CGFloat(rowCount)*viewHeight + CGFloat(rowCount - 1)*padding));
        backView.backgroundColor = UIColor.green;
        
        let viewSize = CGSize(width: (backView.frame.width - CGFloat(numberOfRow - 1)*padding)/CGFloat(numberOfRow), height: viewHeight);
        for (i,value) in list.enumerated() {
            
            let x = (viewSize.width + padding) * CGFloat(i % numberOfRow);
            let y = (viewSize.height + padding) * CGFloat(i / numberOfRow);
            let rect = CGRect(x: x, y: y, width: viewSize.width, height: viewSize.height);
            
            var view: UIView;
            switch type {
            case 1:
                let imgView = UIImageView(frame: rect);
                imgView.isUserInteractionEnabled = true;
                imgView.contentMode = .scaleAspectFit;
                imgView.image = UIImage(named: value);
                
                view = imgView;
                
            case 2:
                let label = UILabel(frame: rect);
                label.text = value;
                label.textAlignment = .center;
                
                label.numberOfLines = 0;
                label.lineBreakMode = .byCharWrapping;
                
                view = label;
                
            default:
                let button = UIButton(type: .custom);
                button.frame = rect;
                button.setTitle(value, for: .normal);
                button.titleLabel?.font = UIFont.systemFont(ofSize: 15);
                button.titleLabel?.adjustsFontSizeToFitWidth = true;
                button.titleLabel?.minimumScaleFactor = 1.0;
                button.isExclusiveTouch = true;
                
                button.setTitleColor(UIColor.black, for: .normal);
                button.backgroundColor = UIColor.white;
                view = button;
            }
            view.tag = i;
            
            backView.addSubview(view);
            
            view.addActionHandler { (tap, itemView, idx) in
                action(tap,itemView,idx);
                
            }
        }
        return backView;
    }
    
    func createSegmentRect(_ rect: CGRect, items: Array<Any>!, selectedIdx: Int, type: Int) -> UISegmentedControl {
        
        let view = UISegmentedControl(items: items)
        view.frame = rect
        view.selectedSegmentIndex = selectedIdx
        
        switch type {
        case 1:
            view.tintColor = UIColor.theme
            view.backgroundColor = UIColor.white
            view.layer.borderWidth = 1.0
            view.layer.borderColor = UIColor.white.cgColor
            let dic_N = [NSAttributedStringKey.foregroundColor: UIColor.black,
                         NSAttributedStringKey.font :   UIFont.systemFont(ofSize: 15),
            
                        ]
            view.setTitleTextAttributes(dic_N, for: .normal)
            view.setDividerImage(UIImageColor(UIColor.white), forLeftSegmentState: .normal, rightSegmentState: .normal, barMetrics: .default);
            
            
        case 2:
            view.tintColor = UIColor.white
            view.backgroundColor = UIColor.white
      
            let dic_N = [NSAttributedStringKey.foregroundColor: UIColor.theme,
                         NSAttributedStringKey.foregroundColor: UIColor.white,
                         NSAttributedStringKey.font :   UIFont.systemFont(ofSize: 15),
                         
                         ]
            
            let dic_H = [NSAttributedStringKey.foregroundColor: UIColor.white,
                         NSAttributedStringKey.foregroundColor: UIColor.theme,
                         NSAttributedStringKey.font :   UIFont.systemFont(ofSize: 18),
                         
                         ]
            
            view.setTitleTextAttributes(dic_N, for: .normal)
            view.setTitleTextAttributes(dic_H, for: .selected)
            
        case 3:
            view.tintColor = UIColor.clear
            view.backgroundColor = UIColor.line
            
            let dic_N = [NSAttributedStringKey.foregroundColor: UIColor.black,
                         NSAttributedStringKey.font :   UIFont.systemFont(ofSize: 15),
                         
                         ]
            
            let dic_H = [NSAttributedStringKey.foregroundColor: UIColor.theme,
                         NSAttributedStringKey.font :   UIFont.systemFont(ofSize: 18),
                         
                         ]
            
            view.setTitleTextAttributes(dic_N, for: .normal)
            view.setTitleTextAttributes(dic_H, for: .selected)
            
        default:
            view.tintColor = UIColor.theme
            view.backgroundColor = UIColor.white
            
            let dic_N = [
                         NSAttributedStringKey.font :   UIFont.systemFont(ofSize: 15),
                         
                         ]
            
            let dic_H = [
                         NSAttributedStringKey.font :   UIFont.systemFont(ofSize: 18),
                         
                         ]
            
            view.setTitleTextAttributes(dic_N, for: .normal)
            view.setTitleTextAttributes(dic_H, for: .selected)
        }
        return view;
    }
    
    func createSliderRect(_ rect: CGRect, value: Float, minValue: Float, maxValue: Float) -> UISlider {
        let view = UISlider(frame: rect)
        view.autoresizingMask = UIViewAutoresizing.flexibleWidth
        view.minimumValue = minValue
        view.maximumValue = maxValue
        view.value = value;
        
        view.minimumTrackTintColor = UIColor.theme
        view.maximumTrackTintColor = UIColor.white
        view.thumbTintColor = UIColor.white
        return view;
    }
    
    func createSwitchRect(_ rect: CGRect, isOn: Bool) -> UISwitch {
        let view = UISwitch(frame: rect)
        view.isOn = isOn
        view.onTintColor = UIColor.theme
        view.tintColor = UIColor.white
        return view
    }
}
