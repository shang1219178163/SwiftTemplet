//
//  UITableViewCellWebView.swift
//  SwiftTemplet
//
//  Created by Bin Shang on 2020/2/6.
//  Copyright © 2020 BN. All rights reserved.
//

import UIKit
import WebKit
import SnapKit

class UITableViewCellWebView: UITableViewCell {
        
    var urlString: String = ""{
        willSet{
            guard let url = URL(string: newValue) else { return }
            let request: URLRequest = URLRequest(url: url)
            webView.load(request)
        }
    }
    
    var loadContent: String = ""{
        willSet{
            webView.loadHTMLString(newValue, baseURL: nil)
        }
    }
    
    var loadingProgressColor: UIColor = UIColor.blue {
        didSet{
            progress.progressTintColor = oldValue
        }
    }
    
    deinit {
        reloadBtn.removeObserver(webView, forKeyPath: "hidden")
        webView.removeObserver(self, forKeyPath: "estimatedProgress")
        webView.stopLoading()
        webView.uiDelegate = nil
        webView.navigationDelegate = nil
    }

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
      super.init(style: style, reuseIdentifier: reuseIdentifier);

        contentView.addSubview(reloadBtn);
        contentView.addSubview(webView);
        contentView.addSubview(progress);
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder);
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews();
              
        setupConstraint()
    }
    
    func setupConstraint() {
        if CGRect.zero.equalTo(bounds) == true {
            return;
        }
        progress.frame = CGRect(x: 0, y: 0, width: frame.size.width, height: 2)
        webView.frame = CGRect(x: 0, y: 8, width: frame.size.width, height: frame.size.height - 10)
        reloadBtn.center = webView.center;
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
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
    
    @objc func loadRequest() {
        if urlString == "" {
            refreshControl.endRefreshing()
            return
        }
        
        if !urlString.hasPrefix("http") {
            urlString = "http://" + urlString;
        }
        guard let url = URL(string: urlString) else {
            refreshControl.endRefreshing()
            return
        }
        let request: URLRequest = URLRequest(url: url)
        webView.load(request)
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

        view.addObserver(webView, forKeyPath: "hidden", options: .new, context: nil)
        return view
    }()
}

extension UITableViewCellWebView: WKUIDelegate{
    //MARK: -webView
    func webView(_ webView: WKWebView, didStartProvisionalNavigation navigation: WKNavigation!) {
        webView.isHidden = false        
    }
    
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        webView.evaluateJavaScript("document.title") { (obj, error) in
//            print(obj)

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
}

extension UITableViewCellWebView: WKNavigationDelegate{
    func webView(_ webView: WKWebView, didFailProvisionalNavigation navigation: WKNavigation!, withError error: Error) {
        webView.isHidden = (urlString != "")
//        UIAlertController.showAlert("提示", msg: error.localizedDescription, actionTitles: nil, handler: nil);
//        IOPProgressHUD.showError(withStatus: error.localizedDescription)
    }
    
    func webView(_ webView: WKWebView, didFail navigation: WKNavigation!, withError error: Error) {
        webView.isHidden = (urlString != "")
//        UIAlertController.showAlert("提示", msg: error.localizedDescription, actionTitles: nil, handler: nil);
//        IOPProgressHUD.showError(withStatus: error.localizedDescription)
    }
}

extension UITableViewCellWebView: WKScriptMessageHandler{
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
