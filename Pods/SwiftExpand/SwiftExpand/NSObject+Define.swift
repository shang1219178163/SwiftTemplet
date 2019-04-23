//
//  NSObject+Define.swift
//  SwiftTemplet
//
//  Created by Bin Shang on 2018/8/28.
//  Copyright © 2018年 BN. All rights reserved.
//

import UIKit

// 定义数据类型(其实就是设置别名)
public typealias SwiftClosure = (AnyObject, AnyObject, Int) -> Void

public typealias ObjClosure = ((AnyObject) -> Void)
public typealias ViewClosure = ((UITapGestureRecognizer?, UIView, NSInteger) -> Void)
public typealias ControlClosure = (UIControl) -> Void
public typealias RecognizerClosure = (UIGestureRecognizer) -> Void

public typealias CellForRowClosure = ((UITableView, IndexPath) -> UITableViewCell?)
public typealias DidSelectRowClosure = ((UITableView, IndexPath) -> Void)

// MARK: - 关联属性的key
public struct RuntimeKey {
    public static let tap = UnsafeRawPointer(bitPattern: "tap".hashValue)!;
    public static let item = UnsafeRawPointer(bitPattern: "item".hashValue)!;
//    public static let control = UnsafeRawPointer(bitPattern: "control".hashValue)!;

}

public func RuntimeKeyFromParams(_ obj: NSObject!, funcAbount: String!) -> UnsafeRawPointer! {
    let unique = "\(obj.hashValue)," + funcAbount
    let key:UnsafeRawPointer = UnsafeRawPointer(bitPattern: unique.hashValue)!
    return key;
}

public func RuntimeKeyFromString(_ obj: String) -> UnsafeRawPointer! {
    let key:UnsafeRawPointer = UnsafeRawPointer(bitPattern: obj.hashValue)!
    return key;
}

public func RuntimeKeyFromSelector(_ aSelector: Selector) -> UnsafeRawPointer! {
    let aSelectorName = NSStringFromSelector(aSelector);
    let key:UnsafeRawPointer = RuntimeKeyFromString(aSelectorName)
    return key;
}

/// 自定义CGRect
public func CGRectMake(_ x: CGFloat,_ y: CGFloat,_ w: CGFloat,_ h: CGFloat) -> CGRect{
    return CGRect(x: x, y: y, width: w, height: h)
}

/// 自定义CGPointMake
public func CGPointMake(_ x: CGFloat,_ y: CGFloat) -> CGPoint {
    return CGPoint(x: x, y: y)
}

/// 自定义GGSizeMake
public func GGSizeMake(_ w: CGFloat,_ h: CGFloat) -> CGSize {
    return CGSize(width: w, height: h)
}

public func NSStringFromIndexPath(_ indexPath:IndexPath) -> String {
    return String(format: "{%d,%d}", indexPath.section, indexPath.row);
}

public func iOSVer(version:Float)->Bool{
    return (UIDevice.current.systemVersion as NSString).floatValue > version;
}

public func kScaleWidth(_ width: CGFloat) -> CGFloat {
    return width * UIScreen.main.bounds.size.width / 320.0
}

//获取本地创建类
public func SwiftClassFromString(_ name:String) -> AnyClass {
    //    let nameKey = "CFBundleName";
    //    这里也是坑，请不要翻译oc的代码，而是去NSBundle类里面看它的api
    //    let appName = Bundle.main.infoDictionary!["CFBundleName"] as? String;
    let nameSpace  = UIApplication.appName;
    let cls : AnyClass = NSClassFromString(nameSpace + "." + name)!;
    return cls;
}

public func UICtrFromString(_ vcName:String) -> UIViewController {
    // 动态获取命名空间
    //    let appName = Bundle.main.infoDictionary!["CFBundleName"] as! String;
    //字符串转类
    //    let cls: AnyClass? = NSClassFromString(appName + "." + vcName);
    
    let cls:AnyClass = SwiftClassFromString(vcName);
    // 通过类创建对象， 不能用cls.init(),有的类可能没有init方法
    // 需将cls转换为制定类型
    let vcCls = cls as! UIViewController.Type;
    
    // 创建对象
    let controller:UIViewController = vcCls.init();
    return controller;
}

