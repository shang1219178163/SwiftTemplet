//
//  TestBlockController.swift
//  SwiftTemplet
//
//  Created by shangbinbin on 2023/3/27.
//  Copyright © 2023 BN. All rights reserved.
//

import UIKit
import SwiftExpand


class TestBlockController: UIViewController {
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        navigationItem.rightBarButtonItems = ["done"].map({
            UIBarButtonItem(obj: $0) {item in
                debugPrint("result: \(item)")
            }
        })
        
        var dic = [AnyHashable : Any]()
        dic["a"] = "aa"
        debugPrint(dic)
    }
    
    @available(iOS 13.0.0, *)
    func request(_ page: Int = 1) async -> [String] {
        return Array(count: 3, generator: { i in
            return "index_\(i)"
        });
    }
    
    //    = UNUserNotificationCenter.current().isAuthorized
    @available(iOS 15.0, *)
    func performAuthorizationFlow(authorized: () async -> Bool) async throws -> Bool {
        let result = await authorized();
        return result;
    }
    
    var testView: NNTestView<TestModel> {
        let view = NNTestView<TestModel>(frame: CGRect.zero)
        view.block = { (val) -> Array<TestModel> in
            if case .authorized = await UNUserNotificationCenter
                .current()
                .notificationSettings()
                .authorizationStatus {
                return [];
            }
            return [];
        }
        return view
    }
}


extension UNUserNotificationCenter{
    
    @available(iOS 15.0, *)
    func isAuthorized() async -> Bool{
        if case .authorized = await UNUserNotificationCenter
            .current()
            .notificationSettings()
            .authorizationStatus {
            return true
        } else {
            return false
        }
    }
}



//struct Amodel {
// 
//}
//
//class UModel: NSCopying {
//
//
//    func copy(with zone: NSZone? = nil) -> Any {
//
//    }
//}
//
//class UOneModel: NSMutableCopying {
//
//    func mutableCopy(with zone: NSZone? = nil) -> Any {
//
//    }
//
//}


class NNTestView<M>: UIView {
 
    var block: ((Int) async -> Array<M>)? = nil
    

    // MARK: - 重写加载方法
    override init(frame: CGRect) {
        super.init(frame: frame);

    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        
    }
    

    // MARK: - 私有方法
    

}

class TestModel {
    
}

