//
//  TestWebViewController.swift
//  SwiftTemplet
//
//  Created by Bin Shang on 2021/4/2.
//  Copyright © 2021 BN. All rights reserved.
//

import UIKit
import SwiftExpand

class TestWebViewController: UIViewController {
    
    
    lazy var webView: WKWebView = {
        let conf = WKWebView.confiDefault
        conf.applicationNameForUserAgent = "IRAIN_KOP"
        
        let view = WKWebView(frame: self.view.bounds, configuration: conf)
        view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
//        view.uiDelegate = self
//        view.navigationDelegate = self
        view.allowsBackForwardNavigationGestures = true
        view.scrollView.showsHorizontalScrollIndicator = false
        view.scrollView.showsVerticalScrollIndicator = true
        view.scrollView.refreshControl = self.refreshControl;
        
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
        let view = UIProgressView(frame: CGRect(x: 0, y: 0, width: self.view.bounds.size.width, height: 2))
        view.progressTintColor = .systemBlue
        return view
    }()
    
    
    var httpHeaderFieldsDic = [String: String]()

    
    var htmlString: String = ""{
        willSet{
//            wkWebView.loadHTMLString(newValue, baseURL: nil)
            webView.loadHTMLStringWithMagic(newValue, baseURL: nil)
        }
    }
    
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
    }
    

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
                
        let htmlString = "<p>lxq必读测试内容</p><p><br/></p><p><a href='https://www.baidu.com' target='_blank'>商品测试</a></p><p><br/></p><p><a href='https://www.baidu.com' target='_blank'>链接测试</a><br/></p>"

        webView.loadHTMLString(htmlString, baseURL: nil)

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
    
    @objc func webViewReload() {
        webView.reload()
    }
    
    func request(_ urlString: String?) {
        guard let urlString = urlString, urlString != "" else {
            refreshControl.endRefreshing()
            return }
        progressView.setProgress(0, animated: false)
        progressView.isHidden = false
        
        webView.loadUrl(urlString, additionalHttpHeaders: httpHeaderFieldsDic)
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
            DDLog(absoluteString.removingPercentEncoding)
            
//            delegate?.webViewVC(self, url: url)
    
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

}
