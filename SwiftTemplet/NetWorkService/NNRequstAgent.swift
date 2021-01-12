//
//  NNRequstAgent.swift
//  SwiftTemplet
//
//  Created by Bin Shang on 2019/4/30.
//  Copyright © 2019 BN. All rights reserved.
//

import UIKit
import Alamofire
import SwiftExpand

//typealias NNNetworkBlock = ((NNURLResponse) -> Void)


@objcMembers class NNRequstAgent: NSObject {

    static let shared = NNRequstAgent()
    private override init() {
        super.init()
    }
    
    lazy var headers: HTTPHeaders = {
        let dic: HTTPHeaders = ["User-Agent": NNAPIConfig.headerUserAgent,
                                "Accept-Version": NNAPIConfig.headerAcceptVersion,
        ];
        return dic;
    }()
  
    /// 常规请求
    func request(_ url: String,
                 method: HTTPMethod,
                 parameters: [String: Any],
                 handler: @escaping (AFDataResponse<Data?>) -> Void) -> DataRequest {
        
        let urlStr = !url.hasPrefix("http") ? NNAPIConfig.serviceURLString + url : url
        return AF.request(URL(string: urlStr)!,
                          method: method,
                          parameters: parameters,
                          headers: NNRequstAgent.shared.headers)
            .response(completionHandler: handler)
    }
    
    /// 多图上传
    func upload(_ url: String,
                parameters: [String: Any],
                progressBlock: @escaping ((Progress) -> Void),
                handler: @escaping (AFDataResponse<Data?>) -> Void) -> DataRequest? {
        
        let urlStr = !url.hasPrefix("http") ? NNAPIConfig.serviceURLString + url : url

        return AF.upload(multipartFormData: { (MultipartFormData) in
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
  
        }, to: urlStr)
        .uploadProgress(closure: progressBlock)
        .response(completionHandler: handler)
//        .responseJSON { (response) in
//            switch response.result {
//            case .success:
//                print("Validation Successful")
//                guard let jsonData = response.data else {
//                    print(error)
//                    return
//                }
//
//            case .failure(let error):
//                print(error)
//                if let statusCode = response.response?.statusCode {
//                    print(statusCode)
//                }
//            }
//        }
    }
    
    /// 文件下载
    func download(_ url: String,
                  parameters: Parameters,
                  successBlock: ((URL) -> Void)?,
                  failBlock: ((Error) -> Void)?) -> DownloadRequest {
        let urlStr = url.hasPrefix("http") ? url : NNAPIConfig.serviceURLString + url
        
        let destination = DownloadRequest.suggestedDownloadDestination(for: .documentDirectory)
        return AF.download(urlStr, method: .get, parameters: parameters, headers: headers, to: destination)
//            .response(completionHandler: handler)
            .responseData { (response) in
//                print(response.fileURL?.lastPathComponent)
                switch response.result {
                case .success:
//                    print("Validation Successful")
                    guard let fileURL = response.fileURL else {
                        print(#function, "文件 fileURL 无效 ")
                        return
                    }
                    successBlock?(fileURL)

                case .failure(let error):
                    print(error)
                    if let statusCode = response.response?.statusCode {
                        print(statusCode)
                    }
                    failBlock?(error)
                }
            }
    }
}
