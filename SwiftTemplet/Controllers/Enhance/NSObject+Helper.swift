
//
//  NSObject+Helper.swift
//  SwiftTemplet
//
//  Created by Bin Shang on 2019/9/12.
//  Copyright © 2019 BN. All rights reserved.
//

import UIKit
import SwiftExpand

@objc public extension NSObject{


}

@objc extension UIImageView{
    

}

@objc public extension Bundle{

    
}

@objc public extension UIApplication{

    

}

@objc extension UIView{

}

import SwiftExpand
@objc extension UISearchBar{
    

    
}


@objc public extension UIBarButtonItem{
    
//    /// 创建 UIBarButtonItem
//    static func create(_ obj: String, style: UIBarButtonItem.Style = .plain, target: Any? = nil, action: Selector? = nil) -> UIBarButtonItem{
//        if let image = UIImage(named: obj) {
//            return UIBarButtonItem(image: image, style: style, target: target, action: action)
//        }
//        return UIBarButtonItem(title: obj, style: style, target: target, action: action);
//    }
    
    
}

import CommonCrypto
@objc public extension NSString{

//    func sha256(data: NSData) -> NSData {
//        var hash = [UInt8].init(repeating: 0, count: Int(CC_SHA256_DIGEST_LENGTH))
//        CC_SHA256(data.bytes, CC_LONG(data.length), &hash)
//        let res = NSData(bytes: hash, length: Int(CC_SHA256_DIGEST_LENGTH))
//        return res
//    }
//
//    func sha1() -> NSString {
//        let data = self.data(using: .utf8)
//        var digest = [UInt8].init(repeating: 0, count: Int(CC_SHA1_DIGEST_LENGTH))
//         CC_SHA1(data.bytes, CC_LONG(data.length), &digest)
//         let output = NSMutableString(capacity: Int(CC_SHA1_DIGEST_LENGTH))
//         for byte in digest {
//             output.appendFormat("%02x", byte)
//         }
//         return output as NSString
//     }
    
//    func map(_ separator: String = ",", block: @escaping (()->Void)) -> String {
//        self.components(separatedBy: separator).map { (<#String#>) -> T in
//            <#code#>
//        }
//    }
}

public extension String{
        
//    @inlinable public func map<T>(_ transform: (Element) throws -> T) rethrows -> [T]
//
//    func fuckMap<T>(_ separator: String = ",", transform:(Element) throws -> T) rethrows -> [T] {
//        let items = self.components(separatedBy: separator)
//        var newArray = [T]()
//        for ele in items {
//            newArray.append(try transform(ele))
//        }
//        return newArray
//    }
}

@objc public extension NSAttributedString{
        

        
}
