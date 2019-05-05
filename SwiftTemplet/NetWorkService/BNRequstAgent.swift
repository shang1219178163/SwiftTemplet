//
//  BNRequstAgent.swift
//  SwiftTemplet
//
//  Created by Bin Shang on 2019/4/30.
//  Copyright © 2019 BN. All rights reserved.
//

import UIKit
import Alamofire
import SwiftExpand

typealias BNNetworkBlock = (BNURLResponse) -> Void

class BNRequstAgent: NSObject {

    static let shared = BNRequstAgent()
    private override init() {
        super.init()
 
    }
    
    lazy var headers: HTTPHeaders = {
        let dic: HTTPHeaders = ["User-Agent": BNAPIConfiguration.headerUserAgent,
                   "Accept-Version": BNAPIConfiguration.headerAcceptVersion,
        ];
        return dic;
    }()
  
    /// 常规请求
    func request(_ url: String = BNAPIConfiguration.serviceURLString, method: HTTPMethod, parameters: Any, result: @escaping (DefaultDataResponse) -> Void) -> Void {
        Alamofire
            .request(URL(string: url)!,
                          method: method,
                          parameters: (parameters as! Parameters),
                          headers: BNRequstAgent.shared.headers)
            .response(completionHandler: result)
    
    }
    
    /// 多图上传
    func upload(_ url: String = BNAPIConfiguration.serviceURLString, parameters: Any, images: [UIImage],
        fileNames: [String]?, result: @escaping (DefaultDataResponse) -> Void) -> Void {
        
        Alamofire
            .upload(multipartFormData: { (MultipartFormData) in
                
                for e in images.enumerated() {
                    let model: BNUploadModel = BNUploadModel.upload(images: images, fileNames: fileNames, idx: e.offset)
                    MultipartFormData.append(model.data!, withName: model.name!, mimeType: model.mimeType!);
                }
                
                if let obj = parameters as? Data {
                    MultipartFormData.append(obj, withName: "data")
                }
                
                if let obj = parameters as? String {
                    let data: Data = obj.data(using: .utf8)!
                    MultipartFormData.append(data, withName: "data")
                    
                    DDLog("formData_\(obj)");
                }
                
                if let obj = parameters as? Dictionary<String, Any> {
                    let string: String = (obj as NSDictionary).jsonValue()
                    let data: Data = string.data(using: .utf8)!
                    MultipartFormData.append(data, withName: "data")

                    DDLog("formData_\(string)");
                }                
                
            }, to: URL(string: url)!) { (encodingResult) in
                
                switch encodingResult {
                case .success(let request, _, _):
                    request.uploadProgress(queue: DispatchQueue.main, closure: { (progress) in
                        print("上传进度_\(progress.fractionCompleted)")
                    })
                
                case .failure(_):
                    print("上传失败")
                }
                
        }
    }
    
    /// 文件下载
    func download(_ url: String = BNAPIConfiguration.serviceURLString, parameters: Parameters) -> Void {
    
        Alamofire.download(URL(string: url)!, method: .get, parameters: parameters, headers: headers, to: nil)
            .responseData { (response) in
                if let data = response.result.value {
//                    let image = UIImage(data: data)
                }
                
        }
    }
    
}
