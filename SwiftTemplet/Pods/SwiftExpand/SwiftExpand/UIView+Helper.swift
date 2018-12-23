//
//  UIView+Helper.swift
//  SwiftTemplet
//
//  Created by hsf on 2018/8/14.
//  Copyright © 2018年 BN. All rights reserved.
//

import UIKit

public extension UIView{
    
    public var width: CGFloat {
        get {
            return self.frame.width
        }
        set {
            self.frame.size.width = newValue
        }
    }
    
    public var height: CGFloat {
        get {
            return self.frame.size.height
        }
        set {
            self.frame.size.height = newValue
        }
    }
    
    public var size: CGSize  {
        get {
            return self.frame.size
        }
        set{
            self.frame.size = newValue
        }
    }
    
    public var origin: CGPoint {
        get {
            return self.frame.origin
        }
        set {
            self.frame.origin = newValue
        }
    }
    
    public var x: CGFloat {
        get {
            return self.frame.origin.x
        }
        set {
            self.frame.origin = CGPoint(x:newValue, y:self.frame.origin.y)
        }
    }
    
    public var y: CGFloat {
        get {
            return self.frame.origin.y
        }
        set {
            self.frame.origin = CGPoint(x:self.frame.origin.x, y:newValue)
        }
    }
    
    public var centerX: CGFloat {
        get {
            return self.center.x
        }
        set {
            self.center = CGPoint(x:newValue, y:self.center.y)
        }
    }
    
    public var centerY: CGFloat {
        get {
            return self.center.y
        }
        set {
            self.center = CGPoint(x:self.center.x, y:newValue)
        }
    }
    
    public var left: CGFloat {
        get {
            return self.frame.origin.x
        }
        set {
            self.frame.origin.x = newValue
        }
    }
    
    public var right: CGFloat {
        get {
            return self.frame.origin.x + self.frame.size.width
        }
        set {
            self.frame.origin.x = newValue - self.frame.size.width
        }
    }
    
    public var top: CGFloat {
        get {
            return self.frame.origin.y
        }
        set {
            self.frame.origin.y = newValue
        }
    }
    
    public var bottom: CGFloat {
        get {
            return self.frame.origin.y + self.frame.size.height
        }
        set {
            self.frame.origin.y = newValue - self.frame.size.height
        }
    }
    
