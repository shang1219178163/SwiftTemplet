////
////  IOPUploadViewModel.swift
////  IntelligentOfParking
////
////  Created by Bin Shang on 2021/8/20.
////  Copyright © 2021 Xi'an iRain IoT. Technology Service CO., Ltd. . All rights reserved.
////
//
//import UIKit
//import RxSwift
//
//
//@objcMembers public class IOPUploadViewModel {
//
//    private(set) lazy var uploadSignApi = IOPOSSUploadSignAPI()
//    private(set) lazy var uploadApi = IOPOSSUploadApi()
//
//    ///附件上传签名
//    func requestUploadSign(_ api: ((IOPOSSUploadSignAPI) -> Void)?, success: @escaping (([AnyHashable: Any]) -> Void), failure: ((String) -> Void)? = nil) {
////        IOPProgressHUD.show(withStatus: "请求中...")
//        IOPProgressHUD.show(withStatus: "上传中...")
//        api?(uploadSignApi)
//        assert(uploadSignApi.files.count != 0)
//        uploadSignApi.startRequest(successBlock: { (manager, dic) in
////            IOPProgressHUD.showSuccess(withStatus: kAPISuccess)
////            let url = (dic["url"] as? String) ?? ""
////            DDLog(dic, url)
//            success(dic)
////            IOPProgressHUD.showSuccess(withStatus: "视频上传成功")
//
//        }) { (manager, errorModel) in
//            if let failure = failure {
//                failure(errorModel.message ?? kAPIFail)
//                return
//            }
//            IOPProgressHUD.showError(withStatus: errorModel.message)
//        }
//    }
//    ///附件上传
//    func requestUpload(_ api: ((IOPOSSUploadApi) -> Void)?, success: @escaping (([AnyHashable: Any]) -> Void), failure: ((String) -> Void)? = nil) {
//        IOPProgressHUD.show(withStatus: "上传中...")
//        api?(uploadApi)
//        assert(uploadApi.file != nil)
//        uploadApi.startRequest(successBlock: { (manager, dic) in
////            IOPProgressHUD.showSuccess(withStatus: kAPISuccess)
////            let url = (dic["url"] as? String) ?? ""
////            DDLog(dic, url)
//            success(dic)
//            IOPProgressHUD.showSuccess(withStatus: "上传成功")
//
//        }) { (manager, errorModel) in
//            if let failure = failure {
//                failure(errorModel.message ?? kAPIFail)
//                return
//            }
//            IOPProgressHUD.showError(withStatus: errorModel.message)
//        }
//    }
//
////    ///附件上传签名
////    func requestUploadSignNew(_ api: ((IOPOSSUploadSignAPI) -> Void)?, success: @escaping ((IOPOSSUploadSignAPI, [AnyHashable: Any]) -> Void), failure: ((String) -> Void)? = nil) {
//////        IOPProgressHUD.show(withStatus: "请求中...")
////        IOPProgressHUD.show(withStatus: "上传中...")
////        api?(uploadSignApi)
////        assert(uploadSignApi.files.count != 0)
////        uploadSignApi.startRequest(successBlock: { [weak self] (manager, dic) in
//////            IOPProgressHUD.showSuccess(withStatus: kAPISuccess)
//////            let url = (dic["url"] as? String) ?? ""
//////            DDLog(dic, url)
////            guard let self = self else { return }
////            success(self.uploadSignApi, dic)
//////            IOPProgressHUD.showSuccess(withStatus: "视频上传成功")
////
////        }) { (manager, errorModel) in
////            if let failure = failure {
////                failure(errorModel.message ?? kAPIFail)
////                return
////            }
////            IOPProgressHUD.showError(withStatus: errorModel.message)
////        }
////    }
////
////    let disposeBag = DisposeBag()
////
////    func upload(URL: URL, success: @escaping (([AnyHashable: Any]) -> Void), failure: ((String) -> Void)? = nil) {
////        rx_requestUploadSignNew(URL: URL).flatMapLatest { tuple in
////            self.rx_requestUploadNew(tuple: tuple)
////        }.subscribe { dic in
////            success(dic)
////        } onError: { error in
////            if let failure = failure {
////                failure((error as NSError).domain)
////                return
////            }
////            IOPProgressHUD.showError(withStatus: (error as NSError).domain)
////        } onCompleted: {
////
////        } onDisposed: {
////
////        }
////        .disposed(by: disposeBag)
////
////    }
////    ///
////    private func rx_requestUploadSignNew(URL: URL) -> Observable<(URL, IOPOSSUploadSignDataModel, IOPOSSUploadSignFilesModel)> {
////        return Observable.create{ observer in
////            let base = IOPOSSUploadSignAPI()
////            base.files = [URL.lastPathComponent]
////            let task = base.startRequest(successBlock: { (manager, dic) in
////                guard let rootModel = IOPOSSUploadSignRootModel.yy_model(with: dic),
////                      let data = rootModel.data,
////                      let files = data.files,
////                      let item = files.first else {
////                    DDLog("数据结构错误")
////                    let error = NSError(domain: "上传数据签名异常", code: 99999, userInfo: nil)
////                    observer.onError(error)
////                    return
////                }
////                observer.onNext((URL, data, item))
////                observer.onCompleted()
////            }) { (manager, errorModel) in
////                let error = NSError(domain: errorModel.message ?? "出现未知错误", code: errorModel.code, userInfo: nil)
////                observer.onError(error)
////            }
////
////            return Disposables.create {
////                if let task = task {
////                    task.cancel()
////                }
////            }
////        }
////    }
////
////    ///
////    private func rx_requestUploadNew(tuple: (URL, IOPOSSUploadSignDataModel, IOPOSSUploadSignFilesModel)) -> Observable<[AnyHashable: Any]> {
////        return Observable.create{ observer in
////            let base = IOPOSSUploadApi()
////            let (url, data, item) = tuple
////            base.upload_url = data.upload_url
////            base.app = data.app
////            base.timestamp = data.timestamp
////
////            base.sign = item.sign
////            base.name = item.name
//////                        api.file = url
////            base.file = try? Data(contentsOf: url)
////
////            let task = base.startRequest(successBlock: { (manager, dic) in
////                observer.onNext(dic)
////                observer.onCompleted()
////            }) { (manager, errorModel) in
////                let error = NSError(domain: errorModel.message ?? "出现未知错误", code: errorModel.code, userInfo: nil)
////                observer.onError(error)
////            }
////
////            return Disposables.create {
////                if let task = task {
////                    task.cancel()
////                }
////            }
////        }
////    }
//
//
//
//}
