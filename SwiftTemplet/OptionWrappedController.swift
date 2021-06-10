//
//  OptionWrappedController.swift
//  SwiftTemplet
//
//  Created by Bin Shang on 2021/6/1.
//  Copyright © 2021 BN. All rights reserved.
//

import UIKit
import SwiftExpand

class OptionWrappedController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        edgesForExtendedLayout = []
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "done", style: .plain, target: self, action: #selector(handleActionItem(_:)))
    }
    
    @objc func handleActionItem(_ item: UIBarButtonItem) {
        NNPickerView.showPickerView { ( e ) in
            e.items = [String].init(count: 10, generator: { (idx) -> String in
                return "item_\(idx)"
            })
        } block: { (e, idx) in
            DDLog(e, idx)
        }

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


