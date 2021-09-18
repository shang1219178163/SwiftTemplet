//
//  IOPWorkOrderViewModel.swift
//  IntelligentOfParking
//
//  Created by Bin Shang on 2021/8/24.
//  Copyright © 2021 Xi'an iRain IoT. Technology Service CO., Ltd. . All rights reserved.
//

import UIKit

@objcMembers public class IOPWorkOrderViewModel: NSObject {

    private(set) lazy var workOrderCreateAPI = IOPWorkOrderCreateAPI()
    private(set) lazy var workOrderListAPI = IOPWorkOrderListAPI()
    private(set) lazy var workOrderDetailAPI = IOPWorkOrderDetailAPI()
      
    ///创建工单
    func requestWorkOrderCreate(_ api: ((IOPWorkOrderCreateAPI) -> Void)?, success: @escaping (([AnyHashable: Any]) -> Void), failure: ((String) -> Void)? = nil) {
        
        ZZProgressHUD.showLoading(kRequestLoading)
        api?(workOrderCreateAPI)
        workOrderCreateAPI.startRequest(success: { (manager, dic) in
            ZZProgressHUD.showSuccess(kRequestSuccess)
            success(dic)

        }) { (manager, errorModel) in
            if let failure = failure {
                failure(errorModel.message)
                return
            }
            ZZProgressHUD.showError(errorModel.message)
        }
    }
    
    
    ///工单列表
    func requestWorkList(_ api: ((IOPWorkOrderListAPI) -> Void)?, success: @escaping (([AnyHashable: Any]) -> Void), failure: ((String) -> Void)? = nil) {
        api?(workOrderListAPI)
        workOrderListAPI.startRequest(success: { (manager, dic) in
//            NNProgressHUD.showSuccess(withStatus: kAPISuccess)
            success(dic)

        }) { (manager, errorModel) in
            if let failure = failure {
                failure(errorModel.message)
                return
            }
            ZZProgressHUD.showError(errorModel.message)
        }
    }
    
    ///工单详情
    func requestWorkDetail(_ api: ((IOPWorkOrderDetailAPI) -> Void)?, success: @escaping (([AnyHashable: Any]) -> Void), failure: ((String) -> Void)? = nil) {
        ZZProgressHUD.showLoading(kRequestLoading)
        api?(workOrderDetailAPI)
        workOrderDetailAPI.startRequest(success: { (manager, dic) in
//            NNProgressHUD.showSuccess(withStatus: kAPISuccess)
            success(dic)

        }) { (manager, errorModel) in
            if let failure = failure {
                failure(errorModel.message)
                return
            }
            ZZProgressHUD.showError(errorModel.message)
        }
    }
    
}
