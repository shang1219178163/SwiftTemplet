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
    @objc optional func webView(_ webView: WKWebView, decidePolicyFor navigationAction: WKNavigationAction, decisionHandler: @escaping (WKNavigationActionPolicy) -> Void);

}

@objc class NNWebView: UIView {
    
    weak var delegate: NNWebViewDelegate?
   
    var urlString: String = ""{
        willSet{
            DispatchQueue.main.async{
                self.loadRequest()
            }
        }
    }
    var jsString: String = ""
    var loadingProgressColor: UIColor = UIColor.systemBlue {
        willSet{
            progressView.progressTintColor = newValue
        }
    }
    
    var loadContent: String = ""{
        willSet{
            webView.loadHTMLString(newValue, baseURL: nil)
        }
    }

    ///展示重载按钮
    var showReloadBtn: Bool = false
    
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
        
        progressView.progressTintColor = loadingProgressColor
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
//        progressView.frame = CGRect(x: 0, y: 0, width: frame.size.width, height: 2)
//        webView.frame = CGRect(x: 0, y: 0, width: frame.size.width, height: frame.size.height)
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
            DDLog(webView.url?.absoluteString)
            
        } else {
            super.observeValue(forKeyPath: keyPath, of: object, change: change, context: context)
        }
    }
    
    @objc func loadRequest() {
        assert(urlString != "")
        if !urlString.hasPrefix("http") {
            urlString = "http://" + urlString;
        }
        if urlString != "", let url = NSURL(string: urlString) as NSURL? {
            let request = URLRequest(url: url as URL)
            webView.load(request)
        } else {
            print("\(#function) 链接无效:\(urlString)")
        }
    }
    
    @objc func webViewReload() {
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
        view.addTarget(self, action:#selector(loadRequest), for: .valueChanged)
        return view
    }()
    
    lazy var progressView: UIProgressView = {
        let view: UIProgressView = UIProgressView(frame: CGRect(x: 0, y: 0, width: bounds.size.width, height: 2))
        return view
    }()
}

extension NNWebView: WKUIDelegate{
    //MARK: -webView
    func webView(_ webView: WKWebView, didStartProvisionalNavigation navigation: WKNavigation!) {
        if showReloadBtn {
            webView.isHidden = false
        }
    }
    
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        webView.evaluateJavaScript("document.title") { (obj, error) in
//            print(obj)
        }
        refreshControl.endRefreshing()
    }
    
    func webView(_ webView: WKWebView, decidePolicyFor navigationAction: WKNavigationAction, decisionHandler: @escaping (WKNavigationActionPolicy) -> Void) {
        if delegate == nil {
            decisionHandler(.allow)
            return
        }
        delegate?.webView?(webView, decidePolicyFor: navigationAction, decisionHandler: decisionHandler)
    }
    
    func webView(_ webView: WKWebView, runJavaScriptAlertPanelWithMessage message: String, initiatedByFrame frame: WKFrameInfo, completionHandler: @escaping () -> Void) {
        DDLog(message)
        UIAlertController.showAlert("温馨提示", msg: message, actionTitles: [kTitleSure]) { (alertVC, action) in
            completionHandler();
        }
    }
    
    func webView(_ webView: WKWebView, runJavaScriptConfirmPanelWithMessage message: String, initiatedByFrame frame: WKFrameInfo, completionHandler: @escaping (Bool) -> Void) {
        DDLog(message)
        UIAlertController.showAlert("温馨提示", msg: message, actionTitles: [kTitleSure]) { (alertVC, action) in
            if action.title == kTitleCancell{
                completionHandler(false)
                return
            }
            completionHandler(true)
        }
    }
    
//    func webView(_ webView: WKWebView, runJavaScriptTextInputPanelWithPrompt prompt: String, defaultText: String?, initiatedByFrame frame: WKFrameInfo, completionHandler: @escaping (String?) -> Void) {
//        let alertVC = UIAlertController(title: nil, message: prompt, preferredStyle: .alert)
//        alertVC.addTextField { (textField) in
//            textField.text = defaultText
//        }
//
//        alertVC.addAction(UIAlertAction(title: "Ok", style: .default, handler: { (action) in
//            if let text = alertVC.textFields?.first?.text {
//                completionHandler(text)
//            } else {
//                completionHandler(defaultText)
//            }
//        }))
//
//        alertVC.addAction(UIAlertAction(title: "Cancel", style: .default, handler: { (action) in
//            completionHandler(nil)
//        }))
//
//        if let rootVC = UIApplication.shared.keyWindow?.rootViewController {
//            rootVC.present(alertVC, animated: true, completion: nil)
//        }
//    }
}

extension NNWebView: WKNavigationDelegate{
    func webView(_ webView: WKWebView, didFailProvisionalNavigation navigation: WKNavigation!, withError error: Error) {
        if showReloadBtn {
//            webView.isHidden = true
        }
//        UIAlertController.showAlert("提示", msg: error.localizedDescription, actionTitles: nil, handler: nil);
//        IOPProgressHUD.showError(withStatus: error.localizedDescription)
    }
    
    func webView(_ webView: WKWebView, didFail navigation: WKNavigation!, withError error: Error) {
        if showReloadBtn {
//            webView.isHidden = true
        }
//        UIAlertController.showAlert("提示", msg: error.localizedDescription, actionTitles: nil, handler: nil);
//        IOPProgressHUD.showError(withStatus: error.localizedDescription)
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
