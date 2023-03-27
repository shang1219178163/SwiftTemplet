//
//  TestBlockController.swift
//  SwiftTemplet
//
//  Created by shangbinbin on 2023/3/27.
//  Copyright © 2023 BN. All rights reserved.
//

import UIKit

class TestBlockController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    //    = UNUserNotificationCenter.current().isAuthorized
    @available(iOS 15.0, *)
    func performAuthorizationFlow(authorized: () async -> Bool) async throws -> Bool {
        let result = await authorized();
        return result;
    }
}


extension UNUserNotificationCenter{
    
    @available(iOS 15.0, *)
    func isAuthorized() async -> Bool{
        if case .authorized = await UNUserNotificationCenter
            .current()
            .notificationSettings()
            .authorizationStatus {
            return true
        } else {
            return false
        }
    }
}
