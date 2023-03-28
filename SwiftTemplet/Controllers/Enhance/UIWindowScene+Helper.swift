//
//  UIWindowScene+Helper.swift
//  SwiftTemplet
//
//  Created by Bin Shang on 2023/3/28.
//  Copyright © 2023 BN. All rights reserved.
//

import UIKit


@available(iOS 13.0, *)
public extension UIWindowScene {
    /// 设备旋转
    func rotationDevice(_ orientations: UIInterfaceOrientationMask = .portrait) {
        if #available(iOS 16.0, *) {
            let connectedScenes = UIApplication.shared.connectedScenes;
            let allObjects = Array(connectedScenes);
            guard let windowScene = allObjects.first as? UIWindowScene else { return }
                
            let perference = UIWindowScene.GeometryPreferences
                .iOS(interfaceOrientations: orientations);
            
            windowScene.requestGeometryUpdate(perference)
        } else {
            UIDevice.current.setValue(orientations, forKey: "orientation");
            UIViewController.attemptRotationToDeviceOrientation();
        }

    }

}
