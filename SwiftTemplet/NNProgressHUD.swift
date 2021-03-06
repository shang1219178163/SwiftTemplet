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

class NNProgressHUD: NSObject {
    
    @objc static func showText(_ text: String?, model: MBProgressHUDMode, imageName: String?, isHidden: Bool, inView: UIView = UIApplication.shared.keyWindow!) {
        
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
    
    @objc static func showText(_ text: String?, inView: UIView = UIApplication.shared.keyWindow!) {
        
        MBProgressHUD.hide(for: inView, animated: false);
        let hud: MBProgressHUD = MBProgressHUD.showAdded(to: inView, animated: true)
        hud.mode = MBProgressHUDMode.text
        hud.label.text = text
        hud.label.numberOfLines = 0;

        hud.hide(animated: true, afterDelay: 1.5)
    }
    
    @objc static func showLoading(_ text: String?, inView: UIView = UIApplication.shared.keyWindow!) {
        NNProgressHUD.showText(text, model: .annularDeterminate, imageName: "toast_loading", isHidden: false, inView: inView)
    }
    
    @objc static func showSuccess(_ text: String?, inView: UIView = UIApplication.shared.keyWindow!) {
        NNProgressHUD.showText(text, model: .customView, imageName: "toast_success", isHidden: true, inView: inView)
    }
    
    @objc static func showError(_ text: String?, inView: UIView = UIApplication.shared.keyWindow!) {
        NNProgressHUD.showText(text, model: .customView, imageName: "toast_error", isHidden: true, inView: inView)
    }
    
    @objc static func dismiss(_ inView: UIView = UIApplication.shared.keyWindow!) {
        MBProgressHUD.hide(for: inView, animated: true)
    }
}
