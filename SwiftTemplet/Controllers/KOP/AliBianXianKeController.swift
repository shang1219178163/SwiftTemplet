//
//  AliBianXianKeController.swift
//  SwiftTemplet
//
//  Created by Bin Shang on 2020/9/24.
//  Copyright © 2020 BN. All rights reserved.
//

import UIKit
import Alamofire
import SwiftExpand


class AliBianXianKeController: UIViewController {

    let kAppkeyBXK = "820906ac"
    let kAppSecretBXK = "0c5d534e9f018b168b88d8542921c47f"
    
    let kServiceUrlBXK = "http://bxapi.dataoke.com/api/wap/component/pool"
//http://bxk.dataoke.com/?r=wap&appkey=820906ac&tempkey=4f2cb501
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        edgesForExtendedLayout = []
        view.backgroundColor = .white
        
        let btn = UIButton.create(title: "done", textColor: .theme, backgroundColor: .white)
        btn.addActionHandler { (control) in
            self.test()
        }
        let doneItem = UIBarButtonItem(customView: btn)
        navigationItem.rightBarButtonItems = [doneItem, ]
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        test()
    }

    // MARK: -funtions
    func test() {
        let comId = 2611
        let type = 8
        
        let sigContent = "appkey=\(kAppkeyBXK)&client=\("app")&comId=\(comId)&type=\(type)"
        let sig = (sigContent + kAppSecretBXK).md5
        
        let params: [String : Any] = [
        "appKey":   kAppkeyBXK,
        "client":   "app",
        "comId":   comId,
        "type":   type,
        "sig":   sig,
        ]
        request(kServiceUrlBXK, params: params)
        
    }
    
    func request(_ url: String, method: HTTPMethod = .get, params: [String: Any]) {
        guard let URL = URL(string: url) else {
            DDLog("url 错误:\(url)")
            return }
        
        DDLog(url)
        DDLog(params.jsonString)
        AF.request(URL, method: method, parameters: params, headers: nil)
            .response { (response) in
                guard let data = response.data,
                      let jsonDic = data.objValue as? [String : Any] else {
                    DDLog("数据解析错误")
                    return;
                }
                DDLog(jsonDic.jsonString)
        }
    }
}
