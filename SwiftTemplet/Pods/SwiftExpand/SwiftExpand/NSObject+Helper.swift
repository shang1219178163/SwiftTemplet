
//
//  NSObject+Helper.swift
//  SwiftTemplet
//
//  Created by hsf on 2018/8/28.
//  Copyright © 2018年 BN. All rights reserved.
//

import UIKit

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

public func UINavListFromList(_ list:Array<Any>) -> Array<UINavigationController>!{
    let marr = NSMutableArray();
    for obj in list {
        if obj is String {
            marr.add(UINavCtrFromObj(obj as AnyObject) as Any);
            
        }else if obj is Array<String> {
            let itemList = obj as! Array<String>;
            
            let title:String = itemList.count > 1 ? itemList[1]    :   "";
            let img_N:String = itemList.count > 2 ? itemList[2]    :   "";
            let img_H:String = itemList.count > 3 ? itemList[3]    :   "";
            let badgeValue:String = itemList.count > 4 ? itemList[4]    :   "";
            
            let controller:UIViewController = UICtrFromString(itemList.first!);
            controller.title = title;
            controller.tabBarItem.image = UIImage(named: img_N)?.withRenderingMode(.alwaysOriginal);
            controller.tabBarItem.selectedImage = UIImage(named: img_H)?.withRenderingMode(.alwaysTemplate);
            controller.tabBarItem.badgeValue = badgeValue;
            if #available(iOS 10.0, *) {
                controller.tabBarItem.badgeColor = badgeValue.isEmpty ? .clear:.red;
            }
            //导航控制器
            let navController = UINavCtrFromObj(controller);
            marr.add(navController as Any);
        }else {
            print("list只能包含字符串对象或者数组对象");
        }
    }
    let viewControllers = marr.copy() as! [UINavigationController];
    return viewControllers;
}

public func UITarBarCtrFromList(_ list:Array<Any>) -> UITabBarController!{
    let tabBarController = UITabBarController();
    tabBarController.tabBar.tintColor = .theme;
    tabBarController.tabBar.barTintColor = .white;
    tabBarController.tabBar.isTranslucent = false;
    tabBarController.viewControllers = UINavListFromList(list);
    return tabBarController;
}

public func UIColorRGBA(_ r:CGFloat,_ g:CGFloat,_ b:CGFloat,_ a:CGFloat) -> UIColor{
    return UIColor(red: r/255.0, green: g/255.0, blue: b/255.0, alpha: a)
}

