//
//  NNProgressHUD.swift
//  SwiftTemplet
//
//  Created by Bin Shang on 2019/7/6.
//  Copyright © 2019 BN. All rights reserved.
//

import UIKit
import MBProgressHUD
import SwiftExpand

private let keyWindow: UIWindow = UIApplication.shared.keyWindow ?? UIApplication.shared.windows.first!

class NNProgressHUD: NSObject {
    
    @objc static func showText(_ text: String?, model: MBProgressHUDMode, imageName: String?, isHidden: Bool, inView: UIView = keyWindow) {
        
        MBProgressHUD.hide(for: inView, animated: false);
        let hud: MBProgressHUD = MBProgressHUD.showAdded(to: inView, animated: true)
        
        hud.isUserInteractionEnabled = !isHidden;
        hud.contentColor = UIColor.white;
        hud.minSize = model == MBProgressHUDMode.annularDeterminate ? CGSize(width: 90, height: 90) : CGSize(width: 130, height: 130)
        hud.bezelView.style = .solidColor
        hud.bezelView.color = UIColor(white: 0, alpha: 0.4)
        hud.bezelView.layer.cornerRadius = 5;
        hud.backgroundView.backgroundColor = UIColor.clear
        
        if let image = UIImage(named: imageName!) {
            hud.mode = MBProgressHUDMode.customView
            hud.customView = UIImageView(image: image)
            
            if model == MBProgressHUDMode.annularDeterminate {
                let anni: CABasicAnimation = {
                    let anni: CABasicAnimation = CABasicAnimation(keyPath: CAAnimation.kTransformRotationZ)
                    anni.fromValue = 0
                    anni.toValue = Double.pi*2
                    anni.duration = 1
                    anni.autoreverses = false
                    anni.fillMode = .forwards
                    anni.repeatCount = MAXFLOAT
                    return anni;
                }();

                hud.customView?.layer.add(anni, forKey: nil)
            }
            
            if let string = text {
                hud.label.text = string
                hud.label.isHidden = true
                hud.label.font = UIFont.systemFont(ofSize: 10)
            }
        }
        
        hud.detailsLabel.text = text;
        hud.detailsLabel.textColor = UIColor.white;
        hud.detailsLabel.font = UIFont.systemFont(ofSize: 15)
        // 标志:必须为true,才可以隐藏,  隐藏的时候从父控件中移除
        hud.removeFromSuperViewOnHide = true;
        
        if (text != nil && imageName == nil) {
            hud.minSize = CGSize(width: 120, height: 40)
            hud.margin = 10;
        }
        
        if isHidden == true {
            hud.hide(animated: true, afterDelay: 1.5)
        }
    }
    
    @objc static func showText(_ text: String?, inView: UIView = keyWindow) {
        
        MBProgressHUD.hide(for: inView, animated: false);
        let hud: MBProgressHUD = MBProgressHUD.showAdded(to: inView, animated: true)
        hud.mode = MBProgressHUDMode.text
        hud.label.text = text
        hud.label.numberOfLines = 0;

        hud.hide(animated: true, afterDelay: 1.5)
    }
    
    @objc static func showLoading(_ text: String?, inView: UIView = keyWindow) {
        NNProgressHUD.showText(text, model: .annularDeterminate, imageName: "toast_loading", isHidden: false, inView: inView)
    }
    
    @objc static func showSuccess(_ text: String?, inView: UIView = keyWindow) {
        NNProgressHUD.showText(text, model: .customView, imageName: "toast_success", isHidden: true, inView: inView)
    }
    
    @objc static func showError(_ text: String?, inView: UIView = keyWindow) {
        NNProgressHUD.showText(text, model: .customView, imageName: "toast_error", isHidden: true, inView: inView)
    }
    
    @objc static func dismiss(_ inView: UIView = keyWindow) {
        MBProgressHUD.hide(for: inView, animated: true)
    }

}


let hideDuration: TimeInterval = 1.5

//let tupleDic: [Int: (UIColor, UIColor, UIImage)]  = [
//    0: (UIColor, UIColor, UIImage)
//]

public extension UIView {
    //显示等待消息
    func showLoading(_ title: String) {
        let hud = MBProgressHUD.showAdded(to: self, animated: true)
        hud.label.text = title
        hud.removeFromSuperViewOnHide = true
    }
    
    ///当前展示 MBProgressHUD
    var currentHUD: MBProgressHUD? {
        return MBProgressHUD.forView(self)
    }
    /// 是否有 hud 正在展示
    var isShowing: Bool {
        return currentHUD != nil;
    }
    /// 更新 hud 标题
    func updateLoading(_ title: String) {
        if let hud = MBProgressHUD.forView(self) {
            hud.label.text = title
        }
    }
    
    //显示等待消息
    func hideHud(_ animated: Bool = true, delay: TimeInterval) {
        if let hud = MBProgressHUD.forView(self) {
            hud.hide(animated: animated, afterDelay: delay)
        }
    }
     
    //显示普通消息
    func showInfo(_ title: String, image: UIImage? = nil) {
        let hud = MBProgressHUD.showAdded(to: self, animated: true)
        hud.mode = .customView //模式设置为自定义视图
        if let image = image {
            hud.customView = UIImageView(image: image)
        }
        hud.label.text = title
        hud.removeFromSuperViewOnHide = true
        //HUD窗口显示1秒后自动隐藏
        hud.hide(animated: true, afterDelay: hideDuration)
    }
     
    //显示成功消息
    func showSuccess(_ title: String, image: UIImage? = UIImage(named: "toast_success")) {
        showInfo(title, image: image)
    }
 
