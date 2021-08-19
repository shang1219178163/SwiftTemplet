//
//  CryptoKitController.swift
//  SwiftTemplet
//
//  Created by Bin Shang on 2021/5/31.
//  Copyright © 2021 BN. All rights reserved.
//

import UIKit
import CryptoKit
import SwiftExpand


@available(iOS 13.2, *)
class CryptoKitController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        let uuid = UUID().uuidString
        DDLog(uuid) //
    }
    

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        encryptString()
    }
    
    func encryptString() {
        let str = "Hello CryptoKit"
        let data = str.data(using: .utf8)!

        let hash256 = SHA256.hash(data: data)
        let hash384 = SHA384.hash(data: data)
        let hash512 = SHA512.hash(data: data)

        print(hash256.description)
    }
    
    
    func encryptFile() {
        if let filePath = Bundle.main.path(forResource: "appLoginJson", ofType: "geojson"),
            let data = FileManager.default.contents(atPath: filePath) {
            
            let hash256 = SHA256.hash(data: data)
            let hash384 = SHA384.hash(data: data)
            let hash512 = SHA512.hash(data: data)
            
            print(hash256.description)
        }
    }

    
    func encryptHMAC() {
        // 构造一个salt
        let salt = "YungFan".data(using: .utf8)!

        // 密钥
        let key = SymmetricKey(size: .bits256)

        // HMAC with SHA256
        let authenticationCode = HMAC<SHA256>.authenticationCode(for: salt, using: key)
        print(authenticationCode)

        // 验证
        if HMAC<SHA256>.isValidAuthenticationCode(Data(authenticationCode),
                                                  authenticating: salt, using: key) {
            print("未被篡改")
        }
    }
}
