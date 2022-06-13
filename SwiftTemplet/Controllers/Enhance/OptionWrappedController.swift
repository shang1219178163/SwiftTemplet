//
//  OptionWrappedController.swift
//  SwiftTemplet
//
//  Created by Bin Shang on 2021/6/1.
//  Copyright © 2021 BN. All rights reserved.
//

import UIKit
import SwiftExpand
import HandyJSON

class OptionWrappedController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        edgesForExtendedLayout = []
        view.backgroundColor = .white
        
        navigationItem.rightBarButtonItems = [("done", #selector(actionDone(_:))),
                                              ("hide", #selector(actionHide(_:)))].map({
            UIBarButtonItem(obj: $0.0, target: self, action: $0.1)
        })

    }
    
    @objc func actionDone(_ item: UIBarButtonItem) {
        NNPickerView.showPickerView { ( e ) in
            e.items = [String].init(count: 10, generator: { (idx) -> String in
                return "item_\(idx)"
            })
        } block: { (e, idx) in
            DDLog(e, idx)
        }
    }
    
    @objc func actionHide(_ item: UIBarButtonItem) {
        print(Bar())
        print(Bar().description())
        print(Bar().toDic())
    }
}

/// 结构体转json
protocol JsonByStruct{
    func toDic() -> [String: Any];
}

extension JsonByStruct{

    func toDic() -> [String: Any] {
        var dic = [String: Any]()

        let mirror = Mirror(reflecting: self);
        for child in mirror.children {
            dic["\(child.label!)"] = child.value;
        }
        return dic
    }
}

/// 结构体描述
protocol DescriptionByStruct{
    func description() -> String;
}

extension DescriptionByStruct{

    func description() -> String {
        let mirror = Mirror(reflecting: self);
        print("对象类型：\(mirror.subjectType)")
        print("对象属性个数：\(mirror.children.count)")
        print("对象的属性及属性值")
        
        var result = ""
        for child in mirror.children {
            result += "\(child.label!): \(child.value)\n"
        }
        return result;
    }
}


struct Bar: JsonByStruct, DescriptionByStruct {
    var name = ""
    var age = ""
    
    init(_ name: String = "小明", age: String = "18") {
        self.name = name;
        self.age = age;
    }
}

public protocol DefaultValue {
    associatedtype Value: Codable
    static var defaultValue: Value { get }
}


@propertyWrapper
struct Default<T: DefaultValue> where T == T.Value {
    var wrappedValue: T.Value
    var value: T.Value?
    init(_ value: T.Value? = nil) {
        self.value = value
        if let value = value {
            wrappedValue = value
        } else {
            wrappedValue = T.defaultValue
        }
    }

}

extension Array: DefaultValue where Element: DefaultValue, Element: Codable {
    public typealias Value = Array<Element>
    public static var defaultValue: Array<Element> {
        return []
    }
}

extension Optional: DefaultValue where Wrapped: DefaultValue, Wrapped: Codable {
    public typealias Value = Optional<Wrapped>
    public static var defaultValue: Optional<Wrapped> {
        return Optional.init(Wrapped.defaultValue as! Wrapped)
    }
}


struct Video: Codable {

//    @Default var id: Int?
//
//    @Default(22) var age: Int
//
//    @Default var title: String?
//
//    @Default(true) var commentEnabled: Bool
//
//    @Default([]) var list: [Int]?

}