    //显示失败消息
    func showError(_ title: String, image: UIImage? = UIImage(named: "toast_error")) {
        showInfo(title, image: image)
    }
}


////显示成功消息
//self.view.showSuccess("操作成功")
//
////显示失败消息
//self.view.showError("操作失败")
//
////显示普通消息
//self.view.showInfo("这是普通提示消息")
//
////显示等待消息
//self.view.showWait("请稍等")

extension MBProgressHUD {
    //显示等待消息
    class func showLoading(_ title: String) {
        let view = viewToShow()
        let hud = MBProgressHUD.showAdded(to: view, animated: true)
        hud.label.text = title
        hud.removeFromSuperViewOnHide = true
    }
        
    ///当前展示 MBProgressHUD
    static var currentHUD: MBProgressHUD? {
        let view = viewToShow()
        return MBProgressHUD.forView(view)
    }
    /// 是否有 hud 正在展示
    static var isShowing: Bool {
        return currentHUD != nil;
    }
    /// 更新 hud 标题
    static func updateLoading(_ title: String) {
        let view = viewToShow()
        if let hud = MBProgressHUD.forView(view) {
            hud.label.text = title
        }
    }

    //显示等待消息
    class func hideHud(_ animated: Bool = true, delay: TimeInterval) {
        let view = viewToShow()
        if let hud = MBProgressHUD.forView(view) {
            hud.hide(animated: animated, afterDelay: delay)
        }
    }
     
    //显示普通消息
    class func showInfo(_ title: String, image: UIImage? = nil) {
        let view = viewToShow()
        let hud = MBProgressHUD.showAdded(to: view, animated: true)
        hud.mode = .customView //模式设置为自定义视图
        if let image = image {
            hud.customView = UIImageView(image: image)
        }
        hud.label.text = title
        hud.removeFromSuperViewOnHide = true
        //HUD窗口显示1秒后自动隐藏
        hud.hide(animated: true, afterDelay: hideDuration)
    }
     
    //显示成功消息
    class func showSuccess(_ title: String, image: UIImage? = UIImage(named: "toast_success")) {
        showInfo(title, image: image)
    }
 
    //显示失败消息
    class func showError(_ title: String, image: UIImage? = UIImage(named: "toast_error")) {
        showInfo(title, image: image)
    }
 
    //获取用于显示提示框的view
    class func viewToShow() -> UIView {
        var window = UIApplication.shared.keyWindow ?? UIApplication.shared.windows.first
        if window?.windowLevel != UIWindow.Level.normal {
            let windowArray = UIApplication.shared.windows
            for tempWin in windowArray {
                if tempWin.windowLevel == UIWindow.Level.normal {
                    window = tempWin;
                    break
                }
            }
        }
        return window!
    }
    
}


enum ZZProgressHUDStyle: Int {
    case defaultBgColor, blackBgColor
}

class ZZProgressHUD: NSObject {
    
}

extension ZZProgressHUD {
    
    static var style: ZZProgressHUDStyle = .defaultBgColor
//    static var style: ZZProgressHUDStyle = .blackBgColor

    //显示等待消息
    static func showLoading(_ title: String) {
        let view = viewToShow()
        let hud = MBProgressHUD.showAdded(to: view, animated: true)
        hud.label.text = title
        if style != .defaultBgColor {
            hud.contentColor = .white
            hud.bezelView.color = .black.withAlphaComponent(0.5)
            hud.bezelView.style = .solidColor
        }
        hud.removeFromSuperViewOnHide = true
    }
    ///当前展示 MBProgressHUD
    static var currentHUD: MBProgressHUD? {
        let view = viewToShow()
        return MBProgressHUD.forView(view)
    }
    /// 是否有 hud 正在展示
    static var isShowing: Bool {
        return currentHUD != nil;
    }
    /// 更新 hud 标题
    static func updateLoading(_ title: String) {
        let view = viewToShow()
        if let hud = MBProgressHUD.forView(view) {
            hud.label.text = title
        }
    }

    //显示等待消息
    static func hide(_ animated: Bool = true, delay: TimeInterval) {
        let view = viewToShow()
        if let hud = MBProgressHUD.forView(view) {
            hud.hide(animated: animated, afterDelay: delay)
        }
    }
     
    //显示普通消息
    static func showInfo(_ title: String, image: UIImage? = nil) {
        let view = viewToShow()
        let hud = MBProgressHUD.showAdded(to: view, animated: true)
        hud.mode = .customView //模式设置为自定义视图
        hud.label.text = title
        if let image = image {
            hud.customView = UIImageView(image: image)
        }
        if style != .defaultBgColor {
            hud.contentColor = .white
            hud.bezelView.color = .black.withAlphaComponent(0.5)
            hud.bezelView.style = .solidColor
        }
        hud.removeFromSuperViewOnHide = true
        //HUD窗口显示1秒后自动隐藏
        hud.hide(animated: true, afterDelay: hideDuration)
    }
     
    //显示成功消息
    static func showSuccess(_ title: String, image: UIImage? = UIImage(named: "toast_success")) {
        showInfo(title, image: image)
    }
 
    //显示失败消息
    static func showError(_ title: String, image: UIImage? = UIImage(named: "toast_error")) {
        showInfo(title, image: image)
    }
 
    //获取用于显示提示框的view
    static func viewToShow() -> UIView {
        var window = UIApplication.shared.keyWindow ?? UIApplication.shared.windows.first
        if window?.windowLevel != UIWindow.Level.normal {
            let windowArray = UIApplication.shared.windows
            for tempWin in windowArray {
                if tempWin.windowLevel == UIWindow.Level.normal {
                    window = tempWin;
                    break
                }
            }
        }
        return window!
    }
    
}


