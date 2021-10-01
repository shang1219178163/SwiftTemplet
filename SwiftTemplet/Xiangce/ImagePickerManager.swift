//
//  ImagePickerManager.swift
//  WImagePicker
//
//  Created by 王云 on 2017/11/14.
//  Copyright © 2017年 王云. All rights reserved.
//

import UIKit
import Photos

class ImagePickerManager: NSObject {
    static let imageManager = PHCachingImageManager()
    static let shareManager = ImagePickerManager()
    
    //MARK:- 用户是否授权
    func isAuthorized(finished: @escaping (Bool) -> Void) {
        let status = PHPhotoLibrary.authorizationStatus()
        switch status {
        case .authorized:
            print("已经授权")
            finished(true)
        case .notDetermined:
            print("不确定是否授权，第一次打开")
            PHPhotoLibrary.requestAuthorization({ (status) in
                if status == .denied || status == .restricted {
                    finished(false)
                }else {
                    finished(true)
                }
            })
        case .denied, .restricted, .limited:
            print("拒绝授权")
            finished(false)
        }
    }
    
    static func getImageFromAsset(size: CGSize = CGSize(width: iconWidth, height: iconWidth), asset: PHAsset, finished: @escaping (UIImage?) -> Void) {

        imageManager.requestImage(for: asset, targetSize: size, contentMode: .aspectFill, options: nil) { (image, info) in
            finished(image)
            return
        }
        finished(nil)
    }
    
    static func albumChinseTitle(title: String?) -> String? {
        guard let title = title else {
            return nil
        }
        switch title {
        case "Slo-mo":
            return "慢动作"
        case "Recently Added":
            return "最近添加"
        case "Favorites":
            return "个人收藏"
        case "Recently Deleted":
            return "最近删除"
        case "Videos":
            return "视频"
        case "All Photos":
            return "所有照片"
        case "Selfies":
            return "自拍"
        case "Screenshots":
            return "屏幕快照"
        case "Camera Roll":
            return "相机胶卷"
        case "Panoramas":
            return "全景照片"
        case "Time-lapse":
            return "延时摄影"
        case "Animated":
            return "动图"
        case "Long Exposure":
            return "长曝光"
        case "Portrait":
            return "人像"
        case "Hidden":
            return nil
        case "Bursts":
            return "连拍快照"
        default:
            return title
        }
    }
    
}
