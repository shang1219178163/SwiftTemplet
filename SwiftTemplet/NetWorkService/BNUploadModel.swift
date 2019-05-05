//
//  BNUploadModel.swift
//  SwiftTemplet
//
//  Created by Bin Shang on 2019/4/30.
//  Copyright © 2019 BN. All rights reserved.
//

import UIKit

class BNUploadModel: NSObject {

    var data: Data?
    var name: String?
    var fileName: String?
    var mimeType: String?
    
    static func upload(images: [UIImage], fileNames: [String]?, idx: Int) -> BNUploadModel {
        
        var imageData: Data?  //图片压缩算法
        imageData = UIImage.compressData(images[idx]) as Data
        let imageType: String = UIImage.contentType(imageData! as NSData);
        
        let timeStamp = DateFormatter.stringFromDate(Date(), fmt: "yyyyMMddHHmmss")
        let imageFileName = timeStamp + "\(idx)" + imageType;
        
        let name = "image\(idx+1)"
        let fileName = fileNames != nil ? fileNames![idx] + ".\(imageType)" : imageFileName

        let model = BNUploadModel()
        model.data = imageData;
        model.name = name;
        model.fileName = fileName;
        model.mimeType = "imaghe\(imageType)"
        return model;
    }

    
    /// 根据最大尺寸限制压缩图片
//    static func compressData(_ image: UIImage, limit: Int = 1024*2) -> NSData {
//        var compression: CGFloat = 1.0;
//        let maxCompression: CGFloat = 0.1;
//
//        var imageData = UIImageJPEGRepresentation(image, compression)
//        while imageData!.count > limit && compression > maxCompression {
//            compression -= 0.1;
//            imageData = UIImageJPEGRepresentation(image, compression)
//        }
//        return imageData! as NSData;
//    }
//
//    /// 获取图片data的类型
//    static func contentType(_ imageData: NSData) -> String {
//        var type: String = "jpg";
//
//        var c: UInt8?
//        imageData.getBytes(&c, length: 1)
//        switch c {
//        case 0xFF:
//            type = "jpeg";
//        case 0x89:
//            type = "png";
//        case 0x47:
//            type = "gif";
//        case 0x49,0x4D:
//            type = "tiff";
//        case 0x42:
//            type = "bmp";
//        case 0x52:
//            if (imageData.count < 12) {
//                type = "none";
//            }
//            let string: NSString = NSString(data: imageData.subdata(with: NSMakeRange(0, 12)), encoding: String.Encoding.ascii.rawValue)!
//            if string.hasPrefix("RIFF"),string.hasSuffix("WEBP") {
//                type = "webp"
//            }
//        default:
//            type = "jpg";
//        }
//        return type;
//    }
    
}
