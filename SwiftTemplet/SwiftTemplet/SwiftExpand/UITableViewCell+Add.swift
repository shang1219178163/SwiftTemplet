
//
//  UITableViewCell+Add.swift
//  SwiftTemplet
//
//  Created by hsf on 2018/8/29.
//  Copyright © 2018年 BN. All rights reserved.
//

import UIKit

extension UITableViewCell{
    
    /// cell默认identifier
    static var identifier: String {
        get {
            var str = objc_getAssociatedObject(self, AssociationKeyFromSelector(#function)) as? String;
            if str == nil {
                str = NSStringFromClass(classForCoder());
                objc_setAssociatedObject(self, AssociationKeyFromSelector(#function), str, .OBJC_ASSOCIATION_RETAIN_NONATOMIC);
            }
            return str!;
        }
        set {
            objc_setAssociatedObject(self, AssociationKeyFromSelector(#function), newValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC);
        }
    }
    
    /// cell-源方法生成,自定义identifier
    static func cellWithTableView(_ tableView:UITableView, identifier:String) -> UITableViewCell! {
        var cell = tableView.dequeueReusableCell(withIdentifier: identifier);
        if cell == nil {
            cell = self.init(style: .default, reuseIdentifier: identifier);
            
        }
        cell!.selectionStyle = .none;
        cell!.separatorInset = .zero;
        cell!.layoutMargins = .zero;
        return cell!;
    }
    
    /// cell-使用默认identifier生成
    static func cellWithTableView(_ tableView:UITableView) -> UITableViewCell! {
//        let identifier = NSStringFromClass(self.classForCoder());
//        return self.cellWithTableView(tableView, identifier: identifier);
        return self.cellWithTableView(tableView, identifier: self.identifier);

    }
        
    var imgViewLeft: UIImageView {
        get {
            var imgView = objc_getAssociatedObject(self, AssociationKeyFromSelector(#function)) as? UIImageView;
            if imgView == nil {
                imgView = UIImageView(frame: .zero);
                imgView!.isUserInteractionEnabled = true;
                imgView!.contentMode = .scaleAspectFit;
                
                objc_setAssociatedObject(self, AssociationKeyFromSelector(#function), imgView, .OBJC_ASSOCIATION_RETAIN_NONATOMIC);

            }
            return imgView!;
        }
        set {
            objc_setAssociatedObject(self, AssociationKeyFromSelector(#function), newValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC);
        }
    }
    
    var imgViewRight: UIImageView {
        get {
            var imgView = objc_getAssociatedObject(self, AssociationKeyFromSelector(#function)) as? UIImageView;
            if imgView == nil {
                imgView = UIImageView(frame: .zero);
                imgView!.isUserInteractionEnabled = true;
                imgView!.contentMode = .scaleAspectFit;
                imgView!.image = UIImage(named: kIMG_arrowRight);
                
                objc_setAssociatedObject(self, AssociationKeyFromSelector(#function), imgView, .OBJC_ASSOCIATION_RETAIN_NONATOMIC);
                
            }
            return imgView!;
        }
        set {
            objc_setAssociatedObject(self, AssociationKeyFromSelector(#function), newValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC);
        }
    }
    
    var labelLeft: UILabel {
        get {
            var label = objc_getAssociatedObject(self, AssociationKeyFromSelector(#function)) as? UILabel;
            if label == nil {
                label = UILabel(frame: .zero);
                label!.textAlignment = .left;
                label!.numberOfLines = 0;
                label!.lineBreakMode = .byCharWrapping;
                objc_setAssociatedObject(self, AssociationKeyFromSelector(#function), label, .OBJC_ASSOCIATION_RETAIN_NONATOMIC);

            }
            return label!;
        }
        set {
            objc_setAssociatedObject(self, AssociationKeyFromSelector(#function), newValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC);
        }
    }
  
    var labelLeftSub: UILabel {
        get {
            var label = objc_getAssociatedObject(self, AssociationKeyFromSelector(#function)) as? UILabel;
            if label == nil {
                label = UILabel(frame: .zero);
                label!.textAlignment = .left;
                label!.numberOfLines = 0;
                label!.lineBreakMode = .byCharWrapping;
                objc_setAssociatedObject(self, AssociationKeyFromSelector(#function), label, .OBJC_ASSOCIATION_RETAIN_NONATOMIC);
                
            }
            return label!;
        }
        set {
            objc_setAssociatedObject(self, AssociationKeyFromSelector(#function)!, newValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC);
        }
    }
    
    
    var labelRight: UILabel {
        get {
            var label = objc_getAssociatedObject(self, AssociationKeyFromSelector(#function)) as? UILabel;
            if label == nil {
                label = UILabel(frame: .zero);
                label!.textAlignment = .left;
                label!.numberOfLines = 0;
                label!.lineBreakMode = .byCharWrapping;
                objc_setAssociatedObject(self, AssociationKeyFromSelector(#function), label, .OBJC_ASSOCIATION_RETAIN_NONATOMIC);
                
            }
            return label!;
        }
        set {
            objc_setAssociatedObject(self, AssociationKeyFromSelector(#function), newValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC);
        }
    }
    
    var btn: UIButton {
        get {
            var button = objc_getAssociatedObject(self, AssociationKeyFromSelector(#function)) as? UIButton;
            if button == nil {
                button = UIButton(type: .custom);
                button!.titleLabel?.adjustsFontSizeToFitWidth = true;
                button!.titleLabel?.minimumScaleFactor = 1.0;
                button!.isExclusiveTouch = true;
                
                objc_setAssociatedObject(self, AssociationKeyFromSelector(#function), button, .OBJC_ASSOCIATION_RETAIN_NONATOMIC);

            }
            return button!;
        }
        set {
            objc_setAssociatedObject(self, AssociationKeyFromSelector(#function), newValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC);
        }
    }
    
    var textField: UITextField {
        get {
            var tf = objc_getAssociatedObject(self, AssociationKeyFromSelector(#function)) as? UITextField;
            if tf == nil {
                tf = UITextField(frame: .zero);
                tf!.textAlignment = .left;
                tf!.contentVerticalAlignment = .center;
                tf!.autocapitalizationType = .none;
                tf!.autocorrectionType = .no;
                tf!.clearButtonMode = .whileEditing;
                tf!.backgroundColor = .white;
                
                objc_setAssociatedObject(self, AssociationKeyFromSelector(#function), tf, .OBJC_ASSOCIATION_RETAIN_NONATOMIC);
                
            }
            return tf!;
        }
        set {
            objc_setAssociatedObject(self, AssociationKeyFromSelector(#function), newValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC);
        }
    }
    
    var textView: UITextView {
        get {
            var tv = objc_getAssociatedObject(self, AssociationKeyFromSelector(#function)) as? UITextView;
            if tv == nil {
                tv = UITextView(frame: .zero);
                tv!.textAlignment = .left;
                tv!.autocapitalizationType = .none;
                tv!.autocorrectionType = .no;
                tv!.backgroundColor = .white;
                
                objc_setAssociatedObject(self, AssociationKeyFromSelector(#function), tv, .OBJC_ASSOCIATION_RETAIN_NONATOMIC);
                
            }
            return tv!;
        }
        set {
            objc_setAssociatedObject(self, AssociationKeyFromSelector(#function), newValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC);
        }
    }
}