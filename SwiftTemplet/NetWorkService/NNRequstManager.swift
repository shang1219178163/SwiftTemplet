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

let kRequestGET: String = "GET"
let kRequestPOST: String = "POST"

//enum NNRequestType: String {
//    case GET = "GET"
//    case POST = "POST"
//}

enum NNRequestCode: Int {
    case Success        = 1        //请求成功
    case ParamsError    = 100      //参数错误，
    case JSONError      = 101      //JSON解析错误
    case Timeout        = 102      //请求超时
    case NetworkError   = 103      //网络错误，
    case ServerError    = 104      //服务端返回非200的状态码
    case Cancel         = 105      //取消网络请求
    case NoLogin        = 106      //未登录
    case NotFound       = 107      //服务器找不到给定的资源；文档不存在
    case InvalidRequest = 108      //无效请求
    case InvalidToken   = 109      //token失效
    case Unknown        = 110      //未知错误
}

/// 必须遵守的基础协议
@objc protocol NNRequestManagerProtocol: NSObjectProtocol {
    @objc func requestURI() -> String
//    func requestType() -> NNRequestType
    @objc func requestType() -> String

    @objc func requestParams() -> [String: Any]
    @objc func validateParams() -> Bool
    @objc func printLog() -> Bool

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

class NNRequstManager: NSObject {

    var isLoading: Bool = false
    
//    weak var child: NNRequestManagerProtocol?
//    weak var delegate: NNRequestManagerDelegate?
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
            let error = NSError.error("validateParams参数校验失败", code: NNRequestCode.ParamsError.rawValue);
            
            delegate?.manager(self, error: error);
            failureBlock?(self, error)
            return nil
        }
        
        if let child = child, let cacheDic = child.jsonFromCache?() as [String: Any]? {
            
            NNLog.logResponseInfo(child.requestURI(), json: cacheDic)

            delegate?.manager(self, dic: cacheDic);
            successBlock?(self, cacheDic)
            return nil
        }
        return startRequestFromNetwork();
    }
    
    func startRequestFromNetwork() -> DataRequest? {
        isLoading = true
        //请求日志
        NNLog.logRequestInfo((child?.requestURI())!, params: (child?.requestParams())!)
        
        return NNRequstAgent.shared.request((child?.requestURI())!, method: HTTPMethod(rawValue: (child?.requestType())!)!, parameters: child?.requestParams() as Any) { (response) in
//            guard let self = self else { fatalError("请检查参数");}
            self.isLoading = false
            
            if response.error != nil {
                self.didFailure(response, errorType: .ServerError)
            } else {
                self.didSuccess(response)
            }
        };
    }
    
    
    func didSuccess(_ response: DefaultDataResponse) {
        guard response.response?.statusCode == 200 else {
            self.didFailure(response, errorType: .ServerError)
            return;
        }
        
        guard let jsonDic: [String : Any] = JSONSerialization.jsonObjectFromData(response.data!) as? [String : Any] else {
            self.didFailure(response, errorType: .JSONError)
            return;
        }
        
//        let jsonDic: Dictionary<String, Any> = ObjFromData(response.data!) as! Dictionary<String, Any>
        let codeKey = jsonDic.keys.contains("code") ? "code" : "resultCount";
        let code: NSInteger = jsonDic[codeKey] as! NSInteger
        if code != 1 {
            self.didFailure(response, errorType: .ServerError)
            return;
        }
        
        NNLog.logResponseInfo((child?.requestURI())!, json: jsonDic)
        
        delegate?.manager(self, dic: jsonDic)
        successBlock?(self, jsonDic)
        
        //缓存数据
        _ = child?.saveJsonOfCache!(jsonDic)
    }
    
    func didFailure(_ response: DefaultDataResponse, errorType: NNRequestCode) {
        var tip: String?
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
            tip = "请求失败,请稍后重试"
        }
        
        _ = UIAlertController.showAlert("", msg: tip!)
        delegate?.manager(self, error: response.error! as NSError)
        failureBlock?(self, response.error! as NSError)
    }
    
}