public func UINavCtrFromObj(_ obj:AnyObject) -> UINavigationController?{
    if obj is UINavigationController {
        return obj as? UINavigationController;
        
    }else if obj is String {
        return UINavigationController(rootViewController: UICtrFromString(obj as! String));
        
    }else if obj is UIViewController {
        return UINavigationController(rootViewController: obj as! UIViewController);
        
    }
    return nil;
}

///获取UITabBarItem 数组
public func UITabBarItemsFromList(_ list: [[String]]) -> [UITabBarItem] {
    
    let marr: NSMutableArray = [];
    for e in list.enumerated() {
        let itemList = e.element
        let title: String = itemList.count > 1 ? itemList[1] : "";
        let img_N: String = itemList.count > 2 ? itemList[2] : "";
        let img_H: String = itemList.count > 3 ? itemList[3] : "";
        let badgeValue: String = itemList.count > 4 ? itemList[4] : "";
        
        let tabBarItem: UITabBarItem = UITabBarItem(title: title, image: UIImageNamed(img_N), selectedImage: UIImageNamed(img_H));
        tabBarItem.badgeValue = badgeValue;
        
        if #available(iOS 10.0, *) {
            tabBarItem.badgeColor = badgeValue.intValue() <= 0 ? UIColor.clear : UIColor.red;
        }
        
        if tabBarItem.title == nil || tabBarItem.title == "" {
            tabBarItem.imageInsets = UIEdgeInsets(top: 5, left: 0, bottom: -5, right: 0)
        }
        
        marr.add(tabBarItem)
    }
    return marr.copy() as! [UITabBarItem]
}

/// 获取UIViewController/UINavigationController数组
public func UICtlrListFromList(_ list: [[String]], isNavController: Bool) -> [UIViewController] {
    let tabItems: [UITabBarItem] = UITabBarItemsFromList(list);
    let marr: NSMutableArray = [];
    for e in list.enumerated() {
        let itemList = e.element
        
        let title: String = itemList.count > 1 ? itemList[1] : "";
        
        var controller: UIViewController = UICtrFromString(itemList.first!)
        controller.title = title
        controller.tabBarItem = tabItems[e.offset]
        
        controller = isNavController == true ? UINavCtrFromObj(controller)! : controller
        marr.add(controller)
    }
    return marr.copy() as! [UIViewController]
}

/// 获取UINavigationController数组
public func UINavListFromList(_ list: [[String]]) -> [UIViewController] {
    return UICtlrListFromList(list, isNavController: true)
}

///获取UITarBarController
public func UITarBarCtrFromList(_ list: [[String]]) -> UITabBarController {
    let tabBarVC: UITabBarController = UITabBarController()
    tabBarVC.viewControllers = UICtlrListFromList(list, isNavController: true)
    return tabBarVC;
}

/// 获取某种颜色Alpha下的色彩
public func UIColorAlpha(_ color: UIColor,_ a:CGFloat) -> UIColor{
    return color.withAlphaComponent(a)
}

public func UIColorRGBA(_ r:CGFloat,_ g:CGFloat,_ b:CGFloat,_ a:CGFloat) -> UIColor{
    return UIColor(red: r/255.0, green: g/255.0, blue: b/255.0, alpha: a)
}

/// 16进制字符串
public func UIColorHex(_ hex: String, _ a:CGFloat) -> UIColor {
    return UIColor.hex(hex, a: a);
}

/// 16进制字符串
public func UIColorHex(_ hex: String) -> UIColor {
    return UIColor.hex(hex);
}

/// 0x开头的16进制Int数字(无#前缀十六进制数表示，开头就是0x)
public func UIColorHexValue(_ hex:Int) -> UIColor {
    return UIColorHexValue(hex, 1.0)
}

/// [源]0x开头的16进制Int数字(无#前缀十六进制数表示，开头就是0x)
public func UIColorHexValue(_ hex:Int, _ a:CGFloat) -> UIColor {
    return UIColor(red: CGFloat((hex & 0xFF0000) >> 16)/255.0, green: CGFloat((hex & 0xFF00) >> 8)/255.0, blue: CGFloat(hex & 0xFF)/255.0, alpha: a)
}

