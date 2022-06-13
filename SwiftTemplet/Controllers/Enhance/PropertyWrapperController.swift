//
//  PropertyWrapperController.swift
//  SwiftTemplet
//
//  Created by Bin Shang on 2021/5/31.
//  Copyright © 2021 BN. All rights reserved.
//

import UIKit
import SwiftExpand
import SnapKit

class PropertyWrapperController: UIViewController {
    
    lazy var label: UILabel = {
        $0.text = "text"
        $0.textColor = .systemRed
        $0.backgroundColor = UIColor.gray.alpha(0.1)
        return $0
    }(UILabel())

    // MARK: -lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        view.backgroundColor = .white
        edgesForExtendedLayout = []
        
        view.addSubview(label)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        label.snp.makeConstraints { (make) in
            make.top.left.equalToSuperview().offset(20)
            make.right.equalToSuperview().offset(-20)
            make.height.equalTo(200)
        }
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        DDLog(UserDefaults.dateTime ?? "-")
        UserDefaults.dateTime = "\(Date())"
        DDLog(UserDefaults.dateTime ?? "-")
        UserDefaults.dateTime = nil
    }

}




@propertyWrapper
struct ConsoleLogged<Value> {
    private var value: Value
    
    init(wrappedValue: Value) {
        self.value = wrappedValue
    }

    var wrappedValue: Value {
        get { value }
        set {
            value = newValue
            print("New value is \(newValue)")
        }
    }
}
//struct Bar {
//    @ConsoleLogged var x = 0
//}

@propertyWrapper
struct Capitalized {
    
    init(wrappedValue: String) {
        self.wrappedValue = wrappedValue.capitalized
    }
    
    var wrappedValue: String {
        didSet { wrappedValue = wrappedValue.capitalized }
    }
}

//struct User {
//    @Capitalized var firstName: String
//    @Capitalized var lastName: String
//}


//@propertyWrapper
//struct UserDefaultsStore<Value> {
//    let key: String
//    var storage: UserDefaults = .standard
//
//    var wrappedValue: Value? {
//        get { storage.value(forKey: key) as? Value }
//        set { storage.setValue(newValue, forKey: key) }
//    }
//}

//struct SettingsViewModel {
//    @UserDefaultsStore<Bool>(key: "mark-as-read")
//    var autoMarkMessagesAsRead
//
//    @UserDefaultsStore<Int>(key: "search-page-size")
//    var numberOfSearchResultsPerPage
//}



@propertyWrapper
struct UserDefaultsStore<Value> {
    private let key: String
    private let defaultValue: Value?
    private let storage: UserDefaults

    init(wrappedValue defaultValue: Value,
         key: String,
         storage: UserDefaults = .standard) {
        self.defaultValue = defaultValue
        self.key = key
        self.storage = storage
    }
    
    var wrappedValue: Value? {
        get {
            let value = storage.value(forKey: key) as? Value
            return value ?? defaultValue
        }
        set {
            if let newValue = newValue {
                storage.setValue(newValue, forKey: key)
            }
        }
    }
}

//struct SettingsViewModel {
//    @UserDefaultsStore(key: "mark-as-read")
//    var autoMarkMessagesAsRead = true
//
//    @UserDefaultsStore(key: "search-page-size")
//    var numberOfSearchResultsPerPage = 20
//}


extension UserDefaultsStore where Value: ExpressibleByNilLiteral {
    init(key: String, storage: UserDefaults = .standard) {
        self.init(wrappedValue: nil, key: key, storage: storage)
    }
}
