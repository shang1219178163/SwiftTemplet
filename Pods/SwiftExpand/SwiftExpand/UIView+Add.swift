
//
//  UIView+Add.swift
//  SwiftTemplet
//
//  Created by Bin Shang on 2018/8/27.
//  Copyright © 2018年 BN. All rights reserved.
//

import UIKit


extension UIView {
    
    @objc public var lineTop: UIView {
        get {
            var view = objc_getAssociatedObject(self, RuntimeKeyFromSelector(#function)) as? UIView;
            if view == nil {
                view = UIView(frame: CGRect(x: 0, y: 0, width: frame.width, height: kH_LINE_VIEW));
                view!.backgroundColor = .line

                objc_setAssociatedObject(self, RuntimeKeyFromSelector(#function), view, .OBJC_ASSOCIATION_RETAIN_NONATOMIC);
            }
            return view!;
        }
        set {
            objc_setAssociatedObject(self, RuntimeKeyFromSelector(#function), newValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC);
        }
    }
    
    @objc public var lineBottom: UIView {
        get {
            var view = objc_getAssociatedObject(self, RuntimeKeyFromSelector(#function)) as? UIView;
            if view == nil {
                view = UIView(frame: CGRect(x: 0, y: frame.maxY - kH_LINE_VIEW, width: frame.width, height: frame.height));
                view!.backgroundColor = .line
                
                objc_setAssociatedObject(self, RuntimeKeyFromSelector(#function), view, .OBJC_ASSOCIATION_RETAIN_NONATOMIC);
            }
            return view!;
        }
        set {
            objc_setAssociatedObject(self, RuntimeKeyFromSelector(#function), newValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC);
        }
    }
    
    /// 渐变色层
    @objc public var gradientLayer: CAGradientLayer {
        get {
            var layer = objc_getAssociatedObject(self, RuntimeKeyFromSelector(#function)) as? CAGradientLayer;
            if layer == nil {
                let colors = [UIColor.theme.withAlphaComponent(0.5).cgColor, UIColor.theme.withAlphaComponent(0.9).cgColor]
                layer = CAGradientLayer.layerRect(.zero, colors: colors, start: CGPointMake(0, 0), end: CGPointMake(1.0, 0))
                objc_setAssociatedObject(self, RuntimeKeyFromSelector(#function), layer, .OBJC_ASSOCIATION_RETAIN_NONATOMIC);
            }
            return layer!;
        }
        set {
            objc_setAssociatedObject(self, RuntimeKeyFromSelector(#function), newValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC);
        }
    }
    
    /// (与holderView配置方法)配套使用
    @objc public var holderView: UIView {
        get {
            var obj = objc_getAssociatedObject(self, RuntimeKeyFromSelector(#function)) as? UIView;
            if obj == nil {
                obj = UIView(frame: bounds);
                obj!.backgroundColor = UIColor.white

                obj!.isHidden = true;

                let height = bounds.height - 25*2
                let YGap = height*0.2
                let imgView = UIImageView(frame: CGRectMake(0, YGap, bounds.width, height*0.3))
                imgView.contentMode = .scaleAspectFit
                imgView.tag = kTAG_IMGVIEW
                obj!.addSubview(imgView)

                let label = UILabel(frame: CGRectMake(0, imgView.frame.maxY + 25, bounds.width, 25))
                label.textAlignment = .center
                label.text = "暂无数据"
                label.textColor = UIColorHexValue(0x999999)
                label.tag = kTAG_LABEL
                obj!.addSubview(label)
                
                addSubview(obj!)
                objc_setAssociatedObject(self, RuntimeKeyFromSelector(#function), obj, .OBJC_ASSOCIATION_RETAIN_NONATOMIC);
            }
            return obj!;
        }
        set {
            objc_setAssociatedObject(self, RuntimeKeyFromSelector(#function), newValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC);
        }
    }
    
    /// 配置HolderView
    @objc public func holderView(_ title: String, image: String?) -> Void {
        let imgView: UIImageView = holderView.viewWithTag(kTAG_IMGVIEW) as! UIImageView
        let label: UILabel = holderView.viewWithTag(kTAG_LABEL) as! UILabel
        label.text = title
        if image == nil {
            label.center = CGPointMake(holderView.center.x, holderView.height*0.35)

        } else {
            imgView.image = UIImageNamed(image!)

        }
    }
    
    /// [源]UITableView创建
    @objc public static func createTableView(_ rect: CGRect, style: UITableView.Style, rowHeight: CGFloat) -> UITableView{
        let table = UITableView(frame: rect, style: style);
        table.autoresizingMask = UIViewAutoresizing(rawValue: UIViewAutoresizing.flexibleWidth.rawValue | UIViewAutoresizing.flexibleHeight.rawValue)
        
        table.separatorStyle = .singleLine;
        table.separatorInset = .zero;
        table.rowHeight = rowHeight;
        //        table.register(UITableViewCell.self, forCellReuseIdentifier: NSStringFromClass(UITableViewCell.self));
        table.register(UITableViewCell.self, forCellReuseIdentifier: UITableViewCell.identifier);
        table.keyboardDismissMode = .onDrag
        table.backgroundColor = UIColor.background;
        
        return table
    }
    /// [源]UILabel创建
    @objc public static func createLabel(_ rect: CGRect, text: String?, font: CGFloat, tag: Int, type: Int) -> UILabel {
        let view = UILabel(frame: rect);
        view.autoresizingMask = UIViewAutoresizing(rawValue: UIViewAutoresizing.flexibleWidth.rawValue | UIViewAutoresizing.flexibleHeight.rawValue)
        view.isUserInteractionEnabled = true;
        view.textAlignment = .left;
        
        view.text = text;
        view.font = UIFont.systemFont(ofSize: font);
        view.tag = tag;
        
        switch type {
        case 1:
            view.numberOfLines = 1;
            view.lineBreakMode = .byTruncatingTail;
            
        case 2:
            view.numberOfLines = 1;
            view.lineBreakMode = .byTruncatingTail;
            view.adjustsFontSizeToFitWidth = true;
            
        case 3:
            view.numberOfLines = 1;
            view.lineBreakMode = .byTruncatingTail;
            
            view.layer.borderColor = view.textColor.cgColor;
            view.layer.borderWidth = 1.0;
            view.layer.masksToBounds = true;
            view.layer.cornerRadius = rect.width*0.5;
            
        case 4:
            view.numberOfLines = 1;
            view.lineBreakMode = .byTruncatingTail;
            
            view.layer.borderColor = view.textColor.cgColor;
            view.layer.borderWidth = 1.0;
            view.layer.masksToBounds = true;
            view.layer.cornerRadius = 3;
            
        default:
            view.numberOfLines = 0;
            view.lineBreakMode = .byCharWrapping;
        }
        return view;
    }
    /// [源]UIImageView创建
    @objc public static func createImgView(_ rect: CGRect, imgName: String, tag: Int) -> UIImageView {
        let view = UIImageView(frame: rect);
        view.autoresizingMask = UIViewAutoresizing(rawValue: UIViewAutoresizing.flexibleWidth.rawValue | UIViewAutoresizing.flexibleHeight.rawValue)
        view.isUserInteractionEnabled = true;
        view.contentMode = .scaleAspectFit;
        view.image = UIImage(named: imgName);
        view.tag = tag;
        
        return view
    }
    /// [源]UIButton创建
    @objc public static func createBtn(_ rect: CGRect, title: String?, font: CGFloat, imgName: String?, tag: Int, type: Int) -> UIButton {
        let view = UIButton(type: .custom);
        view.titleLabel?.font = UIFont.systemFont(ofSize:16);
        view.titleLabel?.adjustsFontSizeToFitWidth = true;
        view.titleLabel?.minimumScaleFactor = 1.0;
        view.titleLabel?.font = UIFont.systemFont(ofSize: font);
        view.imageView?.contentMode = .scaleAspectFit
        view.isExclusiveTouch = true;
        view.adjustsImageWhenHighlighted = false;

        view.frame = rect;
        view.setTitle(title, for: .normal)
        view.tag = tag;
        switch type {
        case 1://白色字体,主题色背景
            view.setTitleColor( .white, for: .normal)
            view.backgroundColor = .theme
            
        case 2:
            view.setTitleColor( .red, for: .normal);

        case 3://导航栏专用
            view.setTitleColor( .white, for: .normal);

        case 4://地图定位按钮一类
            view.setBackgroundImage(UIImageNamed(imgName!), for: .normal)
            view.setBackgroundImage(UIImageColor( .lightGray), for: .disabled)
            
        default://黑色字体,白色背景
            view.setTitleColor( .black, for: .normal)
            
        }
        return view
    }
    /// [源]UITextField创建
    @objc public static func createTextField(_ rect: CGRect, tag: Int) -> UITextField {
        let view = UITextField(frame: rect);
        view.autoresizingMask = UIViewAutoresizing(rawValue: UIViewAutoresizing.flexibleWidth.rawValue | UIViewAutoresizing.flexibleHeight.rawValue)
        view.contentVerticalAlignment = .center;
        view.autocapitalizationType = .none;
        view.autocorrectionType = .no;
        view.clearButtonMode = .whileEditing;
        view.backgroundColor = .white;
        view.returnKeyType = .done
        view.textAlignment = .left;
        view.tag = tag
        return view
    }
    /// [源]UITextView创建
    @objc public static func createTextView(_ rect: CGRect, tag: Int) -> UITextView {
        let view = UITextView(frame: rect);
        view.autoresizingMask = UIViewAutoresizing(rawValue: UIViewAutoresizing.flexibleWidth.rawValue | UIViewAutoresizing.flexibleHeight.rawValue)
        view.autocapitalizationType = .none;
        view.autocorrectionType = .no;
        view.backgroundColor = .white;
        
        view.layer.borderWidth = 0.5;
        view.layer.borderColor = UIColor.line.cgColor;
        
        view.textAlignment = .left;
        view.tag = tag
        return view
    }
    
    /// [源]HeaderView,footerView
    @objc public static func createSectionView(_ tableView: UITableView, text: String?, textAlignment: NSTextAlignment, height: CGFloat) -> UIView{
        let sectionView = UIView()
        if text == nil {
            return sectionView
        }
        let view = UILabel(frame: CGRect(x: kX_GAP, y: 0, width: tableView.width - kX_GAP*2, height: height));
        view.isUserInteractionEnabled = true;
        view.lineBreakMode = .byTruncatingTail;
        view.adjustsFontSizeToFitWidth = true;
        view.text = text;
        view.textAlignment = textAlignment
        
        sectionView.addSubview(view)
        return sectionView
    }
    
    /// [源]GroupView创建
    @objc public static func createGroupView(_ rect:CGRect, list:Array<String>!, numberOfRow:Int, padding:CGFloat, type:Int, action:@escaping (UITapGestureRecognizer?,UIView,NSInteger)->()) -> UIView {
        
        let rowCount: Int = list.count % numberOfRow == 0 ? list.count/numberOfRow : list.count/numberOfRow + 1;
        let itemWidth = (rect.width - CGFloat(numberOfRow - 1)*padding)/CGFloat(numberOfRow)
        let itemHeight = (rect.height - CGFloat(rowCount - 1)*padding)/CGFloat(rowCount)
        
        let backView = UIView(frame: rect);
        for (i,value) in list.enumerated() {
            let x = CGFloat(i % numberOfRow) * (itemWidth + padding);
            let y = CGFloat(i / numberOfRow) * (itemHeight + padding);
            let rect = CGRect(x: x, y: y, width: itemWidth, height: itemHeight);
            
            var view: UIView;
            switch type {
            case 1:
                let imgView = UIImageView(frame: rect);
                imgView.isUserInteractionEnabled = true;
                imgView.contentMode = .scaleAspectFit;
                imgView.image = UIImage(named: value);
                
                view = imgView;
                
            case 2:
                let label = UILabel(frame: rect);
                label.text = value;
                label.textAlignment = .center;
                
                label.numberOfLines = 0;
                label.lineBreakMode = .byCharWrapping;
                
                view = label;
                
            default:
                let button = UIButton(type: .custom);
                button.frame = rect;
                button.setTitle(value, for: .normal);
                button.titleLabel?.font = UIFont.systemFont(ofSize: 15);
                button.titleLabel?.adjustsFontSizeToFitWidth = true;
                button.titleLabel?.minimumScaleFactor = 1.0;
                button.isExclusiveTouch = true;
                
                button.setTitleColor(UIColor.black, for: .normal);
                button.backgroundColor = UIColor.white;
                view = button;
            }
            view.tag = i;
            view.addActionHandler { (tap, itemView, idx) in
                action(tap,itemView,idx);
            }
            
            backView.addSubview(view);
        }
        return backView;
    }
    /// [源]UISegmentControl创建
    @objc public static func createSegment(_ rect: CGRect, items: Array<Any>!, selectedIdx: Int, type: Int) -> UISegmentedControl {
        let view = UISegmentedControl(items: items)
        view.frame = rect
        view.autoresizingMask = UIViewAutoresizing.flexibleWidth
        view.selectedSegmentIndex = selectedIdx
        
        switch type {
        case 1:
            view.tintColor = UIColor.theme
            view.backgroundColor = UIColor.white
            view.layer.borderWidth = 1.0
            view.layer.borderColor = UIColor.white.cgColor
            let dic_N = [NSAttributedStringKey.foregroundColor: UIColor.black,
                         NSAttributedStringKey.font :   UIFont.systemFont(ofSize: 15),
                         
                         ]
            view.setTitleTextAttributes(dic_N, for: .normal)
            view.setDividerImage(UIImageColor(UIColor.white), forLeftSegmentState: .normal, rightSegmentState: .normal, barMetrics: .default);
            
        case 2:
            view.tintColor = UIColor.white
            view.backgroundColor = UIColor.white
            
            let dic_N = [NSAttributedStringKey.foregroundColor: UIColor.black,
                         NSAttributedStringKey.font :   UIFont.systemFont(ofSize: 15),
                         ]
            
            let dic_H = [NSAttributedStringKey.foregroundColor: UIColor.theme,
                         NSAttributedStringKey.font :   UIFont.systemFont(ofSize: 18),
                         ]
            
            view.setTitleTextAttributes(dic_N, for: .normal)
            view.setTitleTextAttributes(dic_H, for: .selected)
            
        case 3:
            view.tintColor = UIColor.clear
            view.backgroundColor = UIColor.line
            
            let dic_N = [NSAttributedStringKey.foregroundColor: UIColor.black,
                         NSAttributedStringKey.font :   UIFont.systemFont(ofSize: 15),
                         
                         ]
            
            let dic_H = [NSAttributedStringKey.foregroundColor: UIColor.theme,
                         NSAttributedStringKey.font :   UIFont.systemFont(ofSize: 18),
                         
                         ]
            
            view.setTitleTextAttributes(dic_N, for: .normal)
            view.setTitleTextAttributes(dic_H, for: .selected)
            
        default:
            view.tintColor = UIColor.theme
            view.backgroundColor = UIColor.white
            
            let dic_N = [
                NSAttributedStringKey.font :   UIFont.systemFont(ofSize: 15),
                
                ]
            
            let dic_H = [
                NSAttributedStringKey.font :   UIFont.systemFont(ofSize: 18),
                
                ]
            
            view.setTitleTextAttributes(dic_N, for: .normal)
            view.setTitleTextAttributes(dic_H, for: .selected)
        }
        return view;
    }
    /// [源]UISlider创建
    @objc public static func createSlider(_ rect: CGRect, value: Float, minValue: Float, maxValue: Float) -> UISlider {
        let view = UISlider(frame: rect)
        view.autoresizingMask = UIViewAutoresizing.flexibleWidth
        view.minimumValue = minValue
        view.maximumValue = maxValue
        view.value = value;
        
        view.minimumTrackTintColor = UIColor.theme
        return view;
    }
    /// [源]UISwitch创建
    @objc public static func createSwitch(_ rect: CGRect, isOn: Bool) -> UISwitch {
        let view = UISwitch(frame: rect)
        view.autoresizingMask = UIViewAutoresizing.flexibleWidth
        view.isOn = isOn
        view.onTintColor = UIColor.theme
        return view
    }
 
}
