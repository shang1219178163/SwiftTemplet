//
//  ProtocolViewController.swift
//  SwiftTemplet
//
//  Created by Bin Shang on 2020/7/22.
//  Copyright © 2020 BN. All rights reserved.
//

import UIKit

class ProtocolViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        let array: [POGreetable] = [
                POPerson(name: "Wei Wang"),
                POCat(name: "onevcat")]
        for obj in array {
            obj.greet()
        }
        
        let triangle1: Drawable = Triangle()
        let triangle2: Triangle = Triangle()
        let triangles: [Drawable] = [triangle1, triangle2]

        triangle1.draw() // *Triangle() Drawing triangle*
        triangle1.commit() // *Triangle() Commit something*

        triangle2.draw() // *Triangle() Drawing triangle*
        triangle2.commit() // *Triangle() Commit triangle*

        triangles.forEach {$0.draw(); $0.commit()}
    }


}

protocol POGreetable {
    var name: String { get }
    func greet()
}

extension POGreetable {
    func greet() {
        print("\(self) greet something")
    }

}

struct POPerson: POGreetable {
    let name: String
    func greet() {
        print("你好 \(name)")
    }
}

struct POCat: POGreetable {
    let name: String
    func greet() {
        print("meow~ \(name)")
    }
}


protocol Drawable {
    func draw()
}

extension Drawable {
    func draw() {
        print("\(self) Drawing something")
    }

    func commit() {
        print("\(self) Commit something")
    }
}

struct Triangle: Drawable {
    func draw() {
        print("\(self) Drawing triangle")
    }

    func commit() {
        print("\(self) Commit triangle")
    }
}
