
//
//  UITableViewCell+Add.swift
//  SwiftTemplet
//
//  Created by hsf on 2018/8/29.
//  Copyright © 2018年 BN. All rights reserved.
//

import UIKit

public extension UITableViewCell{
    
    /// cell默认identifier
    public static var identifier: String {
        get {
            var str = objc_getAssociatedObject(self, RuntimeKeyFromSelector(#function)) as? String;
            if str == nil {
                str = NStringShortFromClass(classForCoder());
                objc_setAssociatedObject(self, RuntimeKeyFromSelector(#function), str, .OBJC_ASSOCIATION_RETAIN_NONATOMIC);
            }
            return str!;
        }
        set {
            objc_setAssociatedObject(self, RuntimeKeyFromSelector(#function), newValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC);
        }
    }
    
    /// cell-源方法生成,自定义identifier
    public static func cellWithTableView(_ tableView:UITableView, identifier:String, style:UITableViewCell.CellStyle) -> UITableViewCell! {
        var cell = tableView.dequeueReusableCell(withIdentifier: identifier);
        if cell == nil {
            cell = self.init(style: style, reuseIdentifier: identifier);
            
        }
     
        cell!.selectionStyle = .none;
        cell!.separatorInset = .zero;
        cell!.layoutMargins = .zero;
        return cell!;
    }
    
    public static func cellWithTableView(_ tableView:UITableView, identifier:String) -> UITableViewCell! {
        return cellWithTableView(tableView, identifier: identifier, style: .default);
    }

    /// cell-使用默认identifier生成
    public static func cellWithTableView(_ tableView:UITableView) -> UITableViewCell! {
//        let identifier = NSStringFromClass(self.classForCoder());
        return cellWithTableView(tableView, identifier: identifier);
    }
        
    public var imgViewLeft: UIImageView {
        get {
            var view = objc_getAssociatedObject(self, RuntimeKeyFromSelector(#function)) as? UIImageView;
            if view == nil {
                view = UIImageView(frame: .zero);
                view!.autoresizingMask = UIViewAutoresizing(rawValue: UIViewAutoresizing.flexibleWidth.rawValue | UIViewAutoresizing.flexibleHeight.rawValue)
                view!.isUserInteractionEnabled = true;
                view!.contentMode = .scaleAspectFit;
                
                objc_setAssociatedObject(self, RuntimeKeyFromSelector(#function), view, .OBJC_ASSOCIATION_RETAIN_NONATOMIC);

            }
            return view!;
        }
        set {
            objc_setAssociatedObject(self, RuntimeKeyFromSelector(#function), newValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC);
        }
    }
    
    public var imgViewRight: UIImageView {
        get {
            var view = objc_getAssociatedObject(self, RuntimeKeyFromSelector(#function)) as? UIImageView;
            if view == nil {
                view = UIImageView(frame: .zero);
                view!.autoresizingMask = UIViewAutoresizing(rawValue: UIViewAutoresizing.flexibleWidth.rawValue | UIViewAutoresizing.flexibleHeight.rawValue)
                view!.isUserInteractionEnabled = true;
                view!.contentMode = .scaleAspectFit;
                view!.image = UIImage(named: kIMG_arrowRight);
                
                objc_setAssociatedObject(self, RuntimeKeyFromSelector(#function), view, .OBJC_ASSOCIATION_RETAIN_NONATOMIC);
                
            }
            return view!;
        }
        set {
            objc_setAssociatedObject(self, RuntimeKeyFromSelector(#function), newValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC);
        }
    }
    
    public var labelLeft: UILabel {
        get {
            var view = objc_getAssociatedObject(self, RuntimeKeyFromSelector(#function)) as? UILabel;
            if view == nil {
                view = UILabel(frame: .zero);
                view!.autoresizingMask = UIViewAutoresizing(rawValue: UIViewAutoresizing.flexibleWidth.rawValue | UIViewAutoresizing.flexibleHeight.rawValue)
                view!.textAlignment = .left;
                view!.numberOfLines = 0;
                view!.lineBreakMode = .byCharWrapping;
                view!.isUserInteractionEnabled = true;

                objc_setAssociatedObject(self, RuntimeKeyFromSelector(#function), view, .OBJC_ASSOCIATION_RETAIN_NONATOMIC);

            }
            return view!;
        }
        set {
            objc_setAssociatedObject(self, RuntimeKeyFromSelector(#function), newValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC);
        }
    }
  
    public var labelLeftSub: UILabel {
        get {
            var view = objc_getAssociatedObject(self, RuntimeKeyFromSelector(#function)) as? UILabel;
            if view == nil {
                view = UILabel(frame: .zero);
                view!.autoresizingMask = UIViewAutoresizing(rawValue: UIViewAutoresizing.flexibleWidth.rawValue | UIViewAutoresizing.flexibleHeight.rawValue)
                view!.textAlignment = .left;
                view!.numberOfLines = 0;
                view!.lineBreakMode = .byCharWrapping;
                view!.font = UIFont.systemFont(ofSize: UIFont.labelFontSize - 2.0);
                view!.isUserInteractionEnabled = true;

                objc_setAssociatedObject(self, RuntimeKeyFromSelector(#function), view, .OBJC_ASSOCIATION_RETAIN_NONATOMIC);
                
            }
            return view!;
        }
        set {
            objc_setAssociatedObject(self, RuntimeKeyFromSelector(#function)!, newValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC);
        }
    }
    
    
    public var labelRight: UILabel {
        get {
            var view = objc_getAssociatedObject(self, RuntimeKeyFromSelector(#function)) as? UILabel;
            if view == nil {
                view = UILabel(frame: .zero);
                view!.autoresizingMask = UIViewAutoresizing(rawValue: UIViewAutoresizing.flexibleWidth.rawValue | UIViewAutoresizing.flexibleHeight.rawValue)
                view!.textAlignment = .left;
                view!.numberOfLines = 0;
                view!.lineBreakMode = .byCharWrapping;
                view!.isUserInteractionEnabled = true;

                objc_setAssociatedObject(self, RuntimeKeyFromSelector(#function), view, .OBJC_ASSOCIATION_RETAIN_NONATOMIC);
                
            }
            return view!;
        }
        set {
            objc_setAssociatedObject(self, RuntimeKeyFromSelector(#function), newValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC);
        }
    }
    
    public var btn: UIButton {
        get {
            var view = objc_getAssociatedObject(self, RuntimeKeyFromSelector(#function)) as? UIButton;
            if view == nil {
                view = UIButton(type: .custom);
                view!.autoresizingMask = UIViewAutoresizing(rawValue: UIViewAutoresizing.flexibleWidth.rawValue | UIViewAutoresizing.flexibleHeight.rawValue)
                view!.titleLabel?.adjustsFontSizeToFitWidth = true;
                view!.titleLabel?.minimumScaleFactor = 1.0;
                view!.isExclusiveTouch = true;
                
                objc_setAssociatedObject(self, RuntimeKeyFromSelector(#function), view, .OBJC_ASSOCIATION_RETAIN_NONATOMIC);

            }
            return view!;
        }
        set {
            objc_setAssociatedObject(self, RuntimeKeyFromSelector(#function), newValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC);
        }
    }
    
    public var textfield: UITextField {
        get {
            var view = objc_getAssociatedObject(self, RuntimeKeyFromSelector(#function)) as? UITextField;
            if view == nil {
                view = UITextField(frame: .zero);
                view!.autoresizingMask = UIViewAutoresizing(rawValue: UIViewAutoresizing.flexibleWidth.rawValue | UIViewAutoresizing.flexibleHeight.rawValue)
                view!.textAlignment = .left;
                view!.contentVerticalAlignment = .center;
                view!.autocapitalizationType = .none;
                view!.autocorrectionType = .no;
                view!.clearButtonMode = .whileEditing;
                view!.backgroundColor = .white;
                view!.returnKeyType = .done
                objc_setAssociatedObject(self, RuntimeKeyFromSelector(#function), view, .OBJC_ASSOCIATION_RETAIN_NONATOMIC);
                
            }
            return view!;
        }
        set {
            objc_setAssociatedObject(self, RuntimeKeyFromSelector(#function), newValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC);
        }
    }
    
    public var textView: UITextView {
        get {
            var view = objc_getAssociatedObject(self, RuntimeKeyFromSelector(#function)) as? UITextView;
            if view == nil {
                view = UITextView(frame: .zero);
                view!.autoresizingMask = UIViewAutoresizing(rawValue: UIViewAutoresizing.flexibleWidth.rawValue | UIViewAutoresizing.flexibleHeight.rawValue)
                view!.textAlignment = .left;
                view!.autocapitalizationType = .none;
                view!.autocorrectionType = .no;
                view!.backgroundColor = .white;
                
                objc_setAssociatedObject(self, RuntimeKeyFromSelector(#function), view, .OBJC_ASSOCIATION_RETAIN_NONATOMIC);
                
            }
            return view!;
        }
        set {
            objc_setAssociatedObject(self, RuntimeKeyFromSelector(#function), newValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC);
        }
    }
}
