//
//	NNOrderPayH5Controller.swift
//	MacTemplet
//
//	Created by shang on 2020/06/04 16:28
//	Copyright © 2020 shang. All rights reserved.
//


import UIKit
import WebKit
import SwiftExpand

//let kAppUniversalLink = "https://wx.parkingwang.com/"
//let kPayURLScheme = "ParkingWang"
//
//let kWXAppID = ""
//let kWXAppSecret = ""
//
//let kAliAppId = ""
        
///ali/wx h5 支付页
@objcMembers class NNOrderPayH5Controller: UIViewController {
        
    let URLScheme = "www.adc.com"
    /// 接口返回 url
    var urlString: String = ""

    ///查询结果
    var redirect_url: String = ""

    var isLoading: Bool = false
    
    lazy var webView: NNWebView = {
        let view: NNWebView = NNWebView(frame: self.view.bounds)
        view.delegate = self
        return view
    }()

    // MARK: -lifecycle
    
    deinit {
        NotificationCenter.default.removeObserver(self, name: NSNotification.Name(rawValue: "payReturn"), object: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        edgesForExtendedLayout = []
        title = "优惠券支付"
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "返回", style: .plain, target: self, action: #selector(handleAction(_:)))
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "查看记录", style: .plain, target: self, action: #selector(handleAction(_:)))
        view.backgroundColor = UIColor.background
        view.addSubview(webView)
        
        NotificationCenter.default.addObserver(self, selector: #selector(refreshOrderResult), name: NSNotification.Name(rawValue: "payReturn"), object: nil)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        if urlString != "" {
            webView.urlString = urlString
        }
    }
    // MARK: -funtins
    func refreshOrderResult() {
        guard let urlStr = redirect_url.removingPercentEncoding as String? else { return }
        webView.urlString = urlStr
    }
    
    @objc func handleAction( _ sender: UIBarButtonItem) {
//        if sender.title == "返回" {
//            switch self.navigationController?.viewControllers[1] {
//            case is PHHCouponShopVC://返回列表 1
//                navigationController?.popToVC(PHHCouponShopVC.self, animate: true)
//
//            case is PHHOrderVC://返回列表 2
//                navigationController?.popToVC(PHHOrderVC.self, animate: true)
//
//            default:
//                navigationController?.popViewController(animated: true)
//            }
//            return
//        }
//        //跳转支付记录列表
//        let storyboard = UIStoryboard(name: "Account", bundle: Bundle.main)
//        let controller: UIViewController = storyboard.instantiateViewController(withIdentifier: "PHHOrderVC")
//        navigationController?.pushViewController(controller, animated: true)
    }
    
}


extension NNOrderPayH5Controller: NNWebViewDelegate{
    
    func webView(_ webView: WKWebView, decidePolicyFor navigationAction: WKNavigationAction, decisionHandler: @escaping (WKNavigationActionPolicy) -> Void) {
        guard let url = navigationAction.request.url as URL?,
            let absoluteString = url.absoluteString as String?
            else { return }

        DDLog(absoluteString)
        if absoluteString.contains("alipay://alipayclient") {
            let tmp = absoluteString.replacingOccurrences(of: "alipays", with: URLScheme)
            UIApplication.openURLString(tmp)
            decisionHandler(.allow)
            return
        }

        //self.load  用来控制对 @"https://wx.tenpay.com/cgi-bin/mmpayweb-bin/checkmweb?" 的拦截
        if absoluteString.contains("weixin://wap/pay") {
            isLoading = false
            UIApplication.openURL(url)
            decisionHandler(.cancel)
        } else if absoluteString.contains("https://wx.tenpay.com/cgi-bin/mmpayweb-bin/checkmweb?") && !isLoading {
            let referer = URLScheme + "://"

            let request = NSMutableURLRequest(url: url, cachePolicy: .useProtocolCachePolicy, timeoutInterval: 20)
            request.allHTTPHeaderFields = navigationAction.request.allHTTPHeaderFields;
            request.setValue(referer , forHTTPHeaderField: "Referer")
                        
            let tmp = URLScheme.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed) ?? ""
            if absoluteString.contains("redirect_url") {
                let range: NSRange = (absoluteString as NSString).range(of: "redirect_url=")
                var reqUrl: String = (absoluteString as NSString).substring(to: range.location + range.length)
                reqUrl = reqUrl + referer
                request.url = URL(string: reqUrl)
                
                redirect_url = (absoluteString as NSString).substring(from: range.location + range.length)
                DDLog(reqUrl, redirect_url)

            } else {
                let reqUrl = "\(absoluteString)&redirect_url=\(tmp)"
                request.url = URL(string: reqUrl)
                DDLog(reqUrl)
            }
            
            webView.load(request as URLRequest)

            isLoading = true
            decisionHandler(.cancel)
        }
        else if (absoluteString.contains("https://wx.tenpay.com/cgi-bin/mmpayweb-bin/checkmweb?")) {
            isLoading = false;
            decisionHandler(.allow);
        }
        else {
            decisionHandler(.allow);
        }
    }
}
