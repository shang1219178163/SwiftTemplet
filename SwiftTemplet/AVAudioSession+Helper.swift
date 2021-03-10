//
//  Helper.swift
//  SwiftTemplet
//
//  Created by Bin Shang on 2021/1/26.
//  Copyright © 2021 BN. All rights reserved.
//

import UIKit

import AVFoundation
@objc public extension AVAudioSession {

    ///音量开关
    static func volume(_ soundoff: Bool) {
        if #available(iOS 10.0, *) {
            let category: AVAudioSession.Category = soundoff == true ? .record : .ambient;
            do {
                try AVAudioSession.sharedInstance().setCategory(category, mode: .default)
                try AVAudioSession.sharedInstance().setActive(true)
            } catch {
                print(error)
            }
        }
    }
}
