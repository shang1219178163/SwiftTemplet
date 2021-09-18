//
//  NNRequstManager.swift
//  SwiftTemplet
//
//  Created by Bin Shang on 2019/4/30.
//  Copyright © 2019 BN. All rights reserved.
//

import UIKit
import Alamofire
import SwiftExpand


//enum NNRequestType: String {
//    case get = "GET"
//    case post = "POST"
//    case post_formData = "POST_FORM_DATA"
//    case upload = "UPLOAD"
//    case download = "DOWNLOAD"
//}


extension HTTPMethod{
    ///
    public static let upload = HTTPMethod(rawValue: "UPLOAD")
    
    public static let download = HTTPMethod(rawValue: "DOWNLOAD")

}

enum NNRequestCode: Int {
    case success         = 1        //请求成功
    case paramsError     = 100      //参数错误，
    case JSONError       = 101      //JSON解析错误
    case timeout         = 102      //请求超时
    case networkError    = 103      //网络错误，
    case serverError     = 104      //服务端返回非200的状态码
    case cancel          = 105      //取消网络请求
    case noLogin         = 106      //未登录
    case notFound        = 107      //服务器找不到给定的资源；文档不存在
    case invalidRequest  = 108      //无效请求
    case invalidToken    = 109      //token失效
    case requestTooLarge = 413      //文件太大
    case unknown         = 110      //未知错误
}

/// 必须遵守的基础协议
protocol NNRequestManagerProtocol: NSObjectProtocol {
    
    func requestURI() -> String
    
    func requestType() -> HTTPMethod

    func requestParams() -> [String: Any]
    
    func validateParams() -> Bool
}
/// 可选协议方法
extension NNRequestManagerProtocol {
    
    func shouldCache() -> Bool{
        return false
    }
    
    func needLogin() -> Bool{
        return true
    }
    
    func printLog() -> Bool{
        return false
    }
    
    @discardableResult
    func saveJsonOfCache(_ json: [String: Any]?) -> Bool{
        return false
    }
    
    func jsonFromCache() -> [String: Any]?{
        return nil
    }

    func clearCache(){
        
    }
    
    func validateAppVer() -> Bool {
        return true
    }
}

/// 网络请求代理
protocol NNRequestManagerDelegate: NSObjectProtocol {
    func manager(_ manager: NNRequstManager, dic: Dictionary<String, Any>)
    func manager(_ manager: NNRequstManager, error: NSError)

}

/// 网络请求结果闭包
typealias NNRequestSuccessBlock = ((NNRequstManager, Dictionary<String, Any>) -> Void)
typealias NNRequestFailureBlock = ((NNRequstManager, NSError) -> Void)


@objcMembers class NNRequstManager: NSObject {
    
    let requestErrorDic = [
        "Request failed: request too large (413)": "文件太大,请重新选择",
    ]
    
    var isLoading: Bool = false
    
    weak var child: NNRequestManagerProtocol!
    weak var delegate: NNRequestManagerDelegate?

    var successBlock: NNRequestSuccessBlock?
    var failureBlock: NNRequestFailureBlock?

    override init() {
        super.init()
    }
    
    @discardableResult
    func startRequest(success: @escaping NNRequestSuccessBlock, fail: @escaping NNRequestFailureBlock) -> DataRequest? {
        successBlock = success;
        failureBlock = fail;
        return startRequest()
    }
        
    func startRequest() -> DataRequest? {
        if child.validateParams() == false {
//            let error = NSError.error("validateParams参数校验失败", code: NNRequestCode.ParamsError.rawValue);
//
//            delegate?.manager(self, error: error);
//            failureBlock?(self, error)
            return nil
        }
        
        if child.validateAppVer() == false {
            return nil
        }
        
        if let cacheDic = child.jsonFromCache() {
            printLog(cacheDic, isRequest: false)

            delegate?.manager(self, dic: cacheDic);
            successBlock?(self, cacheDic)
            return nil
        }
        return startRequestFromNetwork();
    }
    