    public var cornerRadius: CGFloat {
        get {
            return self.layer.cornerRadius
        }
        set {
            self.layer.masksToBounds = true
            self.layer.cornerRadius = newValue
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
    
//    /// 运行时关联
//    private var viewBlock: ViewClick? {
//        set {
//            objc_setAssociatedObject(self, RuntimeKey.viewBlock!, newValue, .OBJC_ASSOCIATION_COPY_NONATOMIC);
//        }
//        get {
//            return  objc_getAssociatedObject(self, RuntimeKey.viewBlock!) as? ViewClick;
//        }
//    }
    /// 每个View都有的识别字符
//    public static var identifier: String {
//        get {
//            var str = objc_getAssociatedObject(self, AssociationKeyFromSelector(#function)) as? String;
//            if str == nil {
//                str = NStringShortFromClass(classForCoder());
//                objc_setAssociatedObject(self, AssociationKeyFromSelector(#function), str, .OBJC_ASSOCIATION_RETAIN_NONATOMIC);
//            }
//            return str!;
//        }
//        set {
//            objc_setAssociatedObject(self, AssociationKeyFromSelector(#function), newValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC);
//        }
//    }
//    
//    public class var identifier: String{
//        return NSStringFromClass(self.classForCoder());
//
//    }
   
    public func addActionHandler(action:@escaping (ViewClick)) -> Void {
        if let sender = self as? UIButton {
            sender.addTarget(self, action:#selector(handleActionSender(sender:)), for:.touchUpInside);
            
        }
        else if let sender = self as? UIControl {
            sender.addTarget(self, action:#selector(handleActionSender(sender:)), for:.valueChanged);

        }
        else {
            let recoginzer = objc_getAssociatedObject(self, RuntimeKey.tap);
            if recoginzer == nil {
                let recoginzer = UITapGestureRecognizer(target: self, action: #selector(handleActionTap(tap:)));
                
                self.isUserInteractionEnabled = true;
                self.addGestureRecognizer(recoginzer);
                
            }
        }
        objc_setAssociatedObject(self, RuntimeKey.tap, action, .OBJC_ASSOCIATION_RETAIN_NONATOMIC);
        
    }
    
    /// 点击回调
    @objc private func handleActionTap(tap:UITapGestureRecognizer) -> Void {
       let block = objc_getAssociatedObject(self, RuntimeKey.tap) as? ViewClick;
        if block != nil{
            block!(tap, tap.view!, tap.view!.tag);
        }
    }
    
    @objc private func handleActionSender(sender:UIControl) -> Void {
        let block = objc_getAssociatedObject(self, RuntimeKey.tap) as? ViewClick;
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

    
    ///轻点手势
    func addGestureTap(action:@escaping (RecognizerClick)) -> Void {
        let recognizer:UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(handleActionGesture(_:)))
        recognizer.numberOfTapsRequired = 2  //轻点次数
        recognizer.numberOfTouchesRequired = 1  //手指个数
        
        self.isUserInteractionEnabled = true
        self.addGestureRecognizer(recognizer)
        
        recognizer.keyOfUnsafeRawPointer = RuntimeKey.recognizerTap
        objc_setAssociatedObject(self, RuntimeKey.recognizerTap, action, .OBJC_ASSOCIATION_RETAIN_NONATOMIC);

    }
  
    ///长按手势
    func addGestureLongPress(action:@escaping (RecognizerClick)) -> Void {
        let recognizer:UILongPressGestureRecognizer = UILongPressGestureRecognizer(target: self, action: #selector(handleActionGesture(_:)))
        
        self.isUserInteractionEnabled = true
        self.addGestureRecognizer(recognizer)
        
        recognizer.keyOfUnsafeRawPointer = RuntimeKey.recognizerLongPress
        objc_setAssociatedObject(self, RuntimeKey.recognizerLongPress, action, .OBJC_ASSOCIATION_RETAIN_NONATOMIC);

    }
    
    ///清扫手势
    func addGestureSwip(action:@escaping (RecognizerClick)) -> Void {
        let recognizer:UISwipeGestureRecognizer = UISwipeGestureRecognizer(target: self, action: #selector(handleActionGesture(_:)))
        recognizer.direction = [.right , .left]
        
        self.isUserInteractionEnabled = true
        self.addGestureRecognizer(recognizer)
        
        recognizer.keyOfUnsafeRawPointer = RuntimeKey.recognizerSwip
        objc_setAssociatedObject(self, RuntimeKey.recognizerSwip, action, .OBJC_ASSOCIATION_RETAIN_NONATOMIC);

    }
    
    ///拖拽手势
    func addGesturePan(action:@escaping (RecognizerClick)) -> Void {
        let recognizer:UIPanGestureRecognizer = UIPanGestureRecognizer(target: self, action: #selector(handleActionGesture(_:)))
        //最大最小的手势触摸次数
        recognizer.minimumNumberOfTouches = 1
        recognizer.maximumNumberOfTouches = 3
        self.isUserInteractionEnabled = true
        self.addGestureRecognizer(recognizer)
        
        recognizer.keyOfUnsafeRawPointer = RuntimeKey.recognizerPan
        objc_setAssociatedObject(self, RuntimeKey.recognizerPan, action, .OBJC_ASSOCIATION_RETAIN_NONATOMIC);

    }
    
    ///捏合手势
    func addGesturePinch(action:@escaping (RecognizerClick)) -> Void {
        let recognizer:UIPinchGestureRecognizer = UIPinchGestureRecognizer(target: self, action: #selector(handleActionGesture(_:)))
        self.isUserInteractionEnabled = true
        self.addGestureRecognizer(recognizer)
        
        recognizer.keyOfUnsafeRawPointer = RuntimeKey.recognizerPinch
        objc_setAssociatedObject(self, RuntimeKey.recognizerPinch, action, .OBJC_ASSOCIATION_RETAIN_NONATOMIC);

    }
    
    ///旋转手势
    func addGestureRotation(action:@escaping (RecognizerClick)) -> Void {
        let recognizer:UIRotationGestureRecognizer = UIRotationGestureRecognizer(target: self, action: #selector(handleActionGesture(_:)))
        self.isUserInteractionEnabled = true
        self.addGestureRecognizer(recognizer)
        
        recognizer.keyOfUnsafeRawPointer = RuntimeKey.recognizerRotation
        objc_setAssociatedObject(self, RuntimeKey.recognizerRotation, action, .OBJC_ASSOCIATION_RETAIN_NONATOMIC);

    }
    
    ///屏幕边缘手势
    func addGestureEdgPain(action:@escaping (RecognizerClick), direction: UIRectEdge) -> Void {
        let recognizer:UIScreenEdgePanGestureRecognizer = UIScreenEdgePanGestureRecognizer(target: self, action: #selector(handleActionGesture(_:)))
//        edgPan.edges = UIRectEdge.left
        recognizer.edges = direction
        self.isUserInteractionEnabled = true
        self.addGestureRecognizer(recognizer)
        
        recognizer.keyOfUnsafeRawPointer = RuntimeKey.recognizerEdgPan
        objc_setAssociatedObject(self, RuntimeKey.recognizerEdgPan, action, .OBJC_ASSOCIATION_RETAIN_NONATOMIC);

    }
    
    @objc private func handleActionGesture(_ recognizer: UIGestureRecognizer) -> Void{
    
        switch recognizer {
        case is UITapGestureRecognizer:
            print(recognizer)
       
        case is UILongPressGestureRecognizer:
            print(recognizer)
            
        case is UISwipeGestureRecognizer:
            print(recognizer)
            
        case is UIPanGestureRecognizer:
            let sender = recognizer as! UIPanGestureRecognizer;
            let translate:CGPoint = sender.translation(in: sender.view?.superview)
            sender.view?.center = CGPoint(x: sender.view?.center.x ?? 0.0 + translate.x, y: sender.view?.center.y ?? 0.0 + translate.y)
            DDLog(sender.view?.center)
            
        case is UIPinchGestureRecognizer:
            let sender = recognizer as! UIPinchGestureRecognizer;
            let location = recognizer.location(in: sender.view?.superview)
            
            sender.view!.center = location;
            sender.view!.transform = sender.view!.transform.scaledBy(x: sender.scale, y: sender.scale)
            sender.scale = 0.1

            print(recognizer)
            
        case is UIRotationGestureRecognizer:
            let sender = recognizer as! UIRotationGestureRecognizer;
            recognizer.view?.transform = CGAffineTransform(rotationAngle: sender.rotation)
            sender.rotation = 0.0;
            print(recognizer)
            
        case is UIScreenEdgePanGestureRecognizer:
            print(recognizer)
            
        default:
            print("无法识别手势类型")
        }
        let block = objc_getAssociatedObject(self, recognizer.keyOfUnsafeRawPointer) as? RecognizerClick;
        if block != nil {
            block!(recognizer)
        }
    }

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
}
