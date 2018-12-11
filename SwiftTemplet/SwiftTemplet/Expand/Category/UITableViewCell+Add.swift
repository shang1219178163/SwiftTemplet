
//
//  UITableViewCell+Add.swift
//  SwiftTemplet
//
//  Created by hsf on 2018/8/29.
//  Copyright © 2018年 BN. All rights reserved.
//

import UIKit

extension UITableViewCell{
    
    static func cellWithTableView(_ tableView:UITableView, identifier:String) -> UITableViewCell! {
                
        var cell = tableView.dequeueReusableCell(withIdentifier: identifier);
        if cell == nil {
            cell = self.init(style: UITableViewCellStyle.default, reuseIdentifier: identifier);
            
        }
        
        cell!.selectionStyle = UITableViewCellSelectionStyle.none;
        cell!.separatorInset = UIEdgeInsets.zero;
        return cell!;
    }
    
    static func cellWithTableView(_ tableView:UITableView) -> UITableViewCell {
        let identifier = NSStringFromClass(self.classForCoder());
        return self.cellWithTableView(tableView, identifier: identifier);
    }
        
    var imgViewLeft: UIImageView {
        get {
            var imgView = objc_getAssociatedObject(self, AssociationKeyFromSelector(#function)) as? UIImageView;
            if imgView == nil {
                imgView = UIImageView(frame: CGRect.zero);
                imgView?.isUserInteractionEnabled = true;
                imgView?.contentMode = UIViewContentMode.scaleAspectFit;
                
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
                imgView = UIImageView(frame: CGRect.zero);
                imgView?.isUserInteractionEnabled = true;
                imgView?.contentMode = UIViewContentMode.scaleAspectFit;
                imgView?.image = UIImage(named: kIMG_arrowRight);
                
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
                label = UILabel(frame: CGRect.zero);
                label?.textAlignment = NSTextAlignment.left;
                label?.numberOfLines = 0;
                label?.lineBreakMode = NSLineBreakMode.byCharWrapping;
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
                label = UILabel(frame: CGRect.zero);
                label?.textAlignment = NSTextAlignment.left;
                label?.numberOfLines = 0;
                label?.lineBreakMode = NSLineBreakMode.byCharWrapping;
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
                label = UILabel(frame: CGRect.zero);
                label?.textAlignment = NSTextAlignment.left;
                label?.numberOfLines = 0;
                label?.lineBreakMode = NSLineBreakMode.byCharWrapping;
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
                tf = UITextField(frame: CGRect.zero);
                tf?.textAlignment = NSTextAlignment.left;
                tf?.contentVerticalAlignment = UIControlContentVerticalAlignment.center;
                tf?.autocapitalizationType = UITextAutocapitalizationType.none;
                tf?.autocorrectionType = UITextAutocorrectionType.no;
                tf?.clearButtonMode = UITextFieldViewMode.whileEditing;
                tf?.backgroundColor = UIColor.white;
                
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
                tv = UITextView(frame: CGRect.zero);
                tv?.textAlignment = NSTextAlignment.left;
                tv?.autocapitalizationType = UITextAutocapitalizationType.none;
                tv?.autocorrectionType = UITextAutocorrectionType.no;
                tv?.backgroundColor = UIColor.white;
                
                objc_setAssociatedObject(self, AssociationKeyFromSelector(#function), tv, .OBJC_ASSOCIATION_RETAIN_NONATOMIC);
                
            }
            return tv!;
        }
        set {
            objc_setAssociatedObject(self, AssociationKeyFromSelector(#function), newValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC);
        }
    }

    



}
