//
//  CellModel.swift
//  SwiftTemplet
//
//  Created by Bin Shang on 2021/8/21.
//  Copyright © 2021 BN. All rights reserved.
//

///元祖参数过多编译器会报错
public struct CellModel {
    public var t0: String
    public var t1: String
    public var t2: String
    public var t3: String
    public var t4: String

    public init(_ t0: String, _ t1: String, _ t2: String, _ t3: String, _ t4: String) {
        self.t0 = t0
        self.t1 = t1
        self.t2 = t2
        self.t3 = t3
        self.t4 = t4
    }
}