    func startRequestFromNetwork() -> DataRequest? {
        isLoading = true
        
        guard let child = child else { return nil }
        
        var url = child.requestURI()
        if !url.hasPrefix("http") {
            url = NNAPIConfig.serviceURLString + url
        }
        
        var params = child.requestParams()
        if params.keys.contains("token") {
            params.merge(["token": UIApplication.token], uniquingKeysWith: {$1})
        }
        
        //请求日志
        printLog(params, isRequest: true)
        
        switch child.requestType() {
        case .upload:
            return NNRequstAgent.shared.upload(url, parameters: params) { (progress) in
                
            } handler: { (response) in
                self.isLoading = false
                
                switch response.result {
                case .success:
    //                print("Validation Successful")
                    guard let jsonData = response.data else {
                        self.didFailure(response, errorType: .JSONError)
                        return
                    }
                    self.didSuccess(response, data: jsonData)

                case .failure(let error):
                    print(error)
                    if let statusCode = response.response?.statusCode {
                        print(statusCode)
                    }
                    
                    self.didFailure(response, errorType: .serverError)
                }
            }

        default:
            let method = child.requestType()
            return NNRequstAgent.shared.request(url,
                                                method: method,
                                                parameters: params) { (response) in
                self.isLoading = false
                
                switch response.result {
                case .success:
    //                print("Validation Successful")
                    
                    guard let jsonData = response.data else {
                        self.didFailure(response, errorType: .JSONError)
                        return
                    }
                    self.didSuccess(response, data: jsonData)

                case .failure(let error):
                    print(error)
                    if let statusCode = response.response?.statusCode {
                        print(statusCode)
                    }
                    
                    self.didFailure(response, errorType: .serverError)
                }
            }
        }
    }
    
    
    func didSuccess(_ response: AFDataResponse<Data?>, data: Data) {
        guard response.response?.statusCode == 200 else {
            didFailure(response, errorType: .serverError)
            return;
        }
        
        guard let jsonDic = data.objValue as? [String : Any] else {
            didFailure(response, errorType: .JSONError)
            return;
        }
        
        guard let child = child else { return }
        printLog(jsonDic, isRequest: false)

        delegate?.manager(self, dic: jsonDic)
        successBlock?(self, jsonDic)
        
        //缓存数据
        child.saveJsonOfCache(jsonDic)
    }
    
    func didFailure(_ response: AFDataResponse<Data?>, errorType: NNRequestCode) {
        var tip: String = "请求失败,请稍后重试"
        switch errorType {
        case .paramsError:
            tip = "参数错误"

        case .JSONError:
            tip = "JSON解析错误"

        case .timeout:
            tip = "请求超时"

        case .networkError:
            tip = "网络错误"
            
        case .serverError:
            tip = "服务端返回非200的状态码"
            
        case .cancel:
            tip = "取消网络请求"
            
        case .noLogin:
            tip = "未登录"
            
        case .notFound:
            tip = "服务器找不到给定的资源；文档不存在"
            
        case .invalidRequest:
            tip = "无效请求"
            
        case .invalidToken:
            tip = "token失效"
            
        case .unknown:
            tip = "未知错误"
            
        default:
            break
        }
        
        UIAlertController.showAlert("", message: tip)
        delegate?.manager(self, error: response.error! as NSError)
        failureBlock?(self, response.error! as NSError)
    }
    
    func printLog(_ params: [String: Any], isRequest: Bool) {
        guard let child = child else { return }
        if !child.printLog() {
            return
        }
        
        var url = child.requestURI()
        if !url.hasPrefix("http") {
            url = NNAPIConfig.serviceURLString + url
        }
        
        if isRequest {
            NNLog.logRequestInfo(url, params: params)
        } else {
            NNLog.logResponseInfo(url, json: params)
        }
    }
    
}
