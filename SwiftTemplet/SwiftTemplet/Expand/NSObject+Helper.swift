
//
//  NSObject+Helper.swift
//  SwiftTemplet
//
//  Created by hsf on 2018/8/28.
//  Copyright © 2018年 BN. All rights reserved.
//

import Foundation
import UIKit


func iOS(version:Float)->Bool{
    return (UIDevice.current.systemVersion as NSString).floatValue > version ? true : false;
    
}

//func kScreen_width() -> CGFloat{
//    return UIScreen.main.bounds.size.width;
//
//}
//func kScreen_height() -> CGFloat{
//    return UIScreen.main.bounds.size.height;
//
//}

//func JKWidth(_ width: CGFloat) -> CGFloat {
//    return width * UIScreen.main.bounds.size.width / 320.0
//
//}

//func DDlog<T>(_ log : T?,fileName: String = #file,methodName: String = #function, lineNumber: Int = #line){
//    #if DEBUG
//    let filePath = fileName as NSString;
//    let filePath_copy = filePath.lastPathComponent as NSString;
//    let fileName = filePath_copy.deletingPathExtension;
//    print("\n******[第\(lineNumber)行][\(fileName)  \(methodName)] ******\n \(String(describing: log ))")
//    #endif
//}

func DDLog<T>(_ msg: T, fileName: String = #file, methodName: String = #function, lineNumber: Int = #line){
    #if DEBUG
    print("\((fileName as NSString).lastPathComponent).\(methodName)[\(lineNumber)]:\(msg)")
//    print("\((fileName as NSString).pathComponents.last!).\(methodName)[\(lineNumber)]:\(msg)")

    #endif
}


func UIViewControllerFromString(vcName:String) -> UIViewController {
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

func NSClassFromString(name:String) -> AnyClass {
    let nameKey = "CFBundleName";
    //这里也是坑，请不要翻译oc的代码，而是去NSBundle类里面看它的api
    let appName = Bundle.main.infoDictionary![nameKey] as? String;
    let cls : AnyClass = NSClassFromString(appName! + "." + name)!;
    return cls;
    
}


func NSStringShortFromClass(_ cls:Swift.AnyClass) -> String {

    var className:String = NSStringFromClass(cls);
    if className.contains(".") {
        let rangePoint = className.range(of: ".");
        className = String(className[rangePoint!.upperBound...]);
    }
    
    return className;
    
}

// print("__",NSStringFromSelector(#function));

func AssociationKeyFromSelector(_ aSelector: Selector) -> UnsafeRawPointer! {
    let key:UnsafeRawPointer = UnsafeRawPointer.init(bitPattern: NSStringFromSelector(aSelector).hashValue)!;
    return key;
}

extension NSObject{
 
    typealias SwiftBlock = (AnyObject,AnyObject,Int);
    
    // MARK: - 关联属性的key
    private struct RunTimeKey {
        static let swiftBlockKey = UnsafeRawPointer(bitPattern: "swiftBlockKey".hashValue)
        
    }
    
    var block:SwiftBlock {
        set {
//                        print("__",NSStringFromSelector(#function));
            objc_setAssociatedObject(self, RunTimeKey.swiftBlockKey!, newValue, objc_AssociationPolicy.OBJC_ASSOCIATION_RETAIN_NONATOMIC);
            
        }
        
        get {
            return objc_getAssociatedObject(self, RunTimeKey.swiftBlockKey!) as! NSObject.SwiftBlock;
            
        }
        
    }
    
    func getAppName() -> String {
        let nameKey = "CFBundleName";
        //这里也是坑，请不要翻译oc的代码，而是去NSBundle类里面看它的api
        let appName = Bundle.main.infoDictionary![nameKey] as? String;
        return appName!;
    }
    
    func getClassName(className:String) -> AnyClass {
        let cls : AnyClass = NSClassFromString(getAppName() + "." + className)!;
        return cls;
        
    }
    
//    func getClassVC(className:String) -> UIViewController {
//        let vcCls = getClassName(className: className) as! UIViewController.Type;
//        let controller:UIViewController = vcCls.init();
//        return controller;
//
//    }
    
    
//    func getController(controllerName: String) ->UIViewController {
//
//        // 动态获取命名空间
//        let appName = Bundle.main.infoDictionary!["CFBundleName"] as! String;
//
//        // 0 字符串转类
//        let cls: AnyClass? =  NSClassFromString(appName + "." + controllerName);
//
//        // 通过类创建对象， 不能用cls.init(),有的类可能没有init方法
//        // 需将cls转换为制定类型，也就是
//        let vcCls = cls as! UIViewController.Type;
//
//        // 创建对象
//        let childController:UIViewController = vcCls.init();
//        return childController;
//
//    }
    
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
    
    func sizeWithText(text:AnyObject, font:AnyObject, width:CGFloat) -> CGSize {
//        if text == nil {
//            return CGSize.zero;
//        }
        
        assert(text is String || text is NSAttributedString, "请检查text格式!");
        assert(font is UIFont || font is Int, "请检查font格式!");

        let attDic = self.attrParaDict(font: font, textColor: UIColor.black, alignment: NSTextAlignment.left);

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
    
    
}
