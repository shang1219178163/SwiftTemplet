//
//  NNUploadModel.swift
//  SwiftTemplet
//
//  Created by Bin Shang on 2019/4/30.
//  Copyright © 2019 BN. All rights reserved.
//

import UIKit

class NNUploadModel: NSObject {

    var data: Data?
    var name: String?
    var fileName: String?
    var mimeType: String?
    
    static func upload(images: [UIImage], fileNames: [String]?, idx: Int) -> NNUploadModel {
        
        let imageData = UIImage.compressData(images[idx]) as Data
        let imageType: String = UIImage.contentType(imageData as NSData);
        
        let timeStamp = DateFormatter.stringFromDate(Date(), fmt: "yyyyMMddHHmmss")
        
        let name = "image\(idx+1)"
        let fileName = timeStamp + ".\(imageType)"

        let model = NNUploadModel()
        model.data = imageData;
        model.name = name;
        model.fileName = fileName;
        model.mimeType = "image/\(imageType)"
        return model;
    }

    
}
