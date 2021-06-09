//
//  EDriverViewController.swift
//  SwiftTemplet
//
//  Created by Bin Shang on 2020/9/21.
//  Copyright © 2020 BN. All rights reserved.
//

import UIKit
import Alamofire
import SwiftExpand


class EDriverViewController: UIViewController {
    
    let kAppkeyEDriver = "61000158"
    let kAppSecretEDriver = "0031186e-5cc6-45a6-a090-3e88ec220452"
    let kFromEDriver = "01051889"
    let kVer = "3.4.2"

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        edgesForExtendedLayout = []
        view.backgroundColor = .white
        
        let btn = UIButton.create(title: "done", textColor: .theme, backgroundColor: .white)
        btn.addActionHandler { (control) in
            self.login()
        }
        let btn1 = UIButton.create(title: "done1", textColor: .theme, backgroundColor: .white)
        btn1.addActionHandler { (control) in
            self.login2()
        }
        let doneItem = UIBarButtonItem(customView: btn)
        let doneItem1 = UIBarButtonItem(customView: btn1)

        navigationItem.rightBarButtonItems = [doneItem, doneItem1]
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        self.testDriver()
    }

    // MARK: -funtions
    func testDriver() {
        let params = (kAppSecretEDriver + "appkey\(kAppkeyEDriver)from\(kFromEDriver)gpsType\("baidu")latitude\(40.018707)longitude\(116.476561)timestamp\("2019-05-23 19:30:35")udid\(123456)ver\("3.4.2")" + kAppSecretEDriver)
        
        let sig = params.md5.substring(0, length: 30)
        DDLog(params, sig, sig.count)
        
//        let urlString =  "http://open.d.api.edaijia.cn/driver/idle/list?appkey=\(kAppkeyEDriver)&from=\(kFromEDriver)&gpsType=\("baidu")&latitude=\(40.018707)&longitude=\(116.476561)&sig=\(sig)&timestamp=\("2019-05-23 19:30:35")&udid=\(123456)&ver=\("3.4.2")"
//        request(urlString)
    }
    
    func login() {
        let dateStr = DateFormatter.stringFromDate(Date())
        DDLog(dateStr)

        let sigContent = "appkey61000158from01051889gpsTypebaidulatitude40.018707longitude116.476561phone17600727828timestamp\(dateStr)udid123456ver3.4.2"
        let sig = (kAppSecretEDriver + sigContent + kAppSecretEDriver).md5.substring(0, length: 30)
        DDLog(sigContent)
//        DDLog(sig, sig.count)
        
        let urlString = "http://open.d.api.edaijia.cn/customer/authorizeToken?appkey=\(61000158)&from=\("01051889")&gpsType=\("baidu")&latitude=\(40.018707)&longitude=\(116.476561)&phone=\("17600727828")&sig=\(sig)&timestamp=\(dateStr)&udid=\(123456)&ver=\("3.4.2")"
        DDLog(urlString)
    }
    
    func login2() {
        let dateStr = DateFormatter.stringFromDate(Date())
        DDLog(dateStr)
        
        let sigContent = "appkey\(kAppkeyEDriver)from\(kFromEDriver)gpsType\("baidu")latitude\(40.018707)longitude\(116.476561)phone\("17600727828")timestamp\(dateStr)udid\(123456)ver\("3.4.2")"
        let sig = (kAppSecretEDriver + sigContent + kAppSecretEDriver).md5.substring(0, length: 30)
        DDLog(sigContent)
//        DDLog(sig, sig.count)

        let urlString = "http://open.d.api.edaijia.cn/customer/authorizeToken?appkey=\(kAppkeyEDriver)&from=\(kFromEDriver)&gpsType=\("baidu")&latitude=\(40.018707)&longitude=\(116.476561)&phone=\("17600727828")&sig=\(sig)&timestamp=\(dateStr)&udid=\(123456)&ver=\("3.4.2")"
        
        let params = ["appkey":   kAppkeyEDriver,
        "from":   kFromEDriver,
        "gpsType":   "baidu",
        "latitude":   "40.018707",
        "longitude":   "116.476561",
        "phone":   "17600727828",
        "sig":   sig,
        "timestamp":   dateStr,
        "udid":   "123456",
        "ver":   "3.4.2",
        ]
        
        let urlStr = "http://open.d.api.edaijia.cn/customer/authorizeToken"
        request(urlStr, params: params)
//        guard let URL = URL(string: urlStr) else {
//            DDLog(urlStr)
//            return }
//
//        Alamofire.request(URL, method: .post, parameters: params, headers: nil)
//            .response { (response) in
//
//                guard response.response?.statusCode == 200 else {
//                    DDLog("数据请求错误")
//                    return;
//                }
//
//                guard let jsonDic: [String : Any] = JSONSerialization.jsonObjectFromData(response.data!) as? [String : Any] else {
//                    DDLog("数据解析错误")
//                    return;
//                }
//                DDLog(jsonDic.jsonString)
//        }
//            let sigContent = "appkey61000158from01051889gpsTypebaidulatitude40.018707longitude116.476561phone17600727828timestamp2020-09-21 17:54:40udid123456ver3.4.2"
//            let sig = (kAppSecretEDriver + sigContent + kAppSecretEDriver).md5.substring(0, length: 30)
//            DDLog(sig, sig.count)
//
//            let urlString = "http://open.d.api.edaijia.cn/customer/authorizeToken?appkey=\(61000158)&from=\("01051889")&gpsType=\("baidu")&latitude=\(40.018707)&longitude=\(116.476561)&phone=\("17600727828")&sig=\(sig)&timestamp=\("2020-09-21 17:54:40")&udid=\(123456)&ver=\("3.4.2")"

//        let urlString = "http://open.d.api.edaijia.cn/customer/authorizeToken?appkey=\(kAppkeyEDriver)&from=\(kFromEDriver)&gpsType=\("baidu")&latitude=\(40.018707)&longitude=\(116.476561)&phone=\("1760072782")&sig=\(sig)&timestamp=\("2020-09-21 17:30:57")&udid=\(123456)&ver=\("3.4.2")"
//        request(urlString)
    }
    
    func request(_ url: String, method: HTTPMethod = .post, params: [String: Any]) {
        guard let URL = URL(string: url) else {
            DDLog(url)
            return }
        
        AF.request(URL, method: .post, parameters: params, headers: nil)
            .response { (response) in
                
                guard response.response?.statusCode == 200 else {
                    DDLog("数据请求错误")
                    return;
                }
                
                guard let data = response.data,
                      let jsonDic = data.objValue as? [String : Any] else {
                    DDLog("数据解析错误")
                    return;
                }
                DDLog(jsonDic.jsonString)
        }
    }
}
