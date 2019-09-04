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

    @objc func requestParams() -> Dictionary<String, Any>
    @objc func validateParams() -> Bool
    
    @objc optional func saveJsonOfCache(_ json: Dictionary<String, Any>?) -> Bool
    @objc optional func jsonFromCache() -> Dictionary<String, Any>?

}

/// 网络请求代理
@objc protocol NNRequestManagerDelegate: NSObjectProtocol {
    func manager(_ manager: NNRequstManager, dic: Dictionary<String, Any>?, error: Error?) -> Void
    
}

/// 网络请求结果闭包
typealias NNRequestBlock = (NNRequstManager, Dictionary<String, Any>?, Error?) -> Void

class NNRequstManager: NSObject {

    var isLoading: Bool = false
    
//    weak var child: NNRequestManagerProtocol?
//    weak var delegate: NNRequestManagerDelegate?
    weak var child: NNRequestManagerProtocol?
    weak var delegate: NNRequestManagerDelegate?

    var successBlock: NNRequestBlock?
    var failureBlock: NNRequestBlock?
    var resultBlock: NNRequestBlock?

    override init() {
        super.init()
    }
    
    func startRequest(success: @escaping NNRequestBlock, fail: @escaping NNRequestBlock) -> Void {
        successBlock = success;
        failureBlock = fail;
        startRequest()
    }
    
    func startRequest(closure: @escaping NNRequestBlock) -> Void {
        resultBlock = closure;
        startRequest()
    }
    
    func startRequest() -> Void {
        if child?.validateParams() == false {
            let error: NSError = NSError.error("validateParams参数校验失败", code: NNRequestCode.ParamsError.rawValue);
            
            delegate?.manager(self, dic: nil, error: error);
            failureBlock?(self, nil, error)
            resultBlock?(self, nil, error)
            return
        }
        
        if (child != nil) && child?.jsonFromCache!() != nil {
            let cacheDic = child?.jsonFromCache!()
            
            delegate?.manager(self, dic: cacheDic, error: nil);
            successBlock?(self, cacheDic, nil)
            resultBlock?(self, cacheDic, nil)
            return
        }
        startRequestFromNetwork();
    }
    
    func startRequestFromNetwork() -> Void {
        isLoading = true
        //请求日志
        NNLog.logRequestInfoWithURI((child?.requestURI())!, params: (child?.requestParams())!)
        
        NNRequstAgent.shared.request((child?.requestURI())!, method: HTTPMethod(rawValue: (child?.requestType())!)!, parameters: child?.requestParams() as Any) { (response) in
//            guard let self = self else { fatalError("请检查参数");}
            self.isLoading = false
            
            if response.error != nil {
                self.didFailure(response, errorType: .ServerError)
                
            } else {
                self.didSuccess(response)
                
            }
        };
    }
    
    
    func didSuccess(_ response: DefaultDataResponse) -> Void {
        guard response.response?.statusCode == 200 else {
            self.didFailure(response, errorType: .ServerError)
            return;
        }
        
        guard let jsonDic: Dictionary<String, Any> = ObjFromData(response.data!) as? Dictionary<String, Any> else {
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
        
        NNLog.logResponseInfoWithURI((child?.requestURI())!, json: jsonDic)
        
        delegate?.manager(self, dic: jsonDic, error: nil);
        successBlock?(self, jsonDic, nil)
        resultBlock?(self, jsonDic, nil)
        
        //缓存数据
        let _ = child?.saveJsonOfCache!(jsonDic)
    }
    
    func didFailure(_ response: DefaultDataResponse, errorType: NNRequestCode) -> Void {
        
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
        delegate?.manager(self, dic: nil, error: response.error)
        failureBlock?(self, nil, response.error)
        resultBlock?(self, nil, response.error)
    }
    
}
