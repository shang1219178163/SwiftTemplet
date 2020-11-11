//
//  NNActivity.swift
//  SwiftTemplet
//
//  Created by Bin Shang on 2020/11/11.
//  Copyright © 2020 BN. All rights reserved.
//

import UIKit


@objcMembers class NNActivity: UIActivity {
    
    public var title = ""
    public var image: UIImage?
    public var url: NSURL?
    public var type = ""
    public var shareContexts: [Any]?

    override class var activityCategory: UIActivity.Category{
//        return .share
        return .action
    }
    
    override var activityType: UIActivity.ActivityType?{
        return ActivityType(type)
    }
    
    override var activityTitle: String?{
        return title
    }
        
    override var activityImage: UIImage?{
        return image
    }
    
    override func canPerform(withActivityItems activityItems: [Any]) -> Bool {
        return activityItems.count > 0
    }
    
    override func prepare(withActivityItems activityItems: [Any]) {
        print(#function, activityItems)
    }
       
    public override func perform() {
        UIApplication.openURLString("https://www.baidu.com/?tn=sitehao123")
        activityDidFinish(true)
    }
    
}
