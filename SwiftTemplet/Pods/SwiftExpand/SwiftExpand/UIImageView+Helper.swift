//
//  UIImageView+Helper.swift
//  SwiftExpand
//
//  Created by Bin Shang on 2018/12/27.
//

import UIKit

public extension UIImageView{
    class func initializeMethod() {
        if self == UIImageView.self {
            let onceToken = "Method Swizzling_\(NSStringFromClass(classForCoder()))";
            //DispatchQueue函数保证代码只被执行一次，防止又被交换回去导致得不到想要的效果
            DispatchQueue.once(token: onceToken) {
                let oriSel0 = #selector(setter: self.tintColor)
                let repSel0 = #selector(self.swz_tintColor(_:))

                let _ = swizzleMethodInstance(UIImageView.self, origSel: oriSel0, replSel: repSel0);

            }
        }
    }
    
    @objc func swz_tintColor(_ color: UIColor!) -> Void {
        //需要注入的代码写在此处
        self.swz_tintColor(color)

        if self.image != nil {
            if self.image?.renderingMode != UIImageRenderingMode.alwaysTemplate {
                self.image = self.image!.withRenderingMode( .alwaysTemplate);

            }
        }
    }
    
    ///MARK:默认渲染AlwaysTemplate方式
    public func renderTintColor(_ tintColor:UIColor) -> Void {
        renderTintColor(tintColor, mode: .alwaysTemplate);
    }
    
    ///MARK:渲染
    public func renderTintColor(_ tintColor:UIColor, mode: UIImage.RenderingMode) -> Void {
        self.tintColor = tintColor
        self.image = self.image!.withRenderingMode(mode)
        //        self.image = self.image!.withRenderingMode( .alwaysTemplate)
        
    }
}



