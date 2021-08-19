//
//  ForExampleController.swift
//  SwiftTemplet
//
//  Created by Bin Shang on 2021/6/21.
//  Copyright © 2021 BN. All rights reserved.
//

import UIKit
import SwiftExpand


class ForExampleController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        test()
        
        testDateContain()
        
        
        let data = "This is a string!"

        DDLog(data[...0])  // "T"
        DDLog(data[..<4])  // "This"
        DDLog(data[5..<9]) // "is a"
        DDLog(data[10...]) // "string!"
        DDLog(data[5...9]) // "is a s"

        
        let dic = [0: 5, 1: 6, 2: 7]
        let dicNew = dic.map { (key: "\($0)", value: $1*$1) }
        DDLog(dicNew)
        
        let dic1 = dic.mapValues { $0*$0 }
        DDLog(dic1)
        
        view.addGestureTap { tap in
            let debouncedPrint = debounced(delay: 1.5) { DDLog("Action performed!") }
            debouncedPrint()
            debouncedPrint()
            debouncedPrint()
        }
        
        let list = Array.init(count: 10) { "\($0)" }
        let list1 = (0..<10).map { "\($0)" }
        DDLog(list, list1)

    }

    
    func test() {
        for i in stride(from: 0, to: 10, by: 2) {
            DDLog(i)
        }
        
        
        for i in stride(from: 0, to: 0.5, by: 0.1) {
            DDLog(i)
        }
        
        for i in stride(from: 0, through: 10, by: 2) {
            DDLog(i)
        }
    }
    
    func testDateContain() {
        let now = Date()
        let soon = Date().addingTimeInterval(5000)
        let later = Date().addingTimeInterval(10000)
        
        let range = now...later

        if range.contains(soon) {
            print("The date is inside the range")
        } else {
            print("The date is outside the range")
        }
    }
    
    func testDateDay() {
        let first = Date()
        let second = Date().addingTimeInterval(10000)
        
        let sameDay = Calendar.current.isDate(first, equalTo: second, toGranularity: .day)
        let isToday = Calendar.current.isDateInToday(first)

    }
}


extension Date{
    
    func containedIn(_ start: Date, end: Date) -> Bool {
        return (start...end).contains(self)
    }
}
