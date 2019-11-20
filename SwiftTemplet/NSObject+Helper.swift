
//
//  NSObject+Helper.swift
//  SwiftTemplet
//
//  Created by Bin Shang on 2019/9/12.
//  Copyright © 2019 BN. All rights reserved.
//

import UIKit


@objc public extension NSObject{

   
    
    
  
}

@objc extension UIImageView{
    
  

}

@objc public extension Bundle{
//    static func infoDictionary(plist: String) -> [String: AnyObject]? {
//        guard
//            let pList = Bundle.main.path(forResource: plist, ofType: "plist"),
//            let dic = NSDictionary(contentsOfFile: pList)
//            else { return nil; }
//        return dic as? [String : AnyObject]
//    }
//    
//    func infoFrom(plist: String, key: String) -> AnyObject? {
//        guard let dic = Bundle.infoDictionary(plist: plist) else {
//            return nil
//        }
//        return dic[key]
//    }
    
}

@objc public extension UIApplication{
//    static func setupAppearanceSearchbarCancellButton() {
//        let shandow: NSShadow = {
//            let shadow = NSShadow();
//            shadow.shadowColor = UIColor.darkGray;
//            shadow.shadowOffset = CGSize(width: 0, height: -1);
//            return shadow;
//        }();
//
//        let dic: [NSAttributedString.Key: Any] = [NSAttributedString.Key.foregroundColor:  UIColor.white,
//                                                  NSAttributedString.Key.font:  UIFont.systemFont(ofSize: 13),
//                                                  NSAttributedString.Key.shadow:  shandow,
//                                                  ]
//        UIBarButtonItem.appearance().setTitleTextAttributes(dic, for: .normal)
//        UIBarButtonItem.appearance(whenContainedInInstancesOf: [UISearchBar.self])
//    }
    
}

@objc extension UIView{
//    ///手势 - 轻点 UITapGestureRecognizer
//    public func addGestureTapNew(_ action: @escaping RecognizerClosure) -> UITapGestureRecognizer {
//        let obj = UITapGestureRecognizer(target: nil, action: nil)
//        obj.numberOfTapsRequired = 1  //轻点次数
//        obj.numberOfTouchesRequired = 1  //手指个数
//
//        isUserInteractionEnabled = true
//        isMultipleTouchEnabled = true
//        addGestureRecognizer(obj)
//
//        obj.addAction { (recognizer) in
//            action(recognizer)
//        }
//        return obj
//    }
//
//    ///手势 - 长按 UILongPressGestureRecognizer
//    public func addGestureLongPressNew(_ action: @escaping RecognizerClosure, for minimumPressDuration: TimeInterval) -> UILongPressGestureRecognizer {
//        let obj = UILongPressGestureRecognizer(target: nil, action: nil)
//        obj.minimumPressDuration = minimumPressDuration;
//
//        isUserInteractionEnabled = true
//        isMultipleTouchEnabled = true
//        addGestureRecognizer(obj)
//
//        obj.addAction { (recognizer) in
//            action(recognizer)
//        }
//        return obj
//    }
//
//    ///手势 - 拖拽 UIPanGestureRecognizer
//    public func addGesturePanNew(_ action: @escaping RecognizerClosure) -> UIPanGestureRecognizer {
//        let obj = UIPanGestureRecognizer(target: nil, action: nil)
//        //最大最小的手势触摸次数
//        obj.minimumNumberOfTouches = 1
//        obj.maximumNumberOfTouches = 3
//
//        isUserInteractionEnabled = true
//        isMultipleTouchEnabled = true
//        addGestureRecognizer(obj)
//
//        obj.addAction { (recognizer) in
//            if let sender = recognizer as? UIPanGestureRecognizer {
//                let translate:CGPoint = sender.translation(in: sender.view?.superview)
//                sender.view!.center = CGPoint(x: sender.view!.center.x + translate.x, y: sender.view!.center.y + translate.y)
//                sender.setTranslation( .zero, in: sender.view!.superview)
//
//                action(recognizer)
//             }
//        }
//        return obj
//    }
//
//    ///手势 - 屏幕边缘 UIScreenEdgePanGestureRecognizer
//    public func addGestureEdgPanNew(_ action: @escaping RecognizerClosure, for edgs: UIRectEdge) -> UIScreenEdgePanGestureRecognizer {
//        let obj = UIScreenEdgePanGestureRecognizer(target: nil, action: nil)
//        obj.edges = edgs
//        isUserInteractionEnabled = true
//        isMultipleTouchEnabled = true
//        addGestureRecognizer(obj)
//
//        obj.addAction { (recognizer) in
//            action(recognizer)
//        }
//        return obj
//    }
//
//    ///手势 - 清扫 UISwipeGestureRecognizer
//    public func addGestureSwipNew(_ action: @escaping RecognizerClosure, for direction: UISwipeGestureRecognizer.Direction) -> UISwipeGestureRecognizer {
//        let obj = UISwipeGestureRecognizer(target: nil, action: nil)
//        obj.direction = direction
//
//        isUserInteractionEnabled = true
//        isMultipleTouchEnabled = true
//        addGestureRecognizer(obj)
//
//        obj.addAction { (recognizer) in
//            action(recognizer)
//        }
//        return obj
//    }
//
//    ///手势 - 捏合 UIPinchGestureRecognizer
//    public func addGesturePinchNew(_ action: @escaping RecognizerClosure) -> UIPinchGestureRecognizer {
//        let obj = UIPinchGestureRecognizer(target: nil, action: nil)
//        isUserInteractionEnabled = true
//        isMultipleTouchEnabled = true
//        addGestureRecognizer(obj)
//
//        obj.addAction { (recognizer) in
//            if let sender = recognizer as? UIPinchGestureRecognizer {
//                let location = recognizer.location(in: sender.view!.superview)
//                sender.view!.center = location;
//                sender.view!.transform = sender.view!.transform.scaledBy(x: sender.scale, y: sender.scale)
//                sender.scale = 1.0
//                //            print(recognizer)
//                action(recognizer)
//            }
//        }
//        return obj
//    }
//
//    ///手势 - 旋转 UIRotationGestureRecognizer
//    public func addGestureRotationNew(_ action: @escaping RecognizerClosure) -> UIRotationGestureRecognizer {
//        let obj = UIRotationGestureRecognizer(target: nil, action: nil)
//        isUserInteractionEnabled = true
//        isMultipleTouchEnabled = true
//        addGestureRecognizer(obj)
//
//        obj.addAction { (recognizer) in
//            if let sender = recognizer as? UIRotationGestureRecognizer {
//                sender.view!.transform = sender.view!.transform.rotated(by: sender.rotation)
//                sender.rotation = 0.0;
//
//                action(recognizer)
//            }
//        }
//        return obj
//    }
}

