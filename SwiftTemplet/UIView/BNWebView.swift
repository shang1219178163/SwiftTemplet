//
//  BNWebView.swift
//  SwiftTemplet
//
//  Created by Bin Shang on 2019/7/5.
//  Copyright © 2019 BN. All rights reserved.
//

import UIKit
import WebKit

class BNWebView: UIView, WKUIDelegate, WKNavigationDelegate, WKScriptMessageHandler {
   
    var urlString: String = ""
    var jsString: String = ""
    var loadingProgressColor: UIColor = UIColor.blue
    {
        didSet{
            progress.progressTintColor = oldValue
            
        }
    }
    
    deinit {
        wkWebView.removeObserver(self, forKeyPath: "estimatedProgress")
        wkWebView.stopLoading()
        wkWebView.uiDelegate = nil
        wkWebView.navigationDelegate = nil
        
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = UIColor.white;
        self.addSubview(reloadBtn)
        self.addSubview(wkWebView)
        self.addSubview(progress)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        progress.frame = CGRect(x: 0, y: 0, width: frame.size.width, height: 2)
        wkWebView.frame = CGRect(x: 0, y: 8, width: frame.size.width, height: frame.size.height - 10)
        reloadBtn.center = wkWebView.center;
        
    }
    
    //MARK: -webView
    func webView(_ webView: WKWebView, didStartProvisionalNavigation navigation: WKNavigation!) {
        webView.isHidden = false
        if webView.url?.scheme == "about" {
            webView.isHidden = true;
        }
    }
    
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        webView.evaluateJavaScript("document.title") { (title, error) in
            print(title)

        }
        let script = WKWebView.javaScriptFromTextSizeRatio(300)
        webView.evaluateJavaScript(script) { (obj, error) in
            //            print(obj, error);
        }
        refreshControl.endRefreshing()
    }
    
    func webView(_ webView: WKWebView, decidePolicyFor navigationAction: WKNavigationAction, decisionHandler: @escaping (WKNavigationActionPolicy) -> Void) {
        decisionHandler(.allow)
    }
    
    func webView(_ webView: WKWebView, didFailProvisionalNavigation navigation: WKNavigation!, withError error: Error) {
        webView.isHidden = true
    }
    
    func webView(_ webView: WKWebView, didFail navigation: WKNavigation!, withError error: Error) {
        webView.isHidden = true
        
    }
    
    //MARK: -UIDelegate
    func webView(_ webView: WKWebView, runJavaScriptAlertPanelWithMessage message: String, initiatedByFrame frame: WKFrameInfo, completionHandler: @escaping () -> Void) {
        print(message)
    }
    
    func webView(_ webView: WKWebView, runJavaScriptConfirmPanelWithMessage message: String, initiatedByFrame frame: WKFrameInfo, completionHandler: @escaping (Bool) -> Void) {
        print(message)
    }
    
    func webView(_ webView: WKWebView, runJavaScriptTextInputPanelWithPrompt prompt: String, defaultText: String?, initiatedByFrame frame: WKFrameInfo, completionHandler: @escaping (String?) -> Void) {
//        print(message)
    }
    
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

    //MARK: -observe

    override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
        if keyPath == "estimatedProgress" {
            if let newValue = change![NSKeyValueChangeKey.newKey] as? NSNumber {
                progress.progress = newValue.floatValue
                progress.isHidden = (progress.progress >= 1.0)
            }
            
        } else if keyPath == "hidden" {
            if let newValue = change![NSKeyValueChangeKey.newKey] as? NSNumber {
                if newValue == true {
                    bringSubviewToFront(reloadBtn)
                } else {
                    sendSubviewToBack(reloadBtn)
                }
            }
        }
    }
    
    @objc func loadRequest() -> Void {
        assert(urlString != "")
        if !urlString.hasPrefix("http") {
            urlString = "http://" + urlString;
        }
        let request: URLRequest = URLRequest(url: URL(string: urlString)!)
        wkWebView.load(request)
        
    }
    
    @objc func webViewReload() -> Void {
        wkWebView.reload()
    }
    
    @objc func back(_ item: UIBarButtonItem) -> Void {
        if wkWebView.canGoBack {
            wkWebView.goBack()
        }
    }
    
   
    //MARK: -lazy
    lazy var wkWebView: WKWebView = {
        let view = WKWebView(frame: bounds, configuration: WKWebView.confiDefault)
        view.uiDelegate = self
        view.navigationDelegate = self
        view.allowsBackForwardNavigationGestures = true
        view.scrollView.showsHorizontalScrollIndicator = false
        view.scrollView.showsVerticalScrollIndicator = true
        if #available(iOS 10.0, *) {
            view.scrollView.refreshControl = self.refreshControl;
        }
        
        view.addObserver(self, forKeyPath: "estimatedProgress", options: .new, context: nil)
        
        return view
    }()

    lazy var refreshControl: UIRefreshControl = {
        let view = UIRefreshControl()
        view.addTarget(self, action:#selector(loadRequest), for: .valueChanged)
        return view
    }()
    
    lazy var progress: UIProgressView = {
        let view: UIProgressView = UIProgressView(frame: CGRect(x: 0, y: 0, width: bounds.size.width, height: 2))
        return view
    }()
    
    lazy var reloadBtn: UIButton = {
        let view = UIButton(type: .custom)
        view.frame = CGRect(x: 0, y: 0, width: 100, height: 40)
        view.setTitle("重新加载", for: .normal)
        view.setTitleColor(UIColor.red, for: .normal)
        view.addTarget(self, action: #selector(loadRequest), for: .touchUpInside)
        
        view.addObserver(wkWebView, forKeyPath: "hidden", options: .new, context: nil)
        return view
    }()
}
