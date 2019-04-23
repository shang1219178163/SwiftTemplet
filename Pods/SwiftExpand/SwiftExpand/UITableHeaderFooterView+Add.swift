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
    @objc public static func viewWithTableView(_ tableView:UITableView, identifier:String) -> UITableViewHeaderFooterView! {
        var view = tableView.dequeueReusableHeaderFooterView(withIdentifier: identifier)
        if view == nil {
            view = self.init(reuseIdentifier: identifier)

        }
      
        view!.lineTop.isHidden = false
        view!.lineBottom.isHidden = false
        return view!;
    }
    
    /// cell-使用默认identifier生成
    @objc public static func viewWithTableView(_ tableView:UITableView) -> UITableViewHeaderFooterView! {
        let identifier = NSStringFromClass(self.classForCoder());
        return viewWithTableView(tableView, identifier: identifier);
        
    }
    
    @objc public var indicatorView: UIImageView {
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
    
    @objc public var imgViewLeft: UIImageView {
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
    
    @objc public var imgViewRight: UIImageView {
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
    
    @objc public var labelLeft: UILabel {
        get {
            var view = objc_getAssociatedObject(self, RuntimeKeyFromSelector(#function)) as? UILabel;
            if view == nil {
                view = UILabel(frame: .zero);
                view!.autoresizingMask = UIViewAutoresizing(rawValue: UIViewAutoresizing.flexibleWidth.rawValue | UIViewAutoresizing.flexibleHeight.rawValue)
                view!.textAlignment = .left;
                view!.numberOfLines = 0;
                view!.lineBreakMode = .byCharWrapping;
                objc_setAssociatedObject(self, RuntimeKeyFromSelector(#function), view, .OBJC_ASSOCIATION_RETAIN_NONATOMIC);
                
            }
            return view!;
        }
        set {
            objc_setAssociatedObject(self, RuntimeKeyFromSelector(#function), newValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC);
        }
    }
    
    @objc public var labelLeftSub: UILabel {
        get {
            var view = objc_getAssociatedObject(self, RuntimeKeyFromSelector(#function)) as? UILabel;
            if view == nil {
                view = UILabel(frame: .zero);
                view!.autoresizingMask = UIViewAutoresizing(rawValue: UIViewAutoresizing.flexibleWidth.rawValue | UIViewAutoresizing.flexibleHeight.rawValue)
                view!.textAlignment = .left;
                view!.numberOfLines = 0;
                view!.lineBreakMode = .byCharWrapping;
                view!.font = UIFont.systemFont(ofSize: UIFont.labelFontSize - 2.0);
                objc_setAssociatedObject(self, RuntimeKeyFromSelector(#function), view, .OBJC_ASSOCIATION_RETAIN_NONATOMIC);
                
            }
            return view!;
        }
        set {
            objc_setAssociatedObject(self, RuntimeKeyFromSelector(#function)!, newValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC);
        }
    }
    
    @objc public var labelRight: UILabel {
        get {
            var view = objc_getAssociatedObject(self, RuntimeKeyFromSelector(#function)) as? UILabel;
            if view == nil {
                view = UILabel(frame: .zero);
                view!.autoresizingMask = UIViewAutoresizing(rawValue: UIViewAutoresizing.flexibleWidth.rawValue | UIViewAutoresizing.flexibleHeight.rawValue)
                view!.textAlignment = .left;
                view!.numberOfLines = 0;
                view!.lineBreakMode = .byCharWrapping;
                objc_setAssociatedObject(self, RuntimeKeyFromSelector(#function), view, .OBJC_ASSOCIATION_RETAIN_NONATOMIC);
                
            }
            return view!;
        }
        set {
            objc_setAssociatedObject(self, RuntimeKeyFromSelector(#function), newValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC);
        }
    }
    
    @objc public var btn: UIButton {
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
    
    @objc public var textfield: UITextField {
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
                
                objc_setAssociatedObject(self, RuntimeKeyFromSelector(#function), view, .OBJC_ASSOCIATION_RETAIN_NONATOMIC);
                
            }
            return view!;
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
