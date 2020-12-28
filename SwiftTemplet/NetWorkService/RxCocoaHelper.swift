//
//  RxCocoaHelper.swift
//  SwiftTemplet
//
//  Created by Bin Shang on 2020/12/24.
//  Copyright © 2020 BN. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class RxCocoaHelper: NSObject {

}

public extension Reactive where Base: UIButton {
    var safeTap: ControlEvent<Void> {
        return ControlEvent.init(events: tap.throttle(.milliseconds(1500), latest: false, scheduler: MainScheduler.instance))
    }
    ///避免连续点击(1.5 秒响应一次)
    func safeDrive(onNext: @escaping ((Base) -> Void)) -> Disposable {
        return self.safeTap
            .asControlEvent()
            .asDriver()
            .drive {
                onNext(self.base)
            } onCompleted: {
                
            } onDisposed: {
                
            }
    }
}

public extension Reactive where Base: UITextField {
    ///避免连续调用(1.5 秒响应一次)
    func safeDrive(_ dueTime: RxSwift.RxTimeInterval = .milliseconds(1500), onNext: @escaping ((String) -> Void)) -> Disposable {
        return text.orEmpty
            .asDriver()
            .distinctUntilChanged()
            .debounce(dueTime)
            .drive(onNext: { (query) in
                onNext(query)
            }) {
                
            } onDisposed: {
                
            }
    }
}

public extension Reactive where Base: UISearchBar{
    ///避免连续调用(1.5 秒响应一次)
    func safeDrive(_ dueTime: RxSwift.RxTimeInterval = .milliseconds(1500), onNext: @escaping ((String) -> Void)) -> Disposable {
        return text.orEmpty
            .asDriver()
            .distinctUntilChanged()
            .debounce(dueTime)
            .drive(onNext: { (query) in
                onNext(query)
            }) {
                
            } onDisposed: {
                
            }
    }
}

public extension UIButton{
    ///避免连续调用(1.5 秒响应一次)
    func rxDrive(onNext: @escaping ((UIButton) -> Void)) -> Disposable {
        return self.rx.safeDrive(onNext: onNext)
    }
}

public extension UITextField{
    ///避免连续调用(1.5 秒响应一次)
    func rxDrive(onNext: @escaping ((String) -> Void)) -> Disposable {
        return self.rx.safeDrive(onNext: onNext)
    }
}

public extension UISearchBar{
    ///避免连续调用(1.5 秒响应一次)
    func rxDrive(onNext: @escaping ((String) -> Void)) -> Disposable {
        return self.rx.safeDrive(onNext: onNext)
    }
}
