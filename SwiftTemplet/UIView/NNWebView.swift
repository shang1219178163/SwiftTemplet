//
//  NNWebView.swift
//  SwiftTemplet
//
//  Created by Bin Shang on 2019/7/5.
//  Copyright © 2019 BN. All rights reserved.
//

import UIKit
import WebKit
import SwiftExpand

@objc protocol NNWebViewDelegate: NSObjectProtocol {
    @objc optional func webView(_ webView: WKWebView, url: URL)
    
    @objc optional func webView(_ webView: WKWebView, didFinishNavigation: WKNavigation!)

    @objc func webView(_ webView: WKWebView, decidePolicyFor navigationAction: WKNavigationAction, decisionHandler: @escaping (WKNavigationActionPolicy) -> Void)

}

@objc class NNWebView: UIView {
    
    weak var delegate: NNWebViewDelegate?
   
    var httpHeaderFieldsDic = [String: String]()

    var urlString: String = ""{
        willSet{
            DispatchQueue.main.async{
                self.request(newValue)
            }
        }
    }
    
    var htmlString: String = ""{
        willSet{
//            webView.loadHTMLString(newValue, baseURL: nil)
            webView.loadHTMLStringWithMagic(newValue, baseURL: nil)
        }
    }
    
    var jsString: String = ""
    
    var loadingProgressColor: UIColor = UIColor.systemBlue {
        willSet{
            progressView.progressTintColor = newValue
        }
    }
    
    var userAgent: String = ""

    var URLScheme: String {
        var result = "wx.parkingwang.com"
        #if DEBUG
            result = "dev.parkingwang.com"
        #endif
        return result
    }
    ///第三方公司微信 H5 支付配置的授权域名
    var refererUrl: String?

    ///查询结果
    var redirect_url: String = ""
    
    var isLoading: Bool = false
    
    var titleBlock:((String)->Void)?

    // MARK: -lifecycle
    deinit {
        webView.removeObserver(self, forKeyPath: "estimatedProgress")
        webView.removeObserver(self, forKeyPath: "URL")
        webView.stopLoading()
        webView.uiDelegate = nil
        webView.navigationDelegate = nil
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        autoresizingMask = [.flexibleWidth, .flexibleHeight]
        backgroundColor = UIColor.white;
        self.addSubview(webView)
        self.addSubview(progressView)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        progressView.frame = CGRect(x: 0, y: 0, width: bounds.size.width, height: 1.5)
        webView.frame = CGRect(x: 0, y: 0, width: bounds.size.width, height: frame.size.height)
    }
    
    //MARK: -observe

    override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
        if keyPath == "estimatedProgress" {
            progressView.setProgress(Float(webView.estimatedProgress), animated: true)
            if webView.estimatedProgress >= 1 {
                progressView.isHidden = true
                refreshControl.endRefreshing()
            }
            
        } else if keyPath == "URL" {
            guard let url = webView.url
                  else { return }
            let absoluteString = url.absoluteString
            DDLog(absoluteString.removingPercentEncoding as Any)
            
            if let delegate = delegate {
                delegate.webView?(self.webView, url: url)
//                webView.stopLoading()
                return
            }
            
            if absoluteString.hasPrefix("tel:") {
                UIApplication.openURLString(url.absoluteString)
            }
            
        } else {
            super.observeValue(forKeyPath: keyPath, of: object, change: change, context: context)
        }
    }

    
    @objc func refreshOrderResult() {
        webView.loadUrl(redirect_url, additionalHttpHeaders: httpHeaderFieldsDic, isAddUserScript: false)
    }
    
    func request(_ urlString: String?) {
        guard let urlString = urlString, urlString != "" else {
            refreshControl.endRefreshing()
            return }
        progressView.setProgress(0, animated: false)
        progressView.isHidden = false
        
        webView.loadUrl(urlString, additionalHttpHeaders: httpHeaderFieldsDic)
    }
    
    @objc func webViewReload() {
        guard let url = webView.url, url.absoluteString.hasPrefix("http") else {
            webView.scrollView.refreshControl?.endRefreshing()
            return }
        webView.reload()
    }
    
    @objc func back(_ item: UIBarButtonItem) {
        if webView.canGoBack {
            webView.goBack()
        }
    }
    
   
    //MARK: -lazy
    lazy var webView: WKWebView = {
        let conf = WKWebView.confiDefault
        conf.applicationNameForUserAgent = "IRAIN_KOP"
        
        let view = WKWebView(frame: self.bounds, configuration: conf)
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
        view.addTarget(self, action:#selector(webViewReload), for: .valueChanged)
        return view
    }()
    
    lazy var progressView: UIProgressView = {
        let view = UIProgressView(frame: CGRect(x: 0, y: 0, width: bounds.size.width, height: 2))
        return view
    }()
}

