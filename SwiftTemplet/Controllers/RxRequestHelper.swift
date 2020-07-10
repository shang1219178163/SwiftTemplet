//
//  RxRequestHelper.swift
//  SwiftTemplet
//
//  Created by Bin Shang on 2020/7/9.
//  Copyright © 2020 BN. All rights reserved.
//

//import UIKit
//
//class RxRequestHelper: NSObject {
//
//}
import HandyJSON
import RxSwift

//数据映射错误
public enum RxMapModelError: Error {
    case parsingError
}

//.扩展Observable：增加模型映射方法
public extension Observable where Element: Any {
    
    //将JSON数据转成对象
    func mapModel<T: HandyJSON>(type: T.Type) -> Observable<T> {
        return self.map { (element) -> T in
            guard let parsedElement = T.deserialize(from: element as? Dictionary) else {
                throw RxMapModelError.parsingError
            }
            
            return parsedElement
        }
    }
    
    //将JSON数据转成数组
    func mapModels<T: HandyJSON>(type: T.Type) -> Observable<[T]> {
        return self.map { (element) -> [T] in
            guard let parsedArray = [T].deserialize(from: element as? [Any]) else {
                throw RxMapModelError.parsingError
            }
            
            return parsedArray as! [T]
        }
    }
}

//public extension Observable where Element:Any {
//
//    //将JSON数据转成对象
//    func mapModel<T>(type:T.Type) -> Observable<T> where T:HandyJSON {
//        return self.map { (element) -> T in
//            guard let parsedElement = T.deserialize(from: element as? Dictionary) else {
//                throw RxMapModelError.parsingError
//            }
//
//            return parsedElement
//        }
//    }
//
//    //将JSON数据转成数组
//    func mapModels<T>(type:T.Type) -> Observable<[T]> where T:HandyJSON {
//        return self.map { (element) -> [T] in
//            guard let parsedArray = [T].deserialize(from: element as? [Any]) else {
//                throw RxMapModelError.parsingError
//            }
//
//            return parsedArray as! [T]
//        }
//    }
//}

extension Reactive where Base: NNRequstManager {
    ///发出请求
    func request() -> Observable<[AnyHashable: Any]> {
        return Observable.create{ observer in
            let task = self.base.startRequest(success: { (api, dic) in
                observer.onNext(dic)
                observer.onCompleted()
            }) { (api, error) in
                observer.onError(error)
            }
            
            return Disposables.create {
                if let task = task {
                    task.cancel()
                }
            }
        }
    }
    
//     func request() -> Observable<Any> {
//        return Observable.create{ observer in
//            let task = self.base.startRequest(successBlock: { (manager, dic) in
//                observer.onNext(dic)
//                observer.onCompleted()
//            }) { (manager, errorModel) in
//                let error = NSError(domain: errorModel.message ?? "出现未知错误", code: errorModel.code, userInfo: nil)
//                observer.onError(error)
//            }
//
//            return Disposables.create {
//                if let task = task {
//                    task.cancel()
//                }
//            }
//        }
//    }

}
