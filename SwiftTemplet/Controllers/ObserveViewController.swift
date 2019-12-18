//
//  ObserveViewController.swift
//  SwiftTemplet
//
//  Created by Bin Shang on 2019/12/18.
//  Copyright © 2019 BN. All rights reserved.
//

import UIKit

class ObserveViewController: UIViewController {
    
    let foo = Foo()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // Here it is, kvo in 2 lines of code!
        _ = foo.observe(\.string) { (obj, change) in
            print("new foo.string: \(obj.string) \(change)")
            self.title = obj.string
        }
        
        foo.string = "not hotdog"
        foo.string = "red hotdog"

        
    }

}

@objcMembers class Foo: NSObject {
    dynamic var string: String
    override init() {
        string = "hotdog"
        super.init()
    }
}
