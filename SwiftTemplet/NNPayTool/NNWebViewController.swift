//
//  NNWebViewController.swift
//  SwiftTemplet
//
//  Created by Bin Shang on 2020/7/15.
//  Copyright © 2020 BN. All rights reserved.
//

import UIKit
import WebKit
import SwiftExpand
import SnapKitExtend

@objc protocol NNWebViewControllerDelegate: NSObjectProtocol{
    @objc func webViewController(_ vc: NNWebViewController, absoluteString: String)
    
}

@objcMembers class NNWebViewController: UIViewController {
    
    weak var delegate: NNWebViewControllerDelegate?
    
    lazy var webView: WKWebView = {
        let conf = WKWebView.confiDefault
        conf.applicationNameForUserAgent = "IRAIN_KOP"
        
        let view = WKWebView(frame: self.view.bounds, configuration: conf)
        view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        view.uiDelegate = self
        view.navigationDelegate = self
        view.allowsBackForwardNavigationGestures = true
        view.scrollView.showsHorizontalScrollIndicator = false
        view.scrollView.showsVerticalScrollIndicator = true
        if #available(iOS 10.0, *) {
            view.scrollView.refreshControl = self.refreshControl;
        }
        view.addObserver(self, forKeyPath: "estimatedProgress", options: .new, context: nil)
        view.addObserver(self, forKeyPath: "URL", options: .new, context: nil)
        return view
    }()
    
    lazy var refreshControl: UIRefreshControl = {
        let view = UIRefreshControl()
        view.addTarget(self, action:#selector(loadRequest), for: .valueChanged)
        return view
    }()
    
    lazy var progressView: UIProgressView = {
        let view = UIProgressView(frame: CGRect(x: 0, y: 0, width: self.view.bounds.size.width, height: 2))
        view.progressTintColor = .systemBlue
        return view
    }()
    
    
    var httpHeaderFieldsDic = [String: String]()

    var urlString: String = ""

    var loadContent: String = ""

    var URLScheme: String {
        var result = "wx.parkingwang.com"
        #if DEBUG
            result = "dev.parkingwang.com"
        #endif
        return result
    }
    ///第三方公司微信 H5 支付配置的授权域名
    var refererUrl: String?

    ///查询结果指引页
    var redirect_url: String = ""
    
    var isLoading: Bool = false

    // MARK: -lifecycle
    deinit {
        NotificationCenter.default.removeObserver(self, name: NSNotification.Name(rawValue: "payReturn"), object: nil)
        webView.removeObserver(self, forKeyPath: "estimatedProgress")
        webView.removeObserver(self, forKeyPath: "URL")
        webView.stopLoading()
        webView.uiDelegate = nil
        webView.navigationDelegate = nil
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        edgesForExtendedLayout = []
        navigationController?.navigationBar.setBackgroudColor(nil, for: .default)
                
        let backBarItem = UIBarButtonItem(image: UIImage(named: "icon_arrow_left_gray")!, style: .plain, target: self, action: #selector(handleActionItem(_:)))
        let closeBarItem = UIBarButtonItem(image: UIImage(named: "icon_close_gray")!, style: .plain, target: self, action: #selector(handleActionItem(_:)))
        let updateBarItem = UIBarButtonItem(title: "刷新", style: .plain, target: self, action: #selector(handleActionItem(_:)))
        backBarItem.tag = 0
        closeBarItem.tag = 1
        updateBarItem.tag = 2
        navigationItem.leftBarButtonItems = [backBarItem, closeBarItem,]
//        navigationItem.leftBarButtonItems = [backBarItem,]
        navigationItem.rightBarButtonItems = [updateBarItem,]
                
        view.addSubview(webView)
        webView.addSubview(progressView)
//        webView.load(URLRequest(url: URL(string: "https://www.apple.com")!))
        
        NotificationCenter.default.addObserver(self, selector: #selector(refreshOrderResult), name: NSNotification.Name(rawValue: "payReturn"), object: nil)
        
        if urlString == "" && loadContent == "" {
            NNProgressHUD.showText("urlString和loadContent不能同时为空")
            return
        }
        loadRequest()
    }
        
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
//        UIScrollView.appearance().contentInsetAdjustmentBehavior = .never
    }
    
    @objc func handleActionItem(_ item: UIBarButtonItem) {
        switch item.tag {
        case 0:
            if webView.canGoBack {
                webView.goBack()
                return
            }
            webView.stopLoading()
            navigationController?.popViewController(animated: true)

        case 1:
            webView.stopLoading()
            navigationController?.popViewController(animated: true)

        case 2:
            webView.reload()

        default:
            break
        }
    }
    
    //MARK: -observe

    override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
        if keyPath == "estimatedProgress" {
            progressView.isHidden = (webView.estimatedProgress >= 1)
            progressView.setProgress(Float(webView.estimatedProgress), animated: true)
            if webView.estimatedProgress >= 1 {
                refreshControl.endRefreshing()
            }

        } else if keyPath == "URL" {
            guard let url = webView.url,
                  let absoluteString = url.absoluteString as String?
                  else { return }
            DDLog(absoluteString.removingPercentEncoding as Any)
            
            if let delegate = delegate {
                delegate.webViewController(self, absoluteString: url.absoluteString)
            }
    
            if absoluteString.hasPrefix("tel:") {
                UIApplication.openURLString(url.absoluteString)
            }
            //拦截特定接口追加 header 参数
//            if absoluteString.contains("fee_charge/ibean_pay?") {
//                request(absoluteString)
//            }
            
        } else {
            super.observeValue(forKeyPath: keyPath, of: object, change: change, context: context)
        }
    }
    
    @objc func loadRequest() {
        if let url = URL(string: urlString) as URL? {
            request(urlString)
            
        } else if loadContent != ""{
            webView.loadHTMLString(loadContent, baseURL: nil)
            
        } else {
            print("\(#function) urlString和loadContent不能同时为空")
            
        }
    }
    
    @objc func refreshOrderResult() {
        guard let urlStr = redirect_url.removingPercentEncoding as String? else { return }
        if let url = URL(string: urlStr) as URL? {
            var request = URLRequest(url: url as URL)
            httpHeaderFieldsDic.forEach { (key, value) in
                request.addValue(value, forHTTPHeaderField: key)
            }
            webView.load(request)
        }
    }
    
    
    func request(_ urlString: String?) {
        webView.loadUrl(urlString, additionalHttpHeaders: httpHeaderFieldsDic)
    }
}

extension NNWebViewController: WKUIDelegate{
    //MARK: -webView
    func webView(_ webView: WKWebView, didStartProvisionalNavigation navigation: WKNavigation!) {

    }
    
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        webView.evaluateJavaScript("document.title") { (obj, error) in
            guard let title = obj as? String else {
                print(obj as Any)
                return
            }
            if title.contains(".png") {
                self.title = "图片"

            } else {
                self.title = title
            }
        }
        let doc = "document.body.outerHTML";
        webView.evaluateJavaScript(doc) { (obj, error) in
//            print(obj)
        }
        
        refreshControl.endRefreshing()
    }
        
    func webViewWebContentProcessDidTerminate(_ webView: WKWebView) {
        NSLog("进程被终止");
        webView.reload()
    }

    func webView(_ webView: WKWebView, decidePolicyFor navigationAction: WKNavigationAction, decisionHandler: @escaping (WKNavigationActionPolicy) -> Void) {
//        decisionHandler(.allow)
        guard let url = navigationAction.request.url as URL?,
            let absoluteString = url.absoluteString as String?
            else { return }

//        DDLog(absoluteString)
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
            let referer = refererUrl ?? (URLScheme + "://")

            let request = NSMutableURLRequest(url: url, cachePolicy: .useProtocolCachePolicy, timeoutInterval: 20)
            request.httpMethod = "GET"
            request.allHTTPHeaderFields = navigationAction.request.allHTTPHeaderFields;
            request.setValue(referer, forHTTPHeaderField: "Referer")

            if absoluteString.contains("redirect_url") {
                let range: NSRange = (absoluteString as NSString).range(of: "redirect_url=")
                var reqUrl: String = (absoluteString as NSString).substring(to: range.location + range.length)
                reqUrl = reqUrl + referer
                request.url = URL(string: reqUrl)

                redirect_url = (absoluteString as NSString).substring(from: range.location + range.length)
                DDLog(reqUrl, redirect_url)

            } else {
                let tmp = referer.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed) ?? ""
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
        else if (absoluteString.contains("tbopen")) {//淘宝
            isLoading = false;
            UIApplication.openURL(url)
            decisionHandler(.allow);
        }
        else {
            decisionHandler(.allow);
        }
    }
    
    func webView(_ webView: WKWebView, runJavaScriptAlertPanelWithMessage message: String, initiatedByFrame frame: WKFrameInfo, completionHandler: @escaping () -> Void) {
        DDLog(message)
        UIAlertController.showAlert("温馨提示", message: message, actionTitles: [kTitleSure]) { (action) in
            completionHandler();
        }
    }
    
    func webView(_ webView: WKWebView, runJavaScriptConfirmPanelWithMessage message: String, initiatedByFrame frame: WKFrameInfo, completionHandler: @escaping (Bool) -> Void) {
        DDLog(message)
        UIAlertController.showAlert("温馨提示", message: message, actionTitles: [kTitleSure]) { (action) in
            if action.title == kTitleCancell{
                completionHandler(false)
                return
            }
            completionHandler(true)
        }
    }
    
    func webView(_ webView: WKWebView, runJavaScriptTextInputPanelWithPrompt prompt: String, defaultText: String?, initiatedByFrame frame: WKFrameInfo, completionHandler: @escaping (String?) -> Void) {
        let alertVC = UIAlertController(title: nil, message: prompt, preferredStyle: .alert)
        alertVC.addTextField { (textField) in
            textField.text = defaultText
        }

        alertVC.addAction(UIAlertAction(title: "OK", style: .default, handler: { (action) in
            if let text = alertVC.textFields?.first?.text {
                completionHandler(text)
            } else {
                completionHandler(defaultText)
            }
        }))

        alertVC.addAction(UIAlertAction(title: "Cancel", style: .default, handler: { (action) in
            completionHandler(nil)
        }))

        if let rootVC = UIApplication.shared.keyWindow?.rootViewController {
            rootVC.present(alertVC, animated: true, completion: nil)
        }
    }
}

extension NNWebViewController: WKNavigationDelegate{
    func webView(_ webView: WKWebView, didFailProvisionalNavigation navigation: WKNavigation!, withError error: Error) {
//        UIAlertController.showAlert("提示", message: (error as NSError).domain, actionTitles: nil, handler: nil);
//        IOPProgressHUD.showError(withStatus: (error as NSError).domain)
    }
    
    func webView(_ webView: WKWebView, didFail navigation: WKNavigation!, withError error: Error) {
//        UIAlertController.showAlert("提示", message: (error as NSError).domain, actionTitles: nil, handler: nil);
//        IOPProgressHUD.showError(withStatus: (error as NSError).domain)
    }
}

extension NNWebViewController: WKScriptMessageHandler{
    //MARK: -WKScriptMessageHandler js 拦截 调用OC方法
    func userContentController(_ userContentController: WKUserContentController, didReceive message: WKScriptMessage) {
        print(message)
        let methodStr = message.name + ":"
        let selector = NSSelectorFromString(methodStr)
        if self.responds(to: selector) {
            self.perform(selector)
        } else {
            print("未实行方法-", methodStr)
        }
    }
}
