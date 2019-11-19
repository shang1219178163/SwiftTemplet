
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
    
    var urls: [String] {
        get {
            return objc_getAssociatedObject(self, RuntimeKeyFromSelector(#function)) as! [String];
        }
        set {
            objc_setAssociatedObject(self, RuntimeKeyFromSelector(#function), newValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC);
        }
    }

    public func showImageEnlarge(urls: [String]) {
        self.urls = urls;
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(enlargeImageView(_:)))
        tap.numberOfTapsRequired = 1  //轻点次数
        tap.numberOfTouchesRequired = 1  //手指个数
        isUserInteractionEnabled = true
        isMultipleTouchEnabled = true
        addGestureRecognizer(tap)
             
        enlargeImageView(tap)
    }

    
    private func enlargeImageView(_ tap: UITapGestureRecognizer) {
        let window = UIApplication.shared.keyWindow;
        
        let avatarImageView = tap.view as! UIImageView;
        let oldFrame = avatarImageView.convert(avatarImageView.frame, to: window)
        
        let imageView: UIImageView = {
          let view = UIImageView(frame: oldFrame)
            view.contentMode = .scaleAspectFit
            view.tag = 1001;
                        
            let pinch = UIPinchGestureRecognizer(target: self, action: #selector(p_handlePinchGesture(_:)))
            pinch.scale = 1
            view.isUserInteractionEnabled = true
            view.isMultipleTouchEnabled = true
            view.addGestureRecognizer(pinch)
            return view;
        }()
        imageView.sd_setImage(with: URL(string: self.urls.first!), placeholderImage: UIImageNamed("img_failedDefault_S"))

        let backgroundView: UIView = {
            let view = UIView(frame: window!.bounds)
            view.backgroundColor = .black
            view.tag = 1000;
            view.alpha = 0;
            return view;
        }()
        backgroundView.addSubview(imageView)
        window?.insertSubview(backgroundView, at: 1)
                
        UIView.animate(withDuration: 0.15) {
            imageView.frame = window!.bounds;
            backgroundView.alpha = 1;
        }
        
        _ = backgroundView.addGestureTap { (reco) in
            UIView.animate(withDuration: 0.15, animations: {
                backgroundView.alpha = 0;

            }) { (finished) in
                if finished == true {
                    reco.view?.removeFromSuperview()
                }
            }
        }
    }
    
    
    private func p_handlePinchGesture(_ sender: UIPinchGestureRecognizer) {
        let location = sender.location(in: sender.view!.superview)
        sender.view!.center = location;
        sender.view!.transform = sender.view!.transform.scaledBy(x: sender.scale, y: sender.scale)
        
//        if sender.state == .began || sender.state == .changed{
//            if sender.view?.bounds.width <= oldFrame.width {
//                sender.view?.frame = oldFrame;
//            } else if ( sender.view?.bounds.width >= oldFrame.width*3) {
//                sender.view?.frame = oldFrame.width*3;
//            } else {
//
//            }
//        }
        sender.scale = 1.0
//        print(recognizer)
    }

}

@objc public extension Bundle{
    static func infoDictionary(plist: String) -> [String: AnyObject]? {
        guard
            let pList = Bundle.main.path(forResource: plist, ofType: "plist"),
            let dic = NSDictionary(contentsOfFile: pList)
            else { return nil; }
        return dic as? [String : AnyObject]
    }
    
    func infoFrom(plist: String, key: String) -> AnyObject? {
        guard let dic = Bundle.infoDictionary(plist: plist) else {
            return nil
        }
        return dic[key]
    }
    
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

@objc public extension UIView{
//    static func createSearchBarRect(_ rect: CGRect) -> UISearchBar {
//        let searchBar = UISearchBar(frame: rect)
//
//        searchBar.layer.cornerRadius = rect.height*0.5;
//        searchBar.layer.masksToBounds = true;
//        //设置背景图是为了去掉上下黑线
//        searchBar.backgroundImage = UIImage();
//        //searchBar.backgroundImage = [UIImage imageNamed:@"sexBankgroundImage"];
//        // 设置SearchBar的主题颜色
//        //searchBar.barTintColor = [UIColor colorWithRed:111 green:212 blue:163 alpha:1];
//        //设置背景色
//        searchBar.backgroundColor = UIColor.black.withAlphaComponent(0.1);
//
//        searchBar.barStyle = .default;
//        searchBar.keyboardType = .namePhonePad;
//        //searchBar.searchBarStyle = UISearchBarStyleMinimal;
//        //没有背影，透明样式
//        // 修改cancel
//        searchBar.setValue("取消", forKey: "cancelButtonText")
//        searchBar.showsCancelButton = true;
//        //    searchBar.showsSearchResultsButton = true;
//        //5. 设置搜索Icon
//        //    [searchBar setImage:[UIImage imageNamed:@"Search_Icon"] forSearchBarIcon:UISearchBarIconSearch state:UIControlStateNormal];
//        searchBar.setPositionAdjustment(UIOffset(horizontal: -8, vertical: 1), for: .search)
//        // 删除按钮往右移一点
//        searchBar.setPositionAdjustment(UIOffset(horizontal: 8, vertical: 0), for: .clear)
//
//        guard let textField: UITextField = (searchBar.findSubview(type: UITextField.self, resursion: true) as? UITextField) else { return searchBar; }
//        textField.backgroundColor = UIColor.clear
//        textField.tintColor = UIColor.gray;
//        textField.textColor = UIColor.white;
//        textField.font = UIFont.systemFont(ofSize: 13)
//
//        return searchBar;
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
    
    /// 动态属性
    var funcName: String {
        get {
            var obj = objc_getAssociatedObject(self, RuntimeKeyFromSelector(#function)) as? String;
            if obj == nil {
                obj = String(describing: self.classForCoder);
                objc_setAssociatedObject(self, RuntimeKeyFromSelector(#function), obj, .OBJC_ASSOCIATION_RETAIN_NONATOMIC);
            }
            return obj!
        }
        set {
            objc_setAssociatedObject(self, RuntimeKeyFromSelector(#function), newValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC);
        }
    }
    
    func addAction(_ closure: @escaping (UIGestureRecognizer) -> Void) {
        objc_setAssociatedObject(self, UnsafeRawPointer(bitPattern: self.hashValue)!, closure, .OBJC_ASSOCIATION_RETAIN_NONATOMIC);
        addTarget(self, action: #selector(p_invoke))
    }
    
    @objc private func p_invoke() {
        let closure = objc_getAssociatedObject(self, UnsafeRawPointer(bitPattern: self.hashValue)!) as! ((UIGestureRecognizer) -> Void)
        closure(self);
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
