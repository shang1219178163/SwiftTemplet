//
//  KVOViewController.swift
//  SwiftTemplet
//
//  Created by Bin Shang on 2020/6/29.
//  Copyright © 2020 BN. All rights reserved.
//

import UIKit
import SwiftExpand
import YYCategories

class KVOViewController: UIViewController {
    
    var now: Date = Date()

    deinit {
        removeObserver(self, forKeyPath: "now")
        removeObserverBlocks(forKeyPath: "title")
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        self.addObserver(self, forKeyPath: "now", options: .new, context: nil)
        DDLog("1")
        willChangeValue(forKey: "now") // 手动触发 self.now 的 KVO，必写。
        DDLog("2")
        didChangeValue(forKey: "now") // 手动触发 self.now 的 KVO，必写。
        DDLog("4")

        self.addObserverBlock(forKeyPath: "title") { (one, two, three) in
            DDLog(one, two, three)
        }
        title = "erere"
    }
    
    override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
        if keyPath == "now" {
            //标题星号处理
            DDLog("3")
            
        }
    }
    



}