extension NNWebView: WKNavigationDelegate{
    func webView(_ webView: WKWebView, didStartProvisionalNavigation navigation: WKNavigation!) {

    }
    
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        delegate?.webView?(webView, didFinishNavigation: navigation)

        webView.evaluateJavaScript("document.title") { (obj, error) in
            guard let title = obj as? String else {
                print(obj as Any)
                return
            }
            if title.contains(".png") {
                self.titleBlock?("图片")
            } else {
                self.titleBlock?("title")
            }
        }
        let doc = "document.body.outerHTML";
        webView.evaluateJavaScript(doc) { (obj, error) in
//            print(obj)
        }
        refreshControl.endRefreshing()
    }
    //! WKWeView在每次加载请求前会调用此方法来确认是否进行请求跳转
    func webView(_ webView: WKWebView, decidePolicyFor navigationAction: WKNavigationAction, decisionHandler: @escaping (WKNavigationActionPolicy) -> Void) {
        if delegate == nil {
            decisionHandler(.allow)
            return
        }
        
        if navigationAction.targetFrame == nil{
            webView.load(navigationAction.request)
            decisionHandler(.allow)
            return
        }
        
        delegate?.webView(webView, decidePolicyFor: navigationAction, decisionHandler: decisionHandler)
    }
    
//    func webView(_ webView: WKWebView, didFailProvisionalNavigation navigation: WKNavigation!, withError error: Error) {
//        UIAlertController.showAlert("提示", message: error.localizedDescription, actionTitles: nil, handler: nil);
//    }
//
//    func webView(_ webView: WKWebView, didFail navigation: WKNavigation!, withError error: Error) {
//        UIAlertController.showAlert("提示", message: error.localizedDescription, actionTitles: nil, handler: nil);
//    }
    
    func webViewWebContentProcessDidTerminate(_ webView: WKWebView) {
        webView.reload()
    }
    
}


extension NNWebView: WKUIDelegate{
    func webView(_ webView: WKWebView, createWebViewWith configuration: WKWebViewConfiguration, for navigationAction: WKNavigationAction, windowFeatures: WKWindowFeatures) -> WKWebView? {
        
        if let targetFrame = navigationAction.targetFrame, targetFrame.isMainFrame == false{
            webView.load(navigationAction.request)
        }
        return nil
    }
    
    func webView(_ webView: WKWebView, runJavaScriptAlertPanelWithMessage message: String, initiatedByFrame frame: WKFrameInfo, completionHandler: @escaping () -> Void) {
        DDLog(message)
        UIAlertController.showAlert("温馨提示", message: message, actionTitles: [kTitleSure], handler: { (alertVC, action) in
            completionHandler();
        })
    }
    
    func webView(_ webView: WKWebView, runJavaScriptConfirmPanelWithMessage message: String, initiatedByFrame frame: WKFrameInfo, completionHandler: @escaping (Bool) -> Void) {
        DDLog(message)
        UIAlertController.showAlert("温馨提示", message: message, actionTitles: [kTitleSure], handler: { (alertVC, action) in
            if action.title == kTitleCancell{
                completionHandler(false)
                return
            }
            completionHandler(true)
        })
    }
    
    func webView(_ webView: WKWebView, runJavaScriptTextInputPanelWithPrompt prompt: String, defaultText: String?, initiatedByFrame frame: WKFrameInfo, completionHandler: @escaping (String?) -> Void) {
        let alertVC = UIAlertController(title: nil, message: prompt, preferredStyle: .alert)
        alertVC.addTextField { (textField) in
            textField.text = defaultText
        }

        alertVC.addAction(UIAlertAction(title: "Ok", style: .default, handler: { (action) in
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


extension NNWebView: WKScriptMessageHandler{
    //MARK: -WKScriptMessageHandler js 拦截 调用OC方法
    func userContentController(_ userContentController: WKUserContentController, didReceive message: WKScriptMessage) {
        print(message)
//        let methodStr = message.name + ":"
//        let selector = NSSelectorFromString(methodStr)
//        if self.responds(to: selector) {
//            self.perform(selector)
//        } else {
//            print("未实行方法-", methodStr)
//        }
    }
}
