//
//  NNTencentOCRManager.swift
//  IntelligentOfParking
//
//  Created by Bin Shang on 2020/12/23.
//  Copyright © 2020 Xi'an iRain IoT. Technology Service CO., Ltd. . All rights reserved.
//

import UIKit
import Alamofire
import RxSwift
import SwiftExpand


@objcMembers class NNTencentOCRManager: NSObject {
    
    var disposeBag = DisposeBag()
    
//    var uploadApi = IOPSaasImgUploadApi()
//    var idCardApi = IOPOcrIDcardImgAPI()
//    var licenseApi = IOPOcrBusinessLicenseImgAPI()

    let urlString = "https://ocr.tencentcloudapi.com/"
    ///获取ocr 请求参数
    func recognizeLicense(_ imgUrl: String, block: ((TXOCRLicenseDetailModel)->Void)?, failBlock: ((String)->Void)? = nil) {
//        NNProgressHUD.showLoading("请求中...")
//        licenseApi.imgUrl = imgUrl
//        licenseApi.startRequest { (api, dic) in
////            IOPProgressHUD.dismiss()
////            DDLog(dic)
//            guard let rootModel = IOPOcrParamsRootModel.yy_model(with: dic),
//                  let detailModel = rootModel.data
//                  else {
//                failBlock?(kAPIFail)
//                return }
////              block?(detailModel)
//            self.recognizeLicenseResult(detailModel, block: block, failBlock: failBlock)
//
//        } failedBlock: { (api, errorModel) in
//            NNProgressHUD.showError(withStatus: errorModel.message)
//            failBlock?(errorModel.message ?? kAPIFail)
//        }
    }
    ///获取ocr 请求参数
    func recognizeIDCard(_ imgUrl: String, block: ((TXOCRICardDetailModel)->Void)?, failBlock: ((String)->Void)? = nil) {
//        NNProgressHUD.showLoading("请求中...")
//        idCardApi.imgUrl = imgUrl
//        idCardApi.startRequest { (api, dic) in
////            IOPProgressHUD.dismiss()
////            DDLog(dic)
////            block?(dic)
//            guard let rootModel = IOPOcrParamsRootModel.yy_model(with: dic),
//                  let detailModel = rootModel.data
//                  else {
//                failBlock?(kAPIFail)
//                return }
////              block?(detailModel)
//            self.recognizeIDCardResult(detailModel, block: block, failBlock: failBlock)
//
//        } failedBlock: { (api, errorModel) in
//            NNProgressHUD.showError(errorModel.message)
//        }
    }
    ///ocr 请求
    private func recognizeResult(_ model: IOPOcrParamsDetailModel, block: (([String: Any])->Void)?, failBlock: ((String)->Void)? = nil) {
        guard let URL = URL(string: urlString) else {
            failBlock?("链接错误")
            return }

        let params = ["Action": model.Action,
                      "ImageUrl": model.ImageUrl,
                      "Nonce": model.Nonce,
                      "Region": model.Region,
                      "SecretId": model.SecretId,
                      "Signature": model.Signature,
                      "Version": model.Version,
                      "Timestamp": model.Timestamp,

        ] as [String : Any]
        
        AF.request(URL, method: .post, parameters: params, headers: nil)
            .response { (response) in
                guard let data = response.data,
                    let dic = JSONSerialization.jsonObjectFromData(data) as? [String : Any]
                else {
                    DDLog("数据解析错误 response:\(response)")
                    failBlock?("数据解析错误")
                    return;
                }
                DDLog(dic.jsonString)
                block?(dic)
        }
    }
    ///License ocr 请求
    private func recognizeLicenseResult(_ model: IOPOcrParamsDetailModel, block: ((TXOCRLicenseDetailModel)->Void)?, failBlock: ((String)->Void)? = nil) {
        recognizeResult(model) { (dic) in
            if let rootModel = TXOCRLicenseRootModel.yy_model(with: dic),
               let detailModel = rootModel.data {
                if let errorModel = detailModel.Error {
                    failBlock?(errorModel.Message)
                } else {
                    block?(detailModel)
                }
                   
            } else {
                failBlock?("请求失败")
            }
        }
    }
    ///IDCard ocr 请求
    private func recognizeIDCardResult(_ model: IOPOcrParamsDetailModel, block: ((TXOCRICardDetailModel)->Void)?, failBlock: ((String)->Void)? = nil) {
        recognizeResult(model) { (dic) in
            if let rootModel = TXOCRICardRootModel.yy_model(with: dic),
               let detailModel = rootModel.data {
                if let errorModel = detailModel.Error {
                    failBlock?(errorModel.Message)
                } else {
                    block?(detailModel)
                }
                   
            } else {
                failBlock?("请求失败")
            }
        }
    }
}


import YYModel
///iop 参数接口模型
@objcMembers class IOPOcrParamsRootModel: NSObject, YYModel {

    var code: String = ""

    var data: IOPOcrParamsDetailModel?

    var message: String = ""

    required override init() {}
    static func modelCustomPropertyMapper() -> [String : Any]? {
        return [:]
    }
    
}

@objcMembers class IOPOcrParamsDetailModel: NSObject, YYModel {

    var Action: String = ""

    var ImageUrl: String = ""

    var Nonce: String = ""

    var Region: String = ""

    var SecretId: String = ""

    var Signature: String = ""

    var Timestamp: Int = 0

    var Version: String = ""

    required override init() {}
    static func modelCustomPropertyMapper() -> [String : Any]? {
        return [:]
    }
    
}

///腾讯接口返回接口营业执照模型
@objcMembers class TXOCRLicenseRootModel: NSObject, YYModel {

    var data: TXOCRLicenseDetailModel?

    required override init() {}

    static func modelCustomPropertyMapper() -> [String : Any]? {
        return ["data": "Response"]
    }
}

@objcMembers class TXOCRLicenseDetailModel: NSObject, YYModel {
    var Error: TXOCRErrorModel?

    var Address: String = ""

    var Business: String = ""

    var Capital: String = ""

    var ComposingForm: String = ""

    var Name: String = ""

    var Period: String = ""

    var Person: String = ""

    var RecognizeWarnCode: [String]?

    var RecognizeWarnMsg: [String]?

    var RegNum: String = ""

    var RequestId: String = ""

    var SetDate: String = ""

    var `Type`: String = ""

    required override init() {}
    static func modelCustomPropertyMapper() -> [String : Any]? {
        return [:]
    }
    
}

@objcMembers class TXOCRErrorModel: NSObject, YYModel {

    var Code: String = ""

    var Message: String = ""

    required override init() {}
    static func modelCustomPropertyMapper() -> [String : Any]? {
        return [:]
    }
    
}

///腾讯身份证识别
@objcMembers class TXOCRICardRootModel: NSObject, YYModel {

    var data: TXOCRICardDetailModel?

    required override init() {}

    static func modelCustomPropertyMapper() -> [String : Any]? {
        return ["data": "Response"]
    }
}

@objcMembers class TXOCRICardDetailModel: NSObject, YYModel {
    var Error: TXOCRErrorModel?

    var Address: String = ""

    var AdvancedInfo: String = ""
    ///发证单位
    var Authority: String = ""

    var Birth: String = ""

    var IdNum: String = ""

    var Name: String = ""

    var Nation: String = ""

    var RequestId: String = ""

    var Sex: String = ""

    var ValidDate: String = ""

    required override init() {}
    static func modelCustomPropertyMapper() -> [String : Any]? {
        return [:]
    }
    
}

