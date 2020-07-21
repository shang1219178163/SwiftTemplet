//
//  MJRefreshNormalHeader+Helper.swift
//  SwiftTemplet
//
//  Created by Bin Shang on 2020/4/21.
//  Copyright © 2020 BN. All rights reserved.
//

import UIKit
import MJRefresh


@objc public extension UIScrollView {

    ///纯色背景色下拉刷新
    func headerColorRefresh(_ action: @escaping MJRefreshComponentAction,
                      textColor: UIColor = .gray,
                      backgroundColor: UIColor = .clear) {
        let backView = UIView(frame: CGRect(x: 0, y: -500, width: UIScreen.main.bounds.width, height: 500))
        backView.backgroundColor = backgroundColor
        addSubview(backView)
        
        let header = MJRefreshNormalHeader(refreshingBlock: action)
        header.lastUpdatedTimeLabel?.isHidden = true
        header.stateLabel?.textColor = textColor
        header.backgroundColor = backgroundColor
        mj_header = header
    }

    ///项目封装下拉加载
    func headerRefresh(_ block: @escaping MJRefreshComponentAction) {
        let header = MJRefreshNormalHeader.init(refreshingBlock: block)
        header.lastUpdatedTimeLabel?.isHidden = true
        header.stateLabel?.textColor = .gray
//        header.backgroundColor = UIColor.theme;
        header.setTitle("加载中...", for: .refreshing)
        mj_header = header
    }
    ///项目封装上拉加载
    func footerRefresh(_ block: @escaping MJRefreshComponentAction) {
        let footer = MJRefreshBackNormalFooter.init(refreshingBlock: block)
        footer.stateLabel?.isHidden = true
        footer.arrowView?.isHidden = true
        
        mj_footer = footer
    }
    
    ///项目封装下拉结束加载
    func beginHeaderRefreshing() {
        mj_header?.beginRefreshing()
    }
    
    ///项目封装上拉结束加载
    func beginFooterRefreshing() {
        mj_footer?.beginRefreshing()
    }
    
    ///项目封装结束加载
    func endHeaderRefreshing() {
        mj_header?.endRefreshing()
    }
    
    ///项目封装结束加载
    func endFooterRefreshing() {
        mj_footer?.endRefreshing()
    }
    
    
}

//class NNRefreshHeader: MJRefreshNormalHeader {
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
