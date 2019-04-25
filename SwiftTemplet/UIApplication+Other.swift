//
//  UIApplication+Other.swift
//  SwiftExpand
//
//  Created by Bin Shang on 2019/4/25.
//

import UIKit
import UserNotifications
import SwiftExpand

extension UIApplication{

    /**
     注册APNs远程推送
     */
    public static func registerAPNsWithDelegate(_ delegate: Any) -> Void {
        
        if #available(iOS 10.0, *) {
            let options = UNAuthorizationOptions(rawValue : UNAuthorizationOptions.alert.rawValue | UNAuthorizationOptions.badge.rawValue | UNAuthorizationOptions.sound.rawValue)
            let center = UNUserNotificationCenter.current()
            center.delegate = (delegate as! UNUserNotificationCenterDelegate);
            center.requestAuthorization(options: options){ (granted: Bool, error:Error?) in
                if granted {
                    print("success")
                }
            }
            UIApplication.shared.registerForRemoteNotifications()
            //            center.delegate = self
        } else {
            // 请求授权
            let types = UIUserNotificationType.alert.rawValue | UIUserNotificationType.badge.rawValue | UIUserNotificationType.sound.rawValue
            let settings = UIUserNotificationSettings(types: UIUserNotificationType(rawValue: types), categories: nil)
            UIApplication.shared.registerUserNotificationSettings(settings)
            // 需要通过设备UDID, 和app bundle id, 发送请求, 获取deviceToken
            UIApplication.shared.registerForRemoteNotifications()
        }
    }
    
    public static func checkVersion(_ appStoreID: String) -> Bool {
        var isUpdate = false;
        
        let path = "http://itunes.apple.com/cn/lookup?id=\(appStoreID)"
        let request = URLRequest(url:NSURL(string: path)! as URL, cachePolicy: .reloadIgnoringLocalCacheData, timeoutInterval: 6)
        let dataTask = URLSession.shared.dataTask(with: request) { (data, respone, error) in
            guard let data = data, let json = try? JSONSerialization.jsonObject(with: data, options: .mutableLeaves) else {
                fatalError("字典不能为空")
            }
            
            guard let dic = json as? Dictionary<String, Any> else {
                fatalError("数据格式错误")
            }
            
            guard (dic["resultCount"] as! NSNumber).intValue == 1 else {
                fatalError("resultCount错误")
            }
            
            guard let list = dic["results"] as? NSArray else {
                fatalError("dicInfo错误")
            }
            
            guard let dicInfo = list[0] as? Dictionary<String, Any> else {
                fatalError("dicInfo错误")
            }
            
            let appStoreVersion = dicInfo["version"] ?? "";
            let releaseNotes = dicInfo["releaseNotes"] ?? "";
            print(dicInfo);
            
            DispatchQueue.main.async {
                let alertController = UIAlertController.showAlert("新版本V\(appStoreVersion)", msg: releaseNotes as! String, actionTitles: [kActionTitle_Update, kActionTitle_Cancell], handler: { (action: UIAlertAction) in
                    isUpdate = action.title == kActionTitle_Update
                    if isUpdate == true {
                        //去升级
                        
                    }
                })
                                
                let paraStyle = NSMutableParagraphStyle.create(.byCharWrapping, alignment: .left)
                alertController.setTitleColor(UIColor.red)
                alertController.setMessageParaStyle(paraStyle)
                alertController.actions.first?.setValue(UIColor.orange, forKey: kAlertActionColor);
            }
        }
        dataTask.resume()
        return isUpdate;
    }

}
