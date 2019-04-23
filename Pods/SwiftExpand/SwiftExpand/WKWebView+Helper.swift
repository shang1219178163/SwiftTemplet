//
//  WKWebView+Helper.swift
//  VehicleBonus
//
//  Created by Bin Shang on 2019/3/13.
//  Copyright © 2019 BN. All rights reserved.
//

import UIKit
import WebKit

extension WKWebView{
    /// WKWebViewConfiguration默认配置
    @objc public static var confiDefault: WKWebViewConfiguration {
        get {
            var obj = objc_getAssociatedObject(self, RuntimeKeyFromSelector(#function)) as? WKWebViewConfiguration;
            if obj == nil {
                obj = WKWebViewConfiguration()
                obj!.allowsInlineMediaPlayback = true;
                obj!.selectionGranularity = .dynamic;
                obj!.preferences = WKPreferences();
                obj!.preferences.javaScriptCanOpenWindowsAutomatically = false;
                obj!.preferences.javaScriptEnabled = true;
                obj!.preferences.minimumFontSize = 17;
                
                objc_setAssociatedObject(self, RuntimeKeyFromSelector(#function), obj, .OBJC_ASSOCIATION_RETAIN_NONATOMIC);
            }
            return obj!;
        }
        set {
            objc_setAssociatedObject(self, RuntimeKeyFromSelector(#function), newValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC);
        }
    }
    
    
    /// JS注入
    @objc public func addUserScript(_ source: String) -> Void {
        let userScript = WKUserScript(source: source, injectionTime: .atDocumentStart, forMainFrameOnly: false)
        configuration.userContentController.addUserScript(userScript)
    }

}
