//
//  AnimationSequence.swift
//  SwiftTemplet
//
//  Created by Bin Shang on 2021/6/15.
//  Copyright © 2021 BN. All rights reserved.
//

import UIKit

class AnimationSequence {
    typealias Animations = (() -> Void)
    
    private let current: Animations
    private let duration: TimeInterval
    private var next: AnimationSequence? = nil
    
    init(animations: @escaping Animations, duration: TimeInterval) {
        self.current = animations
        self.duration = duration
    }
    
    @discardableResult func append(animations: @escaping Animations, duration: TimeInterval) -> AnimationSequence {
        var lastAnimation = self
        while let nextAnimation = lastAnimation.next {
            lastAnimation = nextAnimation
        }
        lastAnimation.next = AnimationSequence(animations: animations, duration: duration)
        return self
    }
    
    func run() {
        UIView.animate(withDuration: duration, animations: current, completion: { finished in
            if finished, let next = self.next {
                next.run()
            }
        })
    }
    
    //AnimationSequence(animations: { firstView.alpha = 1.0 }, duration: 1)
    //            .append(animations: { secondView.alpha = 1.0 }, duration: 0.5)
    //            .append(animations: { firstView.alpha = 0.0 }, duration: 2.0)
    //            .run()
}

public func debounced(delay: TimeInterval, queue: DispatchQueue = .main, action: @escaping (() -> Void)) -> () -> Void {
    var workItem: DispatchWorkItem?
    
    return {
        workItem?.cancel()
        workItem = DispatchWorkItem(block: action)
        queue.asyncAfter(deadline: .now() + delay, execute: workItem!)
    }
}

//let debouncedPrint = debounced(delay: 1.0) { print("Action performed!") }
//debouncedPrint()
//debouncedPrint()
//debouncedPrint()

public extension UIButton{
    
    @discardableResult
    func throttled(delay: TimeInterval = TimeInterval(1.5), queue: DispatchQueue = .main) -> Self {
        isEnabled = false
        queue.asyncAfter(deadline: .now() + delay) {
            self.isEnabled = true
        }
        return self
    }
}



//extension Optional where Wrapped == String {
//    var orEmpty: String {
//        switch self {
//        case .some(let value):
//            return value
//        case .none:
//            return "nil"
//        }
//    }
//}


func asyncUI<T>(_ global: @autoclosure @escaping (() -> T), qos: DispatchQoS.QoSClass = .userInitiated, _ main: @escaping (T) -> Void) {
    DispatchQueue.global(qos: qos).async {
        let value = global()
        DispatchQueue.main.async {
            main(value)
        }
    }
}


struct Expirable<T> {
    private var innerValue: T
    private(set) var expirationDate: Date
    
    var value: T? {
        return hasExpired() ? nil : innerValue
    }
    
    init(value: T, expirationDate: Date) {
        self.innerValue = value
        self.expirationDate = expirationDate
    }
    
    init(value: T, duration: Double) {
        self.innerValue = value
        self.expirationDate = Date().addingTimeInterval(duration)
    }
    
    func hasExpired() -> Bool {
        return expirationDate < Date()
    }
}


///对方法支持不如 then
protocol After {}

extension After where Self: AnyObject {
    @discardableResult
    func after<T>(_ property: ReferenceWritableKeyPath<Self, T>, setTo value: T) -> Self {
        self[keyPath: property] = value
        return self
    }
}

extension UIView: After {}


func testAfter(){
    UILabel()
        .after(\.textAlignment, setTo: .center)
        .after(\.backgroundColor, setTo: .red)
}



@propertyWrapper
struct History<Value> {
    private var value: Value
    private(set) var history: [Value] = []

    init(wrappedValue: Value) {
        self.value = wrappedValue
    }
    
    var wrappedValue: Value {
        get { value }
        set {
            history.append(value)
            value = newValue
        }
    }
    
    var projectedValue: Self {
        return self
    }
}

// We can then decorate our business code
// with the `@History` wrapper
struct User {
    @History var name: String = ""
}


func testPropertyWrapper(){
    var user = User()

    // All the existing call sites will still
    // compile, without the need for any change
    user.name = "John"
    user.name = "Jane"

    // But now we can also access an history of
    // all the previous values!
    user.$name.history // ["", "John"])
}



//extension Encodable {
//    func encoded() throws -> Data {
//        return try JSONEncoder().encode(self)
//    }
//}
//
//extension Data {
//    func decoded<T: Decodable>() throws -> T {
//        return try JSONDecoder().decode(T.self, from: self)
//    }
//}
//
//func testCoded(){
//    var user = User()
//
//    let data = try user.encoded()
//
//    // By using a generic type in the decoded() method, the
//    // compiler can often infer the type we want to decode
//    // from the current context.
//    try userDidLogin(data.decoded())
//
//    // And if not, we can always supply the type, still making
//    // the call site read very nicely.
//    let otherUser = try data.decoded() as User
//}

class Node {
    private(set) weak var parent: Node?
    private(set) lazy var children = [Node]()

    func add(child: Node) {
        children.append(child)
        child.parent = self
    }
    
}


enum Result<T> {
    case success(result: T)
    case failure(error: String)
}
