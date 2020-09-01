
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

import AVFoundation
extension AVAudioSession{
    
    static func appAVAudioVolume(_ soundoff: Bool) {
        if #available(iOS 10.0, *) {
            let category: AVAudioSession.Category = soundoff == true ? AVAudioSession.Category.record : AVAudioSession.Category.ambient;
            do {
                try AVAudioSession.sharedInstance().setCategory(category, mode: .default)
                try AVAudioSession.sharedInstance().setActive(true)
            } catch {
                print(error)
            }
        }
    }
    
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
//@objc public extension NSString{
//
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
//}
