//
//  RxRequestExampleController.swift
//  SwiftTemplet
//
//  Created by Bin Shang on 2020/7/9.
//  Copyright © 2020 BN. All rights reserved.
//

import UIKit
import RxSwift
import RxAlamofire
import Alamofire
import SwiftExpand
import HandyJSON

class RxRequestExampleController: UIViewController {

    var disposeBag = DisposeBag()

    lazy var rightBtn: UIButton = {
        let view = UIButton.create(.zero, title: "Done", textColor: .white, backgroundColor: .clear)
        view.setTitleColor(.white, for: .normal)
        view.setBackgroundColor(.theme, for: .normal)
//        view.isHidden = true;
        view.sizeToFit()
        view.addActionHandler({ (sender) in
            self.requestAppInfo1()
            
        }, for: .touchUpInside)
        return view
    }()
    
    // MARK: -lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        navigationItem.rightBarButtonItem = UIBarButtonItem(customView: rightBtn)
        
//        Alamofire.request(<#T##url: URLConvertible##URLConvertible#>, method: <#T##HTTPMethod#>, parameters: <#T##Parameters?#>, encoding: <#T##ParameterEncoding#>, headers: <#T##HTTPHeaders?#>).responseJSON(completionHandler: <#T##(DataResponse<Any>) -> Void#>)
//
//        let destination = DownloadRequest.suggestedDownloadDestination(for: .documentDirectory)
//        let destination: DownloadRequest.DownloadFileDestination = { _, _ in
//            self.documentsURL = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0]
//            self.documentsURL.appendPathComponent(fileName)
//            print(self.documentsURL)
//            return (self.documentsURL, [.removePreviousFile])
//        }
//
//        Alamofire.download(<#T##urlRequest: URLRequestConvertible##URLRequestConvertible#>, to: destination).downloadProgress { (<#Progress#>) in
//
//        }.responseJSON { (<#DownloadResponse<Any>#>) in
//            <#code#>
//        }

//        Alamofire.upload(multipartFormData: <#T##(MultipartFormData) -> Void#>, to: <#T##URLConvertible#>, encodingCompletion: <#T##((SessionManager.MultipartFormDataEncodingResult) -> Void)?##((SessionManager.MultipartFormDataEncodingResult) -> Void)?##(SessionManager.MultipartFormDataEncodingResult) -> Void#>)

//        RxAlamofire.requestJSON(<#T##method: HTTPMethod##HTTPMethod#>, <#T##url: URLConvertible##URLConvertible#>, parameters: <#T##[String : Any]?#>, encoding: <#T##ParameterEncoding#>, headers: <#T##[String : String]?#>).do(onNext: <#T##(((HTTPURLResponse, Any)) throws -> Void)?##(((HTTPURLResponse, Any)) throws -> Void)?##((HTTPURLResponse, Any)) throws -> Void#>, afterNext: <#T##(((HTTPURLResponse, Any)) throws -> Void)?##(((HTTPURLResponse, Any)) throws -> Void)?##((HTTPURLResponse, Any)) throws -> Void#>, onError: <#T##((Error) throws -> Void)?##((Error) throws -> Void)?##(Error) throws -> Void#>, afterError: <#T##((Error) throws -> Void)?##((Error) throws -> Void)?##(Error) throws -> Void#>, onCompleted: <#T##(() throws -> Void)?##(() throws -> Void)?##() throws -> Void#>, afterCompleted: <#T##(() throws -> Void)?##(() throws -> Void)?##() throws -> Void#>, onSubscribe: <#T##(() -> Void)?##(() -> Void)?##() -> Void#>, onSubscribed: <#T##(() -> Void)?##(() -> Void)?##() -> Void#>, onDispose: <#T##(() -> Void)?##(() -> Void)?##() -> Void#>)
        
//        RxAlamofire.upload(<#T##data: Data##Data#>, urlRequest: <#T##URLRequestConvertible#>).do(onNext: <#T##((UploadRequest) throws -> Void)?##((UploadRequest) throws -> Void)?##(UploadRequest) throws -> Void#>, afterNext: <#T##((UploadRequest) throws -> Void)?##((UploadRequest) throws -> Void)?##(UploadRequest) throws -> Void#>, onError: <#T##((Error) throws -> Void)?##((Error) throws -> Void)?##(Error) throws -> Void#>, afterError: <#T##((Error) throws -> Void)?##((Error) throws -> Void)?##(Error) throws -> Void#>, onCompleted: <#T##(() throws -> Void)?##(() throws -> Void)?##() throws -> Void#>, afterCompleted: <#T##(() throws -> Void)?##(() throws -> Void)?##() throws -> Void#>, onSubscribe: <#T##(() -> Void)?##(() -> Void)?##() -> Void#>, onSubscribed: <#T##(() -> Void)?##(() -> Void)?##() -> Void#>, onDispose: <#T##(() -> Void)?##(() -> Void)?##() -> Void#>)
        
//        RxAlamofire.download(<#T##urlRequest: URLRequestConvertible##URLRequestConvertible#>, to: destination).do(onNext: <#T##((DownloadRequest) throws -> Void)?##((DownloadRequest) throws -> Void)?##(DownloadRequest) throws -> Void#>, afterNext: <#T##((DownloadRequest) throws -> Void)?##((DownloadRequest) throws -> Void)?##(DownloadRequest) throws -> Void#>, onError: <#T##((Error) throws -> Void)?##((Error) throws -> Void)?##(Error) throws -> Void#>, afterError: <#T##((Error) throws -> Void)?##((Error) throws -> Void)?##(Error) throws -> Void#>, onCompleted: <#T##(() throws -> Void)?##(() throws -> Void)?##() throws -> Void#>, afterCompleted: <#T##(() throws -> Void)?##(() throws -> Void)?##() throws -> Void#>, onSubscribe: <#T##(() -> Void)?##(() -> Void)?##() -> Void#>, onSubscribed: <#T##(() -> Void)?##(() -> Void)?##() -> Void#>, onDispose: <#T##(() -> Void)?##(() -> Void)?##() -> Void#>)
        
        

    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        requestAppInfo1()

    }

    // MARK: -funtions
    func requestAppInfo1() {
        NNProgressHUD.showLoading(kNetWorkRequesting)
        let appStoreURL = "https://itunes.apple.com/cn/lookup?id=1223960667";
        RxAlamofire.requestJSON(.get, appStoreURL)
            .debug()
            .map({ (response, json) -> Any in
                guard let dic = json as? NSDictionary else { return json}
                DDLog(dic.jsonString)
                return json
            })
            .mapHandyJSONModel(type: NNRootAppInfoModel.self)
            .subscribe(onNext: { (rootModel) in
                DDLog(rootModel)
                NNProgressHUD.dismiss()

            }, onError: { (error) in
                NNProgressHUD.showError(error.localizedDescription)
            }, onCompleted: {
                
            }) {
                
            }.disposed(by: disposeBag)
        
    }
    ///初版
    func requestAppInfo() {
        NNProgressHUD.showLoading(kNetWorkRequesting)
        let appStoreURL = "https://itunes.apple.com/cn/lookup?id=1223960667";
        RxAlamofire.requestJSON(.get, appStoreURL)
            .debug()
            .subscribe(onNext: { (response, json) in
                NNProgressHUD.dismiss()
                guard let dic = json as? NSDictionary else { return }
                DDLog(dic.jsonString)
                let rootModel = NNRootAppInfoModel.deserialize(from: dic)
                DDLog(rootModel)

            }, onError: { (error) in

            }, onCompleted: {

            }) {

            }.disposed(by: disposeBag)

    }


    ///上传数据
    func upload(_ url: URLConvertible, method: HTTPMethod = .post, parameters: [String: Any], headers: HTTPHeaders? = nil) -> Observable<Data>{
        return Observable<Data>.create({observer in
            AF.upload(multipartFormData: { (MultipartFormData) in

                parameters.forEach { (key, obj) in
                    if let value = obj as? String {
                        guard let data = value.data(using: .utf8) else { return }
                        MultipartFormData.append(data, withName: key)
                        
                    } else if let value = obj as? Data {
                        let fileName = DateFormatter.stringFromDate(Date(), fmt: "yyyyMMddHHmmss")
                        let imageType = UIImage.contentType(value as NSData)
                        let mimeType = "image/\(imageType)"
                        print("\(#function)_\(key)_\(value.fileSize)_\(fileName)_\(mimeType)_")
                        
                        MultipartFormData.append(value, withName: key, fileName: fileName, mimeType: mimeType)
                        
                    } else if let value = obj as? URL {
                        MultipartFormData.append(value, withName: key)
                        
                    }
                }
                    
            }, to: url)
            .responseJSON { (response) in
                switch response.result {
                case .success:
//                    print("Validation Successful")
                    guard let jsonData = response.data else {
                        return
                    }
                    
                    observer.onNext(jsonData)
                    observer.onCompleted()
                    
                case .failure(let error):
                    print(error)
                    if let statusCode = response.response?.statusCode {
                        print(statusCode)
                    }
                    observer.onError(error)
                }
            }
            return Disposables.create();
        })
    }
    ///下载数据
    func download(_ url: URLConvertible, method: HTTPMethod = .get, parameters: [String: Any], headers: HTTPHeaders? = nil) -> Observable<String>{
        return Observable<String>.create({observer in

            let destination = DownloadRequest.suggestedDownloadDestination(for: .documentDirectory)
            AF.download(url, method: method, parameters: parameters, encoding: URLEncoding.default,
                                headers: headers, to: destination)
                .downloadProgress(closure: { (progress) in
                    let current = progress.completedUnitCount/progress.totalUnitCount
                    DDLog("current:\(current)")
                    
                })
                .responseJSON { (response) in
                    switch response.result {
                    case .success(let value):
                        if let value = value as? String {
                            observer.onNext(value as String)
                        }
                                            
                    case .failure(let error):
                        observer.onError(error)
                    }
                    observer.onCompleted()
                }

            return Disposables.create();
        })
    }
}
