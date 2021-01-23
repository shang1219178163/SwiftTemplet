//
//  UIButton+Layer.swift
//  SwiftTemplet
//
//  Created by Bin Shang on 2021/1/23.
//  Copyright © 2021 BN. All rights reserved.
//

import UIKit

class NNButtonLayerTarget: NSObject {
    
    public weak var button: UIButton?
    
    ///addObserver(self, forKeyPath: "selected", options: .new, context: nil)
    var observerBlock:((String?, UIButton?, [NSKeyValueChangeKey: Any]?)->Void)?
    
    var borderColorDic = [UIControl.State.RawValue: UIColor]()
    var borderWidthDic = [UIControl.State.RawValue: CGFloat]()
    var cornerRadiusDic = [UIControl.State.RawValue: CGFloat]()
    
    // MARK: -lifecycle
    deinit {
        removeObserver(self, forKeyPath: "selected")
        removeObserver(self, forKeyPath: "highlighted")
    }
    
    // MARK: -observe
    override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
        if let sender = object as? UIButton {
            if keyPath == "selected" || keyPath == "highlighted" {
                changeLayerBorderColor(sender)
                changeLayerBorderWidth(sender)
                changeLayerCornerRadius(sender)
                observerBlock?(keyPath, sender, change)
            }
        } else {
            super.observeValue(forKeyPath: keyPath, of: object, change: change, context: context)
        }
    }

    // MARK: -public
    func setBorderColor(_ color: UIColor?, for state: UIControl.State){
        guard let color = color else { return }
        borderColorDic[state.rawValue] = color
        changeLayerBorderColor(button)
    }
    func borderColor(for state: UIControl.State) -> UIColor?{
        return borderColorDic[state.rawValue]
    }
    
    func setBorderWidth(_ value: CGFloat, for state: UIControl.State){
        borderWidthDic[state.rawValue] = value
        changeLayerBorderWidth(button)
    }
    func borderWidth(for state: UIControl.State) -> CGFloat{
        return borderWidthDic[state.rawValue] ?? 0
    }
    
    func setCornerRadius(_ value: CGFloat, for state: UIControl.State){
        cornerRadiusDic[state.rawValue] = value
        changeLayerCornerRadius(button)
    }
    func cornerRadius(for state: UIControl.State) -> CGFloat{
        return cornerRadiusDic[state.rawValue] ?? 0
    }

    // MARK: -private
    private func changeLayerBorderColor(_ sender: UIButton?) {
        guard let sender = sender,
              let normalColor = borderColorDic[UIControl.State.normal.rawValue] else { return }
        let color = borderColorDic[sender.state.rawValue] ?? normalColor
        sender.layer.borderColor = color.cgColor

        if sender.layer.borderWidth == 0 {
            sender.layer.borderWidth = 1
        }
    }
    
    private func changeLayerBorderWidth(_ sender: UIButton?) {
        guard let sender = sender,
              let normalValue = borderWidthDic[UIControl.State.normal.rawValue] else { return }
        let value = borderWidthDic[sender.state.rawValue] ?? normalValue
        sender.layer.borderWidth = value
        
        if sender.layer.borderWidth == 0 {
            sender.layer.borderWidth = 1
        }
    }
    
    private func changeLayerCornerRadius(_ sender: UIButton?) {
        guard let sender = sender,
              let normalValue = cornerRadiusDic[UIControl.State.normal.rawValue] else { return }
        let value = cornerRadiusDic[sender.state.rawValue] ?? normalValue
        sender.layer.cornerRadius = value

        if sender.layer.borderWidth == 0 {
            sender.layer.borderWidth = 1
        }
//        print(#function, sender.state.rawValue, value, cornerRadiusDic)
    }

}


public extension UIButton{
    private struct AssociateKeys {
        static var layerTarget   = "UIButton" + "layerTarget"
    }
    /// 关联UITableView视图对象
    private var layerTarget: NNButtonLayerTarget {
        get {
            if let obj = objc_getAssociatedObject(self, &AssociateKeys.layerTarget) as? NNButtonLayerTarget {
                return obj
            }

            let target = NNButtonLayerTarget()
            target.button = self
            
            target.button?.addObserver(target, forKeyPath: "selected", options: .new, context: nil)
            target.button?.addObserver(target, forKeyPath: "highlighted", options: .new, context: nil)

            objc_setAssociatedObject(self, &AssociateKeys.layerTarget, target, .OBJC_ASSOCIATION_RETAIN_NONATOMIC);
            return target
        }
    }
    
    func setBorderColor(_ color: UIColor?, for state: UIControl.State){
        layerTarget.setBorderColor(color, for: state)
    }

    func borderColor(for state: UIControl.State) -> UIColor?{
        return layerTarget.borderColor(for: state)
    }
    
    func setBorderWidth(_ value: CGFloat, for state: UIControl.State){
        layerTarget.setBorderWidth(value, for: state)
    }

    func borderWidth(for state: UIControl.State) -> CGFloat?{
        return layerTarget.borderWidth(for: state)
    }
    
    func setCornerRadius(_ value: CGFloat, for state: UIControl.State){
        layerTarget.setCornerRadius(value, for: state)
    }

    func cornerRadius(for state: UIControl.State) -> CGFloat?{
        return layerTarget.cornerRadius(for: state)
    }
}
