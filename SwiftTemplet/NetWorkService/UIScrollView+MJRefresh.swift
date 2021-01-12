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
    
    @discardableResult
    func refreshHeader(_ block: @escaping MJRefreshComponentAction) -> MJRefreshHeader {
        guard let mj_header = mj_header else {
            let component = MJRefreshNormalHeader(refreshingBlock: block)
            self.mj_header = component
            return component
        }
        return mj_header
    }

    @discardableResult
    func refreshFooter(_ block: @escaping MJRefreshComponentAction) -> MJRefreshFooter {
        guard let mj_footer = mj_footer else {
            let component = MJRefreshAutoNormalFooter(refreshingBlock: block)
            self.mj_footer = component
            return component
        }
        return mj_footer
    }

    ///纯色背景色下拉刷新
    @discardableResult
    func headerColorRefresh(_ block: @escaping MJRefreshComponentAction,
                      textColor: UIColor = .gray,
                      backgroundColor: UIColor = .clear) -> MJRefreshHeader {
        let backView = UIView(frame: CGRect(x: 0, y: -500, width: UIScreen.main.bounds.width, height: 460))
        backView.backgroundColor = backgroundColor
        addSubview(backView)
        
        let header = MJRefreshNormalHeader(refreshingBlock: block)
        header.lastUpdatedTimeLabel?.isHidden = true
        header.stateLabel?.textColor = textColor
        header.backgroundColor = backgroundColor
        mj_header = header
        return header
    }

    ///项目封装下拉加载
    @discardableResult
    func headerRefresh(_ block: @escaping MJRefreshComponentAction) -> MJRefreshHeader {
        let header = MJRefreshNormalHeader.init(refreshingBlock: block)
        header.lastUpdatedTimeLabel?.isHidden = true
        header.stateLabel?.textColor = .gray
//        header.backgroundColor = UIColor.theme;
        header.setTitle("加载中...", for: .refreshing)
        mj_header = header
        return header
    }
    ///项目封装上拉加载
    @discardableResult
    func footerRefresh(_ block: @escaping MJRefreshComponentAction) -> MJRefreshFooter {
        let footer = MJRefreshBackNormalFooter.init(refreshingBlock: block)
        footer.stateLabel?.isHidden = true
        footer.arrowView?.isHidden = true
        
        mj_footer = footer
        return footer
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
    func endRefreshing() {
        mj_header?.endRefreshing()
        mj_footer?.endRefreshing()
    }
    
    
}


//----
/* ============================ Refreshable ================================ */
// 需要使用 MJExtension 的控制器使用

protocol Refreshable {
    
}
extension Refreshable where Self : UIViewController {
    func initRefreshHeader(_ scrollView: UIScrollView, _ action: @escaping () -> Void) -> MJRefreshHeader {
        scrollView.mj_header = MJRefreshNormalHeader(refreshingBlock: { action() })
        return scrollView.mj_header!
    }
    
    func initRefreshFooter(_ scrollView: UIScrollView, _ action: @escaping () -> Void) -> MJRefreshFooter {
        scrollView.mj_footer = MJRefreshAutoNormalFooter(refreshingBlock: { action() })
        return scrollView.mj_footer!
    }
}
