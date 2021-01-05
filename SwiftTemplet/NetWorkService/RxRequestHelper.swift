//
//  RxRequestHelper.swift
//  SwiftTemplet
//
//  Created by Bin Shang on 2020/7/9.
//  Copyright © 2020 BN. All rights reserved.
//
/**
viewModel.spaceStatementNewAPI.rx.request()
    .subscribe(onNext: { (dic) in
          DDLog(dic.jsonValue())

    }, onError: { (error) in
        DDLog("error")
    }, onCompleted: {
        DDLog("onCompleted")
    }) {

}.disposed(by: disposeBag)

///串行请求
viewModel.parkInfoAPIManager.parkCode = IOPStorageManager.getParkCode() ?? ""
viewModel.parkInfoAPIManager.rx.request()
    .flatMapLatest {dic in
        self.viewModel.spaceStatementNewAPI.rx.request()}
    .subscribe(onNext: { (dic) in
          DDLog(dic.jsonValue())

    }, onError: { (error) in
        DDLog("error")
    }, onCompleted: {
        DDLog("onCompleted")
    }) {

}.disposed(by: disposeBag)
//并发请求
Observable.zip(
        viewModel.parkInfoAPIManager.rx.request(),
        viewModel.spaceStatementNewAPI.rx.request()

    ).subscribe(onNext: { (dic1, dic2) in
        DDLog(dic1, dic2)
    }, onError: { (error) in
        DDLog("error")
    }, onCompleted: {
        DDLog("onCompleted")
    }) {

}.disposed(by: disposeBag)
*/


import HandyJSON
import RxSwift

//数据映射错误
public enum RxMapModelError: Error {
    case parsingError
}

//.扩展Observable：增加模型映射方法
public extension Observable where Element: Any {
    
    //HandyJSON 将JSON数据转成对象
    func mapHandyJSONModel<T: HandyJSON>(type: T.Type) -> Observable<T> {
        return self.map { (element) -> T in
            guard let parsedElement = T.deserialize(from: element as? Dictionary) else {
                throw RxMapModelError.parsingError
            }
            return parsedElement
        }
    }
    
    //HandyJSON 将JSON数据转成数组
    func mapHandyJSONModels<T: HandyJSON>(type: T.Type) -> Observable<[T]> {
        return self.map { (element) -> [T] in
            guard let parsedArray = [T].deserialize(from: element as? [Any]) as? [T] else {
                throw RxMapModelError.parsingError
            }
            return parsedArray
        }
    }

    //将JSON数据转成对象
    func mapYYModel<T: NSObject>(type: T.Type) -> Observable<T> {
        return self.map { (element) -> T in
            guard let parsedElement = T.yy_model(withJSON: element) else {
                throw RxMapModelError.parsingError
            }
            return parsedElement
        }
    }
    
    //将JSON数据转成数组
    func mapYYModels<T: NSObject>(type: T.Type) -> Observable<[T]> {
        return self.map { (element) -> [T] in
            guard let parsedArray = NSArray.yy_modelArray(with: T.self, json: element) as? [T] else {
                throw RxMapModelError.parsingError
            }
            return parsedArray
        }
    }
}

extension Reactive where Base: NNRequstManager {
    
    func requestAsSingle() -> Single<[AnyHashable: Any]> {
        return request().asSingle()
//        return Single.create{ single in
//            let task = self.base.startRequest(success: { (api, dic) in
//                single(.success(dic))
//            }) { (manager, errorModel) in
//                let error = NSError(domain: errorModel.message ?? "出现未知错误", code: errorModel.code, userInfo: nil)
//                single(.error(error))
//            }
//            return Disposables.create { task?.cancel() }
//        }
    }
    ///发出请求
    func request() -> Observable<[AnyHashable: Any]> {
        return Observable.create{ observer in
            let task = self.base.startRequest(success: { (api, dic) in
                observer.onNext(dic)
                observer.onCompleted()
            }) { (api, error) in
                observer.onError(error)
            }
            return Disposables.create { task?.cancel() }
        }
    }
}


extension PrimitiveSequence where Trait == SingleTrait, Element: Sequence {

    func flatObservable<R>() -> Observable<R> where R == Element.Element {
        return asObservable().flatMap { Observable.from($0) }
    }
}
