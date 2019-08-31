//
//  NNURLResponse.swift
//  SwiftTemplet
//
//  Created by Bin Shang on 2019/4/30.
//  Copyright © 2019 BN. All rights reserved.
//

import UIKit

class NNURLResponse: NSObject {

    var request: NSURLRequest?
    var response: NSURLRequest?
    var responseObject: Any?
    var error: NSError?
    var errorOther: NSError?

    func response(__kindof request: NSURLRequest,__kindof response: URLResponse, responseObject: Any, error: NSError) -> NNURLResponse {
        let model = NNURLResponse()
        model.request = request;
//        model.response = (response as! HTTPURLResponse);
        model.responseObject = responseObject;
        model.error = error;
        return model;
    }
}
