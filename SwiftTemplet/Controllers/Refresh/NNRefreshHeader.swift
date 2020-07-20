//
//  NNRefreshHeader.swift
//  SwiftTemplet
//
//  Created by Bin Shang on 2020/7/20.
//  Copyright © 2020 BN. All rights reserved.
//

import UIKit
import MJRefresh

//class NNRefreshHeader: MJRefreshNormalHeader {
//
//
//    convenience init(_ action: @escaping MJRefreshComponentAction) {
//        self.init(action)
//        self.lastUpdatedTimeLabel?.isHidden = true
////        self.stateLabel?.isHidden = true
////        self.stateLabel?.textColor = UIColor.white
//    }
//
//}
//
//class NNRefreshFooter: MJRefreshBackNormalFooter {
//
////    convenience init(_ action: @escaping MJRefreshComponentAction) {
////        self.init(action)
////        self.stateLabel?.isHidden = true
////        self.arrowView?.isHidden = true
////    }
//
//}


extension UIScrollView{
    
    ///项目封装下拉加载
    func headerRefresh(_ block: @escaping MJRefreshComponentAction) {
        let header = MJRefreshNormalHeader.init(refreshingBlock: block)
        header.lastUpdatedTimeLabel?.isHidden = true
        header.stateLabel?.textColor = .gray
//        header.backgroundColor = UIColor.theme;
        header.setTitle("加载中...", for: .refreshing)
        self.mj_header = header
    }
    ///项目封装上拉加载
    func footerRefresh(_ block: @escaping MJRefreshComponentAction) {
        let footer = MJRefreshBackNormalFooter.init(refreshingBlock: block)
        footer.stateLabel?.isHidden = true
        footer.arrowView?.isHidden = true
        
        self.mj_footer = footer
    }
    
    ///项目封装下拉结束加载
    func beginHeaderRefreshing() {
        self.mj_header?.beginRefreshing()
    }
    
    ///项目封装上拉结束加载
    func beginFooterRefreshing() {
        self.mj_footer?.beginRefreshing()
    }
    
    ///项目封装结束加载
    func endHeaderRefreshing() {
        self.mj_header?.endRefreshing()
    }
    
    ///项目封装结束加载
    func endFooterRefreshing() {
        self.mj_footer?.endRefreshing()
    }
    
    
}
