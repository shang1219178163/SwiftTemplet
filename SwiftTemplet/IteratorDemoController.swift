//
//  IteratorDemoController.swift
//  SwiftTemplet
//
//  Created by shangbinbin on 2022/4/22.
//  Copyright © 2022 BN. All rights reserved.
//

import UIKit
import SwiftExpand

class IteratorDemoController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        edgesForExtendedLayout = [];
        view.backgroundColor = .white;
        title = "遍历器demo"
        
        navigationItem.rightBarButtonItems = ["test"].map({
            return UIBarButtonItem(obj: $0) { item in
                if item.title == "test" {
                    self.testCountdown();
                }
            }
        });
    }
    
    func testCountdown() {
        let ct = Countdown(start: 5)
        for item in ct {
            DDLog(item)
        }
    }
    
}

//public protocol Sequence {
//
//associatedtype Iterator : IteratorProtocol
//
//func makeIterator() -> Iterator
//
//}

struct Countdown : Sequence {

    let start: Int

    func makeIterator() -> CountdownIterator {
        return CountdownIterator(self)
    }
}


struct CountdownIterator : IteratorProtocol {

    let countdown: Countdown
    var times = 0

    init(_ countdown: Countdown) {
        self.countdown = countdown
    }

    mutating func next() -> Int? {
        let nextNumber = countdown.start - times
        guard nextNumber > 0 else {
            return nil
        }

        times += 1
        return nextNumber
    }


}
