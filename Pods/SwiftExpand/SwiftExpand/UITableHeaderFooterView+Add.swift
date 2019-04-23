//
//  UITableHeaderFooterView+Add.swift
//  BuildUI
//
//  Created by Bin Shang on 2018/12/20.
//  Copyright © 2018 Bin Shang. All rights reserved.
//

import UIKit

extension UITableViewHeaderFooterView{
    
    /// cell-源方法生成,自定义identifier
    @objc public static func viewWithTableView(_ tableView: UITableView, identifier: String = NSStringFromClass(classForCoder())) -> UITableViewHeaderFooterView! {
        var obj = tableView.dequeueReusableHeaderFooterView(withIdentifier: identifier)
        if obj == nil {
            obj = self.init(reuseIdentifier: identifier)

        }
      
        obj!.lineTop.isHidden = false
        obj!.lineBottom.isHidden = false
        return obj!;
    }
    
    /// cell-使用默认identifier生成
    @objc public static func viewWithTableView(_ tableView:UITableView) -> UITableViewHeaderFooterView! {
        let identifier = NSStringFromClass(self.classForCoder());
        return viewWithTableView(tableView, identifier: identifier);
        
    }
    
    @objc public var indicatorView: UIImageView {
        get {
            var obj = objc_getAssociatedObject(self, RuntimeKeyFromSelector(#function)) as? UIImageView;
            if obj == nil {
                obj = UIImageView(frame: .zero);
                obj!.autoresizingMask = UIViewAutoresizing(rawValue: UIViewAutoresizing.flexibleWidth.rawValue | UIViewAutoresizing.flexibleHeight.rawValue)
                
                obj!.isUserInteractionEnabled = true;
                obj!.contentMode = .scaleAspectFit;
                
                objc_setAssociatedObject(self, RuntimeKeyFromSelector(#function), obj, .OBJC_ASSOCIATION_RETAIN_NONATOMIC);
                
            }
            return obj!;
        }
        set {
            objc_setAssociatedObject(self, RuntimeKeyFromSelector(#function), newValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC);
        }
    }
    
    @objc public var imgViewLeft: UIImageView {
        get {
            var obj = objc_getAssociatedObject(self, RuntimeKeyFromSelector(#function)) as? UIImageView;
            if obj == nil {
                obj = UIImageView(frame: .zero);
                obj!.autoresizingMask = UIViewAutoresizing(rawValue: UIViewAutoresizing.flexibleWidth.rawValue | UIViewAutoresizing.flexibleHeight.rawValue)

                obj!.isUserInteractionEnabled = true;
                obj!.contentMode = .scaleAspectFit;
                
                objc_setAssociatedObject(self, RuntimeKeyFromSelector(#function), obj, .OBJC_ASSOCIATION_RETAIN_NONATOMIC);
                
            }
            return obj!;
        }
        set {
            objc_setAssociatedObject(self, RuntimeKeyFromSelector(#function), newValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC);
        }
    }
    
    @objc public var imgViewRight: UIImageView {
        get {
            var obj = objc_getAssociatedObject(self, RuntimeKeyFromSelector(#function)) as? UIImageView;
            if obj == nil {
                obj = UIImageView(frame: .zero);
                obj!.autoresizingMask = UIViewAutoresizing(rawValue: UIViewAutoresizing.flexibleWidth.rawValue | UIViewAutoresizing.flexibleHeight.rawValue)
                obj!.isUserInteractionEnabled = true;
                obj!.contentMode = .scaleAspectFit;
                obj!.image = UIImage(named: kIMG_arrowRight);
                
                objc_setAssociatedObject(self, RuntimeKeyFromSelector(#function), obj, .OBJC_ASSOCIATION_RETAIN_NONATOMIC);
                
            }
            return obj!;
        }
        set {
            objc_setAssociatedObject(self, RuntimeKeyFromSelector(#function), newValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC);
        }
    }
    
    @objc public var labelLeft: UILabel {
        get {
            var obj = objc_getAssociatedObject(self, RuntimeKeyFromSelector(#function)) as? UILabel;
            if obj == nil {
                obj = UILabel(frame: .zero);
                obj!.autoresizingMask = UIViewAutoresizing(rawValue: UIViewAutoresizing.flexibleWidth.rawValue | UIViewAutoresizing.flexibleHeight.rawValue)
                obj!.textAlignment = .left;
                obj!.numberOfLines = 0;
                obj!.lineBreakMode = .byCharWrapping;
                objc_setAssociatedObject(self, RuntimeKeyFromSelector(#function), obj, .OBJC_ASSOCIATION_RETAIN_NONATOMIC);
                
            }
            return obj!;
        }
        set {
            objc_setAssociatedObject(self, RuntimeKeyFromSelector(#function), newValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC);
        }
    }
    
    @objc public var labelLeftSub: UILabel {
        get {
            var obj = objc_getAssociatedObject(self, RuntimeKeyFromSelector(#function)) as? UILabel;
            if obj == nil {
                obj = UILabel(frame: .zero);
                obj!.autoresizingMask = UIViewAutoresizing(rawValue: UIViewAutoresizing.flexibleWidth.rawValue | UIViewAutoresizing.flexibleHeight.rawValue)
                obj!.textAlignment = .left;
                obj!.numberOfLines = 0;
                obj!.lineBreakMode = .byCharWrapping;
                obj!.font = UIFont.systemFont(ofSize: UIFont.labelFontSize - 2.0);
                objc_setAssociatedObject(self, RuntimeKeyFromSelector(#function), obj, .OBJC_ASSOCIATION_RETAIN_NONATOMIC);
                
            }
            return obj!;
        }
        set {
            objc_setAssociatedObject(self, RuntimeKeyFromSelector(#function)!, newValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC);
        }
    }
    
    @objc public var labelRight: UILabel {
        get {
            var obj = objc_getAssociatedObject(self, RuntimeKeyFromSelector(#function)) as? UILabel;
            if obj == nil {
                obj = UILabel(frame: .zero);
                obj!.autoresizingMask = UIViewAutoresizing(rawValue: UIViewAutoresizing.flexibleWidth.rawValue | UIViewAutoresizing.flexibleHeight.rawValue)
                obj!.textAlignment = .left;
                obj!.numberOfLines = 0;
                obj!.lineBreakMode = .byCharWrapping;
                objc_setAssociatedObject(self, RuntimeKeyFromSelector(#function), obj, .OBJC_ASSOCIATION_RETAIN_NONATOMIC);
                
            }
            return obj!;
        }
        set {
            objc_setAssociatedObject(self, RuntimeKeyFromSelector(#function), newValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC);
        }
    }
    
    @objc public var btn: UIButton {
        get {
            var obj = objc_getAssociatedObject(self, RuntimeKeyFromSelector(#function)) as? UIButton;
            if obj == nil {
                obj = UIButton(type: .custom);
                obj!.autoresizingMask = UIViewAutoresizing(rawValue: UIViewAutoresizing.flexibleWidth.rawValue | UIViewAutoresizing.flexibleHeight.rawValue)
                obj!.titleLabel?.adjustsFontSizeToFitWidth = true;
                obj!.titleLabel?.minimumScaleFactor = 1.0;
                obj!.isExclusiveTouch = true;
                
                objc_setAssociatedObject(self, RuntimeKeyFromSelector(#function), obj, .OBJC_ASSOCIATION_RETAIN_NONATOMIC);
                
            }
            return obj!;
        }
        set {
            objc_setAssociatedObject(self, RuntimeKeyFromSelector(#function), newValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC);
        }
    }
    
    @objc public var textfield: UITextField {
        get {
            var obj = objc_getAssociatedObject(self, RuntimeKeyFromSelector(#function)) as? UITextField;
            if obj == nil {
                obj = UITextField(frame: .zero);
                obj!.autoresizingMask = UIViewAutoresizing(rawValue: UIViewAutoresizing.flexibleWidth.rawValue | UIViewAutoresizing.flexibleHeight.rawValue)
                obj!.textAlignment = .left;
                obj!.contentVerticalAlignment = .center;
                obj!.autocapitalizationType = .none;
                obj!.autocorrectionType = .no;
                obj!.clearButtonMode = .whileEditing;
                obj!.backgroundColor = .white;
                
                objc_setAssociatedObject(self, RuntimeKeyFromSelector(#function), obj, .OBJC_ASSOCIATION_RETAIN_NONATOMIC);
                
            }
            return obj!;
        }
        set {
            objc_setAssociatedObject(self, RuntimeKeyFromSelector(#function), newValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC);
        }
    }
    
    @objc public var isOpen: Bool {
        get {
            if let obj = objc_getAssociatedObject(self, RuntimeKeyFromSelector(#function)) as? Bool {
                return obj
            } else {
                return false
            }
        }
        set {
            objc_setAssociatedObject(self, RuntimeKeyFromSelector(#function), newValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        }
    }
    
    @objc public var isCanOpen: Bool {
        get {
            if let obj = objc_getAssociatedObject(self, RuntimeKeyFromSelector(#function)) as? Bool {
                return obj
            } else {
                return false
            }
        }
        set {
            objc_setAssociatedObject(self, RuntimeKeyFromSelector(#function), newValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        }
    }
}

public class BNFoldSectionModel: NSObject{
    @objc public var title = "标题"
    @objc public var titleSub = "子标题"
    @objc public var image = "图片名称"
    @objc public var isOpen = false
    @objc public var isCanOpen = false
    @objc public var headerHeight: CGFloat = 10.0
    @objc public var footerHeight: CGFloat = 0.01
    @objc public var headerColor: UIColor = .background
    @objc public var footerColor: UIColor = .background

    @objc public var dataList:[Any] = []

}
