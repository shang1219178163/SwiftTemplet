//
//  RxRequestVendor.swift
//  SwiftTemplet
//
//  Created by Bin Shang on 2020/7/12.
//  Copyright © 2020 BN. All rights reserved.
//
import UIKit
import RxSwift
import RxCocoa
import MJRefresh

//对MJRefreshComponent增加rx扩展 , 扩展 Reactive 中定义的方法会出现在组件的 .rx 的命名空间下
extension Reactive where Base: MJRefreshComponent {

    //正在刷新事件
    var event: ControlEvent<Base> {
        let source: Observable<Base> = Observable.create { [weak control = self.base] observer  in
            guard let control = control else {
                observer.on(.completed)
                return Disposables.create()
            }
            
            control.refreshingBlock = {
                observer.on(.next(control))
            }
            return Disposables.create()
        }
        .takeUntil(deallocated)
        .share(replay: 1)
        return ControlEvent(events: source)
    }

    //停止刷新
    var endRefreshing: Binder<Bool> {
        return Binder(base) { refresh, isEnd in
            if isEnd {
                refresh.endRefreshing()
            }
        }
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

//-------------------------------------------------------------------------
extension UIScrollView {
    func refreshHeader(_ action: @escaping () -> Void) -> MJRefreshHeader {
        guard let mj_header = mj_header else {
            let component = MJRefreshNormalHeader(refreshingBlock: { action() })
            self.mj_header = component
            return component
        }
        return mj_header
    }
    
    func refreshFooter(_ action: @escaping () -> Void) -> MJRefreshFooter {
        guard let mj_footer = mj_footer else {
            let component = MJRefreshAutoNormalFooter(refreshingBlock: { action() })
            self.mj_footer = component
            return component
        }
        return mj_footer
    }
}


//class RxTarget: NSObject, Disposable {  // RxTarget 是 Rxswift 源码
//    private var retainSelf: RxTarget?
//    override init() {
//        super.init()
//        self.retainSelf = self
//    }
//    func dispose() {
//        self.retainSelf = nil
//    }
//}
//
//final class RefreshTarget<Component: MJRefreshComponent>: RxTarget {
//    typealias Callback = MJRefreshComponentAction
//    var callback: Callback?
//    weak var component: Component?
//
//    let selector = #selector(RefreshTarget.eventHandler)
//
//    init(_ component: Component, callback:@escaping Callback) {
//        self.component = component
//        self.callback = callback
//        super.init()
//        component.setRefreshingTarget(self, refreshingAction: selector)
//    }
//    @objc func eventHandler() {
//        callback?()
//    }
//    override func dispose() {
//        super.dispose()
//        self.component?.refreshingBlock = nil
//        self.callback = nil
//    }
//}
//
//extension Reactive where Base: MJRefreshComponent {
//    var event: ControlEvent<Base> {
//        let source: Observable<Base> = Observable.create { [weak control = self.base] observer  in
//            MainScheduler.ensureExecutingOnScheduler()
//            guard let control = control else {
//                observer.on(.completed)
//                return Disposables.create()
//            }
//            let observer = RefreshTarget(control) {
//                observer.on(.next(control))
//            }
//            return observer
//        }.takeUntil(deallocated)
//        return ControlEvent(events: source)
//    }
//}
