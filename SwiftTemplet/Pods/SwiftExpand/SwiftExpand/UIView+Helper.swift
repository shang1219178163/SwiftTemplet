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
            layer.cornerRadius = newValue
            layer.masksToBounds = true
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
    
    
    public func addCorners(_ corners: UIRectCorner, cornerRadii: CGSize, width: CGFloat, color: UIColor) -> CAShapeLayer {
        let path = UIBezierPath(roundedRect: bounds, byRoundingCorners: corners, cornerRadii: cornerRadii)
        let maskLayer = CAShapeLayer()
        maskLayer.frame = bounds
        maskLayer.path = path.cgPath
        maskLayer.borderWidth = width
        maskLayer.borderColor = color.cgColor
        layer.mask = maskLayer;
        return maskLayer
    }
    
    public func addCornerAll() -> CAShapeLayer {
        let cornerRadii = CGSize(width: bounds.width*0.5, height: bounds.height*0.5)
        return addCorners( .allCorners, cornerRadii: cornerRadii, width: 1.0, color: .white)
    }
   
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
    
    /// (源方法)表视图创建
    public static func createTableView(_ rect: CGRect, style: UITableView.Style, rowHeight: CGFloat) -> UITableView{
        let table = UITableView(frame: rect, style: style);
        table.autoresizingMask = UIViewAutoresizing(rawValue: UIViewAutoresizing.flexibleWidth.rawValue | UIViewAutoresizing.flexibleHeight.rawValue)
        
        table.separatorStyle = .singleLine;
        table.separatorInset = .zero;
        table.rowHeight = rowHeight;
//        table.register(UITableViewCell.self, forCellReuseIdentifier: NSStringFromClass(UITableViewCell.self));
        table.register(UITableViewCell.self, forCellReuseIdentifier: UITableViewCell.identifier);
        table.keyboardDismissMode = .onDrag
        table.backgroundColor = UIColor.background;
       
        return table
    }
    
    public static func createLabel(_ rect: CGRect, textAlignment: NSTextAlignment, tag: Int, type: Int) -> UILabel {
        let view = UILabel(frame: rect);
        view.autoresizingMask = UIViewAutoresizing(rawValue: UIViewAutoresizing.flexibleWidth.rawValue | UIViewAutoresizing.flexibleHeight.rawValue)
        view.isUserInteractionEnabled = true;
        view.textAlignment = textAlignment;
        view.tag = tag;
        
        switch type {
        case 1:
            view.numberOfLines = 1;
            view.lineBreakMode = .byTruncatingTail;
            
        case 2:
            view.numberOfLines = 1;
            view.lineBreakMode = .byTruncatingTail;
            view.adjustsFontSizeToFitWidth = true;
            
        case 3:
            view.numberOfLines = 1;
            view.lineBreakMode = .byTruncatingTail;
            
            view.layer.borderColor = view.textColor.cgColor;
            view.layer.borderWidth = 1.0;
            view.layer.masksToBounds = true;
            view.layer.cornerRadius = rect.width*0.5;

        case 4:
            view.numberOfLines = 1;
            view.lineBreakMode = .byTruncatingTail;
            
            view.layer.borderColor = view.textColor.cgColor;
            view.layer.borderWidth = 1.0;
            view.layer.masksToBounds = true;
            view.layer.cornerRadius = 3;
            
        default:
            view.numberOfLines = 0;
            view.lineBreakMode = .byCharWrapping;
        }
        return view;
    }
    
    public static func createImgView(_ rect: CGRect, imgName: String, tag: Int) -> UIImageView {
        let view = UIImageView(frame: rect);
        view.autoresizingMask = UIViewAutoresizing(rawValue: UIViewAutoresizing.flexibleWidth.rawValue | UIViewAutoresizing.flexibleHeight.rawValue)
        view.isUserInteractionEnabled = true;
        view.contentMode = .scaleAspectFit;
        view.image = UIImage(named: imgName);
        view.tag = tag;
    
        return view
    }
    
    public static func createBtn(_ rect: CGRect, title: String?, imgName: String?, tag: Int, type: Int) -> UIButton {
        assert(title == nil && imgName == nil);
        
        let view = UIButton(type: .custom);
        view.autoresizingMask = UIViewAutoresizing(rawValue: UIViewAutoresizing.flexibleWidth.rawValue | UIViewAutoresizing.flexibleHeight.rawValue)
        view.titleLabel?.adjustsFontSizeToFitWidth = true;
        view.titleLabel?.minimumScaleFactor = 1.0;
        view.isExclusiveTouch = true;
        view.tag = tag;
        switch type {
        case 1://白色字体,主题色背景
            view.setTitleColor( .white, for: .normal)
            view.setBackgroundImage(UIImageColor( .theme), for: .normal)
            
        case 2://地图定位按钮一类
            view.setBackgroundImage(UIImageNamed(imgName!), for: .normal)
            view.setBackgroundImage(UIImageColor( .lightGray), for: .disabled)

        default://黑色字体,白色背景
            view.setTitleColor( .textColorTitle, for: .normal)
            
        }
        return view
    }
    
    public static func createTextField(_ rect: CGRect, textAlignment: NSTextAlignment, tag: Int) -> UITextField {
        let view = UITextField(frame: rect);
        view.autoresizingMask = UIViewAutoresizing(rawValue: UIViewAutoresizing.flexibleWidth.rawValue | UIViewAutoresizing.flexibleHeight.rawValue)
        view.contentVerticalAlignment = .center;
        view.autocapitalizationType = .none;
        view.autocorrectionType = .no;
        view.clearButtonMode = .whileEditing;
        view.backgroundColor = .white;
        view.returnKeyType = .done
        view.textAlignment = textAlignment;
        view.tag = tag
        return view
    }
    
    public static func createTextView(_ rect: CGRect, textAlignment: NSTextAlignment, tag: Int) -> UITextView {
        let view = UITextView(frame: rect);
        view.autoresizingMask = UIViewAutoresizing(rawValue: UIViewAutoresizing.flexibleWidth.rawValue | UIViewAutoresizing.flexibleHeight.rawValue)
        view.autocapitalizationType = .none;
        view.autocorrectionType = .no;
        view.backgroundColor = .white;
        
        view.layer.borderWidth = 0.5;
        view.layer.borderColor = UIColor.line.cgColor;
        
        view.textAlignment = textAlignment;
        view.tag = tag
        return view
    }
    
    /// UITableView的HeaderView,footerView
    public static func createSectionView(_ tableView: UITableView, text: String?, textAlignment: NSTextAlignment, height: CGFloat) -> UIView{
        let sectionView = UIView()
        if text == nil {
            return sectionView
        }
        let view = UILabel(frame: CGRect(x: kX_GAP, y: 0, width: tableView.width - kX_GAP*2, height: height));
        view.isUserInteractionEnabled = true;
        view.lineBreakMode = .byTruncatingTail;
        view.adjustsFontSizeToFitWidth = true;
        view.text = text;
        view.textAlignment = textAlignment
        
        sectionView.addSubview(view)
        return sectionView
    }
    
    ///MARK: -
    public static func createGroupView(_ rect:CGRect, list:Array<String>!, numberOfRow:Int, padding:CGFloat, type:Int, action:@escaping (UITapGestureRecognizer?,UIView,NSInteger)->()) -> UIView {
        
        let rowCount: Int = list.count % numberOfRow == 0 ? list.count/numberOfRow : list.count/numberOfRow + 1;
        let itemWidth = (rect.width - CGFloat(numberOfRow - 1)*padding)/CGFloat(numberOfRow)
        let itemHeight = (rect.height - CGFloat(rowCount - 1)*padding)/CGFloat(rowCount)
        
        let backView = UIView(frame: rect);
        for (i,value) in list.enumerated() {
            let x = CGFloat(i % numberOfRow) * (itemWidth + padding);
            let y = CGFloat(i / numberOfRow) * (itemHeight + padding);
            let rect = CGRect(x: x, y: y, width: itemWidth, height: itemHeight);
            
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
            view.addActionHandler { (tap, itemView, idx) in
                action(tap,itemView,idx);
            }
            
            backView.addSubview(view);
        }
        return backView;
    }
    
    public static func createSegment(_ rect: CGRect, items: Array<Any>!, selectedIdx: Int, type: Int) -> UISegmentedControl {
        let view = UISegmentedControl(items: items)
        view.frame = rect
        view.autoresizingMask = UIViewAutoresizing.flexibleWidth
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
      
            let dic_N = [NSAttributedStringKey.foregroundColor: UIColor.black,
                         NSAttributedStringKey.font :   UIFont.systemFont(ofSize: 15),
                         ]
            
            let dic_H = [NSAttributedStringKey.foregroundColor: UIColor.theme,
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
    
    public static func createSlider(_ rect: CGRect, value: Float, minValue: Float, maxValue: Float) -> UISlider {
        let view = UISlider(frame: rect)
        view.autoresizingMask = UIViewAutoresizing.flexibleWidth
        view.minimumValue = minValue
        view.maximumValue = maxValue
        view.value = value;
        
        view.minimumTrackTintColor = UIColor.theme
        return view;
    }
    
    public static func createSwitch(_ rect: CGRect, isOn: Bool) -> UISwitch {
        let view = UISwitch(frame: rect)
        view.autoresizingMask = UIViewAutoresizing.flexibleWidth
        view.isOn = isOn
        view.onTintColor = UIColor.theme
        return view
    }
}
