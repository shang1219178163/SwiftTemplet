//
//  PHAsset+Helper.swift
//  SwiftTemplet
//
//  Created by Bin Shang on 2019/3/2.
//  Copyright © 2019 BN. All rights reserved.
//

import UIKit
import Photos

public extension PHAsset{
    
    /// 请求UIImage
    public func requestImage(_ resultHandler: @escaping (UIImage?, [AnyHashable : Any]?) -> Void) -> Void {
        let options = PHImageRequestOptions.defaultOptions()
        PHImageManager.default().requestImage(for: self, targetSize: PHImageManagerMaximumSize, contentMode: .aspectFit, options: options, resultHandler: resultHandler)
    }
    
}

public extension PHImageRequestOptions{
    
    /// 默认参数
    public static func defaultOptions() -> PHImageRequestOptions {
        let options = PHImageRequestOptions()
        options.deliveryMode = .highQualityFormat
        options.isNetworkAccessAllowed = true
        return options;
    }

}
