//
//  NNResourceManager.swift
//  SwiftTemplet
//
//  Created by shang on 2026/8/23.
//  Copyright © 2026 BN. All rights reserved.
//

import UIKit

/// 全局资源单例：统一持有网图占位、默认头像、全局网图地址等
class NNResourceManager {

    static let shared = NNResourceManager()

    private init() {
//        placeholderImageName = "postImage"
//        defaultAvatarImageName = "bug.png"

//        imageBaseURL = ""
//        avatarURL = ""
//        bannerURL = ""
    }

    // MARK: -属性
//    /// 网图加载占位图
//    var placeholderImage: UIImage? {
//        return UIImage(named: placeholderImageName)
//    }
//
//    /// 默认头像（本地占位）
//    var defaultAvatarImage: UIImage? {
//        return UIImage(named: defaultAvatarImageName)
//    }

//    /// 全局默认网图前缀
//    var imageBaseURL: String?
//    /// 默认头像网图地址
//    var avatarURL: String?
//    /// 默认背景网图地址
//    var bannerURL: String?

    /// 全局网图 URL 列表
    lazy var imageUrls: [String] = [
        "https://yl-prescription-share.oss-cn-beijing.aliyuncs.com/test/message/document/1737078692/im/msg/rec/651722246582308864.jpg",
        "https://yl-prescription-share.oss-cn-beijing.aliyuncs.com/test/message/document/1737078705/im/msg/rec/651722301611577344.jpg",
        "https://yl-prescription-share.oss-cn-beijing.aliyuncs.com/test/message/document/1737337130/im/msg/rec/652806214488559616.jpg",
        "https://yl-prescription-share.oss-cn-beijing.aliyuncs.com/test/message/document/1737337130/im/msg/rec/652806216854147072.jpg",
        "https://yl-prescription-share.oss-cn-beijing.aliyuncs.com/test/message/document/1737337130/im/msg/rec/652806216086589440.jpg",
        "https://yl-prescription-share.oss-cn-beijing.aliyuncs.com/test/message/document/1737337130/im/msg/rec/652806217546207232.jpg",
        "https://yl-prescription-share.oss-cn-beijing.aliyuncs.com/test/message/document/1737337131/im/msg/rec/652806218489925632.jpg",
        "https://yl-prescription-share.oss-cn-beijing.aliyuncs.com/test/message/document/1737337131/im/msg/rec/652806219450421248.jpg",
        "https://yl-prescription-share.oss-cn-beijing.aliyuncs.com/test/message/document/1737337131/im/msg/rec/652806220805181440.jpg",
        "https://yl-prescription-share.oss-cn-beijing.aliyuncs.com/test/message/document/1737337132/im/msg/rec/652806222130581504.jpg",
        "https://yl-prescription-share.oss-cn-beijing.aliyuncs.com/test/message/document/1737337132/im/msg/rec/652806224420671488.jpg",
        "https://yl-prescription-share.oss-cn-beijing.aliyuncs.com/test/message/document/1737343844/im/msg/rec/652834375670566912.jpg",
        "https://yl-prescription-share.oss-cn-beijing.aliyuncs.com/test/message/document/1737343889/im/msg/rec/652834566318460928.jpg",
        "https://yl-prescription-share.oss-cn-beijing.aliyuncs.com/test/message/document/1737343924/im/msg/rec/652834709679771648.png",
    ]

//    /// 网图占位图名（本地资源名）
//    var placeholderImageName: String
//    /// 默认头像占位图名（本地资源名）
//    var defaultAvatarImageName: String
}
