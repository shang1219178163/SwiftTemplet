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


let kHTTPMethodGet: String = "GET"
let kHTTPMethodPOST: String = "POST"
let kHTTPMethodUpload: String = "upload"
let kHTTPMethodDownload: String = "download"

enum NNRequestCode: Int {
    case Success         = 1        //请求成功
    case ParamsError     = 100      //参数错误，
    case JSONError       = 101      //JSON解析错误
    case Timeout         = 102      //请求超时
    case NetworkError    = 103      //网络错误，
    case ServerError     = 104      //服务端返回非200的状态码
    case Cancel          = 105      //取消网络请求
    case NoLogin         = 106      //未登录
    case NotFound        = 107      //服务器找不到给定的资源；文档不存在
    case InvalidRequest  = 108      //无效请求
    case InvalidToken    = 109      //token失效
    case RequestTooLarge = 413      //文件太大
    case Unknown         = 110      //未知错误
}

/// 必须遵守的基础协议
@objc protocol NNRequestManagerProtocol: NSObjectProtocol {
    @objc func requestURI() -> String
    @objc func requestType() -> String

    @objc func requestParams() -> [String: Any]
    @objc func validateParams() -> Bool
    @objc func shouldCache() -> Bool
    @objc func needLogin() -> Bool
    @objc func printLog() -> Bool

    @discardableResult
    @objc optional func saveJsonOfCache(_ json: [String: Any]?) -> Bool
    @objc optional func jsonFromCache() -> [String: Any]?

    @objc optional func clearCache()
}

/// 网络请求代理
@objc protocol NNRequestManagerDelegate: NSObjectProtocol {
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
    
    weak var child: NNRequestManagerProtocol?
    weak var delegate: NNRequestManagerDelegate?

    var successBlock: NNRequestSuccessBlock?
    var failureBlock: NNRequestFailureBlock?

    override init() {
        super.init()
    }
    
    func startRequest(success: @escaping NNRequestSuccessBlock, fail: @escaping NNRequestFailureBlock) -> DataRequest? {
        successBlock = success;
        failureBlock = fail;
        return startRequest()
    }
        
    func startRequest() -> DataRequest? {
        if child?.validateParams() == false {
//            let error = NSError.error("validateParams参数校验失败", code: NNRequestCode.ParamsError.rawValue);
//
//            delegate?.manager(self, error: error);
//            failureBlock?(self, error)
            return nil
        }
        
        if let child = child, let cacheDic = child.jsonFromCache?() as [String: Any]? {
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
        case kHTTPMethodUpload:
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
                    
                    self.didFailure(response, errorType: .ServerError)
                }
            }

        default:
            return NNRequstAgent.shared.request(url,
                                                method: HTTPMethod(rawValue: child.requestType()),
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
                    
                    self.didFailure(response, errorType: .ServerError)
                }
            }
        }
    }
    
    
    func didSuccess(_ response: AFDataResponse<Data?>, data: Data) {
        guard response.response?.statusCode == 200 else {
            didFailure(response, errorType: .ServerError)
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
        child.saveJsonOfCache?(jsonDic)
    }
    
    func didFailure(_ response: AFDataResponse<Data?>, errorType: NNRequestCode) {
        var tip: String = "请求失败,请稍后重试"
        switch errorType {
        case .ParamsError:
            tip = "参数错误"

        case .JSONError:
            tip = "JSON解析错误"

        case .Timeout:
            tip = "请求超时"

        case .NetworkError:
            tip = "网络错误"
            
        case .ServerError:
            tip = "服务端返回非200的状态码"
            
        case .Cancel:
            tip = "取消网络请求"
            
        case .NoLogin:
            tip = "未登录"
            
        case .NotFound:
            tip = "服务器找不到给定的资源；文档不存在"
            
        case .InvalidRequest:
            tip = "无效请求"
            
        case .InvalidToken:
            tip = "token失效"
            
        case .Unknown:
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
