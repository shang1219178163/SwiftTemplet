//
//  NSURLRequest+Helper.swift
//  SwiftTemplet
//
//  Created by Bin Shang on 2020/7/15.
//  Copyright © 2020 BN. All rights reserved.
//

import UIKit


public extension URLRequest {
    private struct AssociateKeys {
        static var taskDic   = "NSURLRequest" + "taskDic"
    }
    /// 关联NSMutableArray 数据容器
    var taskDic: NSMutableDictionary {
        get {
            var obj = objc_getAssociatedObject(self, &AssociateKeys.taskDic) as? NSMutableDictionary;
            if obj == nil {
                obj = NSMutableDictionary();
                objc_setAssociatedObject(self, &AssociateKeys.taskDic, obj, .OBJC_ASSOCIATION_RETAIN_NONATOMIC);
            }
            return obj!;
        }
        set {
            objc_setAssociatedObject(self, &AssociateKeys.taskDic, newValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC);
        }
    }

    func send(_ urlString: String, method: String = "POST", parameters: [String: Any], handler: @escaping ([String: Any]?, Error?) -> Void) {
        guard let url = URL(string: urlString) else {
            print(#function, "url 错误\(urlString)")
            return }
        var request = URLRequest(url: url)
        request.httpMethod = method
        
        if let data = try? JSONSerialization.data(withJSONObject: parameters, options: []) {
            request.httpBody = data
        }

        // 在示例中我们不需要 `httpBody`，实践中可能需要将 parameter 转为 data
        // request.httpBody = ...
        var dataTask: URLSessionDataTask? = nil
        dataTask = URLSession.shared.dataTask(with: request) { (data, response, error) in
            self.taskDic.removeObject(forKey: NSNumber(integerLiteral: dataTask!.taskIdentifier))
            if let data = data, let res = try? JSONSerialization.jsonObject(with: data, options: []) as? [String: Any] {
                DispatchQueue.main.async { handler(res, error) }
            } else {
                DispatchQueue.main.async { handler(nil, error) }
            }
        }
        taskDic[NSNumber(integerLiteral: dataTask!.taskIdentifier)] = dataTask;
        dataTask!.resume()
    }
}
