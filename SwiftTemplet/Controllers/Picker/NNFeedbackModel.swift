//
//  NNFeedbackModel.swift
//  ParkingWang
//
//  Created by Bin Shang on 2020/8/3.
//  Copyright © 2020 Xi'an iRain IoT. Technology Service CO., Ltd. . All rights reserved.
//

import UIKit


@objcMembers class NNFeedbackModel: NSObject {

    ///反馈类型 默认值 issue
    var type = "issue"
    var content = ""
    var contact = ""
    var imageUrls: [String] = []
    
}
