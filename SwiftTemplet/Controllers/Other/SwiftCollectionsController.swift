//
//  SwiftCollectionsController.swift
//  SwiftTemplet
//
//  Created by Bin Shang on 2021/4/18.
//  Copyright © 2021 BN. All rights reserved.
//

import UIKit
//import Collections

import SwiftExpand

class SwiftCollectionsController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
//    override func viewWillAppear(_ animated: Bool) {
//        super.viewWillAppear(animated)
//        
//        testDeque()
//    }
//
//    func testDeque() {
//        var colors: Deque = ["red", "yellow", "blue"]
//
//        colors.prepend("green")
//        colors.append("orange")
//        // `colors` is now ["green", "red", "yellow", "blue", "orange"]
//
//        colors.popFirst() // "green"
//        colors.popLast() // "orange"
//        
//        DDLog(colors)
//    }
//
//    func testOrderedSet() {
//        let buildingMaterials: OrderedSet = ["straw", "sticks", "bricks"]
//        for i in 0 ..< buildingMaterials.count {
//          print("Little piggie #\(i) built a house of \(buildingMaterials[i])")
//        }
//        
//        
//        buildingMaterials.append("straw") // (inserted: false, index: 0)
//        buildingMaterials.contains("glass") // false
//        buildingMaterials.append("glass") // (inserted: true, index: 3)
//    }
//    
//    func testOrderedDictionary() {
//        let responses: OrderedDictionary = [
//          200: "OK",
//          403: "Forbidden",
//          404: "Not Found",
//        ]
//        
//        responses[200] // "OK"
//        responses[500] = "Internal Server Error"
//        
//        for (code, phrase) in responses {
//          print("\(code) (\(phrase))")
//        }
//        
//        responses[0] // nil (key-based subscript)
//        responses.elements[0] // (200, "OK") (index-based subscript)
//        
//        if let i = responses.index(forKey: 404) {
//          responses.keys[i] // 404
//          responses.values[i] // "Not Found"
//          responses.remove(at: i + 1) // (500, "Internal Server Error")
//        }
//        // `responses` is now [200: "OK", 403: "Forbidden", 404: "Not Found"]
//    }
    
}
