//
//  UIApplication+Permissionr.swift
//  SwiftTemplet
//
//  Created by Bin Shang on 2019/11/21.
//  Copyright © 2019 BN. All rights reserved.
//

import UIKit
import AVFoundation
import Speech
import MediaPlayer
import CoreBluetooth
import EventKit
import Contacts
import StoreKit

@objc public extension UIApplication{
    
    @available(iOS 9.3, *)
    /// 媒体库是否可用
    static func hasRightOfMediaLibrary() -> Bool {
        var isHasRight = false;
        
        MPMediaLibrary.requestAuthorization { (status) in
            switch status {
            case .authorized:
                isHasRight = true;
                
            default:
                isHasRight = false;
            }
        }
        return isHasRight;
    }
    /// 是否有音视频捕捉权限
    static func hasRightOfAVCapture(_ mediaType: AVMediaType = AVMediaType.video) -> Bool {
        var isHasRight = false;

//        let device = AVCaptureDevice.devices(for: mediaType)
        let status = AVCaptureDevice.authorizationStatus(for: mediaType);
        switch status {
        case .authorized:
            isHasRight = true;
            
        case .notDetermined:
            AVCaptureDevice.requestAccess(for: mediaType) { (granted) in
                isHasRight = granted;
            }
            
        default:
            isHasRight = false;
        }
        return isHasRight;
    }
    /// 是否已经打开蓝牙捕捉
    static func hasOpenOfBluetooth() -> Bool {
        var isHasRight = false;
        let centralManager = CBCentralManager();
        switch centralManager.state {
        case .poweredOn:
            isHasRight = true;
            
        default:
            isHasRight = false;
        }
        return isHasRight;
    }
    
    /// 媒体库是否可用
    @available(iOS 10.0, *)
    static func hasRightOfSpeechRecognizer() -> Bool {
        var isHasRight = false;
        
        SFSpeechRecognizer.requestAuthorization { (status) in
            switch status {
            case .authorized:
                isHasRight = true;
                
            default:
                isHasRight = false;
            }
        }
        return isHasRight;
    }
    
    /// 日历是否可用
    @available(iOS 10.0, *)
    static func hasRightOfEventStore(_ entityType: EKEntityType = EKEntityType.reminder) -> Bool {
        var isHasRight = false;
        
        let store = EKEventStore()
        store.requestAccess(to: entityType) { (granted, error) in
            if granted == true {
                isHasRight = granted;

            } else {
                let status = EKEventStore.authorizationStatus(for: .event);
                switch status {
                case .authorized:
                    isHasRight = true;
                    
                default:
                    isHasRight = false;
                }
            }
        }
        return isHasRight;
    }
    
    /// 通讯录是否可用
    @available(iOS 10.0, *)
    static func hasRightOfContactStore(_ entityType: CNEntityType = CNEntityType.contacts) -> Bool {
        var isHasRight = false;
        
        let store = CNContactStore()
        store.requestAccess(for: entityType) { (granted, error) in
            if granted == true {
                isHasRight = granted;
                
            } else {
                let status = EKEventStore.authorizationStatus(for: .event);
                switch status {
                case .authorized:
                    isHasRight = true;
                    
                default:
                    isHasRight = false;
                }
            }
        }
        return isHasRight;
    }

    /// 应用下载其他应用
    static func jumpAppStore(_ appID: String, controller: UIViewController) {
        let productVC = SKStoreProductViewController();
        productVC.delegate = (controller as! SKStoreProductViewControllerDelegate);
        
        let params = [SKStoreProductParameterITunesItemIdentifier: appID]
        productVC.loadProduct(withParameters: params) { (result, error) in
            if result == true {
                controller.present(productVC, animated: true, completion: nil);
            } else {
                NSLog("打开商店失败!!!");
            }
        }
    }
}
