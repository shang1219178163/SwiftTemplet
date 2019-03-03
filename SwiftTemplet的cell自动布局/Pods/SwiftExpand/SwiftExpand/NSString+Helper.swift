//
//  NSString+Helper.swift
//  SwiftTemplet
//
//  Created by hsf on 2018/8/28.
//  Copyright © 2018年 BN. All rights reserved.
//

import UIKit

public extension String{
    
    public func valid() -> Bool! {
        let array = ["","nil","null"];
        if array.contains(self){
            return false;
        }
        return true;
    }
    
    public func intValue() -> Int {
        return Int((self as NSString).intValue)
    }

    public func floatValue() -> Float {
        return (self as NSString).floatValue
    }
    
    public func cgFloatValue() -> CGFloat {
        return CGFloat(self.floatValue())
    }

    public func doubleValue() -> Double {
        return (self as NSString).doubleValue
    }
    
    public func reverse() -> String {
        return String(self.reversed())
    }
    /// range转换为NSRange
    public func nsRange(from range: Range<String.Index>) -> NSRange {
        return NSRange(range, in: self)
    }
    
    /// NSRange转化为range
    public func range(from nsRange: NSRange) -> Range<String.Index>? {
        guard
            let from16 = utf16.index(utf16.startIndex, offsetBy: nsRange.location, limitedBy: utf16.endIndex),
            let to16 = utf16.index(from16, offsetBy: nsRange.length, limitedBy: utf16.endIndex),
            let from = String.Index(from16, within: self),
            let to = String.Index(to16, within: self)
            else { return nil }
        return from ..< to
    }
    
    public func dictValue() -> Dictionary<String, Any>!{
        return ((self as NSString).objcValue() as! Dictionary<String, Any>)
    }
    
    public func arrayValue() -> Array<Any>!{
        
        let jsonData:Data = self.data(using: .utf8)!
        let array = try? JSONSerialization.jsonObject(with: jsonData, options: .mutableContainers)
        if array != nil {
            return (array as! Array);
        }
        return Array();
    }
    
    public func jsonFileToJSONString() -> String {
        assert(self.contains(".geojson") == true);
        
        if self.contains(".geojson") == true {
            let array: Array = self.components(separatedBy: ".");
            let path = Bundle.main.path(forResource: array.first, ofType: array.last);
            if path == nil {
                return "";
            }
            if let jsonData = try? Data(contentsOf: URL(fileURLWithPath: path!)) {
                
                if let jsonObj = try? JSONSerialization.jsonObject(with: jsonData, options: JSONSerialization.ReadingOptions(rawValue: 0)) {
                    let jsonString = ((jsonObj as! NSDictionary).jsonValue()!).removingPercentEncoding!;
                    print(jsonString);
                    return jsonString;
                }
                return "";
            }
            return "";
        }
        return "";
    }
    
    public static func timeNow() -> String {
        let fmt = DateFormatter.format(kDateFormat)
        let dateStr = fmt.string(from: Date());
        return dateStr;
        
    }
    
    public func toTimeStamp() -> String {
        let dateStr = self;
        
        var fmtStr = kDateFormat;
        if dateStr.contains("-") && dateStr.contains(":") {
            fmtStr = kDateFormat;
            
        }
        else if dateStr.contains("-") && !dateStr.contains(":") {
            fmtStr = kDateFormat_one;
            
        }
        else if !dateStr.contains("-") && !dateStr.contains(":") {
            fmtStr = kDateFormat_two;
            
        }
        else{
            DDLog("<\(dateStr)>时间格式不对");
            
        }
        
        let fmt = DateFormatter.format(fmtStr);
        let date = fmt.date(from: dateStr);
        
        let intervl:Double = (date?.timeIntervalSince1970)!;
        let doubleInt = Int(intervl);
        let timeStamp = String(doubleInt);
        return timeStamp;
    }
    
    
    /// 字符串本身大于string
    public func isCompareMore(_ string:String) -> Bool {
        return self.compare(string, options: .numeric, range: nil, locale: nil) == .orderedDescending
    }
    
    /// 字符串本身大于string
    public func isCompare(_ string:String) -> Bool {
        if self == "" {
            return false
        }
        
        var strSelf = self
        if strSelf.contains(".") {
            strSelf = strSelf.replacingOccurrences(of: ".", with: "")
        }
        return strSelf.intValue() > string.intValue()
    }
    
  
    public func toAsterisk() -> NSAttributedString{
        let isMust = self.contains(kAsterisk)
        return (self as NSString).getAttringByPrefix(kAsterisk, content: self, isMust: isMust)
    }
    
    func copyToPasteboard(_ showTips: Bool) -> Void {
        UIPasteboard.general.string = self
        if showTips == true {
            let _ = UIAlertController.createAlert("提示", placeholders: nil, msg: "已复制'\(self)'到剪切板!", actionTitles: nil, handler: nil)
        }
    }

}

extension NSString{
    
    /// 字符串转AnyObject
     @objc public func objcValue() -> AnyObject?{
        let jsonData = self.data(using: String.Encoding.utf8.rawValue, allowLossyConversion: true)
        let obj:Any? = try? JSONSerialization.jsonObject(with: jsonData!, options: .allowFragments)
        if obj != nil {
            return obj! as AnyObject;
        }
        return self;
    }
    
    /// 字符串本身大于string
    public func isCompare(_ string:NSString) -> Bool {
        if self.isEqual(to: "") {
            return false
        }
        
        var strSelf = self
        if strSelf.contains(".") {
            strSelf = strSelf.replacingOccurrences(of: ".", with: "") as NSString
        }
        return strSelf.integerValue > string.integerValue;
    }
}
