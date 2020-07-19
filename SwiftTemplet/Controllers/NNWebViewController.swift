//
//  NNWebViewController.swift
//  SwiftTemplet
//
//  Created by Bin Shang on 2020/7/15.
//  Copyright © 2020 BN. All rights reserved.
//

import UIKit
import WebKit
import SnapKitExtend


@objcMembers
class NNWebViewController: UIViewController {
        
    var urlString: String = ""

    var loadContent: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        setupExtendedLayout()
        title = "协议"
        view.backgroundColor = UIColor.background
        view.addSubview(webView)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        if urlString != "" {
            webView.urlString = urlString

        } else {
            if loadContent != "" {
                webView.refreshControl.addActionHandler({ (control) in
                    guard let sender = control as? UIRefreshControl else { return }
                    sender.endRefreshing()
                }, for: .valueChanged)

                webView.webView.loadHTMLString(loadContent, baseURL: nil)
            }
        }
    }
    
    lazy var webView: NNWebView = {
        let view: NNWebView = NNWebView(frame: self.view.bounds)
        view.loadingProgressColor = UIColor.theme

        return view
    }()
    
}
