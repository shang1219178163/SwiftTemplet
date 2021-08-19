//
//  KeyValueObserverController.swift
//  SwiftTemplet
//
//  Created by Bin Shang on 2021/6/1.
//  Copyright © 2021 BN. All rights reserved.
//

import UIKit

class KeyValueObserverController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}


final class KeyValueObserver: NSObject {

    private let object: NSObject

    private let keyPath: String

    private let callback: ((NSObject) -> Void)
    
    deinit {
        object.removeObserver(self, forKeyPath: keyPath)
    }
    
    init(object: NSObject, keyPath: String, callback: @escaping ((NSObject) -> Void)) {
        self.object = object
        self.keyPath = keyPath

        self.callback = callback
        super.init()

        object.addObserver(self, forKeyPath: keyPath, options: [.new], context: nil)
    }

    override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {

        guard let keyPath = keyPath, keyPath == self.keyPath, let value = change?[.newKey] as? NSObject else { return }
        callback(value)
    }

}
