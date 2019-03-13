//
//  UIViewController+Helper.swift
//  SwiftTemplet
//
//  Created by hsf on 2018/5/16.
//  Copyright © 2018年 BN. All rights reserved.
//

import Foundation
import UIKit

public extension UIViewController{
    
    public var controllerName: String {
        get {
            var className:String = NStringShortFromClass(self.classForCoder);
            if className.contains("Controller") {
                var range = className.range(of: "Controller");
                if className.contains("ViewController") {
                    range = className.range(of: "ViewController");
                    
                }
                className = String(className[..<range!.lowerBound]);
            }
            return className;
        }
    }
    
    @objc private func handleActionItem(_ sender:UIBarButtonItem) -> Void {
        let block = objc_getAssociatedObject(self, sender.runtimeKey) as? ObjClosure;
        if block != nil {
            block!(sender);

        }
    }
    
    public func createBarItem(_ systemItem:UIBarButtonItem.SystemItem, isLeft:Bool, action:@escaping (ObjClosure)) -> Void {
        let funcAbount = NSStringFromSelector(#function) + ",\(systemItem)" + ",\(isLeft)"
        let runtimeKey = RuntimeKeyFromParams(self, funcAbount: funcAbount)!
        
        let item:UIBarButtonItem = UIBarButtonItem(barButtonSystemItem: systemItem, target: self, action: #selector(handleActionItem(_:)));
        item.systemType = systemItem;
        if isLeft == true {
            navigationItem.leftBarButtonItem = item;
        }
        else{
            navigationItem.rightBarButtonItem = item;
        }
        item.runtimeKey = runtimeKey
        objc_setAssociatedObject(self, runtimeKey, action, .OBJC_ASSOCIATION_COPY_NONATOMIC);

    }
    
    public func createBtnBarItem(_ title:String?, image:String?, isLeft:Bool, isHidden:Bool, action:@escaping (ControlClosure)) -> UIButton {
        var size = CGSize(width: 32, height: 32)
        if image != nil && UIImage(named:image!) != nil {
            size = CGSize(width: 40, height: 40)
        }
        
        let rect = CGRect(x: 0, y: 0, width: size.width, height: size.height);
        let btn = UIView.createBtn(rect, title: title, font: 16, imgName: image, tag: kTAG_BTN, type: 3)
        btn.tag = isLeft == true ? kTAG_BackItem : kTAG_RightItem;
        btn.isHidden = isHidden;
        btn.sizeToFit();

        //        let view = UIView(frame: CGRect(x: 0, y: 0, width: 44, height: 44));
        //        view.isHidden = isHidden;
        //        btn.center = view.center;
        //        view.addSubview(btn);
        
        if image != nil && UIImage(named:image!) != nil {
            btn.setImage(UIImage(named:image!), for: .normal);
        }
        else{
            if title!.isEmpty == false{
                btn.setTitle(title, for: .normal);
                if title!.count == 4{
                    btn.titleLabel?.adjustsFontSizeToFitWidth = true;
                    btn.titleLabel?.minimumScaleFactor = 1;
                    
                }
            }
        }
        
        btn.addActionHandler(action, for: .touchUpInside)
        let item:UIBarButtonItem = UIBarButtonItem(customView: btn);
        if isLeft == true {
            navigationItem.leftBarButtonItem = item;
        }
        else{
            navigationItem.rightBarButtonItem = item;
        }
        return btn;
    }

    @objc public func goController(_ name: String!, obj: AnyObject?, objOne: AnyObject?) -> Void {
        assert(UICtrFromString(name).isKind(of: UIViewController.classForCoder()))
        let controller = UICtrFromString(name)
        controller.obj = obj
        controller.objOne = objOne
        navigationController?.pushViewController(controller, animated: true);
    }
    
    public func addControllerName(_ controllerName: String) -> Void {
        let controller = UICtrFromString(controllerName)
        assert(controller.isKind(of: UIViewController.classForCoder()))

        addChildViewController(controller)
        view.addSubview(controller.view)
        controller.didMove(toParentViewController: self)
    }
}