public func UIColorHex(_ hex:String) -> UIColor {
    return UIColor.hex(hex);
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

public extension NSObject{
    
    public var keyOfUnsafeRawPointer: UnsafeRawPointer {
        get {
            return objc_getAssociatedObject(self, RuntimeKeyFromSelector(#function)) as! UnsafeRawPointer
        }
        set {
            objc_setAssociatedObject(self, RuntimeKeyFromSelector(#function), newValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC);
        }
    }

//    public var block:SwiftClosure {
//        set {
//            objc_setAssociatedObject(self, RuntimeKeyFromSelector(#function), newValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC);
//        }
//        
//        get {
//            return objc_getAssociatedObject(self, RuntimeKeyFromSelector(#function)) as! SwiftClosure;
//        }
//    }
    
    public func BNClassName(_ className:String) -> AnyClass {
        let appName = Bundle.main.infoDictionary!["CFBundleName"] as! String;
        let cls : AnyClass = NSClassFromString(appName + "." + className)!;
        return cls;
    }
    
    /// nsRange范围子字符串差异华显示
    @objc public func attString(_ text: String!, nsRange: NSRange) -> NSAttributedString! {
        assert(text.count > (nsRange.location + nsRange.length))
        
        let attrString = NSMutableAttributedString(string: text)
        
        let attDict = [NSAttributedStringKey.foregroundColor: UIColor.theme,
                       NSAttributedStringKey.font:UIFont.systemFont(ofSize: 30),
                       ]
        attrString.addAttributes(attDict, range: nsRange)
        return attrString
    }
    
    /// 特定范围子字符串差异华显示
    @objc public func attString(_ text: String!, offsetStart: Int, offsetEnd: Int) -> NSAttributedString! {
        let nsRange = NSRange(location: offsetStart, length: (text.count - offsetStart - offsetEnd))
        let attrString = attString(text, nsRange: nsRange)
        return attrString
    }
    
    /// 字符串差异华显示
    @objc public func attString(_ text: String!, textSub: String) -> NSAttributedString! {
        let range = text.range(of: textSub)
        let nsRange = text.nsRange(from: range!)
        let attrString = attString(text, nsRange: nsRange)
        return attrString
    }
    
    /// 富文本特殊部分设置
    @objc public func attrDict(_ font:CGFloat, textColor:UIColor) -> Dictionary<NSAttributedString.Key, Any> {
        let dic = [NSAttributedString.Key.font:UIFont.systemFont(ofSize:font),
                   NSAttributedString.Key.foregroundColor: textColor];
        return dic;
    }
    
    /// 富文本整体设置
    @objc public func attrParaDict(_ font:CGFloat, textColor:UIColor, alignment:NSTextAlignment) -> Dictionary<NSAttributedString.Key, Any> {
        let paraStyle = NSMutableParagraphStyle();
        paraStyle.lineBreakMode = .byCharWrapping;
        paraStyle.alignment = alignment;
        
        let mdic = NSMutableDictionary(dictionary: self.attrDict(font, textColor: textColor));
        mdic.setObject(paraStyle, forKey:kCTParagraphStyleAttributeName as! NSCopying);
        return mdic.copy() as! Dictionary<NSAttributedString.Key, Any>;
    }
    
    ///  富文本只有和一般文字同字体大小才能计算高度
    @objc public func sizeWithText(_ text:AnyObject!, font:CGFloat, width:CGFloat) -> CGSize {
        assert(text is String || text is NSAttributedString, "请检查text格式!");
        let attDic = self.attrParaDict(font, textColor: .black, alignment: .left);

        let options : NSStringDrawingOptions = NSStringDrawingOptions(rawValue: NSStringDrawingOptions.RawValue(UInt8(NSStringDrawingOptions.usesLineFragmentOrigin.rawValue) | UInt8(NSStringDrawingOptions.usesFontLeading.rawValue)))
        
        var size = CGSize.zero;
        if text is String  {
            size = text.boundingRect(with: CGSize(width: width, height: CGFloat(MAXFLOAT)), options: options , attributes: attDic, context: nil).size;
        }
        else{
            size = text.boundingRect(with: CGSize(width: width, height: CGFloat(MAXFLOAT)), options: options, context: nil).size;
        }
        size.width = ceil(size.width);
        size.height = ceil(size.height);
        return size;
    }
    
    /// 密集小视图的尺寸布局
    public func itemSize(_ items: [String], numberOfRow: Int, width: CGFloat, itemHeight: inout CGFloat, padding: CGFloat) -> CGSize {
        let rowCount = items.count % numberOfRow == 0 ? items.count/numberOfRow : items.count/numberOfRow + 1
        let tmp = CGFloat(numberOfRow) - 1.0
        let itemWith = (width - tmp*padding)/CGFloat(numberOfRow)
        itemHeight = itemHeight <= 0.0 ? itemWith : itemHeight
        let height = CGFloat(rowCount) * itemHeight + CGFloat(rowCount) - 1.0 * padding
        let size = CGSize(width: width, height: height)
        return size
    }
    
    
    /// (源方法)富文本
    @objc public func getAttString(_ text: String!, textTaps: [String]!, font: CGFloat, tapFont: CGFloat, color: UIColor, tapColor: UIColor, alignment: NSTextAlignment) -> NSAttributedString {
        let paraDic = attrParaDict(font, textColor: color, alignment: alignment)
        let attString = NSMutableAttributedString(string: text, attributes: paraDic)
        textTaps.forEach { ( textTap: String) in
            let nsRange = (text as NSString).range(of: textTap)
            let attDic = self.attrDict(font, textColor: tapColor)
            attString.addAttributes(attDic, range: nsRange)
        }
        return attString
    }
    
    /// 富文本
    @objc public func getAttString(_ text: String!, textTaps: [String]!, tapColor: UIColor) -> NSAttributedString {
        return getAttString(text, textTaps: textTaps, font: 16.0, tapFont: 16.0, color: .black, tapColor: tapColor, alignment: .left)
    }
    
    /// 标题前缀差异化显示
    public func  getAttringByPrefix(_ prefix: String!, content: String!, isMust: Bool) -> NSAttributedString {
        let string = content.hasPrefix(prefix) == true ? content : prefix + content
        let colorMust = isMust == true ? UIColor.red : UIColor.clear
        let attString = getAttString(string, textTaps: [prefix], font: 15, tapFont: 15, color: .black, tapColor: colorMust, alignment: .left)
        return attString
    }
    
    ///MARK: NSObject转json字符串
    @objc public func jsonValue() -> String! {
        
        if JSONSerialization.isValidJSONObject(self) == false {
            return "";
        }
        let data: Data! = try? JSONSerialization.data(withJSONObject: self, options: []);
        let jsonString:String! = String(data: data, encoding: .utf8);
        let string:String! = jsonString.removingPercentEncoding!;
        return string;
    }
    
//    //MARK: 转json(备用)
//    public static func jsonValue(_ obj:AnyObject!) -> String! {
//        if JSONSerialization.isValidJSONObject(obj) == false {
//            return "";
//        }
//        let data: Data! = try? JSONSerialization.data(withJSONObject: obj, options: []);
//        let JSONString:String! = String(data: data, encoding: .utf8);
//        let string = JSONString.removingPercentEncoding!;
//
//        return string;
//
//    }
    
     //MARK:数据解析通用化封装
//   public static func modelWithJSONFile(_ fileName:String) -> AnyObject? {
//
//        let jsonString = fileName.jsonFileToJSONString();
//        let rootModel = Mapper<self.classForCoder()>().map(JSONString: jsonString);
//        return rootModel;
//    }

}


