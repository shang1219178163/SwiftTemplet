
//
//  NSObject+Helper.swift
//  SwiftTemplet
//
//  Created by hsf on 2018/8/28.
//  Copyright © 2018年 BN. All rights reserved.
//

import Foundation
import UIKit

import ObjectMapper


func iOSVer(version:Float)->Bool{
    return (UIDevice.current.systemVersion as NSString).floatValue > version ? true : false;
}

func kScale_width(_ width: CGFloat) -> CGFloat {
    return width * UIScreen.main.bounds.size.width / 320.0
}

func BN_ControllerFromString(_ vcName:String) -> UIViewController {
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

func BN_ClassFromString(_ name:String) -> AnyClass {
    let nameKey = "CFBundleName";
    //这里也是坑，请不要翻译oc的代码，而是去NSBundle类里面看它的api
    let appName = Bundle.main.infoDictionary![nameKey] as? String;
    let cls : AnyClass = NSClassFromString(appName! + "." + name)!;
    return cls;
}

func BN_StringShortFromClass(_ cls:Swift.AnyClass) -> String {

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
    
    func appName() -> String {
        let nameKey = "CFBundleName";
        //这里也是坑，请不要翻译oc的代码，而是去NSBundle类里面看它的api
        let appName = Bundle.main.infoDictionary![nameKey] as? String;
        return appName!;
    }
    
    func BN_ClassName(_ className:String) -> AnyClass {
        let cls : AnyClass = NSClassFromString(appName() + "." + className)!;
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


