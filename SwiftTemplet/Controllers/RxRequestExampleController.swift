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
        let sender = UIButton.create(title: "Done", imgName: nil)
        sender.setTitleColor(.white, for: .normal)
        sender.setBackgroundColor(.theme, for: .normal)
//        button.isHidden = true;
        sender.sizeToFit()
        sender.addActionHandler({ (control) in
            self.requestAppInfo1()
            
        }, for: .touchUpInside)
        return sender
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
            .mapModel(type: NNRootAppInfoModel.self)
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
    func upload(_ url: URLConvertible, method: HTTPMethod = .post, parameters: [String: Any], headers: HTTPHeaders? = nil) -> Observable<String>{
        return Observable<String>.create({observer in
            Alamofire.upload(multipartFormData: { formData in
//                if let imageData = image.jpegData(compressionQuality: 0.8) {
//                    formData.append(imageData, withName: "file", fileName: "file.jpg", mimeType: "image/jpg")
//                }
                for (key, value) in parameters {
                    switch value {
                    case is String:
                        if let data = (value as! String).data(using: .utf8) {
                            formData.append(data, withName: key)
                        }
                        
                    case is Data:
                        formData.append(value as! Data, withName: key, fileName:"file.jpg", mimeType: "image/jpg")

                    case is URL, is NSURL:
                        formData.append(value as! URL, withName: key)

                    default:
                        break
                    }
                }
                
            }, to: url, method: method, headers: headers,
                    encodingCompletion: { encodingResult in
                        switch encodingResult {
                        case .success(let upload, _, _):
                            upload.responseJSON { response in
                                guard let value = response.result.value else {
                                    return
                                }
//                                observer.onNext(JSON(value)["path"].stringValue)
                                observer.onCompleted()
                            }
                        case .failure(let error):
                            observer.onError(error)
                        }
            })
            return Disposables.create();
        })
    }
    ///下载数据
    func download(_ url: URLConvertible, method: HTTPMethod = .get, parameters: [String: Any], headers: HTTPHeaders? = nil) -> Observable<String>{
        return Observable<String>.create({observer in

            let destination = DownloadRequest.suggestedDownloadDestination(for: .documentDirectory)
            Alamofire.download(url, method: method, parameters: parameters, encoding: URLEncoding.default,
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
