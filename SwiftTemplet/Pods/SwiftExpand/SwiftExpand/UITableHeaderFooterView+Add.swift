//
//  UITableHeaderFooterView+Add.swift
//  BuildUI
//
//  Created by Bin Shang on 2018/12/20.
//  Copyright © 2018 Bin Shang. All rights reserved.
//

import UIKit

public extension UITableViewHeaderFooterView{
    
    /// cell-源方法生成,自定义identifier
    public static func viewWithTableView(_ tableView:UITableView, identifier:String) -> UITableViewHeaderFooterView! {
        var view = tableView.dequeueReusableHeaderFooterView(withIdentifier: identifier)
        if view == nil {
            view = self.init(reuseIdentifier: identifier)

        }
      
        view!.lineTop.isHidden = false
        view!.lineBottom.isHidden = false
        return view!;
    }
    
    /// cell-使用默认identifier生成
    public static func viewWithTableView(_ tableView:UITableView) -> UITableViewHeaderFooterView! {
        let identifier = NSStringFromClass(self.classForCoder());
        return viewWithTableView(tableView, identifier: identifier);
        
    }
    
    public var imgViewLeft: UIImageView {
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
    
    public var imgViewRight: UIImageView {
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
    
    public var labelLeft: UILabel {
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
    
    public var labelLeftSub: UILabel {
        get {
            var label = objc_getAssociatedObject(self, AssociationKeyFromSelector(#function)) as? UILabel;
            if label == nil {
                label = UILabel(frame: .zero);
                label!.textAlignment = .left;
                label!.numberOfLines = 0;
                label!.lineBreakMode = .byCharWrapping;
                label!.font = UIFont.systemFont(ofSize: UIFont.labelFontSize - 2.0);
                objc_setAssociatedObject(self, AssociationKeyFromSelector(#function), label, .OBJC_ASSOCIATION_RETAIN_NONATOMIC);
                
            }
            return label!;
        }
        set {
            objc_setAssociatedObject(self, AssociationKeyFromSelector(#function)!, newValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC);
        }
    }
    
    
    public var labelRight: UILabel {
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
    
    public var btn: UIButton {
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
    
    public var textfield: UITextField {
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
    
}

public class BNFoldSectionModel: NSObject{
    public var title = "标题"
    public var titleSub = "子标题"
    public var image = "图片名称"
    public var isOpen = false
    public var headerHeight: CGFloat = 10.0
    public var footerHeight: CGFloat = 0.01
    public var headerColor: UIColor = .background
    public var footerColor: UIColor = .background

    public var dataList:[Any] = []

}
