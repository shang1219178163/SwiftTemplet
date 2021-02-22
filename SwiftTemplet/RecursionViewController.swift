//
//  RecursionViewController.swift
//  SwiftTemplet
//
//  Created by Bin Shang on 2021/1/26.
//  Copyright © 2021 BN. All rights reserved.
//

import UIKit
import SwiftExpand
import SwiftExpand

class RecursionViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        title = "递归子模型"
        // Do any additional setup after loading the view.
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        

        parseGeojson()
    }
    
    func parseGeojson() {
        guard let obj = Bundle.main.jsonObject(forResource: "recursion", ofType: "geojson"),
              let list = NSArray.yy_modelArray(with: NNPowerModel.self, json: obj) as? [NNPowerModel]
              else { return}
        DDLog(list.count)
                
        let items = flatModels(list)
        DDLog(items.count)
    }

    func flatModels(_ items: [NNPowerModel]?) -> [NNPowerModel] {
        guard let items = items else { return []}
        ///内部函数
        func recursionModel(_ model: NNPowerModel, list: inout [NNPowerModel]) {
            guard let children = model.children else { return }
            children.forEach { (child) in
                list.append(child)
                
                if let _ = child.children {
                    recursionModel(child, list: &list)
                }
            }
        }
                        
        var list = [NNPowerModel]()
        items.forEach { (model) in
            list.append(model)
            recursionModel(model, list: &list)
        }
        return list;
    }
    
//    func recursionModel(_ model: NNPowerModel, list: inout [NNPowerModel]) {
//        guard let children = model.children else { return }
//        children.forEach { (child) in
//            list.append(child)
//
//            if let _ = child.children {
//                recursionModel(child, list: &list)
//            }
//        }
//    }
}


@objcMembers class NNPowerModel: NSObject, YYModel {

    var idNew: String = ""

    var is_power: String = ""

    var item_id: String = ""

    var level: String = ""

    var power_name: String = ""

    var children: [NNPowerModel]?

    var sort: String = ""

    var superior_id: String = ""

    var tab: String = ""

    var type: String = ""

    var url: String = ""

    required override init() {}
    static func modelCustomPropertyMapper() -> [String : Any]? {
        return ["children":"son"]
    }
    static func modelContainerPropertyGenericClass() -> [String : Any]? {
        return ["children" : NNPowerModel.self,
                ]
    }
}
