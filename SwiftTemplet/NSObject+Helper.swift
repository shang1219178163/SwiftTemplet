
//
//  NSObject+Helper.swift
//  SwiftTemplet
//
//  Created by Bin Shang on 2019/9/12.
//  Copyright © 2019 BN. All rights reserved.
//

import UIKit
import SwiftExpand

extension NSObjectProtocol where Self: NSObject {
    func observe<Value>(_ keyPath: KeyPath<Self, Value>, onChange: @escaping (Value) -> ()) -> NSKeyValueObservation {
        return observe(keyPath, options: [.initial, .new]) { _, change in
            // TODO: change.newValue should never be `nil`, but when observing an optional property that's set to `nil`, then change.newValue is `nil` instead of `Optional(nil)`. This is the bug report for this: https://bugs.swift.org/browse/SR-6066
//            DDLog(change)
            guard let newValue = change.newValue else { return }
            onChange(newValue)
        }
    }

    func bind<Value, Target>(_ sourceKeyPath: KeyPath<Self, Value>, to target: Target, at targetKeyPath: ReferenceWritableKeyPath<Target, Value>) -> NSKeyValueObservation {
        return observe(sourceKeyPath) { target[keyPath: targetKeyPath] = $0 }
    }
}


@objc public extension NSObject{


}

@objc extension UIImageView{
    

}

@objc public extension Bundle{

    
}

@objc public extension UIApplication{

    
    static func appDidEnterBackground(application : UIApplication) {
        var backgroundTask: UIBackgroundTaskIdentifier! = nil

        //注册一个后台任务，并提供一个在时间耗尽时执行的代码块
        backgroundTask = application.beginBackgroundTask() {
            //当时间耗尽时调用这个代码块
            //如果在这个代码块返回之前没有调用endBackgroundTask
            //应用程序将被终止
            application.endBackgroundTask(backgroundTask)
            backgroundTask = UIBackgroundTaskIdentifier.invalid
        }

        let backgroundQueue = OperationQueue()
        backgroundQueue.addOperation() {

            //完成一些工作。我们有几分钟的时间来完成它
            //在结束时，必须调用endBackgroundTask
            NSLog("Doing some background work!")

            application.endBackgroundTask(backgroundTask)
            backgroundTask = UIBackgroundTaskIdentifier.invalid
        }
    }
}

@objc extension UIView{

}

import SwiftExpand
@objc extension UISearchBar{
    
//    var placeholderStr: String {
//        get {
//            return objc_getAssociatedObject(self, RuntimeKeyFromSelector(self, aSelector: #function)) as! String;
//        }
//        set {
//            objc_setAssociatedObject(self, RuntimeKeyFromSelector(self, aSelector: #function), newValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC);
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



@objc public extension UIBarButtonItem{
    
//    /// 创建 UIBarButtonItem
//    static func create(_ obj: String, style: UIBarButtonItem.Style = .plain, target: Any? = nil, action: Selector? = nil) -> UIBarButtonItem{
//        if let image = UIImage(named: obj) {
//            return UIBarButtonItem(image: image, style: style, target: target, action: action)
//        }
//        return UIBarButtonItem(title: obj, style: style, target: target, action: action);
//    }
    
    
}
