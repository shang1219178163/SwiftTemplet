//
//  UIView+Helper.swift
//  SwiftTemplet
//
//  Created by hsf on 2018/8/14.
//  Copyright © 2018年 BN. All rights reserved.
//

import Foundation
import UIKit


extension UIView{
    
    var width: CGFloat {
        get {
            return self.frame.width
        }
        set {
            self.frame.size.width = newValue
        }
    }
    
    var height: CGFloat {
        get {
            return self.frame.size.height
        }
        set {
            self.frame.size.height = newValue
        }
    }
    
    var size: CGSize  {
        get {
            return self.frame.size
        }
        set{
            self.frame.size = newValue
        }
    }
    
    var origin: CGPoint {
        get {
            return self.frame.origin
        }
        set {
            self.frame.origin = newValue
        }
    }
    
    var x: CGFloat {
        get {
            return self.frame.origin.x
        }
        set {
            self.frame.origin = CGPoint(x:newValue, y:self.frame.origin.y)
        }
    }
    
    var y: CGFloat {
        get {
            return self.frame.origin.y
        }
        set {
            self.frame.origin = CGPoint(x:self.frame.origin.x, y:newValue)
        }
    }
    
    var centerX: CGFloat {
        get {
            return self.center.x
        }
        set {
            self.center = CGPoint(x:newValue, y:self.center.y)
        }
    }
    
    var centerY: CGFloat {
        get {
            return self.center.y
        }
        set {
            self.center = CGPoint(x:self.center.x, y:newValue)
        }
    }
    
    var left: CGFloat {
        get {
            return self.frame.origin.x
        }
        set {
            self.frame.origin.x = newValue
        }
    }
    
    var right: CGFloat {
        get {
            return self.frame.origin.x + self.frame.size.width
        }
        set {
            self.frame.origin.x = newValue - self.frame.size.width
        }
    }
    
    var top: CGFloat {
        get {
            return self.frame.origin.y
        }
        set {
            self.frame.origin.y = newValue
        }
    }
    
    var bottom: CGFloat {
        get {
            return self.frame.origin.y + self.frame.size.height
        }
        set {
            self.frame.origin.y = newValue - self.frame.size.height
        }
    }
    
    var cornerRadius: CGFloat {
        get {
            return self.layer.cornerRadius
        }
        set {
            self.layer.masksToBounds = true
            self.layer.cornerRadius = newValue
        }
    }
    
    
    func getViewLayer() -> () {
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
    
//    /// 运行时关联
//    private var viewBlock: ViewClick? {
//        set {
//            objc_setAssociatedObject(self, RuntimeKey.viewBlock!, newValue, .OBJC_ASSOCIATION_COPY_NONATOMIC);
//        }
//        get {
//            return  objc_getAssociatedObject(self, RuntimeKey.viewBlock!) as? ViewClick;
//        }
//    }
   
    func addActionHandler(action:@escaping (ViewClick)) -> Void {
//        func addActionHandler(action:@escaping ((UITapGestureRecognizer?,UIView,NSInteger)->())) -> Void {

        if let sender = self as? UIButton {
            sender.addTarget(self, action:#selector(handleActionSender(sender:)), for:.touchUpInside);
            
        }
        else if let sender = self as? UIControl {
            sender.addTarget(self, action:#selector(handleActionSender(sender:)), for:.valueChanged);

        }
        else{
            let recoginzer = objc_getAssociatedObject(self, RuntimeKey.tap);
            if recoginzer == nil {
                let recoginzer = UITapGestureRecognizer(target: self, action: #selector(handleActionTap(tap:)));
                
                self.isUserInteractionEnabled = true;
                self.addGestureRecognizer(recoginzer);
                
            }
        }
        objc_setAssociatedObject(self, RuntimeKey.tap, action, .OBJC_ASSOCIATION_RETAIN_NONATOMIC);
        
    }
    
    /// 点击回调
    @objc private func handleActionTap(tap:UITapGestureRecognizer) -> Void {
       let block = objc_getAssociatedObject(self, RuntimeKey.tap) as? ViewClick;
        if block != nil{
            block!(tap, tap.view!, tap.view!.tag);
        }
    }
    
   @objc private func handleActionSender(sender:UIControl) -> Void {
        let block = objc_getAssociatedObject(self, RuntimeKey.tap) as? ViewClick;
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
    

   static func createView(rect:CGRect, list:Array<String>!, numberOfRow:Int, viewHeight:CGFloat, padding:CGFloat, type:Int, action:@escaping (UITapGestureRecognizer?,UIView,NSInteger)->()) -> UIView! {
        
        let rowCount: Int = list.count % numberOfRow == 0 ? list.count/numberOfRow : list.count/numberOfRow + 1;
        
        let backView = UIView(frame: CGRect(x: rect.minX, y: rect.minY, width: rect.width, height: CGFloat(rowCount)*viewHeight + CGFloat(rowCount - 1)*padding));
        backView.backgroundColor = UIColor.green;
        
        let viewSize = CGSize(width: (backView.frame.width - CGFloat(numberOfRow - 1)*padding)/CGFloat(numberOfRow), height: viewHeight);
        for (i,value) in list.enumerated() {
            
            let x = (viewSize.width + padding) * CGFloat(i % numberOfRow);
            let y = (viewSize.height + padding) * CGFloat(i / numberOfRow);
            let rect = CGRect(x: x, y: y, width: viewSize.width, height: viewSize.height);
            
            var view: UIView;
            switch type {
            case 1:
                let imgView = UIImageView(frame: rect);
                imgView.isUserInteractionEnabled = true;
                imgView.contentMode = UIViewContentMode.scaleAspectFit;
                imgView.image = UIImage(named: value);
                
                view = imgView;
                
            case 2:
                let label = UILabel(frame: rect);
                label.text = value;
                label.textAlignment = NSTextAlignment.center;
                label.numberOfLines = 0;
                label.lineBreakMode = NSLineBreakMode.byCharWrapping;
                
                view = label;
                
            default:
                let button = UIButton(type: .custom);
                button.frame = rect;
                button.setTitle(value, for: UIControlState.normal);
                button.titleLabel?.font = UIFont.systemFont(ofSize: 15);
                button.titleLabel?.adjustsFontSizeToFitWidth = true;
                button.titleLabel?.minimumScaleFactor = 1.0;
                button.isExclusiveTouch = true;
                
                button.setTitleColor(UIColor.black, for: UIControlState.normal);
                button.backgroundColor = UIColor.white;
                view = button;
            }
            view.tag = i;
            
            backView.addSubview(view);
            
            view.addActionHandler { (tap, itemView, idx) in
                action(tap,itemView,idx);
                
            }
        }
        return backView;
        
    }
    
    
    
    
}
