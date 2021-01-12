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

typealias NNNetworkBlock = ((NNURLResponse) -> Void)


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
                 result: @escaping (AFDataResponse<Data?>) -> Void) -> DataRequest {
        
        let urlStr = !url.hasPrefix("http") ? NNAPIConfig.serviceURLString + url : url
        return AF.request(URL(string: urlStr)!,
                          method: method,
                          parameters: parameters,
                          headers: NNRequstAgent.shared.headers)
            .response(completionHandler: result)
    }
    
    /// 多图上传
    func upload(_ url: String,
                parameters: [String: Any],
                progressBlock: @escaping ((Progress) -> Void),
                block: @escaping (AFDataResponse<Data?>) -> Void) -> DataRequest? {
        
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
        .response(completionHandler: block)
//        .responseJSON { (response) in
//            switch response.result {
//            case .success:
//                print("Validation Successful")
//                guard let jsonData = response.data else {
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
    func download(_ url: String, parameters: Parameters) -> DownloadRequest {
        return AF.download(url, method: .get, parameters: parameters, headers: headers, to: nil)
                .responseData { (response) in
                    if response.result != nil {
//                    let image = UIImage(data: data)
                }
                
        }
    }
    
}