public func UIColorRandom() -> UIColor {
    return UIColor.randomColor();
}

public func UIColorDim(_ white:CGFloat, _ a:CGFloat) -> UIColor{
    return .init(white: white, alpha: a);
}

public func UIImageNamed(_ name: String) -> UIImage?{
    return UIImage(named: name);
}

public func UIImageNamed(_ name: String, renderingMode: UIImageRenderingMode) -> UIImage?{
    var image = UIImageNamed(name)
    if image != nil {
        image = image!.withRenderingMode(renderingMode)
    }
    return image
}

// 把颜色转成UIImage
public func UIImageColor(_ color: UIColor, size: CGSize) -> UIImage{
    let rect: CGRect = CGRect(x: 0, y: 0, width: size.width, height: size.height)
    UIGraphicsBeginImageContextWithOptions(rect.size, false, 0)
    
    let context: CGContext = UIGraphicsGetCurrentContext()!
    context.setFillColor(color.cgColor)
    context.fill(rect)
    
    let image = UIGraphicsGetImageFromCurrentImageContext()
    UIGraphicsGetCurrentContext()
    return image!
}

// 把颜色转成UIImage
public func UIImageColor(_ color: UIColor) -> UIImage{
    return UIImageColor(color, size: CGSize(width: 1.0, height: 1.0))
}


public func UIImageEquelToImage(_ image0: UIImage, image1: UIImage) -> Bool{
    let data0 = UIImagePNGRepresentation(image0)
    let data1 = UIImagePNGRepresentation(image1)
    return data0 == data1
}

///返回的类名不带明明空间
public func NStringShortFromClass(_ cls:Swift.AnyClass) -> String {
    let className:String = NSStringFromClass(cls);
    //    if className.contains(".") {
    //        let rangePoint = className.range(of: ".");
    //        className = String(className[rangePoint!.upperBound...]);
    //    }
    //    return className;
    let list = className.components(separatedBy: ".");
    return list.last!;
}

public func AttributeDict(_ type:Int) -> [NSAttributedStringKey: Any]{
    
    var dic : [NSAttributedStringKey: Any] = [NSAttributedStringKey.foregroundColor    :   UIColor.black,
                                              NSAttributedStringKey.backgroundColor    :   UIColor.white,]
    
    switch type {
    case 1:
        dic = [NSAttributedString.Key.underlineStyle    :   NSUnderlineStyle.styleSingle.rawValue,
               NSAttributedString.Key.underlineColor     :   UIColor.red,]
    case 2:
        dic = [NSAttributedString.Key.strikethroughStyle    :   NSUnderlineStyle.styleSingle.rawValue,
               NSAttributedString.Key.strikethroughColor     :   UIColor.red,]
    case 3:
        dic = [NSAttributedString.Key.obliqueness    :   0.8,]
    case 4:
        dic = [NSAttributedString.Key.expansion    :   0.3,]
        
    case 5:
        dic = [NSAttributedString.Key.writingDirection    :   3,]
        
    default:
        break
        
    }
    return dic;
}

public func IsTimeStamp(_ obj: Any) -> Bool{
    assert(obj is String || obj is Double)
    if let dateStr = obj as? String {
        if dateStr.count < 10 || dateStr.contains(" ") {
            return false
        }
    } else {
        if let value = obj as? Double {
            if value < 10000000000 {
                return false
            }
        }
    }
    return true
}

public func TimeStampFromObj(_ obj: Any) -> String{
    assert(obj is String || obj is Int || obj is Date)
    
    if let date = obj as? Date {
        return "\(date.timeIntervalSince1970)"
    }
    
    if let value = obj as? Int {
        return "\(value)"
    }
    
    var fmt = kDateFormat;
    if let dateStr = obj as? String {
        if dateStr.contains("-") && dateStr.contains(":") {
            fmt = kDateFormat;
        } else if dateStr.contains("-") && !dateStr.contains(":") {
            fmt = kDateFormat_one
            
        } else if !dateStr.contains("-") && !dateStr.contains(":") {
            fmt = kDateFormat_two
            
        } else {
            print("时间格式不对\(dateStr)")
        }
        return DateFormatter.IntervalFromDateStr(dateStr, fmt: fmt)
    }
    return ""
}

