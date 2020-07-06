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
        
        batchRquest([], success: { (api, dic, error) in
            DDLog(dic)
            
        }) { (api, dic, error) in
            NNProgressHUD.showError(error.debugDescription)
        }
        
        batchRquest([]) { (api) in
            api.startRequest(success: { (api, dic, error) in
                DDLog(dic)

            }) { (api, dic, error) in
                NNProgressHUD.showError(error.debugDescription)
            }
        }
    }
    

    func batchRquest(_ list: [NNBaseRequestApi], success: @escaping NNRequestBlock, fail: @escaping NNRequestBlock) {
        let queue = OperationQueue()
        queue.maxConcurrentOperationCount = list.count
        list.forEach {api in
            queue.addOperation {
                api.startRequest(success: success, fail: fail)
            }
        }
    }
    
    func batchRquest(_ list: [NNBaseRequestApi], block: @escaping ((NNBaseRequestApi)->Void)) {
        let queue = OperationQueue()
        queue.maxConcurrentOperationCount = list.count
        list.forEach {api in
            queue.addOperation {
                block(api)
            }
        }
    }

}
