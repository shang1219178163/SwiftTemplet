
//
//  UITextView+Helper.swift
//  SwiftTemplet
//
//  Created by Bin Shang on 2019/1/15.
//  Copyright © 2019 BN. All rights reserved.
//

import UIKit

extension UITextView{
    
    @objc public class func initializeMethod() {
        if self == UIImageView.self {
            let onceToken = "Method Swizzling_\(NSStringFromClass(classForCoder()))";
            //DispatchQueue函数保证代码只被执行一次，防止又被交换回去导致得不到想要的效果
            DispatchQueue.once(token: onceToken) {
                let oriSel0 = NSSelectorFromString("deinit")
                let repSel0 = #selector(self.swz_deinit)
                
                let _ = swizzleMethodInstance(UIImageView.self, origSel: oriSel0, replSel: repSel0);
                
            }
        }
    }
    
    @objc public func swz_deinit() -> Void {
        //需要注入的代码写在此处
        NotificationCenter.default.removeObserver(self)

        self.swz_deinit()
    
    }
    
    @objc public var placeHolderTextView: UITextView {
        get {
            var view = objc_getAssociatedObject(self, RuntimeKeyFromSelector(#function)) as? UITextView;
            if view == nil {
                view = UITextView(frame: bounds);
                view!.autoresizingMask = UIViewAutoresizing(rawValue: UIViewAutoresizing.flexibleWidth.rawValue | UIViewAutoresizing.flexibleHeight.rawValue)
                view!.autocapitalizationType = .none;
                view!.autocorrectionType = .no;
                view!.backgroundColor = .clear;
                view!.textColor = .gray
                view!.textAlignment = .left;
                view!.font = self.font
                self.addSubview(view!)
                
                NotificationCenter.default.addObserver(self, selector: #selector(textViewDidBeginEditing(_:)), name: NSNotification.Name.UITextViewTextDidBeginEditing, object: nil)
                NotificationCenter.default.addObserver(self, selector: #selector(textViewDidEndEditing(_:)), name: NSNotification.Name.UITextViewTextDidEndEditing, object: nil)

                objc_setAssociatedObject(self, RuntimeKeyFromSelector(#function), view, .OBJC_ASSOCIATION_RETAIN_NONATOMIC);

            }
            return view!;
        }
        set {
            objc_setAssociatedObject(self, RuntimeKeyFromSelector(#function), newValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC);
        }
    }
    
    @objc func textViewDidBeginEditing(_ noti: Notification) -> Void {
        placeHolderTextView.isHidden = true
    }
    
    @objc func textViewDidEndEditing(_ noti: Notification) -> Void {
        placeHolderTextView.isHidden = false

    }
    
    
}
