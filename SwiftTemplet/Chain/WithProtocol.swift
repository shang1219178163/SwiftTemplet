//
//  WithProtocol.swift
//  SwiftTemplet
//
//  Created by shangbinbin on 2023/3/6.
//  Copyright © 2023 BN. All rights reserved.
//

import UIKit


protocol WithProtocol {}

extension WithProtocol where Self: AnyObject {
    @discardableResult
    func with<T>(_ property: ReferenceWritableKeyPath<Self, T>, setTo value: T) -> Self {
        self[keyPath: property] = value
        return self
    }
}

extension UIView: WithProtocol {}


//let view = UIView()
//
//let label = UILabel()
//    .with(\.textColor, setTo: .red)
//    .with(\.text, setTo: "Foo")
//    .with(\.textAlignment, setTo: .right)
//    .with(\.layer.cornerRadius, setTo: 5)
//
//view.addSubview(label)
