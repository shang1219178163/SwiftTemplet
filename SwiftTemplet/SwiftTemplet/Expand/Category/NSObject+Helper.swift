
//
//  NSObject+Helper.swift
//  SwiftTemplet
//
//  Created by hsf on 2018/8/28.
//  Copyright © 2018年 BN. All rights reserved.
//

import Foundation
import UIKit

//import ObjectMapper

func NSStringFromIndexPath(_ indexPath:NSIndexPath) -> String {
    return String(format: "{%d,%d}", indexPath.section, indexPath.row);
}

func iOSVer(version:Float)->Bool{
    return (UIDevice.current.systemVersion as NSString).floatValue > version;
}

func kScale_width(_ width: CGFloat) -> CGFloat {
    return width * UIScreen.main.bounds.size.width / 320.0
}

func UICtrFromString(_ vcName:String) -> UIViewController {
    // 动态获取命名空间
    let appName = Bundle.main.infoDictionary!["CFBundleName"] as! String;
    
    // 0 字符串转类
    let cls: AnyClass? = NSClassFromString(appName + "." + vcName);
    
    // 通过类创建对象， 不能用cls.init(),有的类可能没有init方法
    // 需将cls转换为制定类型，也就是
    let vcCls = cls as! UIViewController.Type;
    
    // 创建对象
    let childController:UIViewController = vcCls.init();
    return childController;
}

func UINavCtrFromObj(_ obj:AnyObject) -> UINavigationController?{
    if obj is UINavigationController {
        return obj as? UINavigationController;
        
    }else if obj is String {
        return UINavigationController(rootViewController: UICtrFromString(obj as! String));
        
    }else if obj is UIViewController {
        return UINavigationController(rootViewController: obj as! UIViewController);
        
    }
    return nil;
}

func UINavListFromList(_ list:Array<Any>) -> Array<UINavigationController>!{
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
            controller.tabBarItem.selectedImage = UIImage(named: img_H)?.withRenderingMode(.alwaysOriginal);
            controller.tabBarItem.badgeValue = badgeValue;
            controller.tabBarItem.badgeColor = badgeValue.isEmpty ? .clear:.red;
            
            //导航控制器
            let navController = UINavCtrFromObj(controller);
            let dic:Dictionary = [NSAttributedStringKey.foregroundColor : UIColor.white,
                                  NSAttributedStringKey.font  : UIFont.boldSystemFont(ofSize: UIFont.systemFontSize + CGFloat(1.0)),
                                  ];
            navController!.navigationBar.titleTextAttributes = dic;
            marr.add(navController as Any);
        }else {
            print("list只能包含字符串对象或者数组对象");
        }
    }
    let viewControllers = marr.copy() as! [UINavigationController];
    return viewControllers;
}

func UITarBarCtrFromList(_ list:Array<Any>) -> UITabBarController!{
    let tabBarController = UITabBarController();
    tabBarController.tabBar.tintColor = .theme;
    tabBarController.tabBar.barTintColor = .white;
    tabBarController.viewControllers = UINavListFromList(list);
    return tabBarController;
}

func UIColorFromDim(_ white:CGFloat, _ a:CGFloat) -> UIColor{
    return .init(white: white, alpha: a);
}
    
func BNClassFromString(_ name:String) -> AnyClass {
    let nameKey = "CFBundleName";
    //这里也是坑，请不要翻译oc的代码，而是去NSBundle类里面看它的api
    let appName = Bundle.main.infoDictionary![nameKey] as? String;
    let cls : AnyClass = NSClassFromString(appName! + "." + name)!;
    return cls;
}

func BNStringShortFromClass(_ cls:Swift.AnyClass) -> String {

    var className:String = NSStringFromClass(cls);
    if className.contains(".") {
        let rangePoint = className.range(of: ".");
        className = String(className[rangePoint!.upperBound...]);
    }
    return className;
}

extension NSObject{
 
    var block:SwiftBlock {
        set {
            objc_setAssociatedObject(self, AssociationKeyFromSelector(#function), newValue, objc_AssociationPolicy.OBJC_ASSOCIATION_RETAIN_NONATOMIC);
        }
        
        get {
            return objc_getAssociatedObject(self, AssociationKeyFromSelector(#function)) as! SwiftBlock;
        }
    }
    
    func BNClassName(_ className:String) -> AnyClass {
        let appName = Bundle.main.infoDictionary!["CFBundleName"] as! String;
        let cls : AnyClass = NSClassFromString(appName + "." + className)!;
        return cls;
    }
        
    func attrDict(font:AnyObject, textColor:UIColor) -> Dictionary<NSAttributedStringKey, Any> {
        let font = font is NSInteger == false ? font as! UIFont : UIFont.systemFont(ofSize:CGFloat(font.floatValue));
        let dic = [NSAttributedStringKey.font:font,
                   NSAttributedStringKey.foregroundColor: textColor];
        return dic;
    }
    
    func attrParaDict(font:AnyObject, textColor:UIColor, alignment:NSTextAlignment) -> Dictionary<NSAttributedStringKey, Any> {
        
        let paraStyle = NSMutableParagraphStyle();
        paraStyle.lineBreakMode = .byCharWrapping;
        paraStyle.alignment = alignment;
        
        let font = font is NSInteger == false ? font as! UIFont : UIFont.systemFont(ofSize:CGFloat(font.floatValue));
        
        let mdic = NSMutableDictionary(dictionary: self.attrDict(font: font, textColor: textColor));
        mdic.setObject(paraStyle, forKey:kCTParagraphStyleAttributeName as! NSCopying);
        return mdic.copy() as! Dictionary<NSAttributedStringKey, Any>;
    }
    
    func sizeWithText(text:AnyObject!, font:AnyObject, width:CGFloat) -> CGSize {

        assert(text is String || text is NSAttributedString, "请检查text格式!");
        assert(font is UIFont || font is Int, "请检查font格式!");

        let attDic = self.attrParaDict(font: font, textColor: .black, alignment: .left);

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
    
    //MARK: 转json
    func jsonValue() -> String! {
        
        if JSONSerialization.isValidJSONObject(self) == false {
            return "";
        }
        let data: Data! = try? JSONSerialization.data(withJSONObject: self, options: []);
        let JSONString:String! = String(data: data, encoding: .utf8);
        let string:String! = JSONString.removingPercentEncoding!;
        
        return string;
        
    }
//    //MARK: 转json(备用)
//    static func jsonValue(_ obj:AnyObject!) -> String! {
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
//   static func modelWithJSONFile(_ fileName:String) -> AnyObject? {
//
//        let jsonString = fileName.jsonFileToJSONString();
//        let rootModel = Mapper<self.classForCoder()>().map(JSONString: jsonString);
//        return rootModel;
//    }

}


