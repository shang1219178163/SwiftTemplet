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

///事件间隔(毫秒)
public let kEventInterval: Int = 1500


class RxCocoaHelper: NSObject {

}

public extension Reactive where Base: UIButton {
    var safeTap: ControlEvent<Void> {
        return ControlEvent.init(events: tap.throttle(.milliseconds(kEventInterval), latest: false, scheduler: MainScheduler.instance))
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
    func safeDrive(_ dueTime: RxSwift.RxTimeInterval = .milliseconds(kEventInterval), onNext: @escaping ((String) -> Void)) -> Disposable {
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
    func safeDrive(_ dueTime: RxSwift.RxTimeInterval = .milliseconds(kEventInterval), onNext: @escaping ((String) -> Void)) -> Disposable {
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

public extension Reactive where Base: UITapGestureRecognizer {
    var safeEvent: ControlEvent<Base> {
        return ControlEvent.init(events: event.throttle(.milliseconds(kEventInterval), latest: false, scheduler: MainScheduler.instance))
    }
    
    ///避免连续点击(1.5 秒响应一次)
    func safeDrive(onNext: @escaping ((Base) -> Void)) -> Disposable {
        return self.safeEvent
            .asControlEvent()
            .asDriver()
            .drive(onNext: { (tap) in
                onNext(self.base)

            }, onCompleted: {
                
            }, onDisposed: {
                
            })
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

public extension UIView{
    ///避免连续调用(1.5 秒响应一次)
    func rxTap(onNext: @escaping ((UITapGestureRecognizer) -> Void)) -> Disposable {
        let tap = UITapGestureRecognizer()
        self.addGestureRecognizer(tap)
        self.isUserInteractionEnabled = true

//        return tap.rx.event.subscribe { (tap) in
//            onNext(tap)
//        }
        return tap.rx.safeDrive(onNext: onNext)
    }
}

//public extension UILabel{
//    ///避免连续调用(1.5 秒响应一次)
//    func rxTap(onNext: @escaping ((UITapGestureRecognizer) -> Void)) -> Disposable {
//        let tap = UITapGestureRecognizer()
//        self.addGestureRecognizer(tap)
//        self.isUserInteractionEnabled = true
//
////        return tap.rx.event.subscribe { (tap) in
////            onNext(tap)
////        }
//        return tap.rx.safeDrive(onNext: onNext)
//    }
//}
