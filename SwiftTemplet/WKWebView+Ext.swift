//
//  WKWebView+Ext.swift
//  SwiftTemplet
//
//  Created by shangbinbin on 2021/11/24.
//  Copyright © 2021 BN. All rights reserved.
//

import UIKit
import WebKit


extension WKWebView{
    
    func cleanCache(_ dataTypes: Set<String> = WKWebsiteDataStore.allWebsiteDataTypes(), clearCookies: Bool = true, callback: (()->Void)? = nil) {
        if clearCookies {
            HTTPCookieStorage.shared.removeCookies(since: Date.distantPast)
            print("[HTTPCookieStorage] All cookies deleted")
        }
                
        WKWebsiteDataStore.default().fetchDataRecords(ofTypes: dataTypes) {records in
            records.forEach { record in
                WKWebsiteDataStore.default().removeData(ofTypes: record.dataTypes, for: [record], completionHandler: {})
                print("[WebCacheCleaner] Record \(record) deleted")
            }
            callback?()
        }
    }
    
}



final class WebCacheCleaner {
    
    class func clean() {
        HTTPCookieStorage.shared.removeCookies(since: Date.distantPast)
        print("[WebCacheCleaner] All cookies deleted")
        
    
        WKWebsiteDataStore.default().fetchDataRecords(ofTypes: WKWebsiteDataStore.allWebsiteDataTypes()) { records in
            records.forEach { record in
                WKWebsiteDataStore.default().removeData(ofTypes: record.dataTypes, for: [record], completionHandler: {})
                print("[WebCacheCleaner] Record \(record) deleted")
            }
        }
    }
    
}
