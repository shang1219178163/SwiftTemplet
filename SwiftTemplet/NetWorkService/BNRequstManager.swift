//
//  BNRequstManager.swift
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

//enum BNRequestType: String {
//    case GET = "GET"
//    case POST = "POST"
//}

enum BNRequestCode: Int {
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
@objc protocol BNRequestManagerProtocol: NSObjectProtocol {
    @objc func requestURI() -> String
//    func requestType() -> BNRequestType
    @objc func requestType() -> String

    @objc func requestParams() -> Dictionary<String, Any>
    @objc func validateParams() -> Bool
    
    @objc optional func saveJsonOfCache(_ json: Dictionary<String, Any>?) -> Bool
    @objc optional func jsonFromCache() -> Dictionary<String, Any>?

}

/// 网络请求代理
@objc protocol BNRequestManagerResultDelegate: NSObjectProtocol {
    func manager(_ manager: BNRequstManager, dic: Dictionary<String, Any>?, error: Error?) -> Void
    
}

/// 网络请求结果闭包
typealias BNRequestResultBlock = (BNRequstManager, Dictionary<String, Any>?, Error?) -> Void

class BNRequstManager: NSObject {

    var isLoading: Bool = false
    
//    weak var child: BNRequestManagerProtocol?
//    weak var delegate: BNRequestManagerResultDelegate?
    weak var child: BNRequestManagerProtocol?
    weak var delegate: BNRequestManagerResultDelegate?

    var successBlock: BNRequestResultBlock?
    var failureBlock: BNRequestResultBlock?

    override init() {
        super.init()
    }
    
    func startRequest(success: @escaping BNRequestResultBlock, fail: @escaping BNRequestResultBlock) -> Void {
        successBlock = success;
        failureBlock = fail;
        startRequest()
    }
    
    func startRequest() -> Void {
        if child?.validateParams() == false {
            let error: NSError = NSError.error("validateParams参数校验失败", code: BNRequestCode.ParamsError.rawValue);
            
//            if (delegate != nil) && delegate!.conforms(to: BNRequestManagerResultDelegate.self) {
                delegate?.manager(self, dic: nil, error: error);
//            }
            if failureBlock != nil {
                failureBlock!(self, nil, error)
            }
            return
        }
        
        if (child != nil) && child?.jsonFromCache!() != nil {
            let cacheDic = child?.jsonFromCache!()
            delegate?.manager(self, dic: cacheDic, error: nil);
            if successBlock != nil {
                successBlock!(self, cacheDic, nil)
            }
            return
        }
        startRequestFromNetwork();
    }
    
    func startRequestFromNetwork() -> Void {
        isLoading = true
        //请求日志
        BNLog.logRequestInfoWithURI((child?.requestURI())!, params: (child?.requestParams())!)
        
        BNRequstAgent.shared.request((child?.requestURI())!, method: HTTPMethod(rawValue: (child?.requestType())!)!, parameters: child?.requestParams() as Any) { (response) in
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
        
        BNLog.logResponseInfoWithURI((child?.requestURI())!, json: jsonDic)
        
//        if (delegate != nil) && delegate!.conforms(to: BNRequestManagerResultDelegate.self) {
            delegate?.manager(self, dic: jsonDic, error: nil);
//        }
        if successBlock != nil {
            successBlock!(self, jsonDic, nil)
        }
        //缓存数据
        let _ = child?.saveJsonOfCache!(jsonDic)
    }
    
    func didFailure(_ response: DefaultDataResponse, errorType: BNRequestCode) -> Void {
        
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
    }
    
}
