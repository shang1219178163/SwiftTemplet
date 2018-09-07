
//
//  SecondViewController.swift
//  SwiftTemplet
//
//  Created by hsf on 2018/8/10.
//  Copyright © 2018年 BN. All rights reserved.
//

import UIKit

import Alamofire
import ObjectMapper


typealias closuer = (AnyObject,Int,Bool) -> Void;

class SecondViewController: UIViewController {

    let url = "https://httpbin.org/get";
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        view.backgroundColor = UIColor.cyan;

        let jsonString = "news.geojson".jsonFileToJSONString();
        DDLog("************************************")
        
        let rootModel = Mapper<BN_RootClass>().map(JSONString: jsonString);
        DDLog(Mapper<BN_RootClass>());
        DDLog(rootModel?.description);
        
        

    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated);

        self.requestWithRank(rank: 0, handler: { (obj, idx, isSuccess) in
            
        });
        return;
        
        let params = ["one":"a"];
        
        Alamofire.request(url,method:.get,parameters:params).responseJSON { (dataResponse) in
            DDLog(dataResponse.request)  // 原始的URL请求
//            DDLog(dataResponse.response) // HTTP URL响应
//            DDLog(dataResponse.data)     // 服务器返回的数据
//            DDLog(dataResponse.result)   // 响应序列化结果，在这个闭包里，存储的是JSON数据
//            DDLog(dataResponse.value)  // 原始的URL请求
            
            if let json = dataResponse.value {
                let rootModel = Mapper<RootClass>().map(JSON: json as! Dictionary);
                DDLog(rootModel);

            }
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    //MARK: request
    func requestParamsWithRank(_ rank:Int) -> Dictionary<String, Any>! {
        
        var dic = Dictionary<String, Any>();
        dic["uid"] = "533";
        dic["uniacid"] = "599";

        switch rank {
        case 0:
            dic["r"] = "api.home.rotation";

        case 1:
            dic["r"] = "api.notice.display";

        default:
            dic["r"] = "";
        }
        return dic;
    }
    
    func requestWithRank(rank:Int,handler:@escaping(closuer)) -> Void {

        let dic = self.requestParamsWithRank(rank);
        let urlString = url;
        Alamofire.request(urlString,method:.get,parameters:dic).responseJSON { (dataResponse) in
           
//        DDLog(dataResponse.request)  // 原始的URL请求
//        DDLog(dataResponse.response) // HTTP URL响应
//        DDLog(dataResponse.data)     // 服务器返回的数据
//        DDLog(dataResponse.result)   // 响应序列化结果，在这个闭包里，存储的是JSON数据
//        DDLog(dataResponse.value)  // 原始的URL请求
            
            if let data = dataResponse.data {
                let JSONString:String! = String(data: data, encoding: .utf8);
                DDLog("___\n",JSONString.removingPercentEncoding!);
            }
            
            if let value = dataResponse.value {
                var jsonString = (value as! NSDictionary).jsonValue().removingPercentEncoding!;
                jsonString = (value as! NSDictionary).toJsonString();
                DDLog(jsonString);

                //数据解析
                let rootModel = Mapper<RootClass>().map(JSON: value as! Dictionary);
                DDLog(rootModel);

            }
            
//            switch rank {
//            case 0:
//
//
//            case 1:
//
//
//            default:
//
//            }
        }
    }
}
