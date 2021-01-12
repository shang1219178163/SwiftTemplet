//
//  OHHTTPStubsHelper.swift
//  SwiftTemplet
//
//  Created by Bin Shang on 2021/1/7.
//  Copyright © 2021 BN. All rights reserved.
//

import OHHTTPStubs

///网络请求返回本地json内容
@objcMembers public class OHHTTPStubsHelper: NSObject {
    
    private static let isOHHTTPStubs = false
    
    ///配置接口和返回的本地 json 文件名称
    static func setupHttpStubs(url: String?, jsonName: String) {
        installStubs(url: url, jsonName: jsonName)
        HTTPStubs.onStubActivation { (request, stup, response) in
            print(#function,"[OHHTTPStubs] Request to \(request.url?.absoluteString ?? "_") has been stubbed with \(stup.name ?? "_")")
        }
    }
    
    static func installStubs(url: String?, jsonName: String?) {
        guard let url = url else { return }
        
        let contentTypes = ["application/json", "text/html", "text/json", "text/plain", "text/javascript", "text/xml", "image/*",]
        let contentType = contentTypes.joined(separator: ",")
        let textStub = HTTPStubs.stubRequests { (request) -> Bool in
            return request.url!.absoluteString.contains(url)

        } withStubResponse: { (request) -> HTTPStubsResponse in
//            return HTTPStubsResponse(jsonObject: <#T##Any#>, statusCode: 200, headers: ["Content-Type": contentType])
            guard let jsonName = jsonName,
                  let filePath = OHPathForFile("\(jsonName).geojson", classForCoder())
            else {
                return HTTPStubsResponse(jsonObject: defaultDic, statusCode: 200, headers: ["Content-Type": contentType])
                    .responseTime(0)
            }
            return HTTPStubsResponse(fileAtPath: filePath,
                                     statusCode: 200,
                                     headers: ["Content-Type": contentType])
                .responseTime(0)
        }
    
        textStub.name = jsonName
    }
    
    static var defaultDic: [String : [String: Any]] {
        return ["data": ["code": 1,
                         "message": "操作成功",
                         "list": [Any]()
                        ],
                ]
    }
    
}
