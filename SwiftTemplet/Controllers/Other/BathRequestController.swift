//
//  BathRequestController.swift
//  SwiftTemplet
//
//  Created by Bin Shang on 2020/6/21.
//  Copyright © 2020 BN. All rights reserved.
//

import UIKit
import SwiftExpand

class BathRequestController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        batchRquest([], success: { (api, dic) in
            DDLog(dic)
            
        }) { (api, error) in
            NNProgressHUD.showError(error.debugDescription)
        }
        
        batchRquest([]) { (api) in
            _ = api.startRequest(success: { (api, dic) in
                    DDLog(dic)

                }) { (api, error) in
                    NNProgressHUD.showError(error.debugDescription)
                }
        }
    }
    

    func batchRquest(_ list: [NNBaseRequestAPI], success: @escaping NNRequestSuccessBlock, fail: @escaping NNRequestFailureBlock) {
        let queue = OperationQueue()
        queue.maxConcurrentOperationCount = list.count
        list.forEach {api in
            queue.addOperation {
                _ = api.startRequest(success: success, fail: fail)
            }
        }
    }
    
    func batchRquest(_ list: [NNBaseRequestAPI], block: @escaping ((NNBaseRequestAPI)->Void)) {
        let queue = OperationQueue()
        queue.maxConcurrentOperationCount = list.count
        list.forEach {api in
            queue.addOperation {
                block(api)
            }
        }
    }

}