import SwiftExpand
@objc extension UISearchBar{
    
//    var placeholderStr: String {
//        get {
//            return objc_getAssociatedObject(self, RuntimeKeyFromSelector(#function)) as! String;
//        }
//        set {
//            objc_setAssociatedObject(self, RuntimeKeyFromSelector(#function), newValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC);
//            
//            if newValue.count <= 0  {
//                return;
//            }
//            let dic: [NSAttributedString.Key: Any] = [NSAttributedString.Key.foregroundColor:  UIColor.white.withAlphaComponent(0.5),
//                                                      NSAttributedString.Key.font:  UIFont.systemFont(ofSize: 13),
//            ]
//            guard let textField: UITextField = (self.findSubview(type: UITextField.self, resursion: true) as? UITextField) else { return }
//            textField.attributedPlaceholder = NSAttributedString(string: newValue, attributes: dic);
//
//        }
//    }
    
}

import AVFoundation
extension AVAudioSession{
    
    static func appAVAudioVolume(_ soundoff: Bool) {
        if #available(iOS 10.0, *) {
            let category: AVAudioSession.Category = soundoff == true ? AVAudioSession.Category.record : AVAudioSession.Category.ambient;
            do {
                try AVAudioSession.sharedInstance().setCategory(category, mode: .default)
                try AVAudioSession.sharedInstance().setActive(true)
            } catch {
                print(error)
            }
        }
    }
    
}

@objc public extension UIGestureRecognizer{
    
//    /// 动态属性
//    var funcName: String {
//        get {
//            var obj = objc_getAssociatedObject(self, RuntimeKeyFromSelector(#function)) as? String;
//            if obj == nil {
//                obj = String(describing: self.classForCoder);
//                objc_setAssociatedObject(self, RuntimeKeyFromSelector(#function), obj, .OBJC_ASSOCIATION_RETAIN_NONATOMIC);
//            }
//            return obj!
//        }
//        set {
//            objc_setAssociatedObject(self, RuntimeKeyFromSelector(#function), newValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC);
//        }
//    }
//    
//    func addAction(_ closure: @escaping (UIGestureRecognizer) -> Void) {
//        objc_setAssociatedObject(self, UnsafeRawPointer(bitPattern: self.hashValue)!, closure, .OBJC_ASSOCIATION_RETAIN_NONATOMIC);
//        addTarget(self, action: #selector(p_invoke))
//    }
//    
//    @objc private func p_invoke() {
//        let closure = objc_getAssociatedObject(self, UnsafeRawPointer(bitPattern: self.hashValue)!) as! ((UIGestureRecognizer) -> Void)
//        closure(self);
//    }
    
    
}

@objc public extension UIBarButtonItem{
    
//    /// 创建 UIBarButtonItem
//    static func create(_ obj: String, style: UIBarButtonItem.Style = .plain, target: Any? = nil, action: Selector? = nil) -> UIBarButtonItem{
//        if let image = UIImage(named: obj) {
//            return UIBarButtonItem(image: image, style: style, target: target, action: action)
//        }
//        return UIBarButtonItem(title: obj, style: style, target: target, action: action);
//    }
//    
//    /// UIBarButtonItem 回调
//    func addAction(_ closure: @escaping (UIBarButtonItem) -> Void) {
//        objc_setAssociatedObject(self, UnsafeRawPointer(bitPattern: self.hashValue)!, closure, .OBJC_ASSOCIATION_RETAIN_NONATOMIC);
//        target = self;
//        action = #selector(p_invoke);
//    }
//    
//    private func p_invoke() {
//        let closure = objc_getAssociatedObject(self, UnsafeRawPointer(bitPattern: self.hashValue)!) as! ((UIBarButtonItem) -> Void)
//        closure(self);
//    }
    
    
}
